<?php

namespace App\Controller;

use App\Entity\AppointmentRequest;
use App\Form\AppointmentRequestType;
use App\Repository\AppointmentRequestRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\Validator\Constraints\Json;
use Symfony\Component\Serializer\SerializerInterface;
use Doctrine\ORM\Mapping as ORM;

#[Route('/appointment/request')]
#[IsGranted('IS_AUTHENTICATED')]
class AppointmentRequestController extends AbstractController
{
    #[Route('/', name: 'app_appointment_request_index', methods: ['GET'])]
    public function index(AppointmentRequestRepository $appointmentRequestRepository): Response
    {
        return $this->render('appointment_request/index.html.twig', [
            'appointment_requests' => $appointmentRequestRepository->findAll(),
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

    #[Route('/displayappointment', name: 'display_appointment', methods: ['GET'])]
    public function displayappointment(AppointmentRequestRepository $appointmentRequestRepository, EntityManagerInterface $entityManager, SerializerInterface $serializer)
    {
        $appointment = $entityManager
        ->getRepository(AppointmentRequest::class)
        ->findAll();
        $json = $serializer->serialize($appointment, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        return new JsonResponse($formatted);
    }
    // #[Route('/displayComments', name: 'display_comments', methods: ['GET'])]
    // public function displayComments(EntityManagerInterface $entityManager,SerializerInterface $serializer)
    // {
    //     $comments = $entityManager
    //         ->getRepository(AppointmentRequest::class)
    //         ->findAll();
    //     $json = $serializer->serialize($comments, 'json');
    //     $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
    //     return new JsonResponse($formatted);
    // }


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
