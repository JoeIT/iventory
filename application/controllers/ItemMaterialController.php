<?php
class ItemMaterialController extends Zend_Controller_Action {
	
	private $_itemMaterialDao;
	
	public function init()
	{
		$this->_itemMaterialDao = new App_Dao_ItemMaterialDao ();
		$this->view->rootPath = $this->getFrontController()->getBaseUrl() . '/'; // /zf/public/
	}
	
	public function indexAction() {		
		$this->view->dataList = $this->_itemMaterialDao->getAll();		
	}
	
	public function viewAction() {
		$id = $this->_getParam('id', '');
	
		if(empty($id))
			$this->_helper->redirector('indexmaterial');
		
		$itemMaterial = $this->_itemMaterialDao->getById($id);
		
		if($itemMaterial == null)
			$this->_helper->redirector('indexmaterial');
	
		$this->view->item = $itemMaterial;
	}
	
	public function addAction() {
		$form = new App_Form_ItemMaterialForm();
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
		
				$itemMaterial = new App_Model_ItemMaterial();
				$itemMaterial->setName			( $formData['name'] );
				$itemMaterial->setDescription	( $formData['description'] );
				
				$this->_itemMaterialDao->save($itemMaterial);
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
	
		$itemMaterial = $this->_itemMaterialDao->getById($id);
	
		if($itemMaterial == null)
			$this->_helper->redirector('index');
	
		$form = new App_Form_ItemMaterialForm();
		
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
				$itemMaterial->setName			( $formData['name'] );
				$itemMaterial->setDescription	( $formData['description'] );
				
				$this->_itemMaterialDao->save($itemMaterial);
				$this->_helper->redirector('index');
				return;
			}
			else
				$form->populate($formData);
		}
		else {
			$form = new App_Form_ItemMaterialForm();			
		}
		
		if (!empty($itemMaterial))
			$form->populate($itemMaterial->toArray());
		
		$this->view->form = $form;
	}
	
	public function removeAction() {
		$id = $this->_getParam('id', '');
		if (empty($id))
			$this->_helper->redirector('index');
	
		$itemMaterial = $this->_itemMaterialDao->getById($id);
	
		if($itemMaterial == null)
			$this->_helper->redirector('index');
	
		$this->view->itemMaterial = $itemMaterial;
	
		if ($this->_request->getPost()) {
				
			$this->_itemMaterialDao->remove($itemMaterial);
			$this->_helper->redirector('index');
			return;
		}
	}
}
