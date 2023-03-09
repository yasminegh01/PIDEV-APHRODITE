<?php
// src/Controller/RatingController.php
namespace App\Controller;

use App\Entity\Stars;
use App\Entity\User;
use App\Entity\Post;
use App\Repository\PostRepository;
use Symfony\Bridge\Doctrine\Attribute\MapEntity;
use App\Repository\UserRepository;
use App\Form\RatingType;
use Doctrine\ORM\EntityManagerInterface;
use JMS\Serializer\SerializationContext;
use JMS\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Doctrine\ORM\Mapping as ORM;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

class RatingController extends AbstractController
{
    #[IsGranted('IS_AUTHENTICATED')]
    #[Route('/blog/posts/{slug}/rating', name: 'rating', methods: ['GET', 'POST'])]
    public function saveRating(
        UserRepository $userRepository,
        #[CurrentUser] User $uID,
        Request $request,
        EntityManagerInterface $entityManager,
        PostRepository $postRepository,
        #[MapEntity] Post $idpost,
    ): Response
    {
        $rating = $entityManager->getRepository(Stars::class)->findOneBy([
            'uID' => $uID->getId(),
            'idpost' => $idpost->getId(),
        ]);
        
        //$idpost=$this->generateUrl('rating', ['slug' => $post->getSlug()]);
        if ($request->request->get('save')) {
            $ratedIndex = $request->request->get('ratedIndex');
            if ($ratedIndex !== null && $ratedIndex >= 1 && $ratedIndex <= 5) {
                if ($rating) {
                    // Update the existing Stars entity with the new rating
                    $rating->setRateIndex($ratedIndex);
                } else {
                $rating = new Stars();
                $rating->setUID($uID->getId());
                $rating->setIdpost($idpost);
                $rating->setRateIndex($ratedIndex);
                $entityManager->persist($rating);
                }
                $entityManager->flush();
                //return $this->redirectToRoute('rating', ['slug' => $idpost->getSlug()]);
            }
            $response = new Response();
            $response->headers->set('Content-Type', 'application/json');
            $response->setContent(json_encode(['id' => $uID]));
            return $response;
        }
        
        // Render the template with the average rating and star rating system
        return $this->render('blog/post_show.html.twig', [
            // 'avg' => $avg,
            'uID' => $uID,
            'idpost' => $idpost,
            'post' => $idpost
        ]);
    }
}