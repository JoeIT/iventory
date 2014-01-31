<?php
class App_Dao_ItemAvailabilityDao {

	private $entityManager;

	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance ();
		$this->entityManager = $registry->entityManager;
	}

	public function save(App_Model_ItemAvailability $item) {
		$this->entityManager->persist ( $item );
		$this->entityManager->flush ();
	}

	public function getAll() {
		$query = $this->entityManager->createQuery ( 'SELECT iavailability FROM App_Model_ItemAvailability iavailability ORDER BY iavailability.name' );

		return $query->getResult ();
	}
	
	public function getById($id) {
		$query = $this->entityManager->createQuery( "SELECT iavailability FROM App_Model_ItemAvailability iavailability WHERE iavailability.id = $id" );
		$arrayResult = $query->getResult();
		if(count($arrayResult) > 0)
			return $arrayResult[0];
		else
			return null;
	}
}