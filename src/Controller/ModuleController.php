<?php

namespace App\Controller;

use App\Entity\Module;
use App\Form\ModuleType;
use Doctrine\ORM\EntityManager;
use App\Repository\ModuleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ModuleController extends AbstractController
{
    #[Route('/module', name: 'app_module')]
    public function index(ModuleRepository $moduleRepository): Response
    {
        $modules = $moduleRepository->findBy([], ["moduleName" => "DESC"]);
        return $this->render('module/index.html.twig', [
            'modules' => $modules
        
        ]);
    }

    #[Route('/module/new', name: 'new_module')]
    public function new(Request $request , EntityManagerInterface $entityManager): Response
    {
        $module = new Module();

        $form = $this->createForm(ModuleType::class, $module);

        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {

            $module = $form->getData();
            $entityManager->persist($module);
            $entityManager->flush();

            return $this->redirectToRoute('app_module');
        }

        return $this->render('module/new.html.twig', [
            'formAddModule' => $form,
        ]);

    }

    #[Route('/module/{id}', name: 'show_module')]
    public function show(Module $module): Response 
    {
        return $this->render('module/show.html.twig', [
            'module' => $module
        ]);
    }
}
