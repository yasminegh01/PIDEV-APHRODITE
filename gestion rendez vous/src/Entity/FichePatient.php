<?php

namespace App\Entity;

use App\Repository\FichePatientRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FichePatientRepository::class)]
class FichePatient
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 30)]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $symptome = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $medicament = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $progres = null;

    #[ORM\OneToOne(cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
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
