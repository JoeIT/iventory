<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	/**
     * generate registry
     * @return Zend_Registry
     */
    protected function _initRegistry(){
        $registry = Zend_Registry::getInstance();
        return $registry;
    }
    
	protected function _initPhpExcel()
	{
		//require_once('PHPExcel/PHPExcel/Shared/ZipStreamWrapper.php');
		//require_once('PHPExcel/PHPExcel/Autoloader.php');
		
		
		/*$classLoader = new \PHPExcel\PHPExcel\PHPExcel_Autoloader();
		$classLoader->Register();*/
		
		/*if ((class_exists($pClassName, FALSE)) || (strpos($pClassName, 'PHPExcel') !== 0)) {
			// Either already loaded, or not a PHPExcel class request
			echo "Loaded...";
		}*/
	}
	
    protected function _initResourceLoader()
    {
		$this->_resourceLoader->addResourceType('dao', 'daos/', 'Dao');
		$this->_resourceLoader->addResourceType('util', 'utils/', 'Util');
		$this->_resourceLoader->addResourceType('form_validators', 'form_validators/', 'CustomZendValidator');
		$this->_resourceLoader->addResourceType('form_decorators', 'form_decorators/', 'CustomDecorator');
    }
    
    protected function _initMessageTranslator()
    {
    	$translateValidators = array(
        				Zend_Validate_NotEmpty::IS_EMPTY => 'No puede estar vacio!',
    					Zend_Validate_Float::NOT_FLOAT => 'No es un numero!'/*,
        				Zend_Validate_Regex::NOT_MATCH => 'Invalid value entered',
        				Zend_Validate_StringLength::TOO_SHORT => 'Value cannot be less than %min% characters',
        				Zend_Validate_StringLength::TOO_LONG => 'Value cannot be longer than %max% characters',
        				Zend_Validate_EmailAddress::INVALID => 'Invalid e-mail address'*/
        			);
    	
    	$translator = new Zend_Translate('array', $translateValidators);
    	Zend_Validate_Abstract::setDefaultTranslator($translator);
    }
	
    /**
     * Initialize Doctrine
     * @return Doctrine_Manager
     */
    public function _initDoctrine() {
        // include and register Doctrine's class loader
        require_once('Doctrine/Common/ClassLoader.php');
        $classLoader = new \Doctrine\Common\ClassLoader(
            'Doctrine', 
            APPLICATION_PATH . '/../library/'
        );
        $classLoader->register();

        // create the Doctrine configuration
        $config = new \Doctrine\ORM\Configuration();
        
        // setting the cache ( to ArrayCache. Take a look at
        // the Doctrine manual for different options ! )
        $cache = new \Doctrine\Common\Cache\ArrayCache;
        $config->setMetadataCacheImpl($cache);
        $config->setQueryCacheImpl($cache);

        // choosing the driver for our database schema
        // we'll use annotations
        $driver = $config->newDefaultAnnotationDriver(
            APPLICATION_PATH . '/models'
        );
        $config->setMetadataDriverImpl($driver);

        // set the proxy dir and set some options
        $config->setProxyDir(APPLICATION_PATH . '/models/Proxies');
        $config->setAutoGenerateProxyClasses(true);
        $config->setProxyNamespace('App\Proxies');

        // now create the entity manager and use the connection
        // settings we defined in our application.ini
        $connectionSettings = $this->getOption('doctrine');
        $conn = array(
            'driver'    => $connectionSettings['conn']['driv'],
            'user'      => $connectionSettings['conn']['user'],
            'password'  => $connectionSettings['conn']['pass'],
            'dbname'    => $connectionSettings['conn']['dbname'],
            'host'      => $connectionSettings['conn']['host']
        );
        
        $entityManager = \Doctrine\ORM\EntityManager::create($conn, $config);
        
        // push the entity manager into our registry for later use
        $registry = Zend_Registry::getInstance();
        $registry->entityManager = $entityManager;

        return $entityManager;
    }
}