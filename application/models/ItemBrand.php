<?php
/**
 * ItemBrand
*
* @Entity
* @Table(name="item_brand")
*/
class App_Model_ItemBrand {
	/**
	 * @var integer
	 *
	 * @Column(name="id", type="integer", nullable=false)
	 * @Id
	 * @GeneratedValue(strategy="IDENTITY")
	 */
	protected $id;

	/**
	 * @var string
	 *
	 * @Column(name="name", type="string", length=50, nullable=false)
	 */
	protected $name;
	
	public function getId() {
		return $this->id;
	}
	
	public function setId($id) {
		$this->id = $id;
	}
	
	public function getName() {
		return utf8_encode($this->name);
	}
	
	public function setName($name) {
		$this->name = $name;
	}
	
	public function toArray() {
		return get_object_vars($this);
	}
}