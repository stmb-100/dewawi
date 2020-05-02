<?php

class Contacts_ContactController extends Zend_Controller_Action
{
	protected $_date = null;

	protected $_user = null;

	protected $_currency = null;

	/**
	 * FlashMessenger
	 *
	 * @var Zend_Controller_Action_Helper_FlashMessenger
	 */
	protected $_flashMessenger = null;

	public function init()
	{
		$params = $this->_getAllParams();

		$this->_date = date('Y-m-d H:i:s');

		$this->_currency = new Zend_Currency();
		if(($this->view->action != 'index') && ($this->view->action != 'select') && ($this->view->action != 'search') && ($this->view->action != 'download') && ($this->view->action != 'save') && ($this->view->action != 'preview') && ($this->view->action != 'get'))
			$this->_currency->setFormat(array('display' => Zend_Currency::NO_SYMBOL));

		$this->view->id = isset($params['id']) ? $params['id'] : 0;
		$this->view->action = $params['action'];
		$this->view->controller = $params['controller'];
		$this->view->module = $params['module'];
		$this->view->client = Zend_Registry::get('Client');
		$this->view->user = $this->_user = Zend_Registry::get('User');
		$this->view->mainmenu = $this->_helper->MainMenu->getMainMenu();

		$this->_flashMessenger = $this->_helper->getHelper('FlashMessenger');
	}

	public function getAction()
	{
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		$contactDb = new Contacts_Model_DbTable_Contact();

		$contact = $contactDb->fetchRow(
			$contactDb->select()
				->from(array('c' => 'contact'))
				->join(array('a' => 'address'), 'c.id = a.contactid', array('street', 'postcode', 'city', 'country'))
				->joinLeft(array('p' => 'phone'), 'c.id = p.contactid', array('phones' => new Zend_Db_Expr('GROUP_CONCAT(DISTINCT p.phone)')))
				->joinLeft(array('e' => 'email'), 'c.id = e.contactid', array('emails' => new Zend_Db_Expr('GROUP_CONCAT(DISTINCT e.email)')))
				->joinLeft(array('i' => 'internet'), 'c.id = i.contactid', array('internets' => new Zend_Db_Expr('GROUP_CONCAT(DISTINCT i.internet)')))
				->group('c.id')
				->where('c.id = ?', $this->_getParam('id', 0))
				->setIntegrityCheck(false)
		);

		header('Content-type: application/json');
		echo Zend_Json::encode($contact);
	}

	public function indexAction()
	{
		if($this->getRequest()->isPost()) $this->_helper->getHelper('layout')->disableLayout();

		$toolbar = new Contacts_Form_Toolbar();
		$options = $this->_helper->Options->getOptions($toolbar, $this->_user['clientid']);
		$params = $this->_helper->Params->getParams($toolbar, $options);

		$contacts = $this->search($params, $options['categories']);

		$this->view->contacts = $contacts;
		$this->view->options = $options;
		$this->view->toolbar = $toolbar;
		$this->view->messages = $this->_flashMessenger->getMessages();
	}

	public function searchAction()
	{
		$type = $this->_getParam('type', 'index');

		$this->_helper->viewRenderer->setRender($type);
		$this->_helper->getHelper('layout')->disableLayout();

		$toolbar = new Contacts_Form_Toolbar();
		$options = $this->_helper->Options->getOptions($toolbar, $this->_user['clientid']);
		$params = $this->_helper->Params->getParams($toolbar, $options);

		$contacts = $this->search($params, $options['categories']);

		$this->view->contacts = $contacts;
		$this->view->options = $options;
		$this->view->toolbar = $toolbar;
		$this->view->messages = $this->_flashMessenger->getMessages();
	}

	public function selectAction()
	{
		$contactid = $this->_getParam('contactid', 0);

		$this->_helper->getHelper('layout')->setLayout('plain');

		$toolbar = new Contacts_Form_Toolbar();
		$options = $this->_helper->Options->getOptions($toolbar, $this->_user['clientid']);
		$params = $this->_helper->Params->getParams($toolbar, $options);

		if($contactid) {
			$contactsDb = new Contacts_Model_DbTable_Contact();
			$contacts = $contactsDb->fetchAll(
				$contactsDb->select()
					->from(array('c' => 'contact'))
					->join(array('a' => 'address'), 'c.id = a.contactid', array('street', 'postcode', 'city', 'country'))
					->where('c.id = ?', $contactid)
					->where('a.type = ?', 'primaryAddress')
					->where('c.clientid = ?', $this->_user['clientid'])
					->where('a.clientid = ?', $this->_user['clientid'])
					->setIntegrityCheck(false)
			);
			$params['keyword'] = $contactid;
			$toolbar->keyword->setValue($params['keyword']);
		} else {
			$contacts = $this->search($params, $options['categories']);
		}

		$this->view->contacts = $contacts;
		$this->view->options = $options;
		$this->view->toolbar = $toolbar;
		$this->view->messages = $this->_flashMessenger->getMessages();
	}

