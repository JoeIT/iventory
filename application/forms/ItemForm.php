<?php
class App_Form_ItemForm extends Zend_Form
{
	public function __construct()
	{
		parent::__construct();
		
		$this->setMethod('post');
		
		$this->getView()->setEscape('stripslashes');
		//$this->setElementDecorators(array(new App_CustomDecorator_InputData()) );
		
		$id = new Zend_Form_Element_Hidden('id');
				
		$code = new Zend_Form_Element_Text('code');
		$code->setLabel("Codigo (*):");
		//$code->addValidator( new App_CustomZendValidator_CodeExist("code") );
		$code->setRequired(true);
		//$code->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$newCode = new Zend_Form_Element_Text('newCode');
		$newCode->setLabel("Nuevo codigo:");
		//$newCode->addValidator( new App_CustomZendValidator_CodeExist("newCode") );
		$newCode->setRequired(false);
		//$newCode->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$accountingCode = new Zend_Form_Element_Text('accountingCode');
		$accountingCode->setLabel("Codigo contable:");
		//$accountingCode->addValidator( new App_CustomZendValidator_CodeExist("accountingCode") );
		$accountingCode->setRequired(false);
		//$accountingCode->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$type = new Zend_Form_Element_Select('type_select');
		//$type->addMultiOptions($this->typeArray);
		$type->setLabel("Tipo:");
		$type->setRequired(false);
		//$type->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$name = new Zend_Form_Element_Text('name');
		$name->setLabel("Nombre:");
		$name->setRequired(false);
		//$name->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$brand = new Zend_Form_Element_Select('brand_select');
		$brand->setLabel("Marca:");
		$brand->setRequired(false);
		//$brand->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$material = new Zend_Form_Element_Select('material_select');
		$material->setLabel("Material:");
		$material->setRequired(false);
		//$material->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$color = new Zend_Form_Element_Select('color_select');
		$color->setLabel("Color:");
		$color->setRequired(false);
		//$color->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$origin = new Zend_Form_Element_Select('origin_select');
		$origin->setLabel("Procedencia:");
		$origin->setRequired(false);
		//$origin->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$location = new Zend_Form_Element_Select('location_select');
		$location->setLabel("Ubicacion:");
		$location->setRequired(false);
		//$location->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$owner = new Zend_Form_Element_Select('owner_select');
		$owner->setLabel("Propiedad:");
		$owner->setRequired(false);
		//$owner->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$quantity = new Zend_Form_Element_Text('quantity');
		$quantity->setLabel("Cantidad:");
		$quantity->addValidator(new Zend_Validate_Float());
		$quantity->setRequired(false);
		//$quantity->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$unitCost = new Zend_Form_Element_Text('unitCost');
		$unitCost->setLabel("Costo unitario:");
		$unitCost->addValidator(new Zend_Validate_Float());
		$unitCost->setRequired(false);
		//$unitCost->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$minimumCost = new Zend_Form_Element_Text('minimumCost');
		$minimumCost->setLabel("Costo minimo:");
		$minimumCost->addValidator(new Zend_Validate_Float());
		$minimumCost->setRequired(false);
		//$minimumCost->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$expectedCost = new Zend_Form_Element_Text('expectedCost');
		$expectedCost->setLabel("Costo esperado:");
		$expectedCost->addValidator(new Zend_Validate_Float());
		$expectedCost->setRequired(false);
		//$expectedCost->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$salesCost = new Zend_Form_Element_Text('salesCost');
		$salesCost->setLabel("Costo de venta:");
		$salesCost->addValidator(new Zend_Validate_Float());
		$salesCost->setRequired(false);
		//$salesCost->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$condition = new Zend_Form_Element_Select('condition_select');
		$condition->setLabel("Estado:");
		$condition->setRequired(false);
		//$condition->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$availability = new Zend_Form_Element_Select('availability_select');
		$availability->setLabel("Disponibilidad:");
		$availability->setRequired(false);
		//$availability->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$comment = new Zend_Form_Element_Textarea('comment');
		$comment->setLabel("Comentario:");
		$comment->setAttrib("cols", "40");
		$comment->setAttrib("rows", "5");
		//$comment->setDecorators(array(new App_CustomDecorator_InputData()) );
		
		$submit = new Zend_Form_Element_Submit('submit', array('label' => 'GUARDAR'));
		
		$this->addElements(array(
				$id, 
				$code, 
				$newCode, 
				$accountingCode, 
				$type, 
				$name, 
				$brand, 
				$material, 
				$color, 
				$origin, 
				$location, 
				$owner, 
				$quantity, 
				$unitCost, 
				$minimumCost, 
				$expectedCost, 
				$salesCost, 
				$condition, 
				$availability, 
				$comment, 
				$submit));
		
	}
	
	public function enableEditFormExtraConfig() {
		//$this->_elements['newCode']->addValidator( new App_CustomZendValidator_CodeExist("newCode") );
		
		
		//print_r($this->_elements);
		//$this->getElement("newCode")->setValue("otros");
		
		//$code->addValidator( new App_CustomZendValidator_CodeExist("code") );
		//$newCode->addValidator( new App_CustomZendValidator_CodeExist("newCode") );
		//$accountingCode->addValidator( new App_CustomZendValidator_CodeExist("accountingCode") );
	}
}