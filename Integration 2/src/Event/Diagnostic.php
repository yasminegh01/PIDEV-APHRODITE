<?php

namespace App\Entity;

use App\Repository\DiagnosticRepository;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Validator\Validator\ValidatorInterface;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use http\Message;

#[ORM\Entity(repositoryClass: DiagnosticRepository::class)]
class Diagnostic
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::STRING)]
   #[Assert\Range(min: 10,max: 50)]
    private ?int $age = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message: 'Diagnostic.blank_content')]
    #[Assert\NotNull]
    private ?string $overweight = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotNull]
    #[Assert\NotBlank(message:"Cigarettes field is required")]

    private ?string $cigarettes = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"recently injured field is required")]
    #[Assert\NotNull]
    private ?string $recentlyInjured = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"hight Cholesterole field is required")]
    #[Assert\NotNull]
    private ?string $highCholesterol = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"hyper tension field is required")]
    #[Assert\NotNull]
    private ?string $hyperTension = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"diabetes field is required")]
    #[Assert\NotNull]
    private ?string $diabetes = null;
    #[Ignore]

    #[ORM\Column(type: Types::ARRAY)]
    private array $symptoms = [];

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    /**
     * @var string A "Y-m-d H:i:s" formatted value
     */
    #[Assert\DateTime]
    private ?\DateTimeInterface $date = null;
    #[Ignore]

    #[ORM\OneToOne(mappedBy: 'diagnostic', cascade: ['persist', 'remove'])]
    private ?Resultat $resultat = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAge(): ?int
    {
        return $this->age;
    }

    public function setAge(int $age): self
    {
        $this->age = $age;

        return $this;
    }

    public function getOverweight(): ?string
    {
        return $this->overweight;
    }

    public function setOverweight(?string $overweight): self
    {
        $this->overweight = $overweight;

        return $this;
    }

    public function getCigarettes(): ?string
    {
        return $this->cigarettes;
    }

    public function setCigarettes(?string $cigarettes): self
    {
        $this->cigarettes = $cigarettes;

        return $this;
    }

    public function getRecentlyInjured(): ?string
    {
        return $this->recentlyInjured;
    }

    public function setRecentlyInjured(?string $recentlyInjured): self
    {
        $this->recentlyInjured = $recentlyInjured;

        return $this;
    }

    public function getHighCholesterol(): ?string
    {
        return $this->highCholesterol;
    }

    public function setHighCholesterol(?string $highCholesterol): self
    {
        $this->highCholesterol = $highCholesterol;

        return $this;
    }

    public function getHyperTension(): ?string
    {
        return $this->hyperTension;
    }

    public function setHyperTension(?string $hyperTension): self
    {
        $this->hyperTension = $hyperTension;

        return $this;
    }

    public function getDiabetes(): ?string
    {
        return $this->diabetes;
    }

    public function setDiabetes(?string $diabetes): self
    {
        $this->diabetes = $diabetes;

        return $this;
    }

    public function getSymptoms(): array
    {
        return $this->symptoms;
    }

    public function setSymptoms(array $symptoms): self
    {
        $this->symptoms = $symptoms;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getResultat(): ?Resultat
    {
        return $this->resultat;
    }

    public function setResultat(?Resultat $resultat): self
    {
        // unset the owning side of the relation if necessary
        if ($resultat === null && $this->resultat !== null) {
            $this->resultat->setDiagnostic(null);
        }

        // set the owning side of the relation if necessary
        if ($resultat !== null && $resultat->getDiagnostic() !== $this) {
            $resultat->setDiagnostic($this);
        }

        $this->resultat = $resultat;

        return $this;
    }
}
