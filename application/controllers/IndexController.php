<?php

class IndexController extends Zend_Controller_Action
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

	public function indexAction()
	{
		$toolbar = new Statistics_Form_Toolbar();
		$options = $this->_helper->Options->getOptions($toolbar, $this->_user['clientid']);
		$params = $this->_helper->Params->getParams($toolbar, $options);

		$charts = new Statistics_Model_Charts();
		$charts->createCharts(13, 750, 400, $this->view->translate('STATISTICS_UNCATEGORIZED'), $params, $options);

		$quotesDb = new Sales_Model_DbTable_Quote();
		$quotes = $quotesDb->fetchAll(
			$quotesDb->select()
				->where('quoteid = ?', 0)
				->order('id desc')
				->limit(5)
		);
		$this->view->quotes = $quotes;

		$salesordersDb = new Sales_Model_DbTable_Salesorder();
		$salesorders = $salesordersDb->fetchAll(
			$salesordersDb->select()
				->where('salesorderid = ?', 0)
				->order('id desc')
				->limit(5)
		);
		$this->view->salesorders = $salesorders;

		$invoicesDb = new Sales_Model_DbTable_Invoice();
		$invoices = $invoicesDb->fetchAll(
			$invoicesDb->select()
				->where('invoiceid = ?', 0)
				->order('id desc')
				->limit(5)
		);
		$this->view->invoices = $invoices;

		$quoterequestsDb = new Purchases_Model_DbTable_Quoterequest();
		$quoterequests = $quoterequestsDb->fetchAll(
			$quoterequestsDb->select()
				->where('quoterequestid = ?', 0)
				->order('id desc')
				->limit(5)
		);
		$this->view->quoterequests = $quoterequests;

		$purchaseordersDb = new Purchases_Model_DbTable_Purchaseorder();
		$purchaseorders = $purchaseordersDb->fetchAll(
			$purchaseordersDb->select()
				->where('purchaseorderid = ?', 0)
				->order('id desc')
				->limit(5)
		);
		$this->view->purchaseorders = $purchaseorders;

		$contactsDb = new Contacts_Model_DbTable_Contact();
		$contacts = $contactsDb->fetchAll(
			$contactsDb->select()
				->order('id desc')
				->limit(5)
		);
		$this->view->contacts = $contacts;

		$itemsDb = new Items_Model_DbTable_Item();
		$items = $itemsDb->fetchAll(
			$itemsDb->select()
				->order('id desc')
				->limit(5)
		);
		$this->view->items = $items;

		$inventoryDb = new Items_Model_DbTable_Inventory();
		$inventory = $inventoryDb->fetchAll(
			$inventoryDb->select()
				->order('id desc')
				->limit(5)
		);
		$this->view->inventories = $inventory;

		$this->view->options = $options;
		$this->view->toolbar = new Application_Form_Toolbar();
		$this->view->messages = $this->_flashMessenger->getMessages();
	}
}







