<?php

namespace App\Form;

use App\Entity\Diagnostic;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\RangeType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class DiagnosticType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('age')
            ->add('overweight',ChoiceType::class,
                [
                    'choices' => [
                        'Yes' => 'yes',
                        'No' => 'no',
                        'I don t know '=> 'I dunno',

                    ],
                    'expanded' => true
                ])
            ->add('cigarettes',ChoiceType::class, [
                'choices' => [
                    'Yes' => 'yes',
                    'No' => 'no',
                    'I don t know '=> 'I dunno',

                ],
                'expanded' => true
            ])
            ->add('recentlyInjured',ChoiceType::class,
                [
                    'choices' => [
                        'Yes' => 'yes',
                        'No' => 'no',
                        'I don t know '=> 'I dunno',

                    ],
                    'expanded' => true
                ])
            ->add('highCholesterol',ChoiceType::class, [
                'choices' => [
                    'Yes' => 'yes',
                    'No' => 'no',
                    'I don t know '=> 'I dunno',

                ],
                'expanded' => true
            ])
            ->add('hyperTension',ChoiceType::class, [
                'choices' => [
                    'Yes' => 'yes',
                    'No' => 'no',
                    'I don t know '=> 'I dunno',

                ],
                'expanded' => true
            ])
            ->add('diabetes',ChoiceType::class, [
                'choices' => [
                    'Yes' => 'yes',
                    'No' => 'no',
                    'I don t know '=> 'I dunno',

                ],
                'expanded' => true
            ])
            ->add('symptoms')
           # ->add('date')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Diagnostic::class,
        ]);
    }
}
