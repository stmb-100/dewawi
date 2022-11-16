<?php

class Admin_Model_DbTable_Increment extends Zend_Db_Table_Abstract
{

	protected $_name = 'increment';

	protected $_date = null;

	protected $_user = null;

	protected $_client = null;

	public function init()
	{
		$this->_date = date('Y-m-d H:i:s');
		$this->_user = Zend_Registry::get('User');
		$this->_client = Zend_Registry::get('Client');
	}

	public function getIncrement($type)
	{
		$where = array();
		$where[] = $this->getAdapter()->quoteInto('clientid = ?', $this->_client['id']);
		$data = $this->fetchRow($where);
		if(!$data) {
			throw new Exception("Could not find row $type");
		}
		return $data->$type;
	}

	public function setIncrement($id, $type)
	{
		$data = array(
			$type => $id,
		);
		$this->update($data, 'clientid = '. (int)$this->_client['id']);
	}

	public function addIncrement($data, $clientid = 0)
	{
		//$data['created'] = $this->_date;
		//$data['createdby'] = $this->_user['id'];
		if($clientid) {
			$data['clientid'] = $clientid;
		} else {
			$data['clientid'] = $this->_client['id'];
		}
		$this->insert($data);
		return $this->getAdapter()->lastInsertId();
	}

	public function updateIncrement($id, $data)
	{
		//$data['modified'] = $this->_date;
		//$data['modifiedby'] = $this->_user['id'];
		$this->update($data, 'id = '. (int)$id);
	}

	public function deleteIncrement($id)
	{
		$data = array();
		$data['deleted'] = 1;
		$this->update($data, 'id =' . (int)$id);
	}
}
