<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Post;
use App\Entity\User;
use App\Event\CommentCreatedEvent;
use App\Form\CommentType;
use App\Repository\PostRepository;
use App\Repository\TagRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Doctrine\Attribute\MapEntity;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Attribute\Cache;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use App\Entity\Reclamation;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\Validator\Constraints\Json;
use Symfony\Component\Serializer\SerializerInterface;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;



/**
 * Controller used to manage blog contents in the public part of the site.
 *
 * @author Ryan Weaver <weaverryan@gmail.com>
 * @author Javier Eguiluz <javier.eguiluz@gmail.com>
 */
#[Route('/blog')]
class BlogController extends AbstractController
{
    /**
     * NOTE: For standard formats, Symfony will also automatically choose the best
     * Content-Type header for the response.
     *
     * See https://symfony.com/doc/current/routing.html#special-parameters
     */
    #[Route('/', defaults: ['page' => '1', '_format' => 'html'], methods: ['GET'], name: 'blog_index')]
    #[Route('/rss.xml', defaults: ['page' => '1', '_format' => 'xml'], methods: ['GET'], name: 'blog_rss')]
    #[Route('/page/{page<[1-9]\d{0,8}>}', defaults: ['_format' => 'html'], methods: ['GET'], name: 'blog_index_paginated')]
    #[Cache(smaxage: 10)]
    public function index(Request $request, int $page, string $_format, PostRepository $posts, TagRepository $tags): Response
    {
        $tag = null;
        if ($request->query->has('tag')) {
            $tag = $tags->findOneBy(['name' => $request->query->get('tag')]);
        }
        $latestPosts = $posts->findLatest($page, $tag);

        // Every template name also has two extensions that specify the format and
        // engine for that template.
        // See https://symfony.com/doc/current/templates.html#template-naming
        return $this->render('blog/index.'.$_format.'.twig', [
            'paginator' => $latestPosts,
            'tagName' => $tag?->getName(),
        ]);
    }

    /**
     * NOTE: The $post controller argument is automatically injected by Symfony
     * after performing a database query looking for a Post with the 'slug'
     * value given in the route.
     *
     * See https://symfony.com/doc/current/bundles/SensioFrameworkExtraBundle/annotations/converters.html
     */
    #[Route('/posts/{slug}', methods: ['GET'], name: 'blog_post')]
    public function postShow(Post $post): Response
    {
        return $this->render('blog/post_show.html.twig', ['post' => $post]);
    }


      #[Route('/api/displayPosts', methods: ['GET'], name: 'display_post')]
      public function displayPosts(EntityManagerInterface $entityManager,SerializerInterface $serializer)
      {
        // $posts = $entityManager
        //     ->getRepository(Post::class)
        //     ->findAll();

            $posts = $entityManager
            ->getRepository(Post::class)
            ->createQueryBuilder('p')
            ->orderby('p.id')
            ->select('p.id,p.title,p.slug,p.summary,p.content,p.publishedAt')
            ->getQuery()
            ->getResult();
        $json = $serializer->serialize($posts, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);


        //$serializer = new Serializer([new ObjectNormalizer()]);
        return new JsonResponse(json_decode($json));
        // return new JsonResponse($formatted, 200, [], JSON_UNESCAPED_UNICODE);
        // return new JsonResponse($formatted);
 
      }

