<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\PostRepository;


class SearchController extends AbstractController
{
    #[Route('/search', name: 'user_blog_search')]
    public function search(Request $request, PostRepository $posts): Response
    {
        $query = (string) $request->query->get('q', '');
        $limit = $request->query->getInt('l', 10);

        if (!$request->isXmlHttpRequest()) {
            return $this->render('search/search.html.twig', ['query' => $query]);
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