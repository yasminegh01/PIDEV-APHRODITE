<?php

namespace App\Entity;

use App\Repository\AppointmentRequestRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Serializer\Annotation\Ignore;

#[ORM\Entity(repositoryClass: AppointmentRequestRepository::class)]
class AppointmentRequest
{
    
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]

    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"Name field is required")]
    #[Assert\Length(min: 5,minMessage: "minumuim 5 caracter")]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"Last Name field is required")]
    private ?string $lastname = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $birthday = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"Gender field is required")]
    private ?string $gender = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:'The value {{ value }} is not valid.')]
    private ?string $phonenumber = null;

    #[ORM\Column(length: 255)]
    #[Assert\Email(
        message: 'The email {{ value }} is not a valid email.',
    )]
    private ?string $email = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"field is required")]
    private ?string $new_old = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"field is required")]
    private ?string $appointmentprocedure = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]

    private ?\DateTimeInterface $appointmentdate = null;

    #[ORM\Column(length: 255)]
    private ?string $type = null;

    #[ORM\Column(length: 255)]
    private ?string $lien = null;
/** @Ignore() */
    #[ORM\Column(type: Types::TIME_MUTABLE)]
    private ?\DateTimeInterface $appointmentime = null;
/** @Ignore() */
    #[ORM\ManyToOne(inversedBy: 'appointmentRequests')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $id_patient = null;

    #[ORM\Column(length: 10)]
    private ?string $status = 'pending';



    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }
/** @Ignore() */
    public function getBirthday(): ?\DateTimeInterface
    {
        return $this->birthday;
    }

    public function setBirthday(\DateTimeInterface $birthday): self
    {
        $this->birthday = $birthday;

        return $this;
    }

    public function getGender(): ?string
    {
        return $this->gender;
    }

    public function setGender(string $gender): self
    {
        $this->gender = $gender;

        return $this;
    }

    public function getPhonenumber(): ?string
    {
        return $this->phonenumber;
    }

    public function setPhonenumber(string $phonenumber): self
    {
        $this->phonenumber = $phonenumber;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }
/** @Ignore() */
    public function getNewOld(): ?string
    {
        return $this->new_old;
    }

    public function setNewOld(string $new_old): self
    {
        $this->new_old = $new_old;

        return $this;
    }

    public function getAppointmentprocedure(): ?string
    {
        return $this->appointmentprocedure;
    }

    public function setAppointmentprocedure(string $appointmentprocedure): self
    {
        $this->appointmentprocedure = $appointmentprocedure;

        return $this;
    }
/** @Ignore() */
    public function getAppointmentdate(): ?\DateTimeInterface
    {
        return $this->appointmentdate;
    }

    public function setAppointmentdate(\DateTimeInterface $appointmentdate): self
    {
        $this->appointmentdate = $appointmentdate;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }
/** @Ignore() */
    public function getLien(): ?string
    {
        return $this->lien;
    }

    public function setLien(string $lien): self
    {
        $this->lien = $lien;

        return $this;
    }

    public function getAppointmentime(): ?\DateTimeInterface
    {
        return $this->appointmentime;
    }

    public function setAppointmentime(\DateTimeInterface $appointmentime): self
    {
        $this->appointmentime = $appointmentime;

        return $this;
    }
/** @Ignore() */
    public function getIdPatient(): ?User
    {
        return $this->id_patient;
    }

    public function setIdPatient(?User $id_patient): self
    {
        $this->id_patient = $id_patient;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(string $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function __toString()
    {
        return(string)$this->getIdPatient();
    }


}
