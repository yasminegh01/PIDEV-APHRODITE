<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BaseController extends AbstractController
{
    #[Route('/', name: 'app_base')]
    public function index(): Response
    {
        return $this->render('html/index.html.twig', [
            'controller_name' => 'BaseController',
        ]);
    }
    #[Route('/admin', name: 'app_admin')]
    public function indexadmine(): Response
    {
        return $this->render('aside.html.twig', [
            'controller_name' => 'BaseController',
        ]);
    }
}
