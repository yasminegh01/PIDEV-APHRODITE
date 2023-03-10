<?php

namespace App\Form;

use App\Entity\Reponse;
use App\Entity\Reclamation;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReponseType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('reponse')
//            ->add('id_reclamation', EntityType::class, [
//                'class' => Reclamation::class,
//                'label' => 'id',
//                'disabled' => true, // This option disables the field and sets the "disabled" HTML attribute
//                'attr' => [
//                    'readonly' => true, // This attribute makes the field read-only
//                ],
//
//            ])


        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reponse::class,
        ]);
    }
}
