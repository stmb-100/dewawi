<?php

class Sales_Model_DbTable_Reminderpos extends Zend_Db_Table_Abstract
{

	protected $_name = 'reminderpos';

	protected $_date = null;

	protected $_user = null;

	public function init()
	{
		$this->_date = date('Y-m-d H:i:s');
		$this->_user = Zend_Registry::get('User');
	}

	public function getPosition($id)
	{
		$id = (int)$id;
		$row = $this->fetchRow('id = ' . $id);
		if (!$row) {
			throw new Exception("Could not find row $id");
		}
		return $row->toArray();
	}

	public function getPositions($reminderid)
	{
		$reminderid = (int)$reminderid;
		$where = array();
		$where[] = $this->getAdapter()->quoteInto('reminderid = ?', $reminderid);
		$where[] = $this->getAdapter()->quoteInto('clientid = ?', $this->_user['clientid']);
		$where[] = $this->getAdapter()->quoteInto('deleted = ?', 0);
		$data = $this->fetchAll($where, 'ordering');
		if (!$data) {
			throw new Exception("Could not find row $reminderid");
		}
		return $data;
	}

	public function addPosition($data)
	{
		$this->insert($data);
		return $this->getAdapter()->lastInsertId();
	}

	public function updatePosition($id, $data)
	{
		$this->update($data, 'id = '. (int)$id);
	}

	public function sortPosition($id, $ordering)
	{
		$data = array(
			'ordering' => $ordering,
		);
		$this->update($data, 'id = '. (int)$id);
	}

	public function sortPositions($orderings)
	{
		$ids = implode(',', array_keys($orderings));
		$sql = "UPDATE ".$this->_name." SET ordering = CASE id ";
		foreach ($orderings as $id => $ordering) {
			$sql .= sprintf("WHEN %d THEN %d ", $id, $ordering);
		}
		$sql .= "END WHERE id IN (".$ids.")";
		$this->_db->query($sql);
	}

	public function deletePosition($id)
	{
		$data = array(
			'deleted' => 1
		);
		$this->update($data, 'id =' . (int)$id);
	}

	public function deletePositions($ids)
	{
		$data = array(
			'deleted' => 1
		);
		$where = $this->getAdapter()->quoteInto('id IN (?)', $ids);
		$this->update($data, $where);
	}
}
