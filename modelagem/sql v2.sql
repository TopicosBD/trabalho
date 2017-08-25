-- MySQL Script generated by MySQL Workbench
-- 08/24/17 22:22:16
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sistemaclinica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistemaclinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistemaclinica` DEFAULT CHARACTER SET latin1 ;
USE `sistemaclinica` ;

-- -----------------------------------------------------
-- Table `sistemaclinica`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`cargo` (
  `id_cargo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(20) NOT NULL,
  `nome_fantasia` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id_empresa`),
  INDEX `fk_empresa_empresa1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_empresa_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `sistemaclinica`.`empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`funcionario` (
  `id_funcionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(20) NULL,
  `cargo_id_cargo` INT NOT NULL,
  `id_empresa` INT NOT NULL,
  INDEX `fk_funcionario_cargo1_idx` (`cargo_id_cargo` ASC),
  INDEX `fk_funcionario_empresa1_idx` (`id_empresa` ASC),
  PRIMARY KEY (`id_funcionario`),
  CONSTRAINT `fk_funcionario_cargo1`
    FOREIGN KEY (`cargo_id_cargo`)
    REFERENCES `sistemaclinica`.`cargo` (`id_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_empresa1`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `sistemaclinica`.`empresa` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`riscos_ocupacionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`riscos_ocupacionais` (
  `id_riscos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_riscos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`resultado_exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`resultado_exame` (
  `id_tipo_resultado_exame` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_tipo_resultado_exame`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`tipo_exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`tipo_exame` (
  `id_tipo_exame` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_exame`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`exame` (
  `id_exame` INT NOT NULL,
  `especialidade` VARCHAR(50) NOT NULL,
  `data_realizacao` DATE NOT NULL,
  `resultado_exame_id_tipo_resultado_exame` INT NOT NULL,
  `tipo_exame_id_tipo_exame` INT NOT NULL,
  PRIMARY KEY (`id_exame`),
  INDEX `fk_exame_resultado_exame1_idx` (`resultado_exame_id_tipo_resultado_exame` ASC),
  INDEX `fk_exame_tipo_exame1_idx` (`tipo_exame_id_tipo_exame` ASC),
  CONSTRAINT `fk_exame_resultado_exame1`
    FOREIGN KEY (`resultado_exame_id_tipo_resultado_exame`)
    REFERENCES `sistemaclinica`.`resultado_exame` (`id_tipo_resultado_exame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exame_tipo_exame1`
    FOREIGN KEY (`tipo_exame_id_tipo_exame`)
    REFERENCES `sistemaclinica`.`tipo_exame` (`id_tipo_exame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`medico` (
  `id_medico` INT NOT NULL AUTO_INCREMENT,
  `crm` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `especialidade` VARCHAR(50) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(20) NULL,
  PRIMARY KEY (`id_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`atestado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`atestado` (
  `id_atestado` INT NOT NULL AUTO_INCREMENT,
  `resultados_riscos` VARCHAR(100) NOT NULL,
  `resultado` VARCHAR(100) NOT NULL,
  `observacoes` VARCHAR(300) NOT NULL,
  `medico_id` INT NOT NULL,
  PRIMARY KEY (`id_atestado`, `medico_id`),
  INDEX `fk_atestado_medico1_idx` (`medico_id` ASC),
  CONSTRAINT `fk_atestado_medico1`
    FOREIGN KEY (`medico_id`)
    REFERENCES `sistemaclinica`.`medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`cargo_has_riscos_ocupacionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`cargo_has_riscos_ocupacionais` (
  `cargo_id_cargo` INT NOT NULL,
  `riscos_ocupacionais_id_riscos` INT NOT NULL,
  PRIMARY KEY (`cargo_id_cargo`, `riscos_ocupacionais_id_riscos`),
  INDEX `fk_cargo_has_riscos_ocupacionais_riscos_ocupacionais1_idx` (`riscos_ocupacionais_id_riscos` ASC),
  INDEX `fk_cargo_has_riscos_ocupacionais_cargo_idx` (`cargo_id_cargo` ASC),
  CONSTRAINT `fk_cargo_has_riscos_ocupacionais_cargo`
    FOREIGN KEY (`cargo_id_cargo`)
    REFERENCES `sistemaclinica`.`cargo` (`id_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cargo_has_riscos_ocupacionais_riscos_ocupacionais1`
    FOREIGN KEY (`riscos_ocupacionais_id_riscos`)
    REFERENCES `sistemaclinica`.`riscos_ocupacionais` (`id_riscos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`funcionario_has_exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`funcionario_has_exame` (
  `exame_id_exame` INT NOT NULL,
  `funcionario_id_funcionario` INT NOT NULL,
  PRIMARY KEY (`exame_id_exame`, `funcionario_id_funcionario`),
  INDEX `fk_funcionario_has_exame_exame1_idx` (`exame_id_exame` ASC),
  INDEX `fk_funcionario_has_exame_funcionario1_idx` (`funcionario_id_funcionario` ASC),
  CONSTRAINT `fk_funcionario_has_exame_exame1`
    FOREIGN KEY (`exame_id_exame`)
    REFERENCES `sistemaclinica`.`exame` (`id_exame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_has_exame_funcionario1`
    FOREIGN KEY (`funcionario_id_funcionario`)
    REFERENCES `sistemaclinica`.`funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`empresa_has_exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`empresa_has_exame` (
  `exame_id_exame` INT NOT NULL,
  `empresa_id_empresa` INT NOT NULL,
  PRIMARY KEY (`exame_id_exame`, `empresa_id_empresa`),
  INDEX `fk_empresa_has_exame_exame1_idx` (`exame_id_exame` ASC),
  INDEX `fk_empresa_has_exame_empresa1_idx` (`empresa_id_empresa` ASC),
  CONSTRAINT `fk_empresa_has_exame_exame1`
    FOREIGN KEY (`exame_id_exame`)
    REFERENCES `sistemaclinica`.`exame` (`id_exame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_exame_empresa1`
    FOREIGN KEY (`empresa_id_empresa`)
    REFERENCES `sistemaclinica`.`empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaclinica`.`exame_has_atestado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaclinica`.`exame_has_atestado` (
  `exame_id_exame` INT NOT NULL,
  `atestado_id_atestado` INT NOT NULL,
  PRIMARY KEY (`exame_id_exame`, `atestado_id_atestado`),
  INDEX `fk_exame_has_atestado_atestado1_idx` (`atestado_id_atestado` ASC),
  INDEX `fk_exame_has_atestado_exame1_idx` (`exame_id_exame` ASC),
  CONSTRAINT `fk_exame_has_atestado_exame1`
    FOREIGN KEY (`exame_id_exame`)
    REFERENCES `sistemaclinica`.`exame` (`id_exame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exame_has_atestado_atestado1`
    FOREIGN KEY (`atestado_id_atestado`)
    REFERENCES `sistemaclinica`.`atestado` (`id_atestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
