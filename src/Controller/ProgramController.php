<?php

namespace App\Controller;

use App\Repository\ProgramRepository;
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
            'programs' => $program
        
        ]);
    }
}
