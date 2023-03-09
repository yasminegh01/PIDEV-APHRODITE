<?php

namespace App\Entity;

use App\Repository\StarsRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: StarsRepository::class)]
class Stars
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(nullable: true)]
    private ?int $uID = null;

    #[ORM\Column(nullable: true)]
    private ?int $rateIndex = null;

    #[ORM\ManyToOne(inversedBy: 'stars', cascade: ['persist'])]
    #[ORM\JoinColumn(name:"idpost_id", referencedColumnName:"id", onDelete:"CASCADE")]
    private ?Post $idpost = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUID(): ?int
    {
        return $this->uID;
    }

    public function setUID(?int $uID): self
    {
        $this->uID = $uID;

        return $this;
    }

    public function getRateIndex(): ?int
    {
        return $this->rateIndex;
    }

    public function setRateIndex(?int $rateIndex): self
    {
        $this->rateIndex = $rateIndex;

        return $this;
    }

    public function getIdpost(): ?Post
    {
        return $this->idpost;
    }

    public function setIdpost(?Post $idpost): self
    {
        $this->idpost = $idpost;

        return $this;
    }
}
