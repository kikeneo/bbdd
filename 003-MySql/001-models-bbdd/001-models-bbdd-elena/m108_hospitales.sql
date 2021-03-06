-- MySQL Script generated by MySQL Workbench
-- 09/10/15 09:33:21
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema m108_hospitales
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `m108_hospitales` ;

-- -----------------------------------------------------
-- Schema m108_hospitales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `m108_hospitales` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `m108_hospitales` ;

-- -----------------------------------------------------
-- Table `m108_hospitales`.`hospitales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m108_hospitales`.`hospitales` ;

CREATE TABLE IF NOT EXISTS `m108_hospitales`.`hospitales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hospital` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m108_hospitales`.`pacientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m108_hospitales`.`pacientes` ;

CREATE TABLE IF NOT EXISTS `m108_hospitales`.`pacientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `datos` TINYTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m108_hospitales`.`medicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m108_hospitales`.`medicos` ;

CREATE TABLE IF NOT EXISTS `m108_hospitales`.`medicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `id_hospital` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medicos_hospitales_idx` (`id_hospital` ASC),
  CONSTRAINT `fk_medicos_hospitales`
    FOREIGN KEY (`id_hospital`)
    REFERENCES `m108_hospitales`.`hospitales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m108_hospitales`.`especialidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m108_hospitales`.`especialidad` ;

CREATE TABLE IF NOT EXISTS `m108_hospitales`.`especialidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `especialidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m108_hospitales`.`medicos_pacientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m108_hospitales`.`medicos_pacientes` ;

CREATE TABLE IF NOT EXISTS `m108_hospitales`.`medicos_pacientes` (
  `id_medico` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  `id_especialidad` INT NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`id_medico`, `id_paciente`),
  INDEX `fk_medicos_has_pacientes_pacientes1_idx` (`id_paciente` ASC),
  INDEX `fk_medicos_has_pacientes_medicos1_idx` (`id_medico` ASC),
  INDEX `fk_medicos_pacientes_especialidad1_idx` (`id_especialidad` ASC),
  CONSTRAINT `fk_medicos_has_pacientes_medicos1`
    FOREIGN KEY (`id_medico`)
    REFERENCES `m108_hospitales`.`medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicos_has_pacientes_pacientes1`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `m108_hospitales`.`pacientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicos_pacientes_especialidad1`
    FOREIGN KEY (`id_especialidad`)
    REFERENCES `m108_hospitales`.`especialidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m108_hospitales`.`medicos_especialidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `m108_hospitales`.`medicos_especialidad` ;

CREATE TABLE IF NOT EXISTS `m108_hospitales`.`medicos_especialidad` (
  `id_medicos` INT NOT NULL,
  `id_especialidad` INT NOT NULL,
  PRIMARY KEY (`id_medicos`, `id_especialidad`),
  INDEX `fk_medicos_has_especialidad_especialidad1_idx` (`id_especialidad` ASC),
  INDEX `fk_medicos_has_especialidad_medicos1_idx` (`id_medicos` ASC),
  CONSTRAINT `fk_medicos_has_especialidad_medicos1`
    FOREIGN KEY (`id_medicos`)
    REFERENCES `m108_hospitales`.`medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicos_has_especialidad_especialidad1`
    FOREIGN KEY (`id_especialidad`)
    REFERENCES `m108_hospitales`.`especialidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
