<?php

namespace App\Form;

use App\Entity\AppointmentRequest;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AppointmentRequestType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('lastname')
            ->add('birth')
            ->add('gender')
            ->add('phonenumber')
            ->add('email')
            ->add('new_old')
            ->add('appointmentprocedure')
            ->add('appointmentdate')
            ->add('type')
            ->add('lien')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => AppointmentRequest::class,
        ]);
    }
}
