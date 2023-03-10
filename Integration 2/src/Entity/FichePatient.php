<?php

namespace App\Entity;

use App\Repository\FichePatientRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Ignore;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: FichePatientRepository::class)]
class FichePatient
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Ignore]
    private ?int $id = null;

    #[ORM\Column(length: 30)]
    #[Assert\NotBlank(message:"name field is required")]
    #[Assert\Length(min: 5,max: 30,minMessage: "minumuim 5 caracter",maxMessage:"max 30 caracter" )]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Assert\NotBlank(message:"symptome field is required")]
    #[Assert\Length(min: 5,max: 255,minMessage: "minumuim 5 caracter",maxMessage:"max 30 caracter")]
    private ?string $symptome = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Assert\NotBlank(message:"medicament field is required")]
    #[Assert\Length(min: 5,max: 255,minMessage: "minumuim 5 caracter",maxMessage:"max 255 caracter")]
    private ?string $medicament = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Assert\NotBlank(message:"progres field is required")]
    #[Assert\Length(min:10,max: 500,minMessage: "minumuim 5 caracter",maxMessage:"max 500 caracter")]
    private ?string $progres = null;

    #[ORM\OneToOne(cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    #[Ignore]
    private ?AppointmentRequest $rendezVous = null;

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

    public function getSymptome(): ?string
    {
        return $this->symptome;
    }

    public function setSymptome(string $symptome): self
    {
        $this->symptome = $symptome;

        return $this;
    }

    public function getMedicament(): ?string
    {
        return $this->medicament;
    }

    public function setMedicament(string $medicament): self
    {
        $this->medicament = $medicament;

        return $this;
    }

    public function getProgres(): ?string
    {
        return $this->progres;
    }

    public function setProgres(string $progres): self
    {
        $this->progres = $progres;

        return $this;
    }

    public function getRendezVous(): ?AppointmentRequest
    {
        return $this->rendezVous;
    }

    public function setRendezVous(AppointmentRequest $rendezVous): self
    {
        $this->rendezVous = $rendezVous;

        return $this;
    }
}
