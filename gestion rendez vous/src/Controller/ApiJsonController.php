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
use App\Entity\User;

use Symfony\Component\Security\Http\Attribute\CurrentUser;

use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\Validator\Constraints\Json;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints\Time;

class ApiJsonController extends AbstractController
{

    #[Route('api/json/displayappointment', name: 'jsondsplay', methods: ['GET', 'POST'])]
    public function displayappointment(AppointmentRequestRepository $appointmentRequestRepository, EntityManagerInterface $entityManager, SerializerInterface $serializer)
    {
        $appointment = $entityManager
            ->getRepository(AppointmentRequest::class)
            ->findAll();

        $json = $serializer->serialize($appointment, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);


        //$serializer = new Serializer([new ObjectNormalizer()]);
        return new JsonResponse(json_decode($json));
        // $json = $serializer->serialize($appointment, 'json');
        // $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        // return new JsonResponse($formatted);
    }

    #[Route('api/json/newappointment', name: 'app_diagnostic_new_JSON', methods: ['GET', 'POST'])]
    public function ajouterAppointment(EntityManagerInterface $entityManagerRequest ,Request $request,AppointmentRequestRepository $appointmentRequestRepository,SerializerInterface $serializer): JsonResponse{
        $appointmentRequest = new AppointmentRequest();


        //$user = $this->getUser();
        //$idp = $appointmentRequestRepository->find($request->get('id_patient'));
        $idp = $request->get('id_patient');
        $idp = $entityManagerRequest->getRepository(User::class)->find($idp);
        $appointmentRequest->setIdPatient($idp);

        $name = $request->get('name');
        $lastname=$request->get('lastname');
        $birthday= new DateTime('2000-01-01');
        $gender=$request->get('gender');
        $phonenumber=$request->get('phonenumber');
        $email=$request->get('email');
        $new_old=$request->get('new_old');
        $appointmentprocedure=$request->get('appointmentprocedure');
        $appointmentdate=new DateTime('2000-01-01');
        $type=$request->get('type');
        $lien=$request->get('lien');
        $appointmentime=new DateTime();

        $appointmentRequest->setName($name);
        $appointmentRequest->setLastname($lastname);
        $appointmentRequest->setBirthday($birthday);
        $appointmentRequest->setGender($gender);
        $appointmentRequest->setPhonenumber($phonenumber);
        $appointmentRequest->setEmail($email);
        $appointmentRequest->setNewOld($new_old);
        $appointmentRequest->setAppointmentprocedure($appointmentprocedure);
        $appointmentRequest->setAppointmentdate($appointmentdate);
        $appointmentRequest->setType($type);
        $appointmentRequest->setLien($lien);
        $appointmentRequest->setAppointmentime($appointmentime);
        //$appointmentRequest->setIdPatient($user);

        $appointmentRequestRepository->save($appointmentRequest);
        $entityManagerRequest->persist($appointmentRequest);
        $entityManagerRequest->flush();

        return new JsonResponse($appointmentRequest);
    }


    #[Route('api/json/deleteappointment', name: 'app_appointment_delete_json', methods: ['GET', 'POST'])]
    public function deleteAppointment(Request $request,AppointmentRequestRepository $appointmentRequestRepository,SerializerInterface $serializer,EntityManagerInterface $entityManager): JsonResponse
    {
        $id = $request->get("id");
        $appointmentRequest = $entityManager->getRepository(AppointmentRequest::class)->find($id);
        if($appointmentRequest!=null ) {
            $entityManager->remove($appointmentRequest);
            $entityManager->flush();

            $serialize = new Serializer([new ObjectNormalizer()]);
            $formatted = $serialize->normalize("Post a ete supprimee avec success.");
            return new JsonResponse($formatted);
        }
        return new JsonResponse("id reclamation invalide.");
    }


    #[Route('api/json/editappointment', name: 'app_appoi_edit_json', methods: ['GET', 'POST'])]
    public function editaAppointment(EntityManagerInterface $entityManagerRequest ,Request $request,AppointmentRequestRepository $appointmentRequestRepository,SerializerInterface $serializer): JsonResponse
    {
        $appointmentRequest = $appointmentRequestRepository->find($request->get('id'));


        if (!$appointmentRequest) {
            $formatted = ['error' => 'Post not found.'];
            return new JsonResponse($formatted);
        }

        $user = $this->getUser();

        $name = $request->get('name');
        $lastname=$request->get('lastname');
        $birthday= new DateTime('2000-01-01');
        $gender=$request->get('gender');
        $phonenumber=$request->get('phonenumber');
        $email=$request->get('email');
        $new_old=$request->get('new_old');
        $appointmentprocedure=$request->get('appointmentprocedure');
        $appointmentdate=new DateTime('2000-01-01');
        $type=$request->get('type');
        $lien=$request->get('lien');
        $appointmentime=new DateTime();

        $appointmentRequest->setName($name);
        $appointmentRequest->setLastname($lastname);
        $appointmentRequest->setBirthday($birthday);
        $appointmentRequest->setGender($gender);
        $appointmentRequest->setPhonenumber($phonenumber);
        $appointmentRequest->setEmail($email);
        $appointmentRequest->setNewOld($new_old);
        $appointmentRequest->setAppointmentprocedure($appointmentprocedure);
        $appointmentRequest->setAppointmentdate($appointmentdate);
        $appointmentRequest->setType($type);
        $appointmentRequest->setLien($lien);
        $appointmentRequest->setAppointmentime($appointmentime);
        //$appointmentRequest->setIdPatient($user);
        $appointmentRequestRepository->save($appointmentRequest);
        $entityManagerRequest->persist($appointmentRequest);
        $entityManagerRequest->flush();

        return new JsonResponse($appointmentRequest);

    }

    // public function modifierSeanceAction(AnimalsCategoryRepository $AnimalsCategoryRepository,Request $request) {

    //     $em = $this->getDoctrine()->getManager();

    //      $AnimalsCategories = $AnimalsCategoryRepository->find($request->get('id'));

    //      $AnimalsCategories->setEspece($request->get('Espece'));
    //      $AnimalsCategories->setRace($request->get('Race'));

    //      $AnimalsCategoryRepository->save($AnimalsCategories);
    //      $em->persist($AnimalsCategories);
    //      $em->flush();

    //      return new JsonResponse($AnimalsCategories);

    //  }

}