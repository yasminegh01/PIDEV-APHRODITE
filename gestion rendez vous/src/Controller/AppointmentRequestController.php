<?php

namespace App\Controller;

use App\Entity\AppointmentRequest;
use App\Form\AppointmentRequestType;
use App\Repository\AppointmentRequestRepository;
use App\Repository\FichePatientRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('/appointment/request')]
#[IsGranted('IS_AUTHENTICATED')]
class AppointmentRequestController extends AbstractController
{
    #[Route('/', name: 'app_appointment_request_index', methods: ['GET'])]
    public function index(AppointmentRequestRepository $appointmentRequestRepository,FichePatientRepository $fichePatientRepository): Response
    {
        return $this->render('appointment_request/index.html.twig', [
            'appointment_requests' => $appointmentRequestRepository->findAll(),
            'fiche_patients' => $fichePatientRepository->findAll(),

        ]);
    }
    #[Route('/showrdv', name: 'app_appointment_show', methods: ['GET'])]
    public function showrdv(AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        $user = $this->getUser(); // Get the logged-in user
        return $this->render('appointment_request/showrdv.html.twig', [
            'appointment_requests' => $appointmentRequestRepository->findBy(['id_patient' => $this->getUser()]),
        ]);
    }

    #[Route('/new', name: 'app_appointment_request_new', methods: ['GET', 'POST'])]
    public function new(Request $request, AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        $user = $this->getUser();
        //echo ($user);
        $appointmentRequest = new AppointmentRequest();
        $appointmentRequest->setIdPatient($user);
        $form = $this->createForm(AppointmentRequestType::class, $appointmentRequest);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $appointmentRequestRepository->save($appointmentRequest, true);

            return $this->redirectToRoute('app_base', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('appointment_request/new.html.twig', [
            'appointment_request' => $appointmentRequest,
            'form' => $form,
        ]);
    }
    #[Route('/new', name: 'app_appointment_request_new_admin', methods: ['GET', 'POST'])]
    public function new_admin(Request $request, AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        $appointmentRequest = new AppointmentRequest();
        $form = $this->createForm(AppointmentRequestType::class, $appointmentRequest);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $appointmentRequestRepository->save($appointmentRequest, true);

            return $this->redirectToRoute('app_appointment_request_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('appointment_request/new_admin.html.twig', [
            'appointment_request' => $appointmentRequest,
            'form' => $form,
        ]);
    }


    #[Route('/{id}', name: 'app_appointment_request_show', methods: ['GET'])]
    public function show(AppointmentRequest $appointmentRequest): Response
    {
        return $this->render('appointment_request/show.html.twig', [
            'appointment_request' => $appointmentRequest,
        ]);
    }


    #[Route('/{id}/edit', name: 'app_appointment_request_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, AppointmentRequest $appointmentRequest, AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        $form = $this->createForm(AppointmentRequestType::class, $appointmentRequest);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $appointmentRequestRepository->save($appointmentRequest, true);

            return $this->redirectToRoute('app_appointment_request_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('appointment_request/edit.html.twig', [
            'appointment_request' => $appointmentRequest,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_appointment_request_delete', methods: ['POST'])]
    public function delete(Request $request, AppointmentRequest $appointmentRequest, AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$appointmentRequest->getId(), $request->request->get('_token'))) {
            $appointmentRequestRepository->remove($appointmentRequest, true);
        }

        return $this->redirectToRoute('app_appointment_request_index', [], Response::HTTP_SEE_OTHER);
    }
}
