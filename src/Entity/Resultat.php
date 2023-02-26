<?php

namespace App\Entity;

use App\Repository\ResultatRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;


#[ORM\Entity(repositoryClass: ResultatRepository::class)]
class Resultat
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message: 'action requise')]
    private ?string $action = null;

    #[ORM\Column]
    #[Assert\NotBlank(message:"Possibility field is required")]
    #[Assert\Range(min: 0,max: 100)]
    private ?int $possibility = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"doctor note field is required")]
    private ?string $doctorNote = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"urgency field is required")]
    private ?string $urgency = null;

    #[ORM\OneToOne(inversedBy: 'resultat', cascade: ['persist', 'remove'])]
    private ?Diagnostic $diagnostic = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAction(): ?string
    {
        return $this->action;
    }

    public function setAction(?string $action): self
    {
        $this->action = $action;

        return $this;
    }

    public function getPossibility(): ?int
    {
        return $this->possibility;
    }

    public function setPossibility(int $possibility): self
    {
        $this->possibility = $possibility;

        return $this;
    }

    public function getDoctorNote(): ?string
    {
        return $this->doctorNote;
    }

    public function setDoctorNote(?string $doctorNote): self
    {
        $this->doctorNote = $doctorNote;

        return $this;
    }

    public function getUrgency(): ?string
    {
        return $this->urgency;
    }

    public function setUrgency(?string $urgency): self
    {
        $this->urgency = $urgency;

        return $this;
    }

    public function getDiagnostic(): ?Diagnostic
    {
        return $this->diagnostic;
    }

    public function setDiagnostic(?Diagnostic $diagnostic): self
    {
        $this->diagnostic = $diagnostic;

        return $this;
    }
}
