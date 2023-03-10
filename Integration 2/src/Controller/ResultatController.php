<?php

namespace App\Controller;

use App\Entity\Diagnostic;
use App\Entity\Resultat;
use App\Form\ResultatType;
use App\Repository\DiagnosticRepository;
use App\Repository\ResultatRepository;
use Dompdf\Dompdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;
use Dompdf\Domdpf;
use Dompdf\Options;
use Knp\Snappy\Pdf;

#[Route('/resultat')]
class ResultatController extends AbstractController
{
    #[Route('/admin', name: 'app_resultat_index', methods: ['GET', 'POST'])]
    public function index(ResultatRepository $resultatRepository, Request $request): Response
    {

        $searchTerm = $request->request->get('searchTerm');
        $sortField = $request->request->get('sortField');
        $sortOrder = $request->request->get('sortOrder');

        $reultat = $resultatRepository->searchSort($searchTerm, $sortField, $sortOrder);

        return $this->render('admin/diagnostic/resultats.html.twig', [
            'resultats' => $reultat,
            'searchTerm' => $searchTerm,
            'sortField' => $sortField,
            'sortOrder' => $sortOrder,
        ]);

        /*  return $this->render('admin/diagnostic/resultats.html.twig', [
              'resultats' => $resultatRepository->findAll(),
          ]);
        */
    }

    #[Route('/new', name: 'app_resultat_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ResultatRepository $resultatRepository): Response
    {
        $resultat = new Resultat();
        $form = $this->createForm(ResultatType::class, $resultat);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $resultatRepository->save($resultat, true);

            return $this->redirectToRoute('app_resultat_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('resultat/new.html.twig', [
            'resultat' => $resultat,
            'form' => $form,
        ]);
    }

    // ******************************** ajout JSON
    #[Route('/JSON/new', name: 'app_resultat_new_JSON', methods: ['GET', 'POST'])]
    public function ajouterResultatAction(Request $request, ResultatRepository $resultatRepository): JsonResponse
    {
        $resultat = new Resultat();

        $action = $request->get('action');
        $possibility = $request->get('possibility');
        $doctorNote = $request->get('doctorNote');
        $urgency = $request->get('urgency');


        $resultat->setAction($action);
        $resultat->setPossibility($possibility);
        $resultat->setDoctorNote($doctorNote);
        $resultat->setUrgency($urgency);

        $resultatRepository->save($resultat, true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($resultat, 'json', [
            AbstractNormalizer::IGNORED_ATTRIBUTES => ['diagnostic'],
        ]);

        return new JsonResponse($formatted);
    }

    // ************* modifier JSON

    #[Route('/JSON/edit', name: 'app_resultat_json_edit', methods: ['GET'])]
    public function modifierResultatAction(Request $request, ResultatRepository $resultatRepository): JsonResponse
    {
        $resultat = $resultatRepository->find($request->get('id'));

        if (!$resultat) {
            $formatted = ['error' => 'Resultat not found.'];
            return new JsonResponse($formatted);
        }

        // Update the resultat properties with data from the request
        $action = $request->get('action');
        $possibility = $request->get('possibility');
        $doctorNote = $request->get('doctorNote');
        $urgency = $request->get('urgency');

        // Update the resultat properties with the new values
        $resultat->setAction($action);
        $resultat->setPossibility($possibility);
        $resultat->setDoctorNote($doctorNote);
        $resultat->setUrgency($urgency);

        $resultatRepository->save($resultat, true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($resultat, 'json', [
            AbstractNormalizer::IGNORED_ATTRIBUTES => ['diagnostic'],
        ]);

        return new JsonResponse($formatted);
    }


    #[Route('/{id}', name: 'app_resultat_show', methods: ['GET'])]
    public function show(Resultat $resultat): Response
    {
        return $this->render('resultat/show.html.twig', [
            'resultat' => $resultat,
        ]);
    }


    #[Route('/{id}/edit', name: 'app_resultat_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Resultat $resultat, ResultatRepository $resultatRepository): Response
    {
        $form = $this->createForm(ResultatType::class, $resultat);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $resultatRepository->save($resultat, true);

            return $this->redirectToRoute('app_resultat_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/diagnostic/editResultat.html.twig', [
            'resultat' => $resultat,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_resultat_delete', methods: ['POST'])]
    public function delete(Request $request, Resultat $resultat, ResultatRepository $resultatRepository): Response
    {
        $resultatRepository->remove($resultat, true);


        return $this->redirectToRoute('app_resultat_index', [], Response::HTTP_SEE_OTHER);
    }

    // **************** affichage JSON
    #[Route('/JSON/getAll', name: 'app_diagnostic_JSON', methods: ['GET'])]
    public function getAllResultatAction(SerializerInterface $serializer, ResultatRepository $resultatRepository)
    {
        $resultat = $resultatRepository->findAll();
        $json = $serializer->serialize($resultat, 'json', [
            AbstractNormalizer::IGNORED_ATTRIBUTES => ['diagnostic'],
        ]);

        return new JsonResponse($json, 200, [], true);
    }

// ******************** JSON supprimer
    #[Route('/JSON/delete', name: 'app_resultat_delete', methods: ['GET'])]
    public function deleteDiagnosticAction(Request $request, ResultatRepository $resultatRepository)
    {
        $id = $request->get("id");

        $resultat = $resultatRepository->find($id);

        if ($resultat != null) {
            $resultatRepository->remove($resultat, true);

            $serializer = new Serializer([new ObjectNormalizer()]);
            $formatted = $serializer->normalize("Resultat has been deleted successfully.");
            return new JsonResponse($formatted);
        }

        $formatted = ["error" => "Invalid resultat ID."];
        return new JsonResponse($formatted);
    }


    /**
     * @Route ("/Imprimer/{id}" ,name="imp")
     */

    public function pdf($id, ResultatRepository $resultatRepository)
    {
        // Configure Dompdf according to your needs
        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');

        // Instantiate Dompdf with our options
        $dompdf = new Dompdf($pdfOptions);
        $resultat = $resultatRepository->find($id);

        $html = $this->renderView('admin/diagnostic/imp_pdf.html.twig',
            ['resultat' => $resultat
            ]);
        // Load HTML to Dompdf
        $dompdf->loadHtml($html);

        // (Optional) Setup the paper size and orientation 'portrait' or 'portrait'
        $dompdf->setPaper('A4', 'portrait');


        // Render the HTML as PDF
        $dompdf->render();
        $pdfFilePath = 'C:\Users\gheri\OneDrive\Bureau\PiDev';
       // readfile('https://symfony.com/installer');
        file_put_contents($pdfFilePath, $dompdf->output());
        $response = new Response(file_get_contents($pdfFilePath));
        $response->headers->set('Content-Type', 'application/pdf');
        $response->headers->set('Content-Disposition', 'attachment; filename="document.pdf"');
        return $response;


}

}
