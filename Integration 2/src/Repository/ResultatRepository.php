<?php

namespace App\Repository;

use App\Entity\Resultat;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Resultat>
 *
 * @method Resultat|null find($id, $lockMode = null, $lockVersion = null)
 * @method Resultat|null findOneBy(array $criteria, array $orderBy = null)
 * @method Resultat[]    findAll()
 * @method Resultat[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ResultatRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Resultat::class);
    }

    public function save(Resultat $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Resultat $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }
    public function searchSort($searchTerm, $sortField, $sortOrder)
    {
        $qb = $this->createQueryBuilder('r');
        if ($searchTerm) {
            $qb->andWhere($qb->expr()->orX(
                $qb->expr()->like('r.id', ':searchTerm'),
                $qb->expr()->like('r.action', ':searchTerm'),
                $qb->expr()->like('r.possibility', ':searchTerm'),
                $qb->expr()->like('r.doctorNote', ':searchTerm'),
                $qb->expr()->like('r.urgency', ':searchTerm'),



            ))->setParameter('searchTerm', '%'.$searchTerm.'%');
        }

        switch ($sortField) {
            case 'id':
            case 'action':
            case 'possibility':
            case 'doctorNote':
            case 'urgency':

            $qb->orderBy('r.'.$sortField, $sortOrder);
                break;
            default:
                $qb->orderBy('r.id', 'ASC');
        }

        return $qb->getQuery()->getResult();
    }


//    /**
//     * @return Resultat[] Returns an array of Resultat objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('r.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Resultat
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
