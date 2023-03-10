<?php

namespace App\Entity;

use App\Repository\ReclamationRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: ReclamationRepository::class)]
class Reclamation
{

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: Types::INTEGER)]
    #[Groups('reclamation')]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message: "Ce champs ne doit pas etre vide")]
    #[Groups('reclamation')]
    private ?string $titre = null;


    #[ORM\Column(type: Types::TEXT)]
    #[Assert\NotBlank(message: "Ce champs ne doit pas etre vide")]
    #[Groups('reclamation')]
    private ?string $message = null;



    #[ORM\Column(length: 255, nullable: true)]
    private ?string $description = null;

    #[ORM\ManyToOne(targetEntity: User::class)]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $idPatient = null;

    #[ORM\OneToOne(mappedBy: 'idReclamation', cascade: ['persist', 'remove'])]
    private ?Reponse $reponse = null;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getMessage(): ?string
    {
        return $this->message;
    }

    public function setMessage(string $message): self
    {
        $this->message = $message;

        return $this;
    }



    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getIdPatient(): ?User
    {
        return $this->idPatient;
    }

    public function setIdPatient(?User $idPatient): self
    {
        $this->idPatient = $idPatient;

        return $this;
    }

    public function getReponse(): ?Reponse
    {
        return $this->reponse;
    }

    public function setReponse(Reponse $reponse): self
    {
        // set the owning side of the relation if necessary
        if ($reponse->getIdReclamation() !== $this) {
            $reponse->setIdReclamation($this);
        }

        $this->reponse = $reponse;

        return $this;
    }
    public function __toString() {
        return(string)$this->getId();
    }


}
