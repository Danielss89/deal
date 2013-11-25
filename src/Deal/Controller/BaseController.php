<?php

namespace Deal\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Zend\View\Model\JsonModel;
use Zend\Stdlib\Hydrator;

class BaseController extends AbstractRestfulController
{
    protected $documentName = 'Deal\Document\BaseDocument';

    public function get($id)
    {
        $document = $this->getObjectManager()->find($this->documentName, $id);
        if($document){
            $hydrator = new Hydrator\ClassMethods();
            return new JsonModel($hydrator->extract($document));
        }
    }

    public function getList()
    {
        $documents = $this->getObjectManager()->getRepository($this->documentName)->findAll();
        $documents = $documents->toArray();
        $hydrator = new Hydrator\ClassMethods();
        $documents = array_map(array($hydrator, 'extract'), $documents);
        $name = explode("\\", $this->documentName);
        return new JsonModel(array($name[count($name)-1] => $documents));
    }

    public function create($data)
    {
        $document = new $this->documentName;
        $hydrator = new Hydrator\ClassMethods();
        $hydrator->hydrate($data, $document);

        $this->getObjectManager()->persist($document);
        $this->getObjectManager()->flush();

        return new JsonModel($hydrator->extract($document));
    }

    public function update($id, $data)
    {
        $data['id'] = $id;
        return $this->create($data);
    }

    public function getObjectManager()
    {
        return $this->getServiceLocator()->get('doctrine.documentmanager.odm_default');
    }
}
