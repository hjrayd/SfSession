<?php

namespace App\Form;

use App\Entity\Session;
use App\Entity\Trainee;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class TraineeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('surname', TextType::class)
            ->add('firstname', TextType::class)
            ->add('gender', TextType::class)
            ->add('birthDate', DateType::class, [
                'widget' => 'single_text',
            ])
            ->add('city', TextType::class)
            ->add('emailTrainee', TextType::class)
            ->add('phone', TextType::class)
            ->add('adress', TextType::class)
            ->add('zipCode', TextType::class)
            ->add('sessions', EntityType::class, [
                'class' => Session::class,
           
                'multiple' => true,
            ])
            ->add('Valider', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Trainee::class,
        ]);
    }
}