	public function addAction()
	{
		$data = array();
		$data['created'] = $this->_date;
		$data['createdby'] = $this->_user['id'];
		$data['clientid'] = $this->_user['clientid'];

		$contactDb = new Contacts_Model_DbTable_Contact();
		$id = $contactDb->addContact($data);

		$addressDb = new Contacts_Model_DbTable_Address();

		$client = Zend_Registry::get('Client');

		//Primary Address
		$data = array();
		$data['contactid'] = $id;
		$data['type'] = 'primaryAddress';
		$data['country'] = $client['country'];
		$data['clientid'] = $this->_user['clientid'];
		$data['created'] = $this->_date;
		$addressDb->addAddress($data);

		//Shipping Address
		$data = array();
		$data['contactid'] = $id;
		$data['type'] = 'shippingAddress';
		$data['country'] = $client['country'];
		$data['clientid'] = $this->_user['clientid'];
		$data['created'] = $this->_date;
		$addressDb->addAddress($data);

        //Check if the directory exists
        $this->checkDirectory($id);

		$this->_helper->redirector->gotoSimple('edit', 'contact', null, array('id' => $id));
	}

	public function editAction()
	{
		$request = $this->getRequest();
		$id = $this->_getParam('id', 0);
		$activeTab = $request->getCookie('tab', null);

		$contactDb = new Contacts_Model_DbTable_Contact();
		$contact = $contactDb->getContact($id);

        //Check if the directory exists
        $dirwritable = $this->checkDirectory($id);

		if(false) {
			$this->_helper->redirector->gotoSimple('view', 'contact', null, array('id' => $id));
		} elseif($this->isLocked($contact['locked'], $contact['lockedtime'])) {
			if($request->isPost()) {
				header('Content-type: application/json');
				$this->_helper->viewRenderer->setNoRender();
				$this->_helper->getHelper('layout')->disableLayout();
				echo Zend_Json::encode(array('message' => $this->view->translate('MESSAGES_LOCKED')));
			} else {
				$this->_flashMessenger->addMessage('MESSAGES_LOCKED');
				$this->_helper->redirector('index');
			}
		} else {
			$contactDb->lock($id, $this->_user['id'], $this->_date);

			$form = new Contacts_Form_Contact();
			$options = $this->_helper->Options->getOptions($form, $this->_user['clientid']);

			if($request->isPost()) {
				$this->_helper->viewRenderer->setNoRender();
				$this->_helper->getHelper('layout')->disableLayout();
				$data = $request->getPost();
				$element = key($data);
				if($element == 'contactinfo') {
					$data['info'] = $data['contactinfo'];
					unset($data['contactinfo']);
					$element = 'info';
				}
				if($element == 'customerinfo') {
					$data['info'] = $data['customerinfo'];
					unset($data['customerinfo']);
					$element = 'info';
				}
				if(isset($form->$element) && $form->isValidPartial($data)) {
					$data['modified'] = $this->_date;
					$data['modifiedby'] = $this->_user['id'];
					$contactDb = new Contacts_Model_DbTable_Contact();
					$contactDb->updateContact($id, $data);
				} else {
					throw new Exception('Form is invalid');
				}
			} else {
				if($id > 0) {
					$data = $contact;
					$form->populate($data);

					//Phone
					$phoneDb = new Contacts_Model_DbTable_Phone();
					$phone = $phoneDb->getPhone($id);

					//Email
					$emailDb = new Contacts_Model_DbTable_Email();
					$email = $emailDb->getEmail($id);

					//Internet
					$internetDb = new Contacts_Model_DbTable_Internet();
					$internet = $internetDb->getInternet($id);

					$addressDb = new Application_Model_DbTable_Address();

					//Primary Address
					$primaryAddress = $addressDb->fetchRow(
						$addressDb->select()
							->where('contactid = ?', $id)
							->where('type = ?', 'primaryAddress')
							->where('clientid = ?', $this->_user['clientid'])
					);
					$formPrimaryAddress = new Contacts_Form_Address();
					$formPrimaryAddress->country->addMultiOptions($options['countries']);
					$formPrimaryAddress->populate($primaryAddress->toArray());
					foreach($formPrimaryAddress as $element) {
						$element->setAttrib('data-id', $primaryAddress['id']);
						$element->setAttrib('data-controller', 'address');
					}

					//Shipping address
					$shippingAddress = $addressDb->fetchRow(
						$addressDb->select()
							->where('contactid = ?', $id)
							->where('type = ?', 'shippingAddress')
							->where('clientid = ?', $this->_user['clientid'])
					);
					$formShippingAddress = new Contacts_Form_Address();
					$formShippingAddress->populate($shippingAddress->toArray());
					foreach($formShippingAddress as $element) {
						$element->setAttrib('data-id', $shippingAddress['id']);
						$element->setAttrib('data-controller', 'address');
					}
					$formShippingAddress->country->addMultiOptions($options['countries']);

					//History
					$history = $this->getHistory($id);

					//Files
					$files = array();
                    $path = BASE_PATH.'/files/contacts/';
					if(file_exists($path.$id) && is_dir($path.$id)) {
					    if($handle = opendir($path.$id)) {
						    $files['contactSpecific'] = array();
						    while (false !== ($entry = readdir($handle))) {
							    if(substr($entry, 0, strlen('.')) !== '.') array_push($files['contactSpecific'], $entry);
						    }
						    closedir($handle);
					    }
					}

					//Toolbar
					$toolbar = new Contacts_Form_Toolbar();

					$this->view->form = $form;
					$this->view->formPrimaryAddress = $formPrimaryAddress;
					$this->view->formShippingAddress = $formShippingAddress;
                    $this->view->dirwritable = $dirwritable;
					$this->view->history = $history;
					$this->view->files = $files;
					$this->view->phone = $phone;
					$this->view->email = $email;
					$this->view->internet = $internet;
					$this->view->activeTab = $activeTab;
					$this->view->toolbar = $toolbar;
				}
			}
		}
        $this->view->messages = array_merge(
            $this->_helper->flashMessenger->getMessages(),
            $this->_helper->flashMessenger->getCurrentMessages()
        );
        $this->_helper->flashMessenger->clearCurrentMessages();
	}

