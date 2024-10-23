<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ModuleController extends AbstractController
{
    #[Route('/module', name: 'app_module')]
    public function index(ModuleRepository $moduleRepository): Response
    {
        $modules = $modulesRepository->findBy([], ["moduleName" => "DESC"]);
        return $this->render('module/index.html.twig', [
            'modules' => $module
        
        ]);
    }
}
