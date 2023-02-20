<?php

namespace App\Controller;

use App\Entity\Diagnostic;
use App\Form\DiagnosticType;
use App\Repository\DiagnosticRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/diagnostic')]
class DiagnosticController extends AbstractController
{
    #[Route('/', name: 'app_diagnostic_index', methods: ['GET'])]
    public function index(DiagnosticRepository $diagnosticRepository): Response
    {
        return $this->render('diagnostic/index.html.twig', [
            'diagnostics' => $diagnosticRepository->findAll(),
        ]);
    }

    #[Route('/admin', name: 'app_diagnostic_index_admin', methods: ['GET'])]
    public function index_admin(DiagnosticRepository $diagnosticRepository): Response
    {
        return $this->render('admin/diagnostic/diagnostic.html.twig', [
            'diagnostics' => $diagnosticRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_diagnostic_new', methods: ['GET', 'POST'])]
    public function new(Request $request, DiagnosticRepository $diagnosticRepository): Response
    {
        $diagnostic = new Diagnostic();
        $form = $this->createForm(DiagnosticType::class, $diagnostic);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $diagnosticRepository->save($diagnostic, true);

            return $this->redirectToRoute('app_diagnostic_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('diagnostic/new_admin.html.twig', [
            'diagnostic' => $diagnostic,
            'form' => $form,
        ]);
    }

    #[Route('/admin/new', name: 'app_diagnostic_new_admin', methods: ['GET', 'POST'])]
    public function new_admin(Request $request, DiagnosticRepository $diagnosticRepository): Response
    {
        $diagnostic = new Diagnostic();
        $form = $this->createForm(DiagnosticType::class, $diagnostic);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $diagnostic->setDate(  new \DateTime());
            $diagnosticRepository->save($diagnostic, true);

            return $this->redirectToRoute('app_diagnostic_index_admin', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('templates/admin/appointment_resquest/new_admin.html.twig', [
            'diagnostic' => $diagnostic,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_diagnostic_show', methods: ['GET'])]
    public function show(Diagnostic $diagnostic): Response
    {
        return $this->render('diagnostic/show.html.twig', [
            'diagnostic' => $diagnostic,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_diagnostic_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Diagnostic $diagnostic, DiagnosticRepository $diagnosticRepository): Response
    {
        $form = $this->createForm(DiagnosticType::class, $diagnostic);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $diagnosticRepository->save($diagnostic, true);

            return $this->redirectToRoute('app_diagnostic_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('diagnostic/edit.html.twig', [
            'diagnostic' => $diagnostic,
            'form' => $form,
        ]);
    }

    #[Route('/admin/{id}/edit', name: 'app_diagnostic_edit_admin', methods: ['GET', 'POST'])]
    public function edit_admin(Request $request, Diagnostic $diagnostic, DiagnosticRepository $diagnosticRepository): Response
    {
        $form = $this->createForm(DiagnosticType::class, $diagnostic);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $diagnosticRepository->save($diagnostic, true);

            return $this->redirectToRoute('app_diagnostic_index_admin', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/diagnostic/new_admin.html.twig', [
            'diagnostic' => $diagnostic,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_diagnostic_delete', methods: ['POST'])]
    public function delete(Request $request, Diagnostic $diagnostic, DiagnosticRepository $diagnosticRepository): Response
    {
            $diagnosticRepository->remove($diagnostic, true);


        return $this->redirectToRoute('app_diagnostic_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/admin/{id}', name: 'app_diagnostic_delete_admin', methods: ['POST'])]
    public function delete_admin(Request $request, Diagnostic $diagnostic, DiagnosticRepository $diagnosticRepository): Response
    {
        $diagnosticRepository->remove($diagnostic, true);


        return $this->redirectToRoute('app_diagnostic_index_admin', [], Response::HTTP_SEE_OTHER);
    }
}
