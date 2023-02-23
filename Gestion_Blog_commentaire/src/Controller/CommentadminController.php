<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Form\CommentadminType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('admin/comment')]
class CommentadminController extends AbstractController
{
    #[Route('/', name: 'admin_app_comment_index', methods: ['GET'])]
    #[IsGranted('ROLE_ADMIN')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $user = $this->getUser(); // Get the logged-in user
        echo ($user);
        $comments = $entityManager
            ->getRepository(Comment::class)
            ->findAll();
            // ->findBy(['author' => $this->getUser()]);

            
        return $this->render('admin/comment/index.html.twig', [
            'comments' => $comments,
        ]);
    }

    #[Route('/new', name: 'admin_app_comment_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentadminType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($comment);
            
            $this->addFlash('success', 'comment.created_successfully');
            return $this->redirectToRoute('admin_app_comment_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/comment/new.html.twig', [
            'comment' => $comment,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'admin_app_comment_show', methods: ['GET'])]
    public function show(Comment $comment): Response
    {
        return $this->render('admin/comment/show.html.twig', [
            'comment' => $comment,
        ]);
    }

    #[Route('/{id}/edit', name: 'admin_app_comment_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Comment $comment, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(CommentadminType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->addFlash('success', 'comment.updated_successfully');

            return $this->redirectToRoute('admin_app_comment_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/comment/edit.html.twig', [
            'comment' => $comment,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'admin_app_comment_delete', methods: ['POST'])]
    public function delete(Request $request, Comment $comment, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$comment->getId(), $request->request->get('_token'))) {
            $entityManager->remove($comment);
            $this->addFlash('success', 'comment.deleted_successfully');
        }

        return $this->redirectToRoute('admin_app_comment_index', [], Response::HTTP_SEE_OTHER);
    }
}
