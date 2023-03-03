<?php

namespace App\Repository;

use App\Entity\Diagnostic;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Diagnostic>
 *
 * @method Diagnostic|null find($id, $lockMode = null, $lockVersion = null)
 * @method Diagnostic|null findOneBy(array $criteria, array $orderBy = null)
 * @method Diagnostic[]    findAll()
 * @method Diagnostic[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DiagnosticRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Diagnostic::class);
    }

    public function save(Diagnostic $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Diagnostic $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }
   /* public function findBySearchTerm(string $searchTerm, string $sortBy, string $sortOrder): array
    {
        $qb = $this->createQueryBuilder('d');

        // Apply search term if provided
        if (!empty($searchTerm)) {
            $qb->andWhere('d.age LIKE :searchTerm OR d.symptoms LIKE :searchTerm')
                ->setParameter('searchTerm', '%'.$searchTerm.'%');
        }

        // Apply sorting
        $qb->orderBy('d.'.$sortBy, $sortOrder);

        return $qb->getQuery()->getResult();
    }
   */
    public function searchSort($searchTerm, $sortField, $sortOrder)
    {
        $qb = $this->createQueryBuilder('d');
        if ($searchTerm) {
            $qb->andWhere($qb->expr()->orX(
                $qb->expr()->like('d.age', ':searchTerm'),
                $qb->expr()->like('d.id', ':searchTerm'),
                $qb->expr()->like('d.overweight', ':searchTerm'),
                $qb->expr()->like('d.cigarettes', ':searchTerm'),
                $qb->expr()->like('d.recentlyInjured', ':searchTerm'),
                $qb->expr()->like('d.highCholesterol', ':searchTerm'),
                $qb->expr()->like('d.hyperTension', ':searchTerm'),
                $qb->expr()->like('d.diabetes', ':searchTerm'),
                $qb->expr()->like('d.date', ':searchTerm'),


            ))->setParameter('searchTerm', '%'.$searchTerm.'%');
        }

        switch ($sortField) {
            case 'age':
            case 'id':
            case 'overweight':
            case 'cigarettes':
            case 'recently_injured':
            case 'high_cholesterol':
            case 'hyper_tension':
            case 'diabetes':
            case 'date':

            $qb->orderBy('d.'.$sortField, $sortOrder);
                break;
            default:
                $qb->orderBy('d.id', 'ASC');
        }

        return $qb->getQuery()->getResult();
    }


//    /**
//     * @return Diagnostic[] Returns an array of Diagnostic objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('d.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Diagnostic
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
