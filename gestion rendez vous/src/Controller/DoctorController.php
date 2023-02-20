<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
class DoctorController extends AbstractController
{
    #[Route('/form', name: 'app_doctor')]
    public function index(): Response
    {
        return $this->render('admin/appointment_resquest/form.html.twig', [
            'controller_name' => 'DoctorController',
        ]);
    }
}
