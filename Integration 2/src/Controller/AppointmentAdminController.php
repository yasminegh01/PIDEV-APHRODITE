<?php

namespace App\Controller;

use App\Entity\AppointmentAdmin;
use App\Entity\AppointmentRequest;
use App\Form\AppointmentRequestType;
use App\Repository\AppointmentRequestRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route('admin/appointment/request')]
#[IsGranted('IS_AUTHENTICATED')]
class AppointmentAdminController extends AbstractController
{
    // #[Route('/', name: 'app_appointment_admin')]
    // public function index(): Response
    // {
    //     return $this->render('appointment_admin/index.html.twig', [
    //         'controller_name' => 'AppointmentAdminController',
    //     ]);
    // }
    #[Route('/', name: 'app_appointment_admin', methods: ['GET'])]
    public function index(AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        return $this->render('appointment_admin/index.html.twig', [
            'appointment_requests' => $appointmentRequestRepository->findAll(),
        ]);
    }
    #[Route('/showrdv', name: 'app_appointment_show', methods: ['GET'])]
    public function showrdv(AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        return $this->render('appointment_request/index.html.twig', [
            'appointment_requests' => $appointmentRequestRepository->findAll(),
        ]);
    }
    #[Route('/new', name: 'app_appointment_admin_new', methods: ['GET', 'POST'])]
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

            return $this->redirectToRoute('app_appointment_admin', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('appointment_admin/new.html.twig', [
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

    #[Route('/{id}', name: 'app_appointment_request_delete', methods: ['GET','POST'])]
    public function delete(Request $request, AppointmentRequest $appointmentRequest, AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$appointmentRequest->getId(), $request->request->get('_token'))) {
            $appointmentRequestRepository->remove($appointmentRequest, true);
        }

        return $this->redirectToRoute('app_appointment_request_index', [], Response::HTTP_SEE_OTHER);
    }



}
