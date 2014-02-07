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
	
	const PHOTO_ROOT_URL = "Photos/";
	
	private $ROOT_PATH;
	
	
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
		
		$uri = "$_SERVER[REQUEST_URI]";
		$uriPathArray = explode('/', $uri );
		$this->ROOT_PATH = "http://$_SERVER[HTTP_HOST]" . '/' . $uriPathArray[1] . '/'; // http://localhost/zf/
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
		$this->view->rootPath = $this->ROOT_PATH . 'public/';
		$this->view->photosPath = self::PHOTO_ROOT_URL;
	}
	
	public function addAction() {
		$itemDao = new App_Dao_ItemDao();
		$form = new App_Form_ItemForm();
		
		$this->_loadFormSelects($form);
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
				
				$item = new App_Model_Item();
				$item->setCode			( $formData['code'] );
				$item->setNewCode		( $formData['newCode'] );
				$item->setAccountingCode( $formData['accountingCode'] );
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
				$item->setCreationDate	( date_create(date('Y-m-d H:m:s')) );
				
				$photoUrl = $item->getCode();
				
				if( !empty( $item->getNewCode() ) )
					$photoUrl = $item->getNewCode();
				
				$item->setPhotoDir($photoUrl);
				
				$dirPermission = "0777";
				if( mkdir( self::PHOTO_ROOT_URL .  $photoUrl, $dirPermission) )
				{
					$itemDao->save($item);
					$this->_helper->redirector('index');
					return;
				}
				else
					$this->view->message = "Error al crear directorio de fotografias.";
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
				
				$lastCode = $item->getCode();
				$lastNewCode = $item->getNewCode();
				
				$item->setCode			( $formData['code'] );
				$item->setNewCode		( $formData['newCode'] );
				$item->setAccountingCode( $formData['accountingCode'] );
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
				$item->setModifiedDate	( date_create(date('Y-m-d H:m:s')) );
		
				$newPhotoUrl = "";
				
				if( !empty($item->getNewCode()) ) {
					if( $lastNewCode != $item->getNewCode() ) 
						$newPhotoUrl = $item->getNewCode();
				}					
				else {
					if( !empty($lastNewCode) || $lastCode != $item->getCode() )
						$newPhotoUrl = $item->getCode();
				}
				
				if( !empty( $newPhotoUrl ) ) {
					if( rename( self::PHOTO_ROOT_URL . $item->getPhotoDir(), self::PHOTO_ROOT_URL . $newPhotoUrl) )
					{
						$item->setPhotoDir( $newPhotoUrl );
						$itemDao->save($item);
						$this->_helper->redirector('index');
						return;
					}
					else
						$this->view->message = "Error al renombrar directorio de fotografias.";
				}
				else {
					$itemDao->save($item);
					$this->_helper->redirector('index');
					return;
				}
			}
		}
		else {
			$form = new App_Form_ItemForm();
		}
		
		if (!empty($item)) {
			$form->populate($item->toArray());
			$form->enableEditFormExtraConfig();
			//print_r($form->getValues());
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
	
	public function removeAction() {
		$id = $this->_getParam('id', '');
		if (empty($id))
			$this->_helper->redirector('index');
		
		$itemDao = new App_Dao_ItemDao();
		$item = $itemDao->getById($id);
		
		if($item == null)
			$this->_helper->redirector('index');
		
		$this->view->item = $item;
		$this->view->rootPath = $this->ROOT_PATH . 'public/';
		$this->view->photosPath = self::PHOTO_ROOT_URL;
		
		if ($this->_request->getPost()) {
			
			rename( self::PHOTO_ROOT_URL . $item->getPhotoDir(), self::PHOTO_ROOT_URL . "(BORRADO)" . $item->getPhotoDir() );
			
			$itemDao->remove($item);
			$this->_helper->redirector('index');
			return;			
		}		
	}
	
	public function ajaxrefreshselectelementAction() {
		$this->_helper->layout->disableLayout();
		
		$selectElement = $this->_getParam('selectElement', '');
		$optionSelected = $this->_getParam('optionSelected', '');
		
		if( empty($selectElement)) {
			echo "";
			return;
		}
		
		$optionsArray = array();
		
		switch($selectElement)
		{
			case 'type_select':
				$optionsArray = $this->_itemTypeDao->getAll();
				break;
			case 'brand_select':
				$optionsArray = $this->_itemBrandDao->getAll();
				break;
			case 'material_select':
				$optionsArray = $this->_itemMaterialDao->getAll();
				break;
			case 'color_select':
				$optionsArray = $this->_itemColorDao->getAll();
				break;
			case 'origin_select':
				$optionsArray = $this->_itemOriginDao->getAll();
				break;
			case 'location_select':
				$optionsArray = $this->_itemLocationDao->getAll();
				break;
			case 'owner_select':
				$optionsArray = $this->_itemOwnerDao->getAll();
				break;
			case 'condition_select':
				$optionsArray = $this->_itemConditionDao->getAll();
				break;
			case 'availability_select':
				$optionsArray = $this->_itemAvailabilityDao->getAll();
				break;
			default:
				return;
		}
		
		$this->view->selectId = $selectElement;
		$this->view->optionSelected = $optionSelected;
		$this->view->options = $optionsArray;		
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
	
	public function testAction() {
		echo "Running....";
	
		/*$uri = "$_SERVER[REQUEST_URI]";
			$arr = explode('/', $uri );
	
		$path = "$_SERVER[HTTP_HOST]" . '/' . $arr[1] . '/';
	
		echo "<br/>Test Path: http://$path";*/
	
		// Create directory, with full permissions
		//mkdir("NewDir", "0777");
		// Rename
		//rename("newDir", "renameDir");
	
		/*
			$indicesServer = array('PHP_SELF',
					'argv',
					'argc',
					'GATEWAY_INTERFACE',
					'SERVER_ADDR',
					'SERVER_NAME',
					'SERVER_SOFTWARE',
					'SERVER_PROTOCOL',
					'REQUEST_METHOD',
					'REQUEST_TIME',
					'REQUEST_TIME_FLOAT',
					'QUERY_STRING',
					'DOCUMENT_ROOT',
					'HTTP_ACCEPT',
					'HTTP_ACCEPT_CHARSET',
					'HTTP_ACCEPT_ENCODING',
					'HTTP_ACCEPT_LANGUAGE',
					'HTTP_CONNECTION',
					'HTTP_HOST',
					'HTTP_REFERER',
					'HTTP_USER_AGENT',
					'HTTPS',
					'REMOTE_ADDR',
					'REMOTE_HOST',
					'REMOTE_PORT',
					'REMOTE_USER',
					'REDIRECT_REMOTE_USER',
					'SCRIPT_FILENAME',
					'SERVER_ADMIN',
					'SERVER_PORT',
					'SERVER_SIGNATURE',
					'PATH_TRANSLATED',
					'SCRIPT_NAME',
					'REQUEST_URI',
					'PHP_AUTH_DIGEST',
					'PHP_AUTH_USER',
					'PHP_AUTH_PW',
					'AUTH_TYPE',
					'PATH_INFO',
					'ORIG_PATH_INFO') ;
	
		echo "<br/>";
	
	
		echo '<table cellpadding="10">' ;
		foreach ($indicesServer as $arg) {
		if (isset($_SERVER[$arg])) {
		echo '<tr><td>'.$arg.'</td><td>' . $_SERVER[$arg] . '</td></tr>' ;
		}
		else {
		echo '<tr><td>'.$arg.'</td><td>-</td></tr>' ;
		}
		}
		echo '</table>' ;
		*/
	}
}
