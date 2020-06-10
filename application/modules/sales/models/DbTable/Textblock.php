<?php

class Sales_Model_DbTable_Textblock extends Zend_Db_Table_Abstract
{

	protected $_name = 'textblock';

	protected $_date = null;

	protected $_user = null;

	public function init()
	{
		$this->_date = date('Y-m-d H:i:s');
		$this->_user = Zend_Registry::get('User');
	}

	public function getTextblocks($controller)
	{
		$where = array();
		$where[] = $this->getAdapter()->quoteInto('controller = ?', $controller);
		$where[] = $this->getAdapter()->quoteInto('clientid = ?', $this->_user['clientid']);
		//$where[] = $this->getAdapter()->quoteInto('deleted = ?', 0);
		$data = $this->fetchAll($where, 'ordering');
		if (!$data) {
			throw new Exception("Could not find row");
		}
		$textblocks = array();
		foreach($data as $textblock)
            $textblocks[$textblock->section] = $textblock->text;
		return $textblocks;
	}

	public function updateTextblock($data, $controller, $section)
	{
		$where = array();
        $where[] = "controller = '".$controller."'";
        $where[] = "section = '".$section."'";
		$this->update($data, $where);
	}
}
