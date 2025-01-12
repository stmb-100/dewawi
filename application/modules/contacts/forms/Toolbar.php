<?php

class Contacts_Form_Toolbar extends Zend_Form
{
	public function init()
	{
		$this->setName('toolbar');

		$form = array();

		$form['add'] = new Zend_Form_Element_Button('add');
		$form['add']->setLabel('TOOLBAR_NEW')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'add');

		$form['addset'] = new Zend_Form_Element_Button('addset');
		$form['addset']->setLabel('TOOLBAR_NEW_SET')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'addSet add');

		$form['view'] = new Zend_Form_Element_Button('view');
		$form['view']->setLabel('TOOLBAR_VIEW')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'view');

		$form['edit'] = new Zend_Form_Element_Button('edit');
		$form['edit']->setLabel('TOOLBAR_EDIT')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'edit hidden-sm');

		$form['editInline'] = new Zend_Form_Element_Button('edit');
		$form['editInline']->setLabel('')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'edit nolabel');

		$form['save'] = new Zend_Form_Element_Button('save');
		$form['save']->setLabel('TOOLBAR_SAVE')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'save');

		$form['copy'] = new Zend_Form_Element_Button('copy');
		$form['copy']->setLabel('TOOLBAR_COPY')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'copy hidden-sm');

		$form['copyInline'] = new Zend_Form_Element_Button('copy');
		$form['copyInline']->setLabel('')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'copy nolabel');

		$form['pdf'] = new Zend_Form_Element_Button('pdf');
		$form['pdf']->setLabel('TOOLBAR_PDF')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'pdf');

		$form['delete'] = new Zend_Form_Element_Button('delete');
		$form['delete']->setLabel('TOOLBAR_DELETE')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'delete hidden-sm');

		$form['deleteInline'] = new Zend_Form_Element_Button('delete');
		$form['deleteInline']->setLabel('')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'delete nolabel');

		$form['keyword'] = new Zend_Form_Element_Text('keyword');
		$form['keyword']->setDecorators(array('ViewHelper'))
			->setAttrib('default', '');

		$form['clear'] = new Zend_Form_Element_Button('clear');
		$form['clear']->setLabel('')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'clear nolabel')
			->setAttrib('rel', 'keyword');

		$form['reset'] = new Zend_Form_Element_Button('reset');
		$form['reset']->setLabel('TOOLBAR_RESET')
			->setDecorators(array('ViewHelper'))
			->setAttrib('class', 'reset hidden-sm');

		$form['order'] = new Zend_Form_Element_Select('order');
		$form['order']->setDecorators(array('ViewHelper'))
			->addMultiOption('id', 'ORDERING_CREATION')
			->addMultiOption('name1', 'ORDERING_NAME')
			->addMultiOption('postcode', 'ORDERING_POSTCODE')
			->addMultiOption('city', 'ORDERING_CITY')
			->addMultiOption('country', 'ORDERING_COUNTRY')
			->addMultiOption('catid', 'ORDERING_CATEGORY')
			->addMultiOption('modified', 'ORDERING_MODIFIED')
			->setAttrib('default', 'id')
			->setAttrib('class', 'hidden-sm');

		$form['sort'] = new Zend_Form_Element_Select('sort');
		$form['sort']->setDecorators(array('ViewHelper'))
			->addMultiOption('asc', 'ORDERING_ASC')
			->addMultiOption('desc', 'ORDERING_DESC')
			->setAttrib('default', 'desc')
			->setAttrib('class', 'hidden-sm');

		$form['country'] = new Zend_Form_Element_Select('country');
		$form['country']->setDecorators(array('ViewHelper'))
			->addMultiOption('0', 'TOOLBAR_ALL_COUNTRIES')
			->setAttrib('default', '0')
			->setAttrib('class', 'hidden-sm hidden-md');

		$form['controller'] = new Zend_Form_Element_Select('controller');
		$form['controller']->setDecorators(array('ViewHelper'))
			->addMultiOption('0', 'TOOLBAR_ALL')
			->addMultiOption('contact', 'CONTACTS')
			->addMultiOption('creditnote', 'CREDIT_NOTES')
			->addMultiOption('deliveryorder', 'DELIVERY_ORDERS')
			->addMultiOption('invoice', 'INVOICES')
			->addMultiOption('quote', 'QUOTES')
			->addMultiOption('reminder', 'REMINDERS')
			->addMultiOption('salesorder', 'SALES_ORDERS')
			->addMultiOption('purchaseorder', 'PURCHASE_ORDERS')
			->addMultiOption('quoterequest', 'QUOTE_REQUESTS')
			->setAttrib('default', '0')
			->setAttrib('class', 'hidden-sm');

		$form['limit'] = new Zend_Form_Element_Select('limit');
		$form['limit']->setDecorators(array('ViewHelper'))
			->addMultiOption('50', '50')
			->addMultiOption('100', '100')
			->addMultiOption('250', '250')
			->addMultiOption('500', '500')
			->addMultiOption('0', 'TOOLBAR_ALL')
			->setAttrib('default', '50')
			->setAttrib('class', 'hidden-sm');

		$form['catid'] = new Zend_Form_Element_Select('catid');
		$form['catid']->setDecorators(array('ViewHelper'))
			->addMultiOption('all', 'CATEGORIES_ALL')
			->setAttrib('default', 'all')
			->setAttrib('class', 'hidden-sm');

		$form['tagid'] = new Zend_Form_Element_Select('tagid');
		$form['tagid']->setDecorators(array('ViewHelper'))
			->addMultiOption('0', 'TAGS_ALL')
			->setAttrib('default', '0')
			->setAttrib('class', 'hidden-sm');

		$form['page'] = new Zend_Form_Element_Text('page');
		$form['page']->setDecorators(array('ViewHelper'))
			->setAttrib('default', '');

		$this->addElements($form);
	}
}
