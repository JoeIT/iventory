<?php
class App_Dao_ItemDao {
	
	private $entityManager;
	
	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance ();
		$this->entityManager = $registry->entityManager;
	}
	
	public function save(App_Model_Item $item) {
		$this->entityManager->persist ( $item );
		$this->entityManager->flush ();
	}
	
	public function getAll() {
		$query = $this->entityManager->createQuery ( 'SELECT i FROM App_Model_Item i ORDER BY i.code, i.newCode' );

		return $query->getResult ();
	}

	// Return the number of total items
	public function countAll() {
		$query = $this->entityManager->createQuery ( 'SELECT COUNT(i) FROM App_Model_Item i' );

		$result = $query->getResult ();
		return $result [0][1];
	}

	// ----------------------------------------------------------------
	public function getAllLimitOffset($limit, $offset) {
		$query = $this->entityManager->createQuery ( 'SELECT i FROM App_Model_Item i ORDER BY i.code, i.newCode' )->setFirstResult ( $offset )->setMaxResults ( $limit );

		return $query->getResult ();
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
}