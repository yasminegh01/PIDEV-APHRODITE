<?php

namespace App\Entity;

use App\Repository\ProduitRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\Ignore;

#[ORM\Entity(repositoryClass: ProduitRepository::class)]
class Produit
{

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups("produit")]

    private ?int $id = null;


    #[ORM\Column(length: 255)]
    #[Groups("produit")]

    private ?string $nom = null;

    #[ORM\Column(length: 255)]
    #[Groups("produit")]

    private ?int $quantite = null;

    #[ORM\Column]
    #[Groups("produit")]

    private ?float $prix = null;

    #[ORM\Column(length: 255)]
    #[Groups("produit")]

    private ?string $categorie = null;

    #[ORM\Column(length: 255)]
    #[Groups("produit")]

    private ?string $description = null;

    #[ORM\ManyToOne(inversedBy: 'produits')]
    #[Groups("produit")]


    /** @Ignore() */

    private ?Promotion $promo = null;
    #[Ignore]
    #[ORM\Column(length: 255)]
    #[Groups("produit")]

    private ?string $image = null;

    #[ORM\Column(length: 255,nullable: true)]
    private ?string $lat = null;

    #[ORM\Column(length: 255,nullable: true)]
    private ?string $lon = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {

        $this->nom = $nom;

        return $this;
    }

    public function getQuantite(): ?int
    {
        return $this->quantite;
    }

    public function setQuantite(int $quantite): self
    {
        $this->quantite = $quantite;

        return $this;
    }

    public function getPrix(): ?float
    {
        return $this->prix;
    }

    public function setPrix(float $prix): self
    {
        $this->prix = $prix;

        return $this;
    }

    public function getCategorie(): ?string
    {
        return $this->categorie;
    }

    public function setCategorie(string $categorie): self
    {
        $this->categorie = $categorie;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getPromo(): ?Promotion
    {
        return $this->promo;
    }

    public function setPromo(?Promotion $promo): self
    {
        $this->promo = $promo;

        return $this;
    }
    public function getPromoPourcent(): ?int
    {
        return $this->promo->getPourcentage();
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getLat(): ?string
    {
        return $this->lat;
    }

    public function setLat(string $lat): self
    {
        $this->lat = $lat;

        return $this;
    }

    public function getLon(): ?string
    {
        return $this->lon;
    }

    public function setLon(string $lon): self
    {
        $this->lon = $lon;

        return $this;
    }
}
