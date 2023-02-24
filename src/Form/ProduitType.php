<?php

namespace App\Form;

use App\Entity\Produit;
use App\Entity\Promotion;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;

class ProduitType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom',TextType::class,[
                'constraints'=>[
                    new NotBlank(['message'=>'ce champ doit etre non vide']),
                    new Regex([
                        'pattern'=>'/^[a-zA-Z]+$/',
                        'message'=>'le nom doit etre des lettre seulement'
                    ])
                ]
            ])
            ->add('quantite',NumberType::class,[
                'constraints'=>[
                                        new NotBlank(['message'=>'ce champ doit etre non vide']),

                    new Length([
                        'max'=>3
                    ])
                ]
            ])
            ->add('prix',NumberType::class,[
                'constraints'=>[
                                        new NotBlank(['message'=>'ce champ doit etre non vide']),

                    new Length([
                        'max'=>3
                    ])
                ]
            ])
            ->add('categorie',ChoiceType::class, [
                'choices'  => [
                    'medicament bio' => 'medicament bio',
                    'vitamins' => 'vitamins' ,
                    'vetements' => 'vetements',
                ],
            ])
            ->add('description',TextType::class,[
                'constraints'=>[
                                        new NotBlank(['message'=>'ce champ doit etre non vide']),

                ]
            ])
            ->add('promo',EntityType::class, [
                // looks for choices from this entity
                'class' => Promotion::class,
            
                // uses the User.username property as the visible option string
                'choice_label' => 'pourcentage',
            
                // used to render a select box, check boxes or radios
                // 'multiple' => true,
                // 'expanded' => true,
            ])
            ->add('image',TextType::class,[
                'constraints'=>[
                                        new NotBlank(['message'=>'ce champ doit etre non vide']),

                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Produit::class,
        ]);
    }
}
