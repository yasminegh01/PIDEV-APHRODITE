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
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;
use Twilio\Rest\Client;
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

 /*   #[Route('/admin/sort', name: 'app_diagnostic_index_admin', methods: ['GET'])]
    public function index_admin(Request $request,DiagnosticRepository $diagnosticRepository): Response
    {

        $searchTerm = $request->request->get('searchTerm');
        $sortField = $request->request->get('sortField');
        $sortOrder = $request->request->get('sortOrder');

        $diagnostic = $diagnosticRepository->searchSort($searchTerm, $sortField, $sortOrder);

        return $this->render('admin/diagnostic/diagnostic.html.twig', [
            'diagnostics' => $diagnostic,
            'searchTerm' => $searchTerm ,
            'sortField' => $sortField,
            'sortOrder' => $sortOrder,
        ]);
       /* return $this->render('admin/diagnostic/diagnostic.html.twig', [
            'diagnostics' => $diagnosticRepository->findAll(),
        ]);
  }*/



     #[Route('/admin', name: 'app_diagnostic_admin_search_sort', methods: ['POST','GET'])]
    public function searchSortBack(Request $request, DiagnosticRepository $diagnosticRepository): Response
    {
        $searchTerm = $request->request->get('searchTerm');
        $sortField = $request->request->get('sortField');
        $sortOrder = $request->request->get('sortOrder');

        $diagnostic = $diagnosticRepository->searchSort($searchTerm, $sortField, $sortOrder);

        return $this->render('admin/diagnostic/diagnostic.html.twig', [
            'diagnostics' => $diagnostic,
            'searchTerm' => $searchTerm ,
            'sortField' => $sortField,
            'sortOrder' => $sortOrder,
        ]);
        /* return $this->render('admin/diagnostic/diagnostic.html.twig', [
         'diagnostics' => $diagnosticRepository->findAll(),
     ]);
}*/
    }

