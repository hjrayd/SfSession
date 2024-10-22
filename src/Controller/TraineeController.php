<?php

namespace App\Controller;

use App\Entity\Trainee;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TraineeController extends AbstractController
{
    #[Route('/trainee', name: 'app_trainee')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $trainees = $entityManager->getRepository(Trainee::class)->findAll();
        return $this->render('trainee/index.html.twig', [
            'trainees' => $trainees
        ]);
    }
}
