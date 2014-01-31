<?php
class App_Dao_ItemConditionDao {

	private $entityManager;

	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance ();
		$this->entityManager = $registry->entityManager;
	}

	public function save(App_Model_ItemCondition $item) {
		$this->entityManager->persist ( $item );
		$this->entityManager->flush ();
	}

	public function getAll() {
		$query = $this->entityManager->createQuery ( 'SELECT icondition FROM App_Model_ItemCondition icondition ORDER BY icondition.name' );

		return $query->getResult ();
	}
	
	public function getById($id) {
		$query = $this->entityManager->createQuery( "SELECT icondition FROM App_Model_ItemCondition icondition WHERE icondition.id = $id" );
		$arrayResult = $query->getResult();
		if(count($arrayResult) > 0)
			return $arrayResult[0];
		else
			return null;
	}
}