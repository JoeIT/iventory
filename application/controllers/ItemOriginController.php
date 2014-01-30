<?php
class ItemOriginController extends Zend_Controller_Action {
	/**
	 * The default action - show the home page
	 */
	public function indexAction() {
		$page = $this->_getParam ( 'page', 1 );
		
		$itemOriginDao = new App_Dao_ItemOriginDao ();
		$paginator = new App_Util_Paginator ( $this->getRequest ()->getBaseUrl () . '/itemorigin/index', $itemOriginDao->countAll (), $page );
		
		$this->view->dataList = $itemOriginDao->getAllLimitOffset ( $paginator->getLimit (), $paginator->getOffset () );
		$this->view->htmlPaginator = $paginator->showHtmlPaginator ();
	}
}
