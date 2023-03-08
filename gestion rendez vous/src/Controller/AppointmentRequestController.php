<?php

namespace App\Controller;

use App\Entity\AppointmentRequest;
use App\Form\AppointmentRequestType;
use App\Repository\AppointmentRequestRepository;
use App\Repository\FichePatientRepository;

use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;

use Symfony\Component\Security\Http\Attribute\CurrentUser;

use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\Validator\Constraints\Json;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints\Time;


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
    //json











//        $appointment = $entityManager
//            ->getRepository(AppointmentRequest::class)
//            ->findAll();
//
//        $json = $serializer->serialize($appointment, 'json');
//        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
//
//        $jsonData = $request->getContent();
//        $formData = json_decode($jsonData,true);
//
//       $name =$formData[1]['value'];
//        $lastname=$formData[2]['value'];
//        $birthday=$formData[3]['value'];
//        $gender=$formData[4]['value'];
//        $phonenumber=$formData[5]['value'];
//        $email=$formData[6]['value'];
//        $new_old=$formData[7]['value'];
//        $appointmentprocedure=$formData[8]['value'];
//        $appointmentdate=$formData[9]['value'];
//        $type=$formData[10]['value'];
//        $lien=$formData[11]['value'];
//        $appointmentime=$formData[12]['value'];
////
////        $appointmentRequest = new AppointmentRequest();

//
////
////        $jsonContent =$serializer->serialize($appointmentRequest);
//        return new JsonResponse($formatted);





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


    //approve request
    #[Route('/form/{id}/approve', name: 'form_approve', methods: ['GET','POST'])]
    public function approve(AppointmentRequest $appointmentRequest,EntityManagerInterface $entityManager)
    {

        $appointmentRequest->setStatus("approved");
        $entityManager->flush();

        return $this->redirectToRoute('app_appointment_request_index', [], Response::HTTP_SEE_OTHER);

    }
//reject request
    #[Route('/form/{id}/reject', name: 'form_reject', methods: ['GET'])]
    public function reject( AppointmentRequest $appointmentRequest, EntityManagerInterface $entityManager)
    {
        $appointmentRequest->setStatus("rejected");
        $entityManager->flush();

        return $this->redirectToRoute('app_appointment_request_index', [], Response::HTTP_SEE_OTHER);

    }

    #[Route('/calendar123', name: 'app_calendar', methods: ['POST','GET'])]
    public function calendar12()
    {
        return $this->render('admin/calendar/basecal.html.twig');
    }

}
