<?php

namespace App\Controller;

use App\Entity\FichePatient;
use App\Form\FichePatientType;
use App\Repository\AppointmentRequestRepository;
use App\Repository\FichePatientRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\AppointmentRequest;
use Symfony\Component\Serializer\SerializerInterface;

#[Route('/fiche/patient')]
class FichePatientController extends AbstractController
{
    #[Route('/', name: 'app_fiche_patient_index', methods: ['GET'])]
    public function index(FichePatientRepository $fichePatientRepository): Response
    {
        return $this->render('calendar/main/index.html.twig', [
            'fiche_patients' => $fichePatientRepository->findAll(),
        ]);
    }



    #[Route('/new/{id}', name: 'app_fiche_patient_new', methods: ['GET', 'POST'])]
    public function new(Request $request, FichePatientRepository $fichePatientRepository,AppointmentRequest $id): Response
    {
        $fichePatient = new FichePatient();
        $fichePatient->setRendezVous($id);
        $form = $this->createForm(FichePatientType::class, $fichePatient);
        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {
            $fichePatientRepository->save($fichePatient, true);

            return $this->redirectToRoute('app_fiche_patient_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('fiche_patient/new.html.twig', [
            'fiche_patient' => $fichePatient,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_fiche_patient_show', methods: ['GET'])]
    public function show(FichePatient $fichePatient): Response
    {
        return $this->render('fiche_patient/show.html.twig', [
            'fiche_patient' => $fichePatient,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_fiche_patient_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, FichePatient $fichePatient, FichePatientRepository $fichePatientRepository): Response
    {
        $form = $this->createForm(FichePatientType::class, $fichePatient);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $fichePatientRepository->save($fichePatient, true);

            return $this->redirectToRoute('app_fiche_patient_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('fiche_patient/edit.html.twig', [
            'fiche_patient' => $fichePatient,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_fiche_patient_delete', methods: ['POST'])]
    public function delete(Request $request, FichePatient $fichePatient, FichePatientRepository $fichePatientRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$fichePatient->getId(), $request->request->get('_token'))) {
            $fichePatientRepository->remove($fichePatient, true);
        }

        return $this->redirectToRoute('app_fiche_patient_index', [], Response::HTTP_SEE_OTHER);
    }


    #[Route('/JSON/displayfichepatient', name: 'display_fiche', methods: ['GET'])]
    public function displayfiche(FichePatientRepository $fichePatientRepository, EntityManagerInterface $entityManager, SerializerInterface $serializer)
    {
$fiche= $entityManager
    ->getRepository(FichePatient::class)
    ->findAll();
        $json = $serializer->serialize($fiche, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        return new JsonResponse($formatted);
    }

    #[Route('/JSON/newfiche', name: 'ajouter_fiche', methods: ['GET'])]
    public function ajouterfiche(Request $request,FichePatientRepository $fichePatientRepository, EntityManagerInterface $entityManager, SerializerInterface $serializer): JsonResponse
    {
        $fiche= new FichePatient();

        $name=$request->get('name');
        $symptome=$request->get('symptome');
        $medicament=$request->get('medicament');
        $progres=$request->get('progres');
//        $rendezVous=$request->get('rendezVous');

        $fiche->setName($name);
        $fiche->setSymptome($symptome);
        $fiche->setMedicament($medicament);
        $fiche->setProgres($progres);
        $fiche->setRendezVous("20");
        $fichePatientRepository->save($fiche,true);

        $json = $serializer->serialize($fiche, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        return new JsonResponse($formatted);
    }

    #[Route('/JSON/editfiche', name: 'edit_fiche', methods: ['GET'])]
    public function editfiche(Request $request,FichePatientRepository $fichePatientRepository, EntityManagerInterface $entityManager, SerializerInterface $serializer): JsonResponse
    {
        $fiche=$fichePatientRepository->find($request->get('id'));
        if (!$fiche) {
            $formatted = ['error' => 'Post not found.'];
            return new JsonResponse($formatted);
        }


        $json = $serializer->serialize($fiche, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);
        return new JsonResponse($formatted);
    }

    #[Route('/calendar', name: 'app_calender')]
    public function calender(FichePatientRepository $fichePatientRepository): Response
    {
        return $this->render('calendar/main/indx.html.twig'  );
    }


}
