<?php

namespace App\Controller;

use App\Entity\Module;
use App\Form\ModuleType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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

    #[Route('/module/new', name: 'new_module')]
    public function new(Request $request): Response
    {
        $module = new Module();

        $form = $this->createForm(ModuleType::class, $module);

        return $this->render('module/new.html.twig', [
            'formAddModule' => $form,
        ]);
    }
}
