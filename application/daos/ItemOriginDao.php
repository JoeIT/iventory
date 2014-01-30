<?php
class App_Dao_ItemOriginDao {
	private $entityManager;
	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance ();
		$this->entityManager = $registry->entityManager;
	}
	public function save(App_Model_ItemOrigin $itemOrigin) {
		$this->entityManager->persist ( $itemOrigin );
		$this->entityManager->flush ();
	}
	public function getAll() {
		$query = $this->entityManager->createQuery ( 'SELECT iorigin FROM App_Model_ItemOrigin iorigin ORDER BY iorigin.name' );
		
		return $query->getResult ();
	}
	
	// Return the number of total item origins
	public function countAll() {
		$query = $this->entityManager->createQuery ( 'SELECT COUNT(iorigin) FROM App_Model_ItemOrigin iorigin' );
		
		$result = $query->getResult ();
		return $result [0] [1];
	}
	
	// ----------------------------------------------------------------
	public function getAllLimitOffset($limit, $offset) {
		$query = $this->entityManager->createQuery ( 'SELECT io FROM App_Model_ItemOrigin io ORDER BY iorigin.name' )->setFirstResult ( $offset )->setMaxResults ( $limit );
		
		return $query->getResult ();
	}
}
	