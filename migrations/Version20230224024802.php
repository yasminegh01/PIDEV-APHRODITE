<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230224024802 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE diagnostic (id INT AUTO_INCREMENT NOT NULL, age VARCHAR(255) NOT NULL, overweight VARCHAR(255) NOT NULL, cigarettes VARCHAR(255) NOT NULL, recently_injured VARCHAR(255) NOT NULL, high_cholesterol VARCHAR(255) NOT NULL, hyper_tension VARCHAR(255) NOT NULL, diabetes VARCHAR(255) NOT NULL, symptoms LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', date DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE resultat (id INT AUTO_INCREMENT NOT NULL, diagnostic_id INT DEFAULT NULL, action VARCHAR(255) NOT NULL, possibility INT NOT NULL, doctor_note VARCHAR(255) NOT NULL, urgency VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_E7DB5DE2224CCA91 (diagnostic_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE resultat ADD CONSTRAINT FK_E7DB5DE2224CCA91 FOREIGN KEY (diagnostic_id) REFERENCES diagnostic (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE resultat DROP FOREIGN KEY FK_E7DB5DE2224CCA91');
        $this->addSql('DROP TABLE diagnostic');
        $this->addSql('DROP TABLE resultat');
    }
}