// Define a controller action that handles the button click
    #[Route('/', name: 'handle_call', methods: ['POST','GET'])]

   /*public function handle_call(): Response
    {
        // Twilio account SID and auth token
        $sid = 'AC3851c53ef419c26d52f4dbf13660e77f';
        $token = '67fbfb5938f7bd6b749ecc19b22844c3';

        // Initialize the Twilio REST client with your account SID and auth token
        $twilio = new Client($sid, $token);

        // Phone number to dial
        $to = ' +216 52 515 038 '; // Replace XXXX with the remaining digits of the phone number you want to call

        // Twilio phone number to use as the caller ID
        $from = '+15073997751';

        // URL of the TwiML document that instructs Twilio how to handle the call
        $twimlUrl = 'https://api.twilio.com/2010-04-01/Accounts/AC3851c53ef419c26d52f4dbf13660e77f/Calls.json';

        // Initiate a phone call using the Twilio REST API
        $call = $twilio->calls->create(
            $to,
            $from,
            array(
                'url' => $twimlUrl
            )
        );

        // Return a response object indicating that the call was initiated
        return new Response('Call initiated! Call SID: ' . $call->sid);
    }
*/

    /**
     * @Route("/sort", name="app_diagnostic_sort", methods={"GET"})
     */
    public function sort(Request $request, DiagnosticRepository $diagnosticRepository): Response
    {
        // Get sorting parameters from query string
        $sortBy = $request->query->get('sortBy', 'id');
        $sortOrder = $request->query->get('sortOrder', 'asc');

        // Get search parameter from query string
        $searchTerm = $request->query->get('search', '');

        // Get diagnostics using repository
        $diagnostics = $diagnosticRepository->findBySearchTerm($searchTerm, $sortBy, $sortOrder);

        return $this->render('admin/diagnostic/diagnostic.html.twig', [
            'diagnostics' => $diagnostics,
            'sortBy' => $sortBy,
            'sortOrder' => $sortOrder,
            'searchTerm' => $searchTerm
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


    // ********************************    ajout JSON
    #[Route('/JSON/new', name: 'app_diagnostic_new_JSON', methods: ['GET', 'POST'])]
    public function ajouterDiagnosticAction(Request $request,DiagnosticRepository $diagnosticRepository): JsonResponse
    {
        $diagnostic = new Diagnostic();

        $age = $request->get('age');
        $overweight = $request->get('overweight');
        $cigarettes = $request->get('cigarettes');
        $recentlyInjured = $request->get('recentlyInjured');
        $highCholesterol = $request->get('highCholesterol');
        $hyperTension = $request->get('hyperTension');
        $diabetes = $request->get('diabetes');
        $symptoms = $request->get('symptoms');


        $date = new \DateTime('now');

        $diagnostic->setAge($age);
        $diagnostic->setOverweight($overweight);
        $diagnostic->setCigarettes($cigarettes);
        $diagnostic->setRecentlyInjured($recentlyInjured);
        $diagnostic->setHighCholesterol($highCholesterol);
        $diagnostic->setHyperTension($hyperTension);
        $diagnostic->setDiabetes($diabetes);
        $diagnostic->setDate($date);
        $diagnostic->setSymptoms($symptoms);

        $diagnosticRepository->save($diagnostic,true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($diagnostic);
        return new JsonResponse($formatted);
    }


    #[Route('/{id}', name: 'app_diagnostic_show', methods: ['GET'])]
    public function show(Diagnostic $diagnostic): Response
    {
        return $this->render('diagnostic/show.html.twig', [
            'diagnostic' => $diagnostic,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_diagnostic_edit', methods: ['GET', 'POST']  )]
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



    // ************* modifier JSON
    #[Route('/JSON/jsonedit', name: 'app_diagnostic_edit_json', methods: ['GET'])]
    public function modifierDiagnosticAction(Request $request,DiagnosticRepository $diagnosticRepository): JsonResponse
    {
        $diagnostic = $diagnosticRepository->find($request->get('id'));

        if (!$diagnostic) {
            $formatted = ['error' => 'Diagnostic not found.'];
            return new JsonResponse($formatted);
        }

        // Update the diagnostic properties with data from the request
        $age = $request->get('age');
        $overweight = $request->get('overweight');
        $cigarettes = $request->get('cigarettes');
        $recentlyInjured = $request->get('recentlyInjured');
        $highCholesterol = $request->get('highCholesterol');
        $hyperTension = $request->get('hyperTension');
        $diabetes = $request->get('diabetes');
        $symptoms = $request->get('symptoms');

        // Update the diagnostic properties with the new values
        $diagnostic->setAge($age);
        $diagnostic->setOverweight($overweight);
        $diagnostic->setCigarettes($cigarettes);
        $diagnostic->setRecentlyInjured($recentlyInjured);
        $diagnostic->setHighCholesterol($highCholesterol);
        $diagnostic->setHyperTension($hyperTension);
        $diagnostic->setDiabetes($diabetes);
        $diagnostic->setSymptoms($symptoms);

        $diagnosticRepository->save($diagnostic, true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($diagnostic);

        return new JsonResponse($formatted);
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

    // ******************** JSON supprimer
    #[Route('/JSON/delete', name: 'app_diagnostic_delete', methods: ['GET'])]
    public function deleteDiagnosticAction(Request $request , DiagnosticRepository $diagnosticRepository) {
        $id = $request->get("id");

        $diagnostic = $diagnosticRepository->find($id);

        if($diagnostic != null) {
            $diagnosticRepository->remove($diagnostic,true);

            $serializer = new Serializer([new ObjectNormalizer()]);
            $formatted = $serializer->normalize("Diagnostic has been deleted successfully.");
            return new JsonResponse($formatted);
        }

        $formatted = ["error" => "Invalid diagnostic ID."];
        return new JsonResponse($formatted);
    }


    #[Route('/admin/{id}', name: 'app_diagnostic_delete_admin', methods: ['POST'])]
    public function delete_admin(Request $request, Diagnostic $diagnostic, DiagnosticRepository $diagnosticRepository): Response
    {
        $diagnosticRepository->remove($diagnostic, true);


        return $this->redirectToRoute('app_diagnostic_index_admin', [], Response::HTTP_SEE_OTHER);
    }


    // **************** affichage JSON
    #[Route('/JSON/getAll', name: 'app_diagnostic_JSON', methods: ['GET'])]
    public function getAllDiagnosticsAction(SerializerInterface $serializer, DiagnosticRepository $diagnosticRepository)
    {
        $diagnostics = $diagnosticRepository->findAll();
        $json = $serializer->serialize($diagnostics, 'json', [
            AbstractNormalizer::IGNORED_ATTRIBUTES => ['resultat'],
        ]);

        return new JsonResponse($json, 200, [], true);
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