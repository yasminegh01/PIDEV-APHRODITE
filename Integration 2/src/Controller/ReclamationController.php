<?php

namespace App\Controller;

use App\Entity\Reclamation;
use App\Entity\User;
use App\Form\ReclamationType;
use App\Repository\ReclamationRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;



#[Route('/reclamation')]
class ReclamationController extends AbstractController
{
    #[Route('/', name: 'app_reclamation_index', methods: ['GET'])]
    public function index(ReclamationRepository $reclamationRepository, Security $security): Response
    {
        $user = $security->getUser();

        return $this->render('reclamation/index.html.twig', [
            'reclamations' => $reclamationRepository->findBy(['idPatient' => $user]),
        ]);
    }

    #[Route('/api/displayReclamation', name: 'display_reclamation', methods: ['GET'])]
    public function displayReclamation(ReclamationRepository $reclamationRepository, Security $security,SerializerInterface $serializer): Response
    {

        $reclamation = $reclamationRepository->findAll();
        $json = $serializer->serialize($reclamation, 'json', ['groups' => ['reclamation']]);
//        dump($json);
//        die;
//        return new JsonResponse(json_decode($json));
         return new JsonResponse($json, 200, [], true);
    }


    #[Route('/new', name: 'app_reclamation_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ReclamationRepository $reclamationRepository): Response
    {
        $reclamation = new Reclamation();
        $user = $this->getUser();
        $reclamation->setIdPatient($user);


        $form = $this->createForm(ReclamationType::class, $reclamation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $reclamationRepository->save($reclamation, true);

            return $this->redirectToRoute('app_reclamation_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('reclamation/new.html.twig', [
            'reclamation' => $reclamation,
            'form' => $form,
        ]);
    }


    #[Route('/api/newReclamation', name: 'new_reclamation', methods: ['GET', 'POST'])]
    public function newReclamation(ReclamationRepository $reclamationRepository,EntityManagerInterface $entityManager, Request $request,SerializerInterface $serializer, Security $security): JsonResponse
    {
        $reclamation = new Reclamation();

        $idPatient = $request->get('idPatient');
        // echo ($author);
        $idPatient = $entityManager->getRepository(User::class)->find($idPatient);
        // echo ($author);

        $titre = $request->get('titre');
        $message = $request->get('message');
//        $user = $security->getUser();
//
        $reclamation->setMessage($message);
        $reclamation->setTitre($titre);
        $reclamation->setIdPatient($idPatient);
        $entityManager->persist($reclamation);
        $entityManager->flush();


        $json = $serializer->serialize($reclamation, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['reclamation']]);
        $formatted = $serializer->normalize($reclamation);
        return new JsonResponse($formatted);
//        $reclamation->setIdPatient($user);
//
//        $reclamationRepository->save($reclamation,true);
//        $reclamation = $reclamationRepository->find($reclamation->getId());
//
//        $json = $serializer->serialize($reclamation, 'json');
//        $formatted = $serializer->serialize($json, 'json', ['groups' => ['reclamation']]);
//
//        return new JsonResponse($formatted, 201, [], true);




//        $content = $request->getContent();
//        $reclamation = $serializer->deserialize($content, Reclamation::class, 'json');
//
//        $user = $this->getUser();
//        $reclamation->setIdPatient($user);
//
//        $reclamationRepository->save($reclamation);
//
//        return $this->json($reclamation, 201, [], ['groups' => ['reclamation']]);


    }

    #[Route('/{id}/edit', name: 'app_reclamation_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Reclamation $reclamation, ReclamationRepository $reclamationRepository): Response
    {
        $form = $this->createForm(ReclamationType::class, $reclamation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $reclamationRepository->save($reclamation, true);

            return $this->redirectToRoute('app_reclamation_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('reclamation/edit.html.twig', [
            'reclamation' => $reclamation,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_reclamation_delete', methods: ['POST'])]
    public function delete(Request $request, Reclamation $reclamation, ReclamationRepository $reclamationRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$reclamation->getId(), $request->request->get('_token'))) {
            $reclamationRepository->remove($reclamation, true);
        }

        return $this->redirectToRoute('app_reclamation_index', [], Response::HTTP_SEE_OTHER);
    }
}
