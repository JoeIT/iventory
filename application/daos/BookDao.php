<?php

class App_Dao_BookDao {
	private $entityManager;

	public function __construct() {
		/* Initialize action controller here */
		$registry = Zend_Registry::getInstance();
		$this->entityManager = $registry->entityManager;
	}

	public function save(App_Model_Book $book) {
		$this->entityManager->persist($book);
		$this->entityManager->flush();
	}
	
	public function getByIdOrigin($idOrigin) {
		$query = $this->entityManager->createQuery('SELECT b FROM App_Model_Book b WHERE b.idOrigin = ' . $idOrigin);
		$arrayResult = $query->getResult();
		return $arrayResult[0];
	}

	public function getAll() {
		$query = $this->entityManager->createQuery('SELECT b FROM App_Model_Book b');

		return $query->getResult();
	}

	// Return the number of total advertisements
	public function countAll() {
		$query = $this->entityManager->createQuery('SELECT COUNT(b) FROM App_Model_Book b');

		$result = $query->getResult();
		return $result[0][1];
	}

	//----------------------------------------------------------------
	public function getAllLimitOffset($limit, $offset) {
		$query = $this->entityManager->createQuery('SELECT b FROM App_Model_Book b')->setFirstResult($offset)->setMaxResults($limit);

		return $query->getResult();
	}

	//----------------------------------------------------------------
	public function getSearchLimitOffset($txtSearch, $attribsArray, $limit, $offset) {
		$where = '';

		foreach ($attribsArray as $attribute) {
			$where = $this->_whereOrBuilder($where, "b.$attribute LIKE '%" . $txtSearch . "%'");
		}

		$query = $this->entityManager->createQuery("SELECT b FROM App_Model_Book b $where ")->setFirstResult($offset)->setMaxResults($limit);

		return $query->getResult();
	}

	public function countSearchLimitOffset($txtSearch, $attribsArray) {
		$where = '';

		foreach ($attribsArray as $attribute) {
			$where = $this->_whereOrBuilder($where, "b.$attribute LIKE '%" . $txtSearch . "%'");
		}

		$query = $this->entityManager->createQuery("SELECT COUNT(b) FROM App_Model_Book b $where ");

		$result = $query->getResult();
		return $result[0][1];
	}

	//----------------------------------------------------------------
	public function getAllFeatured() {
		$query = $this->entityManager->createQuery('SELECT b FROM App_Model_Book b WHERE b.featured = 1');

		return $query->getResult();
	}

	public function getAllNew() {
		$query = $this->entityManager->createQuery('SELECT b FROM App_Model_Book b WHERE b.isNew = 1');

		return $query->getResult();
	}

	public function getBook($id) {
		return $this->entityManager->find('App_Model_Book', $id);
	}

	public function getSearchBook($title, $year, $keywords, $isbn, $issn) {
		$where = '';

		if ($title != '')
			$where = $this->_whereAndBuilder($where, "b.title LIKE '" . $title . "%'");
		if ($year != '')
			$where = $this->_whereAndBuilder($where, "b.year LIKE '" . $year . "%'");
		if ($keywords != '')
			$where = $this->_whereAndBuilder($where, "b.keywords LIKE '" . $keywords . "%'");
		if ($isbn != '')
			$where = $this->_whereAndBuilder($where, "b.isbn LIKE '" . $isbn . "%'");
		if ($issn != '')
			$where = $this->_whereAndBuilder($where, "b.issn LIKE '" . $issn . "%'");

		$query = $this->entityManager->createQuery("SELECT b FROM App_Model_Book b $where ");

		return $query->getResult();
	}

	private function _whereAndBuilder($where, $andQuery) {
		if (empty($where))
			$where = " WHERE " . $andQuery;
		else
			$where .= " AND " . $andQuery;

		return $where;
	}

	private function _whereOrBuilder($where, $orQuery) {
		if (empty($where))
			$where = " WHERE " . $orQuery;
		else
			$where .= " OR " . $orQuery;

		return $where;
	}

	public function searchBooksAriel($txtSearch, $attribsArray, $limit, $offset) {
		return $this->searchBooksYearAriel($txtSearch, $attribsArray, null, $limit, $offset);
	}

