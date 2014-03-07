<?php
class App_Dao_ItemMaterialDao {

	private $entityManager;

	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance ();
		$this->entityManager = $registry->entityManager;
	}

	public function save(App_Model_ItemMaterial $itemMaterial) {
		$this->entityManager->persist ( $itemMaterial );
		$this->entityManager->flush ();
	}
	
	public function remove(App_Model_ItemMaterial $itemMaterial) {
		$this->entityManager->remove ( $itemMaterial );
		$this->entityManager->flush ();
	}

	public function getAll() {
		$query = $this->entityManager->createQuery ( 'SELECT imaterial FROM App_Model_ItemMaterial imaterial ORDER BY imaterial.name' );

		return $query->getResult ();
	}
	
	public function getById($id) {
		$query = $this->entityManager->createQuery( "SELECT imaterial FROM App_Model_ItemMaterial imaterial WHERE imaterial.id = $id" );
		$arrayResult = $query->getResult();
		if(count($arrayResult) > 0)
			return $arrayResult[0];
		else
			return null;
	}
}