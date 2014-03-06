<?php
/**
 * Item
*
* @Entity
* @Table(name="item")
*/
class App_Model_Item {
	/**
	 * @var integer
	 *
	 * @Column(name="id", type="integer", nullable=false)
	 * @Id
	 * @GeneratedValue(strategy="IDENTITY")
	 */
	protected $id;
	
	// The custom format validator depends of this name
	/**
	 * @var string
	 *
	 * @Column(name="code", type="string", length=50, nullable=true)
	 */
	protected $code;
	
	// The custom format validator depends of this name
	/**
	 * @var string
	 *
	 * @Column(name="new_code", type="string", length=50, nullable=true)
	 */
	protected $newCode;
	
	// The custom format validator depends of this name
	/**
	 * @var string
	 *
	 * @Column(name="accounting_code", type="string", length=50, nullable=true)
	 */
	protected $accountingCode;
	
	/**
	 * @var App_Model_ItemType
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemType")
	 * @JoinColumn(name="type_id", referencedColumnName="id")
	 */
	protected $type;
	
	/**
	 * @var string
	 *
	 * @Column(name="name", type="text", nullable=false)
	 */
	protected $name;
	
	/**
	 * @var App_Model_ItemBrand
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemBrand")
	 * @JoinColumn(name="brand_id", referencedColumnName="id")
	 */
	protected $brand;
	
	/**
	 * @var App_Model_ItemMaterial
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemMaterial")
	 * @JoinColumn(name="material_id", referencedColumnName="id")
	 */
	protected $material;
	
	/**
	 * @var App_Model_ItemColor
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemColor")
	 * @JoinColumn(name="color_id", referencedColumnName="id")
	 */
	protected $color;
	
	/**
	 * @var App_Model_ItemOrigin
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemOrigin")
	 * @JoinColumn(name="origin_id", referencedColumnName="id")
	 */
	protected $origin;
	
	/**
	 * @var App_Model_ItemLocation
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemLocation")
	 * @JoinColumn(name="location_id", referencedColumnName="id")
	 */
	protected $location;
	
	/**
	 * @var App_Model_ItemOwner
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemOwner")
	 * @JoinColumn(name="owner_id", referencedColumnName="id")
	 */
	protected $owner;
	
	/**
	 * @var decimal
	 *
	 * @Column(name="quantity", type="decimal", scale=3, nullable=false)
	 */
	protected $quantity;
	
	/**
	 * @var decimal
	 *
	 * @Column(name="unit_cost", type="decimal", scale=2, nullable=true)
	 */
	protected $unitCost;
	
	/**
	 * @var decimal
	 *
	 * @Column(name="minimum_cost", type="decimal", scale=2, nullable=true)
	 */
	protected $minimumCost;
	
	/**
	 * @var decimal
	 *
	 * @Column(name="expected_cost", type="decimal", scale=2, nullable=true)
	 */
	protected $expectedCost;
	
	/**
	 * @var decimal
	 *
	 * @Column(name="sales_cost", type="decimal", scale=2, nullable=true)
	 */
	protected $salesCost;
	
	/**
	 * @var App_Model_ItemCondition
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemCondition")
	 * @JoinColumn(name="condition_id", referencedColumnName="id")
	 */
	protected $condition;
	
	/**
	 * @var App_Model_ItemAvailability
	 *
	 * @ManyToOne(targetEntity="App_Model_ItemAvailability")
	 * @JoinColumn(name="availability_id", referencedColumnName="id")
	 */
	protected $availability;
	
	/**
	 * @var string
	 *
	 * @Column(name="comment", type="text", nullable=true)
	 */
	protected $comment;
	
	/**
	 * @var string
	 *
	 * @Column(name="photo_dir", type="string", length=100, nullable=false)
	 */
	protected $photoDir;
	
	/**
	 * @var datetime
	 *
	 * @Column(name="creation_date", type="datetime", nullable=true)
	 */
	protected $creationDate;
	
