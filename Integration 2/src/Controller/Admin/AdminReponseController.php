<?php

namespace App\Controller\Admin;

use App\Entity\Reponse;
use App\Entity\Reclamation;
use App\Form\ReponseType;
use App\Repository\ReponseRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ReclamationRepository;
use Doctrine\DBAL\Types\TextType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/admin/reponse')]
class AdminReponseController extends AbstractController
{
//    #[Route('/', name: 'app_admin_reponse_index', methods: ['GET'])]
//    public function index(ReponseRepository $reponseRepository): Response
//    {
//        return $this->render('admin/reponse/index.html.twig', [
//            'reponses' => $reponseRepository->findAll(),
//        ]);
//    }

    #[Route('/new/{id}', name: 'app_admin_reponse_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ReponseRepository $reponseRepository,Reclamation $reclamation): Response
    {

        $reponse = new Reponse();
        $reponse->setIdReclamation($reclamation);
        $form = $this->createForm(ReponseType::class, $reponse);
        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {
            $reponseRepository->save($reponse, true);

            return $this->redirectToRoute('app_admin_reclamation', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/reponse/new.html.twig', [
            'reponse' => $reponse,
            'form' => $form,
            'reclamation' => $reclamation,
        ]);
    }


    #[Route('/{id}', name: 'app_admin_reponse_show', methods: ['GET'])]
    public function show(Reponse $reponse): Response
    {
        return $this->render('admin/reponse/show.html.twig', [
            'reponse' => $reponse,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_admin_reponse_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Reponse $reponse, ReponseRepository $reponseRepository): Response
    {
        $form = $this->createForm(ReponseType::class, $reponse);
        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {
            $reponseRepository->save($reponse, true);

            return $this->redirectToRoute('app_admin_reclamation', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/reponse/edit.html.twig', [
            'reponse' => $reponse,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_admin_reponse_delete', methods: ['POST'])]
    public function delete(Request $request, Reponse $reponse, ReponseRepository $reponseRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$reponse->getId(), $request->request->get('_token'))) {
            $reponseRepository->remove($reponse, true);
        }

        return $this->redirectToRoute('app_admin_reponse_index', [], Response::HTTP_SEE_OTHER);
    }
}
