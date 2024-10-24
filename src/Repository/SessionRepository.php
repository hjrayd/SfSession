<?php

namespace App\Repository;

use App\Entity\Session;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Session>
 */
class SessionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Session::class);
    }

    //    /**
    //     * @return Session[] Returns an array of Session objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('s')
    //            ->andWhere('s.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('s.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Session
    //    {
    //        return $this->createQueryBuilder('s')
    //            ->andWhere('s.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }

    public function findNotRegistered($session_id)
    {
        $em = $this->getEntityManager();
        $sub = $em ->createQueryBuilder();

        $qb = $sub; 

        $qb->select('t')
           ->from('App\Entity\Trainee', 't')
           ->leftJoin('s.sessions', 'se')
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


    public function findNotProgramed($session_id)
    {
        $em = $this->getEntityManager();
        $sub = $em ->createQueryBuilder();

        $qb = $sub; 

        $qb->select('m')
           ->from('App\Entity\Module', 'm')
           ->leftJoin('s.sessions', 'se')
           ->where('se.id = :id');

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