	public function copyAction()
	{
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		$id = $this->_getParam('id', 0);
		$contact = new Contacts_Model_DbTable_Contact();
		$data = $contact->getContact($id);
		unset($data['id']);
		unset(
			$data['street'],
			$data['postcode'],
			$data['city'],
			$data['country'],
			$data['shippingname1'],
			$data['shippingname2'],
			$data['shippingdepartment'],
			$data['shippingstreet'],
			$data['shippingpostcode'],
			$data['shippingcity'],
			$data['shippingcountry'],
			$data['shippingphone']
		);
		$data['name1'] = $data['name1'].' 2';
		$data['created'] = $this->_date;
		$data['createdby'] = $this->_user['id'];
		$data['modified'] = '0000-00-00';
		$data['modifiedby'] = 0;
		echo $contactid = $contact->addContact($data);

		$addressDb = new Application_Model_DbTable_Address();

		//Primary Address
		$primaryAddress = $addressDb->fetchRow(
			$addressDb->select()
				->where('contactid = ?', $id)
				->where('type = ?', 'primaryAddress')
				->where('clientid = ?', $this->_user['clientid'])
		);
		$street = $primaryAddress['street'];
		$postcode = $primaryAddress['postcode'];
		$city = $primaryAddress['city'];
		$country = $primaryAddress['country'];
		$addressDb->addAddress($contactid, 'primaryAddress', '', '', '', $street, $postcode, $city, $country, '', $this->_user['clientid'], $this->_date);

		//Shipping Address
		$shippingAddress = $addressDb->fetchRow(
			$addressDb->select()
				->where('contactid = ?', $id)
				->where('type = ?', 'shippingAddress')
				->where('clientid = ?', $this->_user['clientid'])
		);
		$shippingname1 = $shippingAddress['name1'];
		$shippingname2 = $shippingAddress['name2'];
		$shippingdepartment = $shippingAddress['department'];
		$shippingstreet = $shippingAddress['street'];
		$shippingpostcode = $shippingAddress['postcode'];
		$shippingcity = $shippingAddress['city'];
		$shippingcountry = $shippingAddress['country'];
		$shippingphone = $shippingAddress['phone'];
		$addressDb->addAddress($contactid, 'shippingAddress', $shippingname1, $shippingname2, $shippingdepartment, $shippingstreet, $shippingpostcode, $shippingcity, $shippingcountry, $shippingphone, $this->_user['clientid'], $this->_date);

		//Phone
		$phoneDb = new Contacts_Model_DbTable_Phone();
		$phones = $phoneDb->getPhone($id);
		foreach($phones as $phone) {
			$phoneDb->addPhone($contactid, $phone['type'], $phone['phone'], $phone['ordering']);
		}

		//Email
		$emailDb = new Contacts_Model_DbTable_Email();
		$emails = $emailDb->getEmail($id);
		foreach($emails as $email) {
			$emailDb->addEmail($contactid, $email['email'], $email['ordering']);
		}

		//Internet
		$internetDb = new Contacts_Model_DbTable_Internet();
		$internets = $internetDb->getInternet($id);
		foreach($internets as $internet) {
			$internetDb->addInternet($contactid, $internet['internet'], $internet['ordering']);
		}

        //Create the directory for the new contact
        $this->checkDirectory($contactid);

		$this->_flashMessenger->addMessage('MESSAGES_SUCCESFULLY_COPIED');
	}

