<?php
class ItemController extends Zend_Controller_Action {

	public function init() {
		/* Initialize action controller here */
	}

	public function indexAction() {
		$page = $this->_getParam('page', 1);
		
		$itemOriginDao = new App_Dao_ItemOriginDao();
		$paginator = new App_Util_Paginator($this->getRequest()->getBaseUrl() . '/item/index', $itemOriginDao->countAll(), $page);
		
		$this->view->dataList = $itemOriginDao->getAllLimitOffset($paginator->getLimit(), $paginator->getOffset());
		$this->view->htmlPaginator = $paginator->showHtmlPaginator();
	}
}
