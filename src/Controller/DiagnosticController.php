<?php

namespace App\Controller;

use App\Entity\Diagnostic;
use App\Entity\Resultat;
use App\Form\DiagnosticType;
use App\Form\ResultatType;
use App\Repository\DiagnosticRepository;
use App\Repository\ResultatRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

#[Route('/diagnostic')]
class DiagnosticController extends AbstractController
{
    #[Route('/', name: 'app_diagnostic_index', methods: ['GET'])]
    public function index(DiagnosticRepository $diagnosticRepository): Response
    {
        return $this->render('diagnostic/index.html.twig', [
            'diagnostics' => $diagnosticRepository->findAll(),
            'symptoms' => $this->getSymptoms(),
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
    public function new(Request $request, DiagnosticRepository $diagnosticRepository,SerializerInterface $serializer, ResultatRepository $resultatRepository): JsonResponse
    {
        $jsonData = $request->getContent();

        // Decode the JSON data into a PHP array
        $formData = json_decode($jsonData,true);



// Extract the form data values
        $overweight = $formData[1]['value'];
        $recentlyInjured = $formData[2]['value'];
        $cholesterol = $formData[3]['value'];
        $hyperTension = $formData[4]['value'];
        $diabetes = $formData[5]['value'];
        $cigarettes = $formData[5]['value'];
        $age = $formData[7]['value'];
        $symptoms = $formData[8]['value'];

        // Create a new Diagnostic entity with the form data
        $diagnostic = new Diagnostic();
        $diagnostic->setOverweight($overweight);
        $diagnostic->setRecentlyInjured($recentlyInjured);
        $diagnostic->setHighCholesterol($cholesterol);
        $diagnostic->setHyperTension($hyperTension);
        $diagnostic->setDiabetes($diabetes);
        $diagnostic->setAge($age);
        $diagnostic->setCigarettes($cigarettes);
        $diagnostic->setSymptoms($symptoms);
        $diagnostic->setDate(  new \DateTime());

        $resultat = new Resultat();
        $resultat = $this->generateResult($diagnostic);

        $diagnosticRepository->save($diagnostic, true);
        $resultatRepository->save($resultat,true);

        $jsonContent = $serializer->serialize($resultat, 'json');

        return new JsonResponse($jsonContent, 200, [], true);
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

        return $this->renderForm('admin/diagnostic/new.html.twig', [
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

        return $this->renderForm('admin/diagnostic/new.html.twig', [
            'diagnostic' => $diagnostic,
            'form' => $form,
        ]);
    }

    #[Route('/admin/{id}/repondre', name: 'app_diagnostic_resultat_admin', methods: ['GET', 'POST'])]
    public function resultat_admin(Request $request, Diagnostic $diagnostic,ResultatRepository $resultatRepository, DiagnosticRepository $diagnosticRepository): Response
    {
        $resultat = new Resultat();
        $form = $this->createForm(ResultatType::class, $resultat);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $resultat->setDiagnostic($diagnostic);
            $resultatRepository->save($resultat, true);

            return $this->redirectToRoute('app_resultat_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/diagnostic/newResult.html.twig', [
            'resultat' => $resultat,
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

    public function generateResult(Diagnostic $diagnostic):Resultat
    {
        $actions =[
            "Changer le régime alimentaire" ,
            "Commencer un traitement médicamenteux" ,
            "Réduire l'exposition au soleil" ,
            "Augmenter l'activité physique" ,
            "Faire des ajustements de sommeil" ,
            "Suivre un programme de réadaptation cardiaque" ,
            "Changer les médicaments"
        ];

        // function to implemnt .....
        // returning an example

        $resultat = new Resultat();
        $resultat->setAction($actions[random_int(0,6)]);
        $resultat->setDiagnostic($diagnostic);
        $resultat->setPossibility(random_int(0,100));
        $resultat->setUrgency('No');
        $resultat->setDoctorNote('Waitin to doctors to respond ...');

        return $resultat;

    }
    public function getSymptoms():array
    {
        return [
        "Absent period",
        "Breast tenderness",
        "Morning sickness",
        "Fatigue",
        "Frequent urination",
        "Food cravings or aversions",
        "Mood swings",
        "Headaches",
        "Constipation",
        "Heartburn",
        "Back pain",
        "Spotting or light bleeding",
        "Darkening of the nipples",
        "Fetal movement",
        "Edema (swelling)",
        "Shortness of breath",
        "High blood pressure",
        "Gestational diabetes",
        "Preeclampsia",
        "Eclampsia",
        "Placenta previa",
        "Premature labor",
        "Miscarriage",
        "Stillbirth"
    ];
    }
}
