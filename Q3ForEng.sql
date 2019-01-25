-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `patID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `gender` ENUM("male", "female", "X") NULL,
  `age` VARCHAR(45) NULL,
  PRIMARY KEY (`patID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `GeneID` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `gene_descr` VARCHAR(45) NULL,
  PRIMARY KEY (`GeneID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `SyndromeID` INT NOT NULL,
  `Syndrome_name` VARCHAR(45) NULL,
  `Syndrome_descr` VARCHAR(200) NULL,
  PRIMARY KEY (`SyndromeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutation` (
  `mutation_ID` INT NOT NULL,
  `GeneID` INT NULL,
  `Chromosome` INT NULL,
  `start` INT NULL,
  `end` INT NULL,
  `SyndromeID` INT NULL,
  PRIMARY KEY (`mutation_ID`),
  INDEX `Gene_idx` (`GeneID` ASC) VISIBLE,
  INDEX `Syndr_idx` (`SyndromeID` ASC) VISIBLE,
  CONSTRAINT `Gene`
    FOREIGN KEY (`GeneID`)
    REFERENCES `mydb`.`Gene` (`GeneID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Syndr`
    FOREIGN KEY (`SyndromeID`)
    REFERENCES `mydb`.`Syndrome` (`SyndromeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diagnosis` (
  `PatID` INT NOT NULL,
  `SyndromeID` INT NULL,
  `age_of_diag` INT NULL,
  PRIMARY KEY (`PatID`),
  INDEX `Synd_idx` (`SyndromeID` ASC) VISIBLE,
  CONSTRAINT `patient`
    FOREIGN KEY (`PatID`)
    REFERENCES `mydb`.`Patient` (`patID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Synd`
    FOREIGN KEY (`SyndromeID`)
    REFERENCES `mydb`.`Syndrome` (`SyndromeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
