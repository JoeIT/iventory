<?php
class ItemController extends Zend_Controller_Action {
	
	public function init() {
		/* Initialize action controller here */
	}
	
	public function indexAction() {
		$page = $this->_getParam ( 'page', 1 );
		
		$itemDao = new App_Dao_ItemDao ();
		$paginator = new App_Util_Paginator ( $this->getRequest ()->getBaseUrl () . '/item/index', $itemDao->countAll (), $page );
		
		$this->view->dataList = $itemDao->getAllLimitOffset ( $paginator->getLimit (), $paginator->getOffset () );
		$this->view->htmlPaginator = $paginator->showHtmlPaginator ();
	}
	
	public function viewAction() {
		$id = $this->_getParam('id', '');
		
		if(empty($id))
			$this->_helper->redirector('index');

		$itemDao = new App_Dao_ItemDao ();
		
		$item = $itemDao->getById($id);
		if($item == null)
			$this->_helper->redirector('index');
		
		$this->view->item = $item;
	}
	
	public function addAction() {
		$itemDao = new App_Dao_ItemDao();
		$form = new App_Form_ItemForm();
		
		$itemTypeDao = new App_Dao_ItemTypeDao();
		$itemBrandDao = new App_Dao_ItemBrandDao();
		$itemMaterialDao = new App_Dao_ItemMaterialDao();
		$itemColorDao = new App_Dao_ItemColorDao();
		$itemOriginDao = new App_Dao_ItemOriginDao();
		$itemLocationDao = new App_Dao_ItemLocationDao();
		$itemOwnerDao = new App_Dao_ItemOwnerDao();
		$itemConditionDao = new App_Dao_ItemConditionDao();
		$itemAvailabilityDao = new App_Dao_ItemAvailabilityDao();
		
		//$form->type->addMultiOptions(array("1" => "One", "2" => "Dos"));
		$form->type->addMultiOptions( $this->_buildSelectArray( $itemTypeDao->getAll() ) );
		$form->brand->addMultiOptions( $this->_buildSelectArray( $itemBrandDao->getAll() ) );
		$form->material->addMultiOptions( $this->_buildSelectArray( $itemMaterialDao->getAll() ) );
		$form->color->addMultiOptions( $this->_buildSelectArray( $itemColorDao->getAll() ) );
		$form->origin->addMultiOptions( $this->_buildSelectArray( $itemOriginDao->getAll() ) );
		$form->location->addMultiOptions( $this->_buildSelectArray( $itemLocationDao->getAll() ) );
		$form->owner->addMultiOptions( $this->_buildSelectArray( $itemOwnerDao->getAll() ) );
		$form->condition->addMultiOptions( $this->_buildSelectArray( $itemConditionDao->getAll() ) );
		$form->availability->addMultiOptions( $this->_buildSelectArray( $itemAvailabilityDao->getAll() ) );
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
				
				echo "Everything is valid";
				
				$item = new App_Model_Item();
				$item->setCode			( $formData['code'] );
				$item->setNewCode		( $formData['newCode'] );
				$item->setType			( $itemTypeDao->getById($formData['type']) );
				$item->setName			( $formData['name'] );
				$item->setBrand			( $itemBrandDao->getById($formData['brand']) );
				$item->setMaterial		( $itemMaterialDao->getById($formData['material']) );
				$item->setColor			( $itemColorDao->getById($formData['color']) );
				$item->setOrigin		( $itemOriginDao->getById($formData['origin']) );
				$item->setLocation		( $itemLocationDao->getById($formData['location']) );
				$item->setOwner			( $itemOwnerDao->getById($formData['owner']) );
				$item->setQuantity		( $formData['quantity'] );
				$item->setUnitCost		( $formData['unitCost'] );
				$item->setExpectedCost	( $formData['expectedCost'] );
				$item->setSalesCost		( $formData['salesCost'] );
				$item->setCondition		( $itemConditionDao->getById($formData['condition']) );
				$item->setAvailability	( $itemAvailabilityDao->getById($formData['availability']) );
				//$item->setComment($formData['comment']);
				
				$itemDao->save($item);
				
				$this->_helper->redirector('index');
		
				return;
			}
		}
		$this->view->form = $form;
	}
	
	private function _buildSelectArray($fullTypeArray)
	{
		$result = array();
		
		foreach($fullTypeArray as $type)
		{
			$result[$type->getId()] = $type->getName(); 
		}

		return $result;
	}
}
