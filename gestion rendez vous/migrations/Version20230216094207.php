<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230216094207 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE diagnostic (id INT AUTO_INCREMENT NOT NULL, age INT NOT NULL, overweight VARCHAR(255) NOT NULL, cigarettes VARCHAR(255) NOT NULL, recently_injured VARCHAR(255) NOT NULL, high_cholesterol VARCHAR(255) NOT NULL, hyper_tension VARCHAR(255) NOT NULL, diabetes VARCHAR(255) NOT NULL, symptoms LONGTEXT NOT NULL COMMENT \'(DC2Type:array)\', date DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE diagnostic');
    }
}
