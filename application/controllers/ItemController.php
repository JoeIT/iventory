<?php
class ItemController extends Zend_Controller_Action {
	
	private $_itemTypeDao;
	private $_itemBrandDao;
	private $_itemMaterialDao;
	private $_itemColorDao;
	private $_itemOriginDao;
	private $_itemLocationDao;
	private $_itemOwnerDao;
	private $_itemConditionDao;
	private $_itemAvailabilityDao;
	
	
	public function init() {
		/* Initialize action controller here */
		$this->_itemTypeDao = new App_Dao_ItemTypeDao();
		$this->_itemBrandDao = new App_Dao_ItemBrandDao();
		$this->_itemMaterialDao = new App_Dao_ItemMaterialDao();
		$this->_itemColorDao = new App_Dao_ItemColorDao();
		$this->_itemOriginDao = new App_Dao_ItemOriginDao();
		$this->_itemLocationDao = new App_Dao_ItemLocationDao();
		$this->_itemOwnerDao = new App_Dao_ItemOwnerDao();
		$this->_itemConditionDao = new App_Dao_ItemConditionDao();
		$this->_itemAvailabilityDao = new App_Dao_ItemAvailabilityDao();
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
		
		//$form->type->addMultiOptions(array("1" => "One", "2" => "Dos"));
		$this->_loadFormSelects($form);
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
				
				$item = new App_Model_Item();
				$item->setCode			( $formData['code'] );
				$item->setNewCode		( $formData['newCode'] );
				$item->setType			( $this->_itemTypeDao->getById($formData['type_select']) );
				$item->setName			( $formData['name'] );
				$item->setBrand			( $this->_itemBrandDao->getById($formData['brand_select']) );
				$item->setMaterial		( $this->_itemMaterialDao->getById($formData['material_select']) );
				$item->setColor			( $this->_itemColorDao->getById($formData['color_select']) );
				$item->setOrigin		( $this->_itemOriginDao->getById($formData['origin_select']) );
				$item->setLocation		( $this->_itemLocationDao->getById($formData['location_select']) );
				$item->setOwner			( $this->_itemOwnerDao->getById($formData['owner_select']) );
				$item->setQuantity		( $formData['quantity'] );
				$item->setUnitCost		( $formData['unitCost'] );
				$item->setExpectedCost	( $formData['expectedCost'] );
				$item->setSalesCost		( $formData['salesCost'] );
				$item->setCondition		( $this->_itemConditionDao->getById($formData['condition_select']) );
				$item->setAvailability	( $this->_itemAvailabilityDao->getById($formData['availability_select']) );
				$item->setComment		( $formData['comment'] );
				
				$itemDao->save($item);
				
				$this->_helper->redirector('index');
		
				return;
			}
		}
		$this->view->form = $form;
	}
	
	public function editAction() {
		
		$id = $this->_getParam('id', '');
		if (empty($id))
			$this->_helper->redirector('index');
		
		$itemDao = new App_Dao_ItemDao();
		$item = $itemDao->getById($id);
		
		if($item == null)
			$this->_helper->redirector('index');
		
		$form = new App_Form_ItemForm();
		
		$this->_loadFormSelects($form);
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
				
				//$item = new App_Model_Item();
				$item->setCode			( $formData['code'] );
				$item->setNewCode		( $formData['newCode'] );
				$item->setType			( $this->_itemTypeDao->getById($formData['type_select']) );
				$item->setName			( $formData['name'] );
				$item->setBrand			( $this->_itemBrandDao->getById($formData['brand_select']) );
				$item->setMaterial		( $this->_itemMaterialDao->getById($formData['material_select']) );
				$item->setColor			( $this->_itemColorDao->getById($formData['color_select']) );
				$item->setOrigin		( $this->_itemOriginDao->getById($formData['origin_select']) );
				$item->setLocation		( $this->_itemLocationDao->getById($formData['location_select']) );
				$item->setOwner			( $this->_itemOwnerDao->getById($formData['owner_select']) );
				$item->setQuantity		( $formData['quantity'] );
				$item->setUnitCost		( $formData['unitCost'] );
				$item->setExpectedCost	( $formData['expectedCost'] );
				$item->setSalesCost		( $formData['salesCost'] );
				$item->setCondition		( $this->_itemConditionDao->getById($formData['condition_select']) );
				$item->setAvailability	( $this->_itemAvailabilityDao->getById($formData['availability_select']) );
				$item->setComment		( $formData['comment'] );
		
				$itemDao->save($item);
		
				$this->_helper->redirector('index');
		
				return;
			}
		}
		else {
			$form = new App_Form_ItemForm();
		}
		
		if (!empty($item)) {
			$form->populate($item->toArray());
			$this->_loadFormSelects($form);
			
			//  
			$form->type_select->		setValue( $item->getType()->getId() );
			$form->brand_select->		setValue( $item->getBrand()->getId() );
			$form->material_select->	setValue( $item->getMaterial()->getId() );
			$form->color_select->		setValue( $item->getColor()->getId() );
			$form->origin_select->		setValue( $item->getOrigin()->getId() );
			$form->location_select->	setValue( $item->getLocation()->getId() );
			$form->owner_select->		setValue( $item->getOwner()->getId() );
			$form->condition_select->	setValue( $item->getCondition()->getId() );
			$form->availability_select->setValue( $item->getAvailability()->getId() );
		}
		
		//$this->view->item = $item;
		$this->view->form = $form;
	}
	
	private function _loadFormSelects(&$form) {
		$form->type_select->		addMultiOptions( $this->_buildSelectArray( $this->_itemTypeDao->getAll() ) );
		$form->brand_select->		addMultiOptions( $this->_buildSelectArray( $this->_itemBrandDao->getAll() ) );
		$form->material_select->	addMultiOptions( $this->_buildSelectArray( $this->_itemMaterialDao->getAll() ) );
		$form->color_select->		addMultiOptions( $this->_buildSelectArray( $this->_itemColorDao->getAll() ) );
		$form->origin_select->		addMultiOptions( $this->_buildSelectArray( $this->_itemOriginDao->getAll() ) );
		$form->location_select->	addMultiOptions( $this->_buildSelectArray( $this->_itemLocationDao->getAll() ) );
		$form->owner_select->		addMultiOptions( $this->_buildSelectArray( $this->_itemOwnerDao->getAll() ) );
		$form->condition_select->	addMultiOptions( $this->_buildSelectArray( $this->_itemConditionDao->getAll() ) );
		$form->availability_select->addMultiOptions( $this->_buildSelectArray( $this->_itemAvailabilityDao->getAll() ) );
	}
	
	
	private function _buildSelectArray($fullTypeArray) {
		$result = array();
		
		foreach($fullTypeArray as $type)
		{
			$result[$type->getId()] = $type->getName(); 
		}

		return $result;
	}
}
