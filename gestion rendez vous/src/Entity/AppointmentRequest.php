<?php

namespace App\Entity;

use App\Repository\AppointmentRequestRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AppointmentRequestRepository::class)]
class AppointmentRequest
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 30)]
    #[Assert\NotBlank(message:"name field is required")]
    private ?string $name = null;

    #[ORM\Column(length: 30)]
    #[Assert\NotBlank(message:"last name field is required")]
    private ?string $lastname = null;

    #[ORM\Column(length: 30)]
    private ?string $birth = null;

    #[ORM\Column(length: 30)]
    private ?string $gender = null;

    #[ORM\Column(length: 30)]
    #[Assert\NotBlank(message:"phone field is required")]
    #[Assert\Range(
        min: 8,
        max: 8,
        notInRangeMessage: 'Your phone must be {{ min }}',
    )]
    private ?string $phonenumber = null;
    #[ORM\Column(length: 30)]
    #[Assert\NotBlank(message:"email field is required")]
    private ?string $email = null;

    #[ORM\Column]
    #[Assert\NotBlank(message:" field is required")]
    private ?bool $new_old = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $appointmentprocedure = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    /**
     * @var string A "Y-m-d H:i:s" formatted value
     */
    #[Assert\DateTime]
    #[Assert\NotBlank(message:" field is required")]
    private ?\DateTimeInterface $appointmentdate = null;

    #[ORM\Column(length: 30)]
    #[Assert\NotBlank(message:"field is required")]
    private ?string $type = null;

    #[ORM\Column(length: 50, nullable: true)]
    #[Assert\NotBlank(message:"field is required")]
    private ?string $lien = null;

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

    public function getBirth(): ?string
    {
        return $this->birth;
    }

    public function setBirth(string $birth): self
    {
        $this->birth = $birth;

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

    public function isNewOld(): ?bool
    {
        return $this->new_old;
    }

    public function setNewOld(bool $new_old): self
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

    public function getLien(): ?string
    {
        return $this->lien;
    }

    public function setLien(?string $lien): self
    {
        $this->lien = $lien;

        return $this;
    }
}