	protected function uploadAction()
	{
		$this->_helper->getHelper('layout')->setLayout('plain');

		$form = new Application_Form_Upload();
		//$form->file->setDestination('/var/www/dewawi/files/');

		if($this->getRequest()->isPost()) {
			$formData = $this->getRequest()->getPost();
			if($form->isValid($formData)) {
				$contactid = $this->_getParam('contactid', 0);

				/* Uploading Document File on Server */
				$upload = new Zend_File_Transfer_Adapter_Http();
				$upload->setDestination(BASE_PATH.'/files/contacts/'.$contactid.'/');
				try {
					// upload received file(s)
					$upload->receive();
				} catch (Zend_File_Transfer_Exception $e) {
					$e->getMessage();
				}
			} else {
				$form->populate($formData);
			}
		}

		$this->view->form = $form;
	}

	public function pdfAction()
	{
		$this->_helper->getHelper('layout')->disableLayout();

		$id = $this->_getParam('id', 0);
		$templateid = $this->_getParam('templateid', 0);
		$locale = Zend_Registry::get('Zend_Locale');
		$templateid = 100;
		$locale = 'de';

		if($templateid) {
			$templateDb = new Application_Model_DbTable_Template();
			$template = $templateDb->getTemplate($templateid);
			if($template['filename']) $this->_helper->viewRenderer->setRender($template['filename']);
			$this->view->template = $template;
		}

		$contactDb = new Contacts_Model_DbTable_Contact();
		$contact = $contactDb->getContact($id);

		//Set language
		$translate = new Zend_Translate('array', BASE_PATH.'/languages/'.$quote['language']);
		Zend_Registry::set('Zend_Locale', $quote['language']);
		Zend_Registry::set('Zend_Translate', $translate);

		$this->view->contact = $contact;
		$this->view->footers = $this->_helper->Footer->getFooters($templateid, $this->_user['clientid']);
	}


	public function deleteAction()
	{
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		if($this->getRequest()->isPost()) {
			$id = $this->_getParam('id', 0);
			$contactDb = new Contacts_Model_DbTable_Contact();
			$contactDb->deleteContact($id);

			$phoneDb = new Contacts_Model_DbTable_Phone();
			$phones = $phoneDb->getPhone($id);
			foreach($phones as $phone) {
				$phoneDb->deletePhone($phone['id']);
			}

			$emailDb = new Contacts_Model_DbTable_Email();
			$emails = $emailDb->getEmail($id);
			foreach($emails as $email) {
				$emailDb->deleteEmail($email['id']);
			}

			$internetDb = new Contacts_Model_DbTable_Internet();
			$internets = $internetDb->getInternet($id);
			foreach($internets as $internet) {
				$internetDb->deleteInternet($internet['id']);
			}
		}
		$this->_flashMessenger->addMessage('MESSAGES_SUCCESFULLY_DELETED');
	}