	/**
	 * @var datetime
	 *
	 * @Column(name="modified_date", type="datetime", nullable=true)
	 */
	protected $modifiedDate;
	


	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id = $id;
	}

	public function getCode() {
		return utf8_encode($this->code);
	}

	public function setCode($code) {
		$this->code = $code;
	}
	
	public function getNewCode() {
		return utf8_encode($this->newCode);
	}
	
	public function setNewCode($newCode) {
		$this->newCode = $newCode;
	}
	
	public function getAccountingCode() {
		return utf8_encode($this->accountingCode);
	}
	
	public function setAccountingCode($accountingCode) {
		$this->accountingCode = $accountingCode;
	}
	
	public function getType() {
		return $this->type;
	}
	
	public function setType(App_Model_ItemType $type) {
		$this->type = $type;
	}
	
	public function getName() {
		return $this->name;
	}
	
	public function setName($name) {
		$this->name = $name;
	}
	
	public function getBrand() {
		return $this->brand;
	}
	
	public function setBrand(App_Model_ItemBrand $brand) {
		$this->brand = $brand;
	}
	
	public function getMaterial() {
		return $this->material;
	}
	
	public function setMaterial(App_Model_ItemMaterial $material) {
		$this->material = $material;
	}
	
	public function getColor() {
		return $this->color;
	}
	
	public function setColor(App_Model_ItemColor $color) {
		$this->color = $color;
	}
	
	public function getOrigin() {
		return $this->origin;
	}
	
	public function setOrigin(App_Model_ItemOrigin $origin) {
		$this->origin = $origin;
	}
	
	public function getLocation() {
		return $this->location;
	}
	
	public function setLocation(App_Model_ItemLocation $location) {
		$this->location = $location;
	}
	
	public function getOwner() {
		return $this->owner;
	}
	
	public function setOwner(App_Model_ItemOwner $owner) {
		$this->owner = $owner;
	}
	
	public function getQuantity() {
		return $this->quantity;
	}
	
	public function setQuantity($quantity) {
		$this->quantity = $quantity;
	}
	
	public function getUnitCost() {
		return $this->unitCost;
	}
	
	public function setUnitCost($unitCost) {
		$this->unitCost = $unitCost;
	}
	
	public function getMinimumCost() {
		return $this->minimumCost;
	}
	
	public function setMinimumCost($minimumCost) {
		$this->minimumCost = $minimumCost;
	}
	
	public function getExpectedCost() {
		return $this->expectedCost;
	}
	
	public function setExpectedCost($expectedCost) {
		$this->expectedCost = $expectedCost;
	}
	
	public function getSalesCost() {
		return $this->salesCost;
	}
	
	public function setSalesCost($salesCost) {
		$this->salesCost = $salesCost;
	}
	
	public function getCondition() {
		return $this->condition;
	}
	
	public function setCondition(App_Model_ItemCondition $condition) {
		$this->condition = $condition;
	}
	
	public function getAvailability() {
		return $this->availability;
	}
	
	public function setAvailability(App_Model_ItemAvailability $availability) {
		$this->availability = $availability;
	}
	
	public function getComment() {
		return $this->comment;
	}
	
	public function setComment($comment) {
		$this->comment = $comment;
	}
	
	public function getPhotoDir() {
		return $this->photoDir;
	}
	
	public function setPhotoDir($photoDir) {
		$this->photoDir = $photoDir;
	}
	
	public function getCreationDate() {
		return $this->creationDate;
	}
	
	public function setCreationDate($creationDate) {
		$this->creationDate = $creationDate;
	}
	
	public function getModifiedDate() {
		return $this->modifiedDate;
	}
	
	public function setModifiedDate($modifiedDate) {
		$this->modifiedDate = $modifiedDate;
	}
	
	public function toArray() {
		return get_object_vars($this);
	}
}