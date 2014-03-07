<?php
class ItemLocationController extends Zend_Controller_Action {
	
	private $_itemLocationDao;
	
	public function init()
	{
		$this->_itemLocationDao = new App_Dao_ItemLocationDao ();
		$this->view->rootPath = $this->getFrontController()->getBaseUrl() . '/'; // /zf/public/
	}
	
	public function indexAction() {		
		$this->view->dataList = $this->_itemLocationDao->getAll();		
	}
	
	public function viewAction() {
		$id = $this->_getParam('id', '');
	
		if(empty($id))
			$this->_helper->redirector('indexlocation');
		
		$itemLocation = $this->_itemLocationDao->getById($id);
		
		if($itemLocation == null)
			$this->_helper->redirector('indexlocation');
	
		$this->view->item = $itemLocation;
	}
	
	public function addAction() {
		$form = new App_Form_ItemLocationForm();
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
		
				$itemLocation = new App_Model_ItemLocation();
				$itemLocation->setName			( $formData['name'] );
				$itemLocation->setDescription		( $formData['description'] );
				
				$this->_itemLocationDao->save($itemLocation);
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
	
		$itemLocation = $this->_itemLocationDao->getById($id);
	
		if($itemLocation == null)
			$this->_helper->redirector('index');
	
		$form = new App_Form_ItemLocationForm();
		
		
		if ($this->_request->getPost()) {
			$formData = $this->_request->getPost();
		
			if ($form->isValid($formData)) {
				$itemLocation->setName			( $formData['name'] );
				$itemLocation->setDescription		( $formData['description'] );
				
				$this->_itemLocationDao->save($itemLocation);
				$this->_helper->redirector('index');
				return;
			}
			else
				$form->populate($formData);
		}
		else {
			$form = new App_Form_ItemLocationForm();			
		}
		
		if (!empty($itemLocation))
			$form->populate($itemLocation->toArray());
		
		$this->view->form = $form;
	}
	
	public function removeAction() {
		$id = $this->_getParam('id', '');
		if (empty($id))
			$this->_helper->redirector('index');
	
		$itemLocation = $this->_itemLocationDao->getById($id);
	
		if($itemLocation == null)
			$this->_helper->redirector('index');
	
		$this->view->itemLocation = $itemLocation;
	
		if ($this->_request->getPost()) {
				
			$this->_itemLocationDao->remove($itemLocation);
			$this->_helper->redirector('index');
			return;
		}
	}
}
