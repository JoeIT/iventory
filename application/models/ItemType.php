<?php
/**
 * ItemType
 *
 * @Entity
 * @Table(name="item_type")
 */
class App_Model_ItemType {
	/**
	 * @var integer
	 *
	 * @Column(name="id", type="integer", nullable=false)
	 * @Id
	 * @GeneratedValue(strategy="IDENTITY")
	 */
	protected $id;
	
	/**
	 * @ManyToOne(targetEntity="App_Model_ItemType")
	 * @JoinColumn(name="parent_id", referencedColumnName="id")
	 **/
	protected $parentId;
	
	/**
	 * @var string
	 *
	 * @Column(name="name", type="string", length=50, nullable=false)
	 */
	protected $name;
	
	/**
	 * @var string
	 *
	 * @Column(name="description", type="text", nullable=true)
	 */
	protected $description;
	
	
	public function getId() {
		return $this->id;
	}
	
	public function setId($id) {
		$this->id = $id;
	}
	
	public function getParent() {
		return utf8_encode($this->type);
	}
	
	public function setParent(App_Model_ItemType $type) {
		$this->type = $type;
	}
	
	public function getName() {
		return utf8_encode($this->name);
	}
	
	public function setName($name) {
		$this->name = $name;
	}
	
	public function getDescription() {
		return utf8_encode($this->description);
	}
	
	public function setDescription($description) {
		$this->description = $description;
	}
	
	public function toArray() {
		return get_object_vars($this);
	}
}