	public function lockAction()
	{
		header('Content-type: application/json');
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		$id = $this->_getParam('id', 0);
		$contactDb = new Contacts_Model_DbTable_Contact();
		$contact = $contactDb->getContact($id);
		if($this->isLocked($contact['locked'], $contact['lockedtime'])) {
			$userDb = new Users_Model_DbTable_User();
			$user = $userDb->getUser($contact['locked']);
			echo Zend_Json::encode(array('message' => $this->view->translate('MESSAGES_ACCESS_DENIED_%1$s', $user['name'])));
		} else {
			$contactDb->lock($id, $this->_user['id'], $this->_date);
		}
	}

	public function unlockAction()
	{
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		$id = $this->_getParam('id', 0);
		$contactDb = new Contacts_Model_DbTable_Contact();
		$contactDb->unlock($id);
	}

	public function keepaliveAction()
	{
		$id = $this->_getParam('id', 0);
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		$contactDb = new Contacts_Model_DbTable_Contact();
		$contactDb->lock($id, $this->_user['id'], $this->_date);
	}

	public function validateAction()
	{
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		$form = new Contacts_Form_Contact();
		$options = $this->_helper->Options->getOptions($form, $this->_user['clientid']);

		$form->isValid($this->_getAllParams());
		$json = $form->getMessages();
		header('Content-type: application/json');
		echo Zend_Json::encode($json);
	}

