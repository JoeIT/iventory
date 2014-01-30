<?php

/**
 * Book
 *
 * @Entity
 * @Table(name="book")
 */
class App_Model_Book {
	/**
	 * @var integer
	 *
	 * @Column(name="id", type="integer", nullable=false)
	 * @Id
	 * @GeneratedValue(strategy="IDENTITY")
	 */
	protected $id;

	/**
	 * @var integer
	 *
	 * @Column(name="id_origin", type="integer", nullable=false)
	 */
	protected $idOrigin;

	/**
	 * @var string
	 *
	 * @Column(name="title", type="string", length=100, nullable=true)
	 */
	protected $title;

	/**
	 * @var string
	 *
	 * @Column(name="authors", type="string", length=100, nullable=true)
	 */
	protected $authors;

	/**
	 * @var string
	 *
	 * @Column(name="collection", type="string", length=100, nullable=true)
	 */
	protected $collection;

	/**
	 * @var string
	 *
	 * @Column(name="collection_number", type="string", length=100, nullable=true)
	 */
	protected $collectionNumber;

	/**
	 * @var string
	 *
	 * @Column(name="city", type="string", length=100, nullable=true)
	 */
	protected $city;

	/**
	 * @var string
	 *
	 * @Column(name="country", type="string", length=100, nullable=true)
	 */
	protected $country;
	
	/**
	 * @var string
	 *
	 * @ManyToOne(targetEntity="App_Model_Topic")
	 * @JoinColumn(name="id_topic", referencedColumnName="id")
	 */
    private $topic;
	
	/**
	 * @var string
	 *
	 * @Column(name="keywords", type="string", length=100, nullable=true)
	 */
	protected $keywords;
	/**
	 * @var string
	 *
	 * @Column(name="edition", type="string", length=50, nullable=true)
	 */
	protected $edition;

	/**
	 * @var string
	 *
	 * @Column(name="editorial", type="string", length=100, nullable=true)
	 */
	protected $editorial;

	/**
	 * @var string
	 *
	 * @Column(name="description", type="string", length=1000, nullable=true)
	 */
	protected $description;
	/**
	 * @var string
	 *
	 * @Column(name="summary", type="string", length=1000, nullable=true)
	 */
	protected $summary;

	/**
	 * @var string
	 *
	 * @Column(name="publish_date", type="string", nullable=true)
	 */
	protected $publishDate;

	/**
	 * @var integer
	 *
	 * @Column(name="year", type="integer", nullable=true)
	 */
	protected $year;
	/**
	 * @var string
	 *
	 * @Column(name="size", type="string", nullable=true)
	 */
	protected $size;

	/**
	 * @var string
	 *
	 * @Column(name="isbn", type="string", length=30, nullable=true)
	 */
	protected $isbn;

	/**
	 * @var string
	 *
	 * @Column(name="issn", type="string", length=30, nullable=true)
	 */
	protected $issn;

	/**
	 * @var decimal
	 *
	 * @Column(name="price_bs", type="decimal", nullable=true)
	 */
	protected $priceBs;
	
	/**
	 * @var decimal
	 *
	 * @Column(name="price_sus", type="decimal", nullable=true)
	 */
	protected $priceSus;

	/**
	 * @var integer
	 *
	 * @Column(name="number_of_pages", type="integer", nullable=true)
	 */
	protected $numberOfPages;
	/**
	 * @var blob
	 *
	 * @Column(name="cover", type="blob", nullable=true)
	 */
	protected $cover;
	/**
	 * @var integer
	 *
	 * @Column(name="featured", type="integer", nullable=true)
	 */
	protected $featured;

	/**
	 * @var boolean
	 *
	 * @Column(name="is_new", type="boolean", nullable=true)
	 */
	protected $isNew;
	/**
	 * @var datetime
	 *
	 * @Column(name="creation_date", type="datetime", nullable=true)
	 */
	protected $creationDate;
	/**
	 * @var datetime
	 *
	 * @Column(name="last_modified", type="datetime", nullable=true)
	 */
	protected $lastModified;

	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id = $id;
	}

	public function getIdOrigin() {
		return $this->idOrigin;
	}

	public function setIdOrigin($idOrigin) {
		$this->idOrigin = $idOrigin;
	}
	
	public function getTitle() {
		return utf8_encode($this->title);	}

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getAuthors() {
		return utf8_encode($this->authors);
	}

	public function setAuthors($authors) {
		$this->authors = $authors;
	}
	
	public function getCollection() {
		return $this->collection;
	}

	public function setCollection($collection) {
		$this->collection = $collection;
	}
	
	public function getCollectionNumber() {
		return $this->collectionNumber;
	}

	public function setCollectionNumber($collectionNumber) {
		$this->collectionNumber = $collectionNumber;
	}
	
	public function getCity() {
		return $this->city;
	}

	public function setCity($city) {
		$this->city = $city;
	}
	
	public function getCountry() {
		return $this->country;
	}

	public function setCountry($country) {
		$this->country = $country;
	}

	public function getTopic() {
		return $this->topic;
	}

	public function setTopic(App_Model_Topic $topic) {
		$this->topic = $topic;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getEdition() {
		return $this->edition;
	}

	public function setEdition($edition) {
		$this->edition = $edition;
	}

	public function getEditorial() {
		return $this->editorial;
	}

	public function setEditorial($editorial) {
		$this->editorial = $editorial;
	}

	public function getDescription() {
		return utf8_encode($this->description);
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getSummary() {
		return utf8_encode($this->summary);
	}

	public function setSummary($summary) {
		$this->summary = $summary;
	}
	
	public function getPublishDate() {
		return $this->publishDate;
	}

	public function setPublishDate($publishDate) {
		$this->publishDate = $publishDate;
	}
	
	public function getYear() {
		return $this->year;
	}

	public function setYear($year) {
		$this->year = $year;
	}

	public function getSize() {
		return $this->size;
	}

	public function setSize($size) {
		$this->size = $size;
	}

	public function getPriceBs() {
		return $this->priceBs;
	}

	public function setPriceBs($priceBs) {
		$this->priceBs = $priceBs;
	}
	
	public function getPriceSus() {
		return $this->priceSus;
	}

	public function setPriceSus($priceSus) {
		$this->priceSus = $priceSus;
	}

	public function getIsbn() {
		return $this->isbn;
	}

	public function setIsbn($isbn) {
		$this->isbn = $isbn;
	}

	public function getIssn() {
		return $this->issn;
	}

	public function setIssn($issn) {
		$this->issn = $issn;
	}

	public function getNumberOfPages() {
		return $this->numberOfPages;
	}

	public function setNumberOfPages($numberOfPages) {
		$this->numberOfPages = $numberOfPages;
	}

	public function getCover() {
		return $this->cover;
	}

	public function setCover($cover) {
		$this->cover = $cover;
	}

	public function getFeatured() {
		return $this->featured;
	}

	public function setFeatured($featured) {
		$this->featured = $featured;
	}

	public function getIsNew() {
		return $this->isNew;
	}

	public function setIsNew($isNew) {
		$this->isNew = $isNew;
	}

	public function getCreationDate() {
		return $this->creationDate;
	}

	public function setCreationDate($creationDate) {
		$this->creationDate = $creationDate;
	}

	public function getLastModified() {
		return $this->lastModified;
	}

	public function setLastModified($lastModified) {
		$this->lastModified = $lastModified;
	}

	public function toArray() {
		return get_object_vars($this);
	}

}
?>