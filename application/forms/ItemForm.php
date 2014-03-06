<?php
class App_Form_ItemForm extends Zend_Form
{
	public function __construct()
	{
		parent::__construct();
		
		$this->setMethod('post');		
		$this->getView()->setEscape('stripslashes');
		
		
		//$this->setElementDecorators(array(new App_CustomDecorator_InputData()) );
		//$id = new Zend_Form_Element_Hidden('id');
				
		$code = new Zend_Form_Element_Text('code');
		$code->setLabel("Codigo (*):");
		//$code->addValidator( new App_CustomZendValidator_CodeExist("code") );
		$code->setRequired(true);
		$code->setAttrib('class', 'css-input_text_form');
		
		$newCode = new Zend_Form_Element_Text('newCode');
		$newCode->setLabel("Nuevo codigo:");
		//$newCode->addValidator( new App_CustomZendValidator_CodeExist("newCode") );
		$newCode->setRequired(false);
		$newCode->setAttrib('class', 'css-input_text_form');
		
		$accountingCode = new Zend_Form_Element_Text('accountingCode');
		$accountingCode->setLabel("Codigo contable:");
		//$accountingCode->addValidator( new App_CustomZendValidator_CodeExist("accountingCode") );
		$accountingCode->setRequired(false);
		$accountingCode->setAttrib('class', 'css-input_text_form');
		
		$type = new Zend_Form_Element_Select('type_select');
		//$type->addMultiOptions($this->typeArray);
		$type->setLabel("Tipo:");
		$type->setRequired(false);
		
		$name = new Zend_Form_Element_Text('name');
		$name->setLabel("Nombre:");
		$name->setRequired(false);
		$name->setAttrib('class', 'css-input_text_form');
		
		$brand = new Zend_Form_Element_Select('brand_select');
		$brand->setLabel("Marca:");
		$brand->setRequired(false);
		$brand->setValue('11');
		
		$material = new Zend_Form_Element_Select('material_select');
		$material->setLabel("Material:");
		$material->setRequired(false);
		
		$color = new Zend_Form_Element_Select('color_select');
		$color->setLabel("Color:");
		$color->setRequired(false);
		
		$origin = new Zend_Form_Element_Select('origin_select');
		$origin->setLabel("Procedencia:");
		$origin->setRequired(false);
		$origin->setValue('19');
		
		$location = new Zend_Form_Element_Select('location_select');
		$location->setLabel("Ubicacion:");
		$location->setRequired(false);
		$location->setValue('14');
		
		$owner = new Zend_Form_Element_Select('owner_select');
		$owner->setLabel("Propiedad:");
		$owner->setRequired(false);
		
		$quantity = new Zend_Form_Element_Text('quantity');
		$quantity->setLabel("Cantidad:");
		$quantity->addValidator(new Zend_Validate_Float());
		$quantity->setValue("1");
		$quantity->setRequired(true);
		$quantity->setAttrib('class', 'css-input_number_form');
		
		$unitCost = new Zend_Form_Element_Text('unitCost');
		$unitCost->setLabel("Costo unitario:");
		$unitCost->addValidator(new Zend_Validate_Float());
		$unitCost->setValue("0.00");
		$unitCost->setRequired(false);
		$unitCost->setAttrib('class', 'css-input_number_form');
		
		$minimumCost = new Zend_Form_Element_Text('minimumCost');
		$minimumCost->setLabel("Costo minimo:");
		$minimumCost->addValidator(new Zend_Validate_Float());
		$minimumCost->setValue("0.00");
		$minimumCost->setRequired(false);
		$minimumCost->setAttrib('class', 'css-input_number_form');
		
		$expectedCost = new Zend_Form_Element_Text('expectedCost');
		$expectedCost->setLabel("Costo esperado:");
		$expectedCost->addValidator(new Zend_Validate_Float());
		$expectedCost->setValue("0.00");
		$expectedCost->setRequired(false);
		$expectedCost->setAttrib('class', 'css-input_number_form');
		
		$salesCost = new Zend_Form_Element_Text('salesCost');
		$salesCost->setLabel("Costo de venta:");
		$salesCost->addValidator(new Zend_Validate_Float());
		$salesCost->setValue("0.00");
		$salesCost->setRequired(false);
		$salesCost->setAttrib('class', 'css-input_number_form');
		
		$condition = new Zend_Form_Element_Select('condition_select');
		$condition->setLabel("Estado:");
		$condition->setRequired(false);
		$condition->setValue('3');
		
		$availability = new Zend_Form_Element_Select('availability_select');
		$availability->setLabel("Disponibilidad:");
		$availability->setRequired(false);
		
		$comment = new Zend_Form_Element_Textarea('comment');
		$comment->setLabel("Comentario:");
		$comment->setAttrib("cols", "45");
		$comment->setAttrib("rows", "8");
		
		$submit = new Zend_Form_Element_Submit('submit', array('label' => 'GUARDAR'));
		
		$this->addElements(array(
				//$id, 
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
		
		$this->setDecorators(array(
				'FormElements',
				array('HtmlTag', array('tag' => 'table')),
				'Form'
		));
		$this->setElementDecorators(array(
				'ViewHelper',
				'Errors',
				array(array('data' => 'HtmlTag'), array('tag' => 'td')),
				array('Label', array('tag' => 'td')),
				array(array('row' => 'HtmlTag'), array('tag' => 'tr'))
		));
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