	public function searchBooksYearAriel($txtSearch, $attribsArray, $year, $limit, $offset) {
		if (empty($txtSearch) || count($attribsArray) == 0)
			return null;
		$txtSearch = utf8_decode($txtSearch);
		$stringUtils = new App_Util_String();
		$topicDao = new App_Dao_TopicDao();
		$booksResult = array();
		$firstWhere = '';
		//search the hole txtSearch
		foreach ($attribsArray as $key => $value) {
			if ($key == 'topic') {
				$topics = $topicDao->getLikeName($txtSearch);

				foreach ($topics as $topic) {
					$firstWhere = $this->_whereOrBuilder($firstWhere, "b.topic = '" . $topic->getId() . "'");
				}
			} elseif ($key == "year") {

				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key = $year");

			} else {
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '" . $txtSearch . " %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% " . $txtSearch . "'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% " . $txtSearch . " %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '" . $txtSearch . "_ %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% _" . $txtSearch . "'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% _" . $txtSearch . "_ %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '" . $txtSearch . "'");
			}
		}

		$query = $this->entityManager->createQuery("SELECT b FROM App_Model_Book b $firstWhere ")->setFirstResult($offset)->setMaxResults($limit);

		$booksResult = $stringUtils->arrayConcat($booksResult, $query->getResult());
		$ignoreList = array("del", "al", "a", "o", "las", "los", "con", "sin");
		$minLength = 3;
		$searchList = $stringUtils->stringToArrayIgnore($txtSearch, " ", $ignoreList, $minLength);

		//search exact words.
		// $where = " WHERE b.id NOT IN (SELECT b2.id FROM App_Model_Book b2 $firstWhere)";
		// foreach ($searchList as $singleValue) {
		// foreach ($attribsArray as $key => $value) {
		//
		// //Search the splitted textSearch
		// if ($key == 'topic') {
		//
		// $topics = $topicDao->getLikeName($singleValue);
		//
		// foreach ($topics as $topic) {
		// $where = $this->_whereOrBuilder($where, "b.topic = '" . $topic->getId() . "'");
		// }
		// } elseif ($key == "year") {
		// $where = $this->_whereOrBuilder($where, "b.$key = $year");
		// } else {
		//
		// $where .= " OR b.$key LIKE '" . $singleValue . " %'";
		// $where .= " OR b.$key LIKE '% " . $singleValue . "'";
		// $where .= " OR b.$key LIKE '% " . $singleValue . " %'";
		// $where .= " OR b.$key LIKE '% " . $singleValue . "_ %'";
		// $where .= " OR b.$key LIKE '% _" . $singleValue . " %'";
		// $where .= " OR b.$key LIKE '% _" . $singleValue . "_ %'";
		// $where .= " OR b.$key LIKE '" . $singleValue . "' ";
		// }
		// }
		// }
		//
		// $query = $this->entityManager->createQuery("SELECT b FROM App_Model_Book b $where ");
		// $booksResult = $stringUtils->arrayConcat($booksResult, $query->getResult());
		//		return $booksResult;
	}

	public function countSearchAriel($txtSearch, $attribsArray) {
		if (empty($txtSearch) || count($attribsArray) == 0)
			return null;

		$stringUtils = new App_Util_String();
		$topicDao = new App_Dao_TopicDao();
		$booksResult = array();
		$firstWhere = '';
		//search the hole txtSearch
		foreach ($attribsArray as $key => $value) {
			if ($key == 'topic') {
				$topics = $topicDao->getLikeName($txtSearch);

				foreach ($topics as $topic) {
					$firstWhere = $this->_whereOrBuilder($firstWhere, "b.topic = '" . $topic->getId() . "'");
				}
			} elseif ($key == "year") {
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key = $year");
			} else {
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '" . $txtSearch . " %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% " . $txtSearch . "'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% " . $txtSearch . " %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '" . $txtSearch . "_ %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% _" . $txtSearch . "'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '% _" . $txtSearch . "_ %'");
				$firstWhere = $this->_whereOrBuilder($firstWhere, "b.$key LIKE '" . $txtSearch . "'");
			}
		}
		$query = $this->entityManager->createQuery("SELECT count(b.id) FROM App_Model_Book b $firstWhere ")->setFirstResult($offset)->setMaxResults($limit);

		return $query->getSingleScalarResult();
		;
	}

	//----------------------------------------------------------------
	public function getBooksByTopicLimitOffset($topicId, $limit, $offset) {
		$query = $this->entityManager->createQuery("SELECT b FROM App_Model_Book b WHERE b.topic = '$topicId'")->setFirstResult($offset)->setMaxResults($limit);

		return $query->getResult();
	}

	public function countAllBooksByTopic($topicId) {
		$query = $this->entityManager->createQuery("SELECT COUNT(b) FROM App_Model_Book b WHERE b.topic = '$topicId'");

		$result = $query->getResult();
		return $result[0][1];
	}

	//----------------------------------------------------------------
}
?>