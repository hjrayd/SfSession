<?php

namespace App\Controller;

use App\Entity\Session;
use App\Form\SessionType;
use Doctrine\ORM\EntityManager;
use App\Repository\ProgramRepository;
use App\Repository\SessionRepository;
use App\Repository\TraineeRepository;
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


    #[Route('/session/{id}/removeTrainee/{traineeId}', name: 'removeTrainee_session')]
    public function removeTraineeSession($id, $traineeId, EntityManagerInterface $entityManager, SessionRepository $sessionRepository, TraineeRepository $traineeRepository): Response
    {
        $session = $sessionRepository->find($id);
        $trainee = $traineeRepository->find($traineeId);

        $session->removeTrainee($trainee);
        $entityManager->persist($session);
        $entityManager->flush();

        return $this->redirectToRoute('show_session',['id' => $id] );
     
        
    }

    #[Route('/session/{id}/addTrainee/{traineeId}', name: 'addTrainee_session')]
    public function addTraineeSession($id, $traineeId, EntityManagerInterface $entityManager, SessionRepository $sessionRepository, TraineeRepository $traineeRepository): Response
    {
        $session = $sessionRepository->find($id);
        $trainee = $traineeRepository->find($traineeId);

        $session->addTrainee($trainee);
        $entityManager->persist($session);
        $entityManager->flush();

        return $this->redirectToRoute('show_session',[
            'id' => $id,
            'session' => $session,
            'trainee' => $trainee
        ] );
        

     
        
    }

    #[Route('/session/{id}/removeProgram/{programId}', name: 'removeProgram_session')]
    public function removeProgramSession($id, $programId, EntityManagerInterface $entityManager, SessionRepository $sessionRepository, ProgramRepository $programRepository): Response
    {
        $session = $sessionRepository->find($id);
        $program = $programRepository->find($programId);

        $session->removeProgram($program);
        $entityManager->persist($session);
        $entityManager->flush();

        return $this->redirectToRoute('show_session',['id' => $id] );
     
        
    }

    #[Route('/session/{id}/addProgram/{programId}', name: 'addProgram_session')]
    public function addProgramSession($id, $programId, EntityManagerInterface $entityManager, SessionRepository $sessionRepository, ProgramRepository $programRepository): Response
    {
        $session = $sessionRepository->find($id);
        $program = $programRepository->find($programId);

        $session->addProgram($program);
        $entityManager->persist($session);
        $entityManager->flush();

        return $this->redirectToRoute('show_session',['id' => $id] );
     
        
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