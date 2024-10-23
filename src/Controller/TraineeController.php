<?php

namespace App\Controller;

use App\Entity\Trainee;
use App\Form\TraineeType;
use App\Repository\TraineeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TraineeController extends AbstractController
{
    #[Route('/trainee', name: 'app_trainee')]
    public function index(TraineeRepository $traineeRepository): Response
    {
        $trainees = $traineeRepository->findBy([], ["firstname" => "ASC"]);
        return $this->render('trainee/index.html.twig', [
            'trainees' => $trainees
        
        ]);
    }

    #[Route('/trainee/new', name: 'new_trainee')]
    public function new(Request $request): Response
    {
        $trainee = new Trainee();

        $form = $this->createForm(TraineeType::class, $trainee);

        return $this->render('trainee/new.html.twig', [
            'formAddTrainee' => $form,
        ]);
    }

    #[Route('/trainee/{id}', name: 'show_trainee')]
    public function show(Trainee $trainee): Response 
    {
        return $this->render('trainee/show.html.twig', [
            'trainee' => $trainee
        ]);
    }


}