	public function autocompleteAction()
	{
		$request = $this->getRequest();
		$order = $this->_getParam('order', null) ? $this->_getParam('order', 'id') : $request->getCookie('order', 'id');
		$sort = $this->_getParam('sort', null) ? $this->_getParam('sort', 'desc') : $request->getCookie('sort', 'desc');
		$keyword = $this->_getParam('keyword', null);

		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->getHelper('layout')->disableLayout();

		$keyword = trim($keyword);
		$columns = array('id', 'name1', 'name2');
		if($keyword) {
			$keywordArray = explode(" ", $keyword);
		}

		$query = "";
		foreach($columns as $column) {
			if($query) $query .= " OR ";
			$query .= "(";
			//Keyword
			if(isset($keywordArray)) {
				$query .= "(";
				$count = count($keywordArray);
				foreach($keywordArray as $key => $value) {
					$query .= $column." LIKE '%".$value."%'";
					if($count > ($key+1)) $query .= " AND ";
				}
				$query .= ") AND ";
			} elseif($keyword) {
				$query .= $column." LIKE '%".$keyword."%' AND ";
			}
			$query .= "clientid = ".$this->_user["clientid"].")";
		}

		$contactsDb = new Contacts_Model_DbTable_Contact();
		$contacts = $contactsDb->fetchAll(
			$contactsDb->select()
				->from('contact', array('id', 'name1'))
				->where($query)
				->setIntegrityCheck(false)
				->order($order." ".$sort)
				->limit(100)
		);

		header('Content-type: application/json');
		//$suggestions = array("suggestions" => array());
		//foreach($contacts as $contact) {
		//	array_push($suggestions["suggestions"], array("id" => $contact->id, "name1" => $contact->name1));
		//}
		//echo Zend_Json::encode($suggestions);
echo '{
        // Query is not required as of version 1.2.5
        query: "Unit",
        suggestions: [
            { value: "United Arab Emirates", data: "AE" },
            { value: "United Kingdom",       data: "UK" },
            { value: "United States",        data: "US" }
        ]
    }';
//print_r($suggestions);
	}

	protected function search($params, $categories)
	{
		$contactsDb = new Contacts_Model_DbTable_Contact();

		$columns = array('c.id', 'c.name1', 'c.name2', 'a.postcode', 'a.street', 'a.postcode', 'a.city', 'a.country', 'p.phone', 'e.email', 'i.internet');

		$query = '';
		$schema = 'c';
		if($params['keyword']) $query = $this->_helper->Query->getQueryKeyword($query, $params['keyword'], $columns);
		if($params['catid']) $query = $this->_helper->Query->getQueryCategory($query, $params['catid'], $categories, $schema);
		if($params['country']) $query = $this->_helper->Query->getQueryCountryC($query, $params['country'], 'a');
		if($query) {
			$query .= " AND a.type = 'primaryAddress'";
			$query .= ' AND c.clientid = '.$this->_user['clientid'];
		}

		$order = $params['order'];
		if(($order == 'street') || ($order == 'postcode') || ($order == 'city') || ($order == 'country')) $order = 'a.'.$order;
		else $order = 'c.'.$order;

		$contacts = $contactsDb->fetchAll(
			$contactsDb->select()
				->setIntegrityCheck(false)
				->from(array($schema => 'contact'))
				->join(array('a' => 'address'), 'c.id = a.contactid', array('street', 'postcode', 'city', 'country'))
				->joinLeft(array('p' => 'phone'), 'c.id = p.contactid', array('phones' => new Zend_Db_Expr('GROUP_CONCAT(DISTINCT p.phone)')))
				->joinLeft(array('e' => 'email'), 'c.id = e.contactid', array('emails' => new Zend_Db_Expr('GROUP_CONCAT(DISTINCT e.email)')))
				->joinLeft(array('i' => 'internet'), 'c.id = i.contactid', array('internets' => new Zend_Db_Expr('GROUP_CONCAT(DISTINCT i.internet)')))
				->group($schema.'.id')
				->where($query ? $query : 1)
				->order($order.' '.$params['sort'])
				->limit($params['limit'])
		);

		return $contacts;
	}

	protected function getHistory($id) {
		$this->_currency->setFormat(array('display' => Zend_Currency::USE_SYMBOL));

		$documentrelationDb = new Application_Model_DbTable_Documentrelation();
		$documentrelations = $documentrelationDb->fetchAll(
				$documentrelationDb->select()
					->where('contactid = ?', $id)
		);
		$documentrelationIDs = array();
		foreach($documentrelations as $documentrelation) {
			if(!isset($documentrelationIDs[$documentrelation['module']][$documentrelation['controller']]))
				$documentrelationIDs[$documentrelation['module']][$documentrelation['controller']] = array();
			array_push($documentrelationIDs[$documentrelation['module']][$documentrelation['controller']], $documentrelation['documentid']);
		}

		//Quotes
		$quoteDb = new Sales_Model_DbTable_Quote();
		if(isset($documentrelationIDs['sales']['quote'])) {
			$history['quotes'] = $quoteDb->fetchAll(
					$quoteDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
						->orWhere('id IN (?)', $documentrelationIDs['sales']['quote'])
						->where('clientid = ?', $this->_user['clientid'])
			);
		} else {
			$history['quotes'] = $quoteDb->fetchAll(
					$quoteDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
			);
		}
		foreach($history['quotes'] as $quote) {
			$quote->subtotal = $this->_currency->toCurrency($quote->subtotal);
			$quote->taxes = $this->_currency->toCurrency($quote->taxes);
			$quote->total = $this->_currency->toCurrency($quote->total);
			if($quote->quotedate && ($quote->quotedate != '0000-00-00'))
				$quote->quotedate = date('d.m.Y', strtotime($quote->quotedate));
			if($quote->modified && ($quote->modified != '0000-00-00'))
				$quote->modified = date('d.m.Y', strtotime($quote->modified));
			if($quote->deliverydate && ($quote->deliverydate != '0000-00-00'))
				$quote->deliverydate = date('d.m.Y', strtotime($quote->deliverydate));
		}

		//Sales orders
		$salesorderDb = new Sales_Model_DbTable_Salesorder();
		if(isset($documentrelationIDs['sales']['salesorder'])) {
			$history['salesorders'] = $salesorderDb->fetchAll(
					$salesorderDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
						->orWhere('id IN (?)', $documentrelationIDs['sales']['salesorder'])
						->where('clientid = ?', $this->_user['clientid'])
			);
		} else {
			$history['salesorders'] = $salesorderDb->fetchAll(
					$salesorderDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
			);
		}
		foreach($history['salesorders'] as $salesorder) {
			$salesorder->subtotal = $this->_currency->toCurrency($salesorder->subtotal);
			$salesorder->taxes = $this->_currency->toCurrency($salesorder->taxes);
			$salesorder->total = $this->_currency->toCurrency($salesorder->total);
			if($salesorder->salesorderdate && ($salesorder->salesorderdate != '0000-00-00'))
				$salesorder->salesorderdate = date('d.m.Y', strtotime($salesorder->salesorderdate));
			if($salesorder->modified && ($salesorder->modified != '0000-00-00'))
				$salesorder->modified = date('d.m.Y', strtotime($salesorder->modified));
			if($salesorder->deliverydate && ($salesorder->deliverydate != '0000-00-00'))
				$salesorder->deliverydate = date('d.m.Y', strtotime($salesorder->deliverydate));
		}

		//Invoices
		$invoiceDb = new Sales_Model_DbTable_Invoice();
		if(isset($documentrelationIDs['sales']['invoice'])) {
			$history['invoices'] = $invoiceDb->fetchAll(
					$invoiceDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
						->orWhere('id IN (?)', $documentrelationIDs['sales']['invoice'])
						->where('clientid = ?', $this->_user['clientid'])
			);
		} else {
			$history['invoices'] = $invoiceDb->fetchAll(
					$invoiceDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
			);
		}
		foreach($history['invoices'] as $invoice) {
			$invoice->subtotal = $this->_currency->toCurrency($invoice->subtotal);
			$invoice->taxes = $this->_currency->toCurrency($invoice->taxes);
			$invoice->total = $this->_currency->toCurrency($invoice->total);
			if($invoice->invoicedate && ($invoice->invoicedate != '0000-00-00'))
				$invoice->invoicedate = date('d.m.Y', strtotime($invoice->invoicedate));
			if($invoice->modified && ($invoice->modified != '0000-00-00'))
				$invoice->modified = date('d.m.Y', strtotime($invoice->modified));
			if($invoice->deliverydate && ($invoice->deliverydate != '0000-00-00'))
				$invoice->deliverydate = date('d.m.Y', strtotime($invoice->deliverydate));
		}

		//Delivery orders
		$deliveryorderDb = new Sales_Model_DbTable_Deliveryorder();
		if(isset($documentrelationIDs['sales']['deliveryorder'])) {
			$history['deliveryorders'] = $deliveryorderDb->fetchAll(
					$deliveryorderDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
						->orWhere('id IN (?)', $documentrelationIDs['sales']['deliveryorder'])
						->where('clientid = ?', $this->_user['clientid'])
			);
		} else {
			$history['deliveryorders'] = $deliveryorderDb->fetchAll(
					$deliveryorderDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
			);
		}
		foreach($history['deliveryorders'] as $deliveryorder) {
			$deliveryorder->subtotal = $this->_currency->toCurrency($deliveryorder->subtotal);
			$deliveryorder->taxes = $this->_currency->toCurrency($deliveryorder->taxes);
			$deliveryorder->total = $this->_currency->toCurrency($deliveryorder->total);
			if($deliveryorder->deliveryorderdate && ($deliveryorder->deliveryorderdate != '0000-00-00'))
				$deliveryorder->deliveryorderdate = date('d.m.Y', strtotime($deliveryorder->deliveryorderdate));
			if($deliveryorder->modified && ($deliveryorder->modified != '0000-00-00'))
				$deliveryorder->modified = date('d.m.Y', strtotime($deliveryorder->modified));
			if($deliveryorder->deliverydate && ($deliveryorder->deliverydate != '0000-00-00'))
				$deliveryorder->deliverydate = date('d.m.Y', strtotime($deliveryorder->deliverydate));
		}

		//Credit notes
		$creditnoteDb = new Sales_Model_DbTable_Creditnote();
		if(isset($documentrelationIDs['sales']['creditnote'])) {
			$history['creditnotes'] = $creditnoteDb->fetchAll(
					$creditnoteDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
						->orWhere('id IN (?)', $documentrelationIDs['sales']['creditnote'])
						->where('clientid = ?', $this->_user['clientid'])
			);
		} else {
			$history['creditnotes'] = $creditnoteDb->fetchAll(
					$creditnoteDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
			);
		}
		foreach($history['creditnotes'] as $creditnote) {
			$creditnote->subtotal = $this->_currency->toCurrency($creditnote->subtotal);
			$creditnote->taxes = $this->_currency->toCurrency($creditnote->taxes);
			$creditnote->total = $this->_currency->toCurrency($creditnote->total);
			if($creditnote->creditnotedate && ($creditnote->creditnotedate != '0000-00-00'))
				$creditnote->creditnotedate = date('d.m.Y', strtotime($creditnote->creditnotedate));
			if($creditnote->modified && ($creditnote->modified != '0000-00-00'))
				$creditnote->modified = date('d.m.Y', strtotime($creditnote->modified));
			if($creditnote->deliverydate && ($creditnote->deliverydate != '0000-00-00'))
				$creditnote->deliverydate = date('d.m.Y', strtotime($creditnote->deliverydate));
		}

		//Quote requests
		$quoterequestDb = new Purchases_Model_DbTable_Quoterequest();
		if(isset($documentrelationIDs['purchases']['quoterequest'])) {
			$history['quoterequests'] = $quoterequestDb->fetchAll(
					$quoterequestDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
						->orWhere('id IN (?)', $documentrelationIDs['purchases']['quoterequest'])
						->where('clientid = ?', $this->_user['clientid'])
			);
		} else {
			$history['quoterequests'] = $quoterequestDb->fetchAll(
					$quoterequestDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
			);
		}
		foreach($history['quoterequests'] as $quoterequest) {
			$quoterequest->subtotal = $this->_currency->toCurrency($quoterequest->subtotal);
			$quoterequest->taxes = $this->_currency->toCurrency($quoterequest->taxes);
			$quoterequest->total = $this->_currency->toCurrency($quoterequest->total);
			if($quoterequest->quoterequestdate && ($quoterequest->quoterequestdate != '0000-00-00'))
				$quoterequest->quoterequestdate = date('d.m.Y', strtotime($quoterequest->quoterequestdate));
			if($quoterequest->modified && ($quoterequest->modified != '0000-00-00'))
				$quoterequest->modified = date('d.m.Y', strtotime($quoterequest->modified));
			if($quoterequest->deliverydate && ($quoterequest->deliverydate != '0000-00-00'))
				$quoterequest->deliverydate = date('d.m.Y', strtotime($quoterequest->deliverydate));
		}

		//Purchase orders
		$purchaseorderDb = new Purchases_Model_DbTable_Purchaseorder();
		if(isset($documentrelationIDs['purchases']['purchaseorder'])) {
			$history['purchaseorders'] = $purchaseorderDb->fetchAll(
					$purchaseorderDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
						->orWhere('id IN (?)', $documentrelationIDs['purchases']['purchaseorder'])
						->where('clientid = ?', $this->_user['clientid'])
			);
		} else {
			$history['purchaseorders'] = $purchaseorderDb->fetchAll(
					$purchaseorderDb->select()
						->where('contactid = ?', $id)
						->where('clientid = ?', $this->_user['clientid'])
			);
		}
		foreach($history['purchaseorders'] as $purchaseorder) {
			$purchaseorder->subtotal = $this->_currency->toCurrency($purchaseorder->subtotal);
			$purchaseorder->taxes = $this->_currency->toCurrency($purchaseorder->taxes);
			$purchaseorder->total = $this->_currency->toCurrency($purchaseorder->total);
		}

		//Processes
		$processesDb = new Processes_Model_DbTable_Process();
		$history['processes'] = $processesDb->fetchAll(
				$processesDb->select()
					->where('customerid = ?', $id)
					//->where('clientid = ?', $this->_user['clientid'])
		);
		/*foreach($history['processes'] as $process) {
			$process->subtotal = $this->_currency->toCurrency($process->subtotal);
			$process->taxes = $this->_currency->toCurrency($process->taxes);
			$process->total = $this->_currency->toCurrency($process->total);
		}*/
		return $history;
	}

	protected function checkDirectory($id) {
		//Create contact folder if does not already exists
        $path = BASE_PATH.'/files/contacts/';
        $dir1 = substr($id, 0, 1).'/';
        if(strlen($id) > 1) $dir2 = substr($id, 1, 1).'/';
        else $dir2 = '0/';
        if(file_exists($path.$dir1.$dir2.$id) && is_dir($path.$dir1.$dir2.$id) && is_writable($path.$dir1.$dir2.$id)) {
            return true;
        } elseif(is_writable($path)) {
            $response = mkdir($path.$dir1.$dir2.$id, 0777, true);
            if($response === false) $this->_flashMessenger->addMessage('MESSAGES_DIRECTORY_IS_NOT_WRITABLE');
			return $response;
        } else {
            $this->_flashMessenger->addMessage('MESSAGES_DIRECTORY_IS_NOT_WRITABLE');
			return false;
        }
	}

	protected function isLocked($locked, $lockedtime)
	{
		if($locked && ($locked != $this->_user['id'])) {
			$timeout = strtotime($lockedtime) + 300; // 5 minutes
			$timestamp = strtotime($this->_date);
			if($timeout < $timestamp) {
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}
}
