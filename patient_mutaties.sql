-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema patient_mutaties
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema patient_mutaties
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `patient_mutaties` DEFAULT CHARACTER SET utf8 ;
USE `patient_mutaties` ;

-- -----------------------------------------------------
-- Table `patient_mutaties`.`Gen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `patient_mutaties`.`Gen` (
  `genID` INT NOT NULL AUTO_INCREMENT,
  `gennaam` VARCHAR(45) NOT NULL,
  `genstart` INT NOT NULL,
  `gen_einde` INT NOT NULL,
  `beschrijving` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`genID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `patient_mutaties`.`Mutatie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `patient_mutaties`.`Mutatie` (
  `mutatieID` INT NOT NULL AUTO_INCREMENT,
  `chromosomale_locatie` VARCHAR(20) NOT NULL,
  `mut_genID` INT NOT NULL,
  PRIMARY KEY (`mutatieID`),
  INDEX `FK_mut_gen_idx` (`mut_genID` ASC),
  CONSTRAINT `FK_mut_gen`
    FOREIGN KEY (`mut_genID`)
    REFERENCES `patient_mutaties`.`Gen` (`genID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `patient_mutaties`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `patient_mutaties`.`Patient` (
  `patient_ID` INT NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(45) NOT NULL,
  `geslacht` ENUM('M', 'V') NOT NULL,
  `leeftijd_diagnose` INT(3) NOT NULL,
  `pat_mutatie_ID` INT NOT NULL,
  PRIMARY KEY (`patient_ID`),
  INDEX `FK_pat_mut_idx` (`pat_mutatie_ID` ASC),
  CONSTRAINT `FK_pat_mut`
    FOREIGN KEY (`pat_mutatie_ID`)
    REFERENCES `patient_mutaties`.`Mutatie` (`mutatieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
