<?php

namespace App\Entity;

use App\Repository\DiagnosticRepository;
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

    #[ORM\Column]
    #[Assert\NotBlank(message:"Age field is required")]

    #[Assert\Range(
        min: 15,
        max: 60,
        notInRangeMessage: 'You must be between {{ min }}cm and {{ max }}cm tall to enter',
    )]
    private ?int $age = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"Weight is required")]
    private ?string $overweight = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"Cigarettes field is required")]
    private ?string $cigarettes = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"recently injured field is required")]

    private ?string $recentlyInjured = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"hight Cholesterole field is required")]

    private ?string $highCholesterol = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"hyper tension field is required")]

    private ?string $hyperTension = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message:"diabetes field is required")]

    private ?string $diabetes = null;

    #[ORM\Column(type: Types::ARRAY)]
    private array $symptoms = [];

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    /**
     * @var string A "Y-m-d H:i:s" formatted value
     */
    #[Assert\DateTime]
    private ?\DateTimeInterface $date = null;

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

    public function setOverweight(string $overweight): self
    {
        $this->overweight = $overweight;

        return $this;
    }

    public function getCigarettes(): ?string
    {
        return $this->cigarettes;
    }

    public function setCigarettes(string $cigarettes): self
    {
        $this->cigarettes = $cigarettes;

        return $this;
    }

    public function getRecentlyInjured(): ?string
    {
        return $this->recentlyInjured;
    }

    public function setRecentlyInjured(string $recentlyInjured): self
    {
        $this->recentlyInjured = $recentlyInjured;

        return $this;
    }

    public function getHighCholesterol(): ?string
    {
        return $this->highCholesterol;
    }

    public function setHighCholesterol(string $highCholesterol): self
    {
        $this->highCholesterol = $highCholesterol;

        return $this;
    }

    public function getHyperTension(): ?string
    {
        return $this->hyperTension;
    }

    public function setHyperTension(string $hyperTension): self
    {
        $this->hyperTension = $hyperTension;

        return $this;
    }

    public function getDiabetes(): ?string
    {
        return $this->diabetes;
    }

    public function setDiabetes(string $diabetes): self
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
}
