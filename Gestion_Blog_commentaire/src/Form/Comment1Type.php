<?php

namespace App\Form;

use App\Entity\Comment;
use App\Entity\Post;
use App\Entity\User;
use App\Form\Type\DateTimePickerType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Security\Core\Security;

class Comment1Type extends AbstractType
{

    private Security $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('content')
            // ->add('publishedAt')
            ->add('publishedAt', DateTimePickerType::class, [
                'label' => 'label.published_at',
                'disabled' => true, // This option disables the field and sets the "disabled" HTML attribute
                'attr' => [
                    'readonly' => true, // This attribute makes the field read-only
                ],  
            ])
            ->add('post', EntityType::class, [
                'class' => Post::class,
                'choice_label' => 'title',
            ])
            ->add('author', EntityType::class, [
                'class' => User::class,
                'choice_label' => 'full_name',
                'disabled' => true, // This option disables the field and sets the "disabled" HTML attribute
                'attr' => [
                //'readonly' => true, // This attribute makes the field read-only
                ],  
                
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Comment::class,
        ]);
    }
}
