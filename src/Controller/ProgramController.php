<?php

namespace App\Controller;

use App\Entity\Program;
use App\Form\ProgramType;
use App\Repository\ProgramRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProgramController extends AbstractController
{
    #[Route('/program', name: 'app_program')]
    
    public function index(ProgramRepository $programRepository): Response
    {
        $programs = $programRepository->findBy([], []);
        return $this->render('program/index.html.twig', [
            'programs' => $programs
        
        ]);
    }


    #[Route('/program/new', name: 'new_program')]
    public function new(Request $request , EntityManagerInterface $entityManager): Response
    {
        $program = new Program();

        $form = $this->createForm(ProgramType::class, $program);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

                    $program = $form->getData();
                    $entityManager->persist($program);
                    $entityManager->flush();

                    return $this->redirectToRoute('app_program');
                }

        return $this->render('program/new.html.twig', [
            'formAddProgram' => $form,
        ]);

        
    }


}
