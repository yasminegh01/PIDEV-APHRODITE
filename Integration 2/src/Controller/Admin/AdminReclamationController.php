<?php

namespace App\Controller\Admin;

use App\Entity\Reclamation;

use App\Repository\ReclamationRepository;
use App\Repository\ReponseRepository;
use Doctrine\DBAL\Types\TextType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

/**
 * Controller used to manage blog contents in the backend.
 *
 * Please note that the application backend is developed manually for learning
 * purposes. However, in your real Symfony application you should use any of the
 * existing bundles that let you generate ready-to-use backends without effort.
 * See https://symfony.com/bundles
 *
 * @author Ryan Weaver <weaverryan@gmail.com>
 * @author Javier Eguiluz <javier.eguiluz@gmail.com>
 */


#[Route('/admin/reclamation')]
class AdminReclamationController extends AbstractController
{
    #[Route('/', name: 'app_admin_reclamation', methods: ['GET', 'POST'])]
    public function index(Request $request, ReclamationRepository $reclamationRepository): Response
    {
        $reclamations = $reclamationRepository->findAll();


        return $this->render('admin/reclamation/index.html.twig', [
            'reclamations' => $reclamations,

        ]);
    }

    #[Route('/{id}', name: 'app_admin_reclamation_delete', methods: ['POST'])]
    public function delete(Request $request, Reclamation $reclamation, ReclamationRepository $reclamationRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$reclamation->getId(), $request->request->get('_token'))) {
            $reclamationRepository->remove($reclamation, true);
        }

        return $this->redirectToRoute('app_admin_reclamation', [], Response::HTTP_SEE_OTHER);
    }


}
