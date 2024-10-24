<?php

namespace App\Controller;

use App\Entity\Session;
use App\Form\SessionType;
use Doctrine\ORM\EntityManager;
use App\Repository\SessionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class SessionController extends AbstractController
{
    #[Route('/session', name: 'app_session')]
    public function index(SessionRepository $sessionRepository): Response
    {
        $sessions = $sessionRepository->findBy([], ["startDate" => "ASC"]);
        return $this->render('session/index.html.twig', [
            'sessions' => $sessions
        
        ]);
    }

    #[Route('/session/new', name: 'new_session')]
    public function new(Request $request , EntityManagerInterface $entityManager): Response
    {
        $session = new Session();

        $form = $this->createForm(SessionType::class, $session);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

                    $session = $form->getData();
                    $entityManager->persist($session);
                    $entityManager->flush();

                    return $this->redirectToRoute('app_session');
                }

        return $this->render('session/new.html.twig', [
            'formAddSession' => $form,
        ]);

        
    }

    #[Route('/session/{id}', name: 'show_session')]
    public function show(Session $session = null, SessionRepository $sr): Response 
    {
        $notRegistered = $sr->findNotRegistered($session->getId());
        $notProgrammed = $sr->findNotProgrammed($session->getId());

        return $this->render('session/show.html.twig', [
            'notRegistered'=> $notRegistered,
            'notProgrammed'=> $notProgrammed,
            'session' => $session
        ]);
    }
}
