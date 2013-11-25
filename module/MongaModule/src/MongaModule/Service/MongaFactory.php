<?php

namespace MongaModule\Service;

use Monga;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class MongaFactory implements FactoryInterface
{
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        $config = $serviceLocator->get('Config')['monga'];
        $connection = Monga::connection($config['dsn'], $config['options']);
        return $connection;
    }
}