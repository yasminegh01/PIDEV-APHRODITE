<?php

namespace App\Controller;

use App\Form\ContactType;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{

     #[Route("/contact", name:"app_contact")]

    public function index(Request $request, MailerInterface $mailer):Response
    {
        $form = $this->createForm(ContactType::class);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) {
            $this->addFlash('notice', 'Hello world');
            $data = $form->getData();
            $adress=$data['email'];
            $contenu=$data['message'];
            $email = (new Email())
                ->from($adress)
                ->to('admin@admin.com')
                ->subject('Demande de contact')
                ->text($contenu)
//                ->html('<p>See Twig integration for better HTML integration!</p>')

            ;

            $this->addFlash('success','Votre message a été envoyé avec succes !');
            $mailer->send($email);
            {}


            return $this->redirectToRoute('app_base');
        }
        return $this->renderForm('contact/index.html.twig', [
            'controller_name' => 'ContactController',
            'form' => $form
        ]);
    }
}