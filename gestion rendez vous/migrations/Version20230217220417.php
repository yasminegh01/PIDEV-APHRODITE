<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230217220417 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE appointment_request (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(30) NOT NULL, lastname VARCHAR(30) NOT NULL, birth VARCHAR(30) NOT NULL, gender VARCHAR(30) NOT NULL, phonenumber VARCHAR(30) NOT NULL, email VARCHAR(30) NOT NULL, new_old TINYINT(1) NOT NULL, appointmentprocedure LONGTEXT NOT NULL, appointmentdate DATETIME NOT NULL, type VARCHAR(30) NOT NULL, lien VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE appointment_request');
    }
}
