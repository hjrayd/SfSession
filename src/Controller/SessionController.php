<?php

namespace App\Controller;

use App\Entity\Program;
use App\Entity\Session;
use App\Form\ProgramType;
use App\Form\SessionType;
use Doctrine\ORM\EntityManager;
use App\Repository\ProgramRepository;
use App\Repository\SessionRepository;
use App\Repository\TraineeRepository;
use Symfony\Component\Form\FormError;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class SessionController extends AbstractController
{
    #[Route('/session', name: 'app_session')]
    public function index(SessionRepository $sessionRepository, EntityManagerInterface $entityManager): Response
    {
        $sessions = $sessionRepository->findBy([], ["startDate" => "ASC"]);

        $statutsSession = [
            'upcoming' => [],
            'currently' => [],
            'finished' => []
        ];

        foreach ($sessions as $session) {
            $statut = $session->getStatut();
            $statutsSession[$statut][] = $session;
        }
        return $this->render('session/index.html.twig', [
            'sessions' => $sessions,
            'statutsSession' => $statutsSession,
        
        ]);
    }

    #[Route('/session/new', name: 'new_session')]
    public function new(Request $request , EntityManagerInterface $entityManager): Response
    {
        $session = new Session();

        $form = $this->createForm(SessionType::class, $session);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $startDate = $session->getStartDate();
            $endDate = $session->getEndDate();
                    if($startDate > $endDate) {
                        $form->addError(new FormError('The ending date is earlier than the beginning date '));
                    } else {
                    $session = $form->getData();
                    $entityManager->persist($session);
                    $entityManager->flush();

                    return $this->redirectToRoute('app_session');
                    }
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
    public function show(Session $session = null, SessionRepository $sr, Request $request , EntityManagerInterface $entityManager): Response 
    {
        $notRegistered = $sr->findNotRegistered($session->getId());
        $notProgrammed = $sr->findNotProgrammed($session->getId());

        //on crée un nouvel objet program
        $program = new Program();
        
        //on crée le formulaire
        $form = $this->createForm(ProgramType::class, $program);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

                    $program = $form->getData();
                    $entityManager->persist($program);
                    $entityManager->flush();
        
                    return $this->redirectToRoute('show_session', ['id' => $session->getId()]);
        
    }

    $totalPlaces = $session->getNumberPlace();
    $takenPlaces = $session->countTrainees();
    $remainingPlaces = $session->getRemainingPlaces($totalPlaces);

        return $this->render('session/show.html.twig', [
            'notRegistered'=> $notRegistered,
            'notProgrammed'=> $notProgrammed,
            'session' => $session,
            'form' => $form->createView(),
            'takenPlaces' => $takenPlaces,
            'remainingPlaces' => $remainingPlaces,
        ]);
    }


}