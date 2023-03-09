<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Form;

use App\Entity\Post;
use App\Entity\Tag;
use App\Form\Type\DateTimePickerType;
use App\Form\Type\TagsInputType;
// use App\Form\RatingType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\String\Slugger\SluggerInterface;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
/**
 * Defines the form used to create and manipulate blog posts.
 *
 * @author Ryan Weaver <weaverryan@gmail.com>
 * @author Javier Eguiluz <javier.eguiluz@gmail.com>
 * @author Yonel Ceruto <yonelceruto@gmail.com>
 */
class PostType extends AbstractType
{
    // Form types are services, so you can inject other services in them if needed

    // public function __construct(
    //     private SluggerInterface $slugger
    // ) {
    // }

    private $entityManager;

    public function __construct(private SluggerInterface $slugger,EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
        
    }

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        // For the full reference of options defined by each form field type
        // see https://symfony.com/doc/current/reference/forms/types.html

        // By default, form fields include the 'required' attribute, which enables
        // the client-side form validation. This means that you can't test the
        // server-side validation errors from the browser. To temporarily disable
        // this validation, set the 'required' attribute to 'false':
        // $builder->add('title', null, ['required' => false, ...]);
        $tags = $this->entityManager->getRepository(Tag::class)->findAll();

        $tagChoices = [];
        foreach ($tags as $tag) {
            $tagChoices[$tag->getName()] = $tag->getId();
        }
        $builder
            ->add('title', null, [
                'attr' => ['autofocus' => true],
                'label' => 'label.title',
            ])
            ->add('summary', TextareaType::class, [
                // 'help' => 'help.post_summary',
                'label' => 'label.summary',
            ])
            ->add('content', CKEditorType::class, [
                'attr' => ['rows' => 20],
                'help' => 'help.post_content',
                'label' => 'label.content',
            ])
            ->add('publishedAt', DateTimePickerType::class, [
                'label' => 'label.published_at',
                'disabled' => true, // This option disables the field and sets the "disabled" HTML attribute
                'attr' => [
                    'readonly' => true, // This attribute makes the field read-only
                ],  
            ])
            // ->add('tags', TagsInputType::class, [
            //     'label' => 'label.tags',
            //     'expanded' => true,
            //     'multiple' => true,
            //     'choices' => $tagChoices,
            // ])
            ->add('tags', TagsInputType::class, [
                'label' => 'label.tags',
                'required' => false,
            ])

            // ->add('rating', RatingType::class, [
            //     'label' => 'Rating',
            //     'required' => false,
            // ])


            // form events let you modify information or fields at different steps
            // of the form handling process.
            // See https://symfony.com/doc/current/form/events.html
            ->addEventListener(FormEvents::SUBMIT, function (FormEvent $event) {
                /** @var Post */
                $post = $event->getData();
                if (null === $post->getSlug() && null !== $post->getTitle()) {
                    $post->setSlug($this->slugger->slug($post->getTitle())->lower());
                }
            })
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Post::class,
        ]);
    }
}
