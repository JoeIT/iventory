<?php
class App_Dao_ItemDao {
	
	private $entityManager;
	private $_where = '';
	
	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance ();
		$this->entityManager = $registry->entityManager;
	}
	
	public function save(App_Model_Item $item) {
		$this->entityManager->persist ( $item );
		$this->entityManager->flush ();
	}
	
	public function remove(App_Model_Item $item) {
		$this->entityManager->remove($item);
		$this->entityManager->flush();
	}
	
	public function getAll() {
		$query = $this->entityManager->createQuery ( 'SELECT i FROM App_Model_Item i ORDER BY i.code, i.newCode, i.accountingCode' );
		
		return $query->getResult ();
	}

	// ----------------------------------------------------------------
	// Return the number of total items
	public function countAll() {
		$query = $this->entityManager->createQuery ( 'SELECT COUNT(i) FROM App_Model_Item i' );

		$result = $query->getResult ();
		return $result [0][1];
	}
	
	public function getAllLimitOffset($limit, $offset) {
		$query = $this->entityManager->createQuery ( 'SELECT i FROM App_Model_Item i ORDER BY i.code, i.newCode, i.accountingCode' )->setFirstResult ( $offset )->setMaxResults ( $limit );
		
		return $query->getResult ();
	}
	
	// ----------------------------------------------------------------
	// Return the number of total items from the search result
	public function countSearchAll() {
		$query = $this->entityManager->createQuery ( "SELECT COUNT(i) FROM App_Model_Item i " . $this->_where );	
		$result = $query->getResult ();
		
		return $result [0][1];
	}
	
	public function getSearchLimitOffset($limit, $offset) {
		$query = $this->entityManager->createQuery ( "SELECT i FROM App_Model_Item i ". $this->_where ." ORDER BY i.code, i.newCode, i.accountingCode " )->setFirstResult ( $offset )->setMaxResults ( $limit );
		//$query = $this->entityManager->createQuery ( "SELECT i FROM App_Model_Item i WHERE i.type = '3'" )->setFirstResult ( $offset )->setMaxResults ( $limit );
		//$query = $this->entityManager->createQuery ( 'SELECT i FROM App_Model_Item i $where ORDER BY i.code, i.newCode, i.accountingCode' )->setFirstResult ( $offset )->setMaxResults ( $limit );
		
		return $query->getResult ();
	}
	
	public function createSearchWhere($name, $code, $type, $brand, $origin, $location) {
		$this->_where = '';
		
		if( !empty($name) )
			$this->_where .= " AND i.name LIKE '$name'% ";
		if( !empty($code) )
			$this->_where .= " AND i.code LIKE '$code'% ";
		if( !empty($type) )
			$this->_where .= " AND i.type = '$type' ";
		if( !empty($brand) )
			$this->_where .= " AND i.brand = '$brand' ";
		if( !empty($origin) )
			$this->_where .= " AND i.origin = '$origin' ";
		if( !empty($location) )
			$this->_where .= " AND i.location = '$location' ";
		
		if( !empty($this->_where) )
			$this->_where = ' WHERE ' . substr($this->_where, 4);		
	}
	
	// ----------------------------------------------------------------
	public function getById($id) {
		$query = $this->entityManager->createQuery( "SELECT i FROM App_Model_Item i WHERE i.id = $id" );
		$arrayResult = $query->getResult();
		if(count($arrayResult) > 0)
			return $arrayResult[0];
		else
			return null;
	}
	
	public function getByCode($code) {
		$query = $this->entityManager->createQuery( "SELECT i FROM App_Model_Item i WHERE i.code = '$code'" );
		$arrayResult = $query->getResult();
		if(count($arrayResult) > 0)
			return $arrayResult[0];
		else
			return null;
	}
	
	public function getByNewCode($newCode) {
		$query = $this->entityManager->createQuery( "SELECT i FROM App_Model_Item i WHERE i.newCode = '$newCode'" );
		$arrayResult = $query->getResult();
		if(count($arrayResult) > 0)
			return $arrayResult[0];
		else
			return null;
	}
	
	public function getByAccountingCode($accountingCode) {
		$query = $this->entityManager->createQuery( "SELECT i FROM App_Model_Item i WHERE i.accountingCode = '$accountingCode'" );
		$arrayResult = $query->getResult();
		if(count($arrayResult) > 0)
			return $arrayResult[0];
		else
			return null;
	}
}