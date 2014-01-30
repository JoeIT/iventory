<?php
class App_Dao_ItemLocationDao {

	private $entityManager;

	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance ();
		$this->entityManager = $registry->entityManager;
	}

	public function save(App_Model_ItemLocation $item) {
		$this->entityManager->persist ( $item );
		$this->entityManager->flush ();
	}

	public function getAll() {
		$query = $this->entityManager->createQuery ( 'SELECT ilocation FROM App_Model_ItemLocation ilocation ORDER BY ilocation.name' );

		return $query->getResult ();
	}
}