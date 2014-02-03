<?php
class App_Form_ItemForm extends Zend_Form
{
    public function __construct()
	{
		parent::__construct();
		
		$this->setMethod('post');
		
		$this->getView()->setEscape('stripslashes');
		
		$code = new Zend_Form_Element_Text('code');
		$code->setLabel("Codigo:");
		$code->setRequired(false);
		
		$newCode = new Zend_Form_Element_Text('newCode');
		$newCode->setLabel("Nuevo codigo:");
		$newCode->setRequired(false);
		
		$type = new Zend_Form_Element_Select('type');
		//$type->addMultiOptions($this->typeArray);
		$type->setLabel("Tipo:");
		$type->setRequired(false);
		
		$name = new Zend_Form_Element_Text('name');
		$name->setLabel("Nombre:");
		$name->setRequired(false);
		
		/*$brand = new Zend_Form_Element_Select('brand');
		$brand->setLabel("Marca:");
		$brand->setRequired(false);
		
		$material = new Zend_Form_Element_Select('material');
		$material->setLabel("Material:");
		$material->setRequired(false);
		
		$color = new Zend_Form_Element_Select('color');
		$color->setLabel("Color:");
		$color->setRequired(false);
		
		$origin = new Zend_Form_Element_Select('origin');
		$origin->setLabel("Procedencia:");
		$origin->setRequired(false);
		
		$location = new Zend_Form_Element_Select('location');
		$location->setLabel("Ubicacion:");
		$location->setRequired(false);
		
		$owner = new Zend_Form_Element_Select('owner');
		$owner->setLabel("Propiedad:");
		$owner->setRequired(false);*/
		
		$quantity = new Zend_Form_Element_Text('quantity');
		$quantity->setLabel("Cantidad:");
		$quantity->setRequired(false);
		
		$unitCost = new Zend_Form_Element_Text('unitCost');
		$unitCost->setLabel("Costo unitario:");
		$unitCost->setRequired(false);
		
		$minimumCost = new Zend_Form_Element_Text('minimumCost');
		$minimumCost->setLabel("Costo minimo:");
		$minimumCost->setRequired(false);
		
		$expectedCost = new Zend_Form_Element_Text('expectedCost');
		$expectedCost->setLabel("Costo esperado:");
		$expectedCost->setRequired(false);
		
		$salesCost = new Zend_Form_Element_Text('salesCost');
		$salesCost->setLabel("Costo de venta:");
		$salesCost->setRequired(false);
		
		/*$condition = new Zend_Form_Element_Select('condition');
		$condition->setLabel("Estado:");
		$condition->setRequired(false);
		
		$availability = new Zend_Form_Element_Select('availability');
		$availability->setLabel("Disponibilidad:");
		$availability->setRequired(false);*/
		
		$comment = new Zend_Form_Element_Textarea('comment');
		$comment->setLabel("Comentario:");
		$comment->setAttrib("cols", "40");
		$comment->setAttrib("rows", "5");
		
		$submit = new Zend_Form_Element_Submit('submit', array('label' => 'GUARDAR'));
		
		/*if (isset($options['id'])) {
			$id = new Zend_Form_Element_Hidden('id', array('value' => '1'));
			$this->addElement($id);
		}*/
		
		$this->addElements(array($code, 
				$newCode, 
				$type, 
				$name, 
				/*$brand, 
				$material, 
				$color, 
				$origin, 
				$location, 
				$owner, */
				$quantity, 
				$unitCost, 
				$minimumCost, 
				$expectedCost, 
				$salesCost, 
				/*$condition, 
				$availability, */
				$comment, 
				$submit));
	}
}