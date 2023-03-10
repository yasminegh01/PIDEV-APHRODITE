<?php

namespace App\Form;

use App\Entity\AppointmentRequest;
use Symfony\Component\Form\AbstractType;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use App\Entity\Comment;
use App\Entity\Post;
use App\Form\Type\DateTimePickerType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Security\Core\Security;
class AppointmentRequestType extends AbstractType
{
    private Security $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('lastname')
            ->add('birthday',DateType::class,['widget' => 'single_text','label'=>'Date of Birth','empty_data' => ''])
            ->add('gender',choiceType::class,array('placeholder'=>'-SELECT-',
                'empty_data' => null,
                'choices'=>array(
                    'Male'=>'Male',
                    'Female'=>'Female'
                )))
            ->add('phonenumber',TelType::class,['label' => 'Phone Number'])
            ->add('email',EmailType::class)
            ->add('new_old',choiceType::class,
                [
                    'label' => 'Have you ever applied to our facility before?',
                    'choices'=>[
                        'yes'=>'yes',
                        'no'=>'no',
                        'I don t know'=>'I dunno'
                    ],
                    'expanded'=>true
                ])
            ->add('appointmentprocedure',choiceType::class,array(
                'label' => 'Which procedure do you want to make an appointment for?',
                'placeholder'=>'-SELECT-',
                'empty_data' => null,
                'choices'=>array(
                    'Check-up'=>'Check-up',
                    'Result Analysis'=>'Result Analysis',
                    'Doctor Check'=>'Doctor Check',
                    'Medical Examination'=>'Medical Examination'
                )
            ))
            ->add('appointmentdate',DateType::class,['widget' => 'single_text','label' =>'Preferred Appointment Date'])
            ->add('appointmentime')
//            ->add('appointmentime', TimeType::class, [
//                'widget' => 'choice',
//                'input' => 'string',
//                'minutes' => range(0, 59, 30),
//                'required' => true,
//                'constraints' => [
//                    new NotBlank(),
//                ],
//            ])
            ->add('type',choiceType::class,array(
                'placeholder'=>'-SELECT-',
                'empty_data' => null,
                'choices'=>array(
                    'online'=>'online',
                    'cabinet'=>'cabinet'

                )
            ))
            ->add('lien')
            ->add('id_patient', EntityType::class, [
                'class' => User::class,
                'choice_label' => 'id',
                'disabled' => true, // This option disables the field and sets the "disabled" HTML attribute
                'attr' => [
                //'readonly' => true, // This attribute makes the field read-only
                ],  
                
            ])
        ;
    }

    private function getAvailableTimes()
    {
        $startTime = strtotime('09:00');
        $endTime = strtotime('17:00');
        $interval = 1800; // 30 minutes in seconds
        $times = [];

        while ($startTime <= $endTime) {
            $time = date('H:i', $startTime);
            $times[$time] = date('h:i A', $startTime);
            $startTime += $interval;
        }

        return $times;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => AppointmentRequest::class,
        ]);
    }
}
