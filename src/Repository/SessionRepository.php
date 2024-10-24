<?php

namespace App\Repository;

use App\Entity\Session;
use App\Repository\SessionRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @extends ServiceEntityRepository<Session>
 */
class SessionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Session::class);
    }

    
    //Trouver les stagiaires non inscrit à une section
    public function findNotRegistered($session_id)
    {
        $em = $this->getEntityManager();
        $sub = $em ->createQueryBuilder();

        $qb = $sub; 

        $qb->select('t')
           ->from('App\Entity\Trainee', 't')
           ->leftJoin('t.sessions', 'se')
           ->where('se.id = :id');

        $sub = $em->createQueryBuilder();

        $sub->select('tr')
        ->from('App\Entity\Trainee', 'tr')
        ->where($sub->expr()->notIn('tr.id', $qb->getDQL()))
        ->setParameter('id', $session_id)
        ->orderBy('tr.firstname');


        $query = $sub->getQuery();
        return $query->getResult();
    }


    //trouver les modules non programmés pour une session
    public function findNotProgrammed($session_id)
    {
        $em = $this->getEntityManager();
        $sub = $em ->createQueryBuilder();

        $qb = $sub; 

        $qb->select('m')
           ->from('App\Entity\Module', 'm')
           ->leftJoin('m.programs', 'mp')
           ->where('mp.session = :id');

        $sub = $em->createQueryBuilder();

        $sub->select('mo')
        ->from('App\Entity\Module', 'mo')
        ->where($sub->expr()->notIn('mo.id', $qb->getDQL()))
        ->setParameter('id', $session_id)
        ->orderBy('mo.moduleName');


        $query = $sub->getQuery();
        return $query->getResult();
    }
}