    #[Route('/api/newPosts', name: 'app_new_blog', methods: ['GET', 'POST'])]
    public function NewPostAction(Request $request,PostRepository $postRepository,EntityManagerInterface $entityManager,SerializerInterface $serializer): JsonResponse
    {
        $post = new Post();
        $title = $request->get('title');
        $author = $request->get('author');
        $author = $entityManager->getRepository(User::class)->find($author);
        $post->setAuthor($author);
        $slug = $request->get('slug');
        $summary = $request->get('summary');
        $content = $request->get('content');
        $publishedAt = $request->get('publishedAt');


        $publishedAt = new \DateTime('now');
        
        $post->setTitle($title);
        $post->setAuthor($author);
        $post->setSlug($slug);
        $post->setSummary($summary);
        $post->setContent($content);
        $post->setPublishedAt($publishedAt);

        $postRepository->save($post,true);
        
        $json = $serializer->serialize($post, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        $formatted = $serializer->normalize($post);
        return new JsonResponse($formatted);
    }

    #[Route('/api/editPosts', name: 'app_blog_edit_json', methods: ['GET'])]
    public function editPostAction(Request $request,PostRepository $postRepository,EntityManagerInterface $entityManager,SerializerInterface $serializer): JsonResponse
        {
            $post = $postRepository->find($request->get('id'));

            if (!$post) {
                $formatted = ['error' => 'Post not found.'];
                return new JsonResponse($formatted);
            }
            //$post = new Post();
            $title = $request->get('title');
            $author = $request->get('author');
            $author = $entityManager->getRepository(User::class)->find($author);
            $post->setAuthor($author);
            $slug = $request->get('slug');
            $summary = $request->get('summary');
            $content = $request->get('content');
            $publishedAt = $request->get('publishedAt');


            $publishedAt = new \DateTime('now');
            
            $post->setTitle($title);
            $post->setAuthor($author);
            $post->setSlug($slug);
            $post->setSummary($summary);
            $post->setContent($content);
            $post->setPublishedAt($publishedAt);

            $postRepository->save($post,true);
            
            $json = $serializer->serialize($post, 'json');
            $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
            $formatted = $serializer->normalize($post);
            return new JsonResponse($formatted);
        }

    #[Route('/api/deletePosts', name: 'app_blog_delete_json', methods: ['GET'])]   
    public function deletePostAction(Request $request,PostRepository $postRepository,EntityManagerInterface $entityManager,SerializerInterface $serializer): JsonResponse
    {
            $id = $request->get("id");
            $post = $entityManager->getRepository(Post::class)->find($id);
            if($post!=null ) {
                $entityManager->remove($post);
                $entityManager->flush();


                $serialize = new Serializer([new ObjectNormalizer()]);
                $formatted = $serialize->normalize("Post a ete supprimee avec success.");
                return new JsonResponse($formatted);
            }
        return new JsonResponse("id reclamation invalide.");
    }

    #[Route('/api/displayComments', methods: ['GET'], name: 'display_comments')]
    public function displayComments(EntityManagerInterface $entityManager,SerializerInterface $serializer)
    {
        // $comments = $entityManager
        //     ->getRepository(Comment::class)
        //     ->createQueryBuilder('c')
        //     ->orderby('c.id')
        //     ->select('c.id,c.post,c.author,c.content,c.publishedAt')
        //     ->getQuery()
        //     ->getResult();
    $comments = $entityManager
        ->getRepository(Comment::class)
        ->findAll();
        $json = $serializer->serialize($comments, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);


        //$serializer = new Serializer([new ObjectNormalizer()]);
        return new JsonResponse(json_decode($json));
        // return new JsonResponse($formatted, 200, [], JSON_UNESCAPED_UNICODE);
        // return new JsonResponse($formatted);
    // $json = $serializer->serialize($comments, 'json');
    // $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
    //     return new JsonResponse($formatted);
    }
    #[Route('/api/newComments', name: 'app_new_Comments', methods: ['GET', 'POST'])]
    public function NewCommentsAction(Request $request,PostRepository $postRepository,EntityManagerInterface $entityManager,SerializerInterface $serializer): JsonResponse
    {   $comment = new Comment();

        $postId = $request->get('idpost');
        $post = $entityManager->getRepository(Post::class)->find($postId);

        $author = $request->get('author');
        // echo ($author);
        $author = $entityManager->getRepository(User::class)->find($author);
        // echo ($author);
        
        $content = $request->get('content');
        $publishedAt = $request->get('publishedAt');
        $publishedAt = new \DateTime('now');

        $comment->setContent($content);
        $comment->setPublishedAt($publishedAt);
        $comment->setAuthor($author);
        // echo ($author);
        $comment->setPost($post);


        //$postRepository->save($comment,true);
        $entityManager->persist($comment);
        $entityManager->flush();
        
        
        $json = $serializer->serialize($comment, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        $formatted = $serializer->normalize($comment);
        return new JsonResponse($formatted);
    }
    #[Route('/api/editComments', name: 'app_edit_Comments', methods: ['GET', 'POST'])]
    public function EditCommentsAction(Request $request,PostRepository $postRepository,EntityManagerInterface $entityManager,SerializerInterface $serializer): JsonResponse
    {   //$comment = new Comment();
        $comment = $request->get('id');
        $comment = $entityManager->getRepository(Comment::class)->find($comment);

        if (!$comment) {
            $formatted = ['error' => 'Comment not found.'];
            return new JsonResponse($formatted);
        }

        $postId = $request->get('idpost');
        $post = $entityManager->getRepository(Post::class)->find($postId);
        $author = $request->get('author');
        $author = $entityManager->getRepository(User::class)->find($author);
        $content = $request->get('content');
        $publishedAt = $request->get('publishedAt');
        $publishedAt = new \DateTime('now');

        $comment->setContent($content);
        $comment->setPublishedAt($publishedAt);
        $comment->setAuthor($author);
        // echo ($author);
        $comment->setPost($post);


        //$postRepository->save($comment,true);
        $entityManager->persist($comment);
        $entityManager->flush();
        
        
        $json = $serializer->serialize($comment, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        $formatted = $serializer->normalize($comment);
        return new JsonResponse($formatted);
    }
    #[Route('/api/deleteComments', name: 'app_Comments_delete_json', methods: ['GET'])]   
    public function deleteCommentsAction(Request $request,PostRepository $postRepository,EntityManagerInterface $entityManager,SerializerInterface $serializer): JsonResponse
    {
            $id = $request->get("id");
            $comment = $entityManager->getRepository(Comment::class)->find($id);
            if($comment!=null ) {
                $entityManager->remove($comment);
                $entityManager->flush();

                $serialize = new Serializer([new ObjectNormalizer()]);
                $formatted = $serialize->normalize("Comments a ete supprimee avec success.");
                return new JsonResponse($formatted);
            }
        return new JsonResponse("id reclamation invalide.");
    }

    #[Route('/comment/{postSlug}/new', methods: ['POST'], name: 'comment_new')]
    #[IsGranted('IS_AUTHENTICATED')]
    public function commentNew(
        #[CurrentUser] User $user,
        Request $request,
        #[MapEntity(mapping: ['postSlug' => 'slug'])] Post $post,
        EventDispatcherInterface $eventDispatcher,
        EntityManagerInterface $entityManager,
    ): Response {
        $comment = new Comment();
        $comment->setAuthor($user);
        $post->addComment($comment);

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($comment);
            $entityManager->flush();

            // When an event is dispatched, Symfony notifies it to all the listeners
            // and subscribers registered to it. Listeners can modify the information
            // passed in the event and they can even modify the execution flow, so
            // there's no guarantee that the rest of this controller will be executed.
            // See https://symfony.com/doc/current/components/event_dispatcher.html
            $eventDispatcher->dispatch(new CommentCreatedEvent($comment));

            return $this->redirectToRoute('blog_post', ['slug' => $post->getSlug()]);
        }

        return $this->render('blog/comment_form_error.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }

    /**
     * This controller is called directly via the render() function in the
     * blog/post_show.html.twig template. That's why it's not needed to define
     * a route name for it.
     *
     * The "id" of the Post is passed in and then turned into a Post object
     * automatically by the ParamConverter.
     */
    public function commentForm(Post $post): Response
    {
        $form = $this->createForm(CommentType::class);

        return $this->render('blog/_comment_form.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }

    #[Route('/search', methods: ['GET'], name: 'blog_search')]
    public function search(Request $request, PostRepository $posts): Response
    {
        $query = (string) $request->query->get('q', '');
        $limit = $request->query->getInt('l', 10);

        if (!$request->isXmlHttpRequest()) {
            return $this->render('admin/search.html.twig', ['query' => $query]);
        }

        $foundPosts = $posts->findBySearchQuery($query, $limit);

        $results = [];
        foreach ($foundPosts as $post) {
            /** @var string $author */
            $author = $post->getAuthor() ? $post->getAuthor()->getFullName() : '';

            /** @var string $title */
            $title = $post->getTitle();

            /** @var string $summary */
            $summary = $post->getSummary();

            $results[] = [
                'title' => htmlspecialchars($title, \ENT_COMPAT | \ENT_HTML5),
                'date' => $post->getPublishedAt()->format('M d, Y'),
                'author' => htmlspecialchars($author, \ENT_COMPAT | \ENT_HTML5),
                'summary' => htmlspecialchars($summary, \ENT_COMPAT | \ENT_HTML5),
                'url' => $this->generateUrl('blog_post', ['slug' => $post->getSlug()]),
            ];
        }

        return $this->json($results);
    }
}
