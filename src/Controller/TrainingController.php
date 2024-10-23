<?php

namespace App\Controller;

use App\Entity\Training;
use App\Repository\TrainingRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TrainingController extends AbstractController
{
    #[Route('/training', name: 'app_training')]
    public function index(TrainingRepository $trainingRepository): Response
    {
        $trainings = $trainingRepository->findBy([], ["trainingName" => "ASC"]);
        return $this->render('training/index.html.twig', [
            'trainings' => $trainings
        
        ]);
    }

    
    #[Route('/training/{id}', name: 'show_training')]
    public function show(Training $training): Response 
    {
        return $this->render('training/show.html.twig', [
            'training' => $training
        ]);
    }

}
