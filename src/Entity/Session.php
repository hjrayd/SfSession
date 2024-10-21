<?php

namespace App\Entity;

use App\Repository\SessionRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: SessionRepository::class)]
class Session
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $sessionName = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $startDate = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $endDate = null;

    #[ORM\Column]
    private ?int $numberPlace = null;

    #[ORM\Column]
    private ?int $reservedPlace = null;

    /**
     * @var Collection<int, Trainee>
     */
    #[ORM\ManyToMany(targetEntity: Trainee::class, inversedBy: 'session')]
    private Collection $trainees;

    #[ORM\ManyToOne(inversedBy: 'sessions')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Training $training = null;

    public function __construct()
    {
        $this->trainees = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSessionName(): ?string
    {
        return $this->sessionName;
    }

    public function setSessionName(string $sessionName): static
    {
        $this->sessionName = $sessionName;

        return $this;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(\DateTimeInterface $startDate): static
    {
        $this->startDate = $startDate;

        return $this;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function setEndDate(\DateTimeInterface $endDate): static
    {
        $this->endDate = $endDate;

        return $this;
    }

    public function getNumberPlace(): ?int
    {
        return $this->numberPlace;
    }

    public function setNumberPlace(int $numberPlace): static
    {
        $this->numberPlace = $numberPlace;

        return $this;
    }

    public function getReservedPlace(): ?int
    {
        return $this->reservedPlace;
    }

    public function setReservedPlace(int $reservedPlace): static
    {
        $this->reservedPlace = $reservedPlace;

        return $this;
    }

    /**
     * @return Collection<int, Trainee>
     */
    public function getTrainees(): Collection
    {
        return $this->trainees;
    }

    public function addTrainee(Trainee $trainee): static
    {
        if (!$this->trainees->contains($trainee)) {
            $this->trainees->add($trainee);
        }

        return $this;
    }

    public function removeTrainee(Trainee $trainee): static
    {
        $this->trainees->removeElement($trainee);

        return $this;
    }

    public function getTraining(): ?Training
    {
        return $this->training;
    }

    public function setTraining(?Training $training): static
    {
        $this->training = $training;

        return $this;
    }
}
