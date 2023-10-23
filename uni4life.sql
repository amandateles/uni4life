-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema uni4life
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema uni4life
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `uni4life` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `uni4life` ;

-- -----------------------------------------------------
-- Table `uni4life`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`administrador` (
  `idAdmin` INT NOT NULL,
  `funcaoAdmin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`),
  UNIQUE INDEX `idAdmin_UNIQUE` (`idAdmin` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`instituições`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`instituições` (
  `idInstituicao` INT NOT NULL,
  `nomeInstituicao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInstituicao`),
  UNIQUE INDEX `idInstituicao_UNIQUE` (`idInstituicao` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`cursos` (
  `idCurso` INT NOT NULL,
  `nomeCurso` VARCHAR(45) NOT NULL,
  `idInstituicao` INT NOT NULL,
  PRIMARY KEY (`idCurso`),
  UNIQUE INDEX `idCursos_UNIQUE` (`idCurso` ASC) VISIBLE,
  INDEX `idInstituicao_Curso_idx` (`idInstituicao` ASC) VISIBLE,
  CONSTRAINT `idInstituicao_Curso`
    FOREIGN KEY (`idInstituicao`)
    REFERENCES `uni4life`.`instituições` (`idInstituicao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`estudante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`estudante` (
  `idEstudante` INT NOT NULL,
  `nroMatriculaEstudante` INT NOT NULL,
  PRIMARY KEY (`idEstudante`),
  UNIQUE INDEX `idEstudante_UNIQUE` (`idEstudante` ASC) VISIBLE,
  UNIQUE INDEX `nroMatriculaEstudante_UNIQUE` (`nroMatriculaEstudante` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`professor` (
  `idProfessor` INT NOT NULL,
  `nroMatriculaProf` INT NOT NULL,
  PRIMARY KEY (`idProfessor`),
  UNIQUE INDEX `idProfessor_UNIQUE` (`idProfessor` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`usuário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`usuário` (
  `idUsuário` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(45) NOT NULL,
  `emailUsuario` VARCHAR(45) NOT NULL,
  `senhaUsuario` VARCHAR(200) NOT NULL,
  `CPFUsuario` VARCHAR(11) NOT NULL,
  `foto_perfil` VARCHAR(45) NULL DEFAULT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `dataNascUsuario` DATE NOT NULL,
  `idCurso` INT NULL DEFAULT NULL,
  `idInstituicao` INT NOT NULL,
  `idEstudante` INT NULL DEFAULT NULL,
  `idProfessor` INT NULL DEFAULT NULL,
  `idAdmin` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuário`),
  UNIQUE INDEX `idUsuário_UNIQUE` (`idUsuário` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`CPFUsuario` ASC) VISIBLE,
  UNIQUE INDEX `emailUsuario_UNIQUE` (`emailUsuario` ASC) VISIBLE,
  INDEX `idCurso_idx` (`idCurso` ASC) VISIBLE,
  INDEX `idInstituicao_idx` (`idInstituicao` ASC) VISIBLE,
  INDEX `idEstudante_idx` (`idEstudante` ASC) VISIBLE,
  INDEX `idProfessor_idx` (`idProfessor` ASC) VISIBLE,
  INDEX `idAdmin_idx` (`idAdmin` ASC) VISIBLE,
  CONSTRAINT `idAdmin`
    FOREIGN KEY (`idAdmin`)
    REFERENCES `uni4life`.`administrador` (`idAdmin`),
  CONSTRAINT `idCurso`
    FOREIGN KEY (`idCurso`)
    REFERENCES `uni4life`.`cursos` (`idCurso`),
  CONSTRAINT `idEstudante`
    FOREIGN KEY (`idEstudante`)
    REFERENCES `uni4life`.`estudante` (`idEstudante`),
  CONSTRAINT `idInstituicao`
    FOREIGN KEY (`idInstituicao`)
    REFERENCES `uni4life`.`instituições` (`idInstituicao`),
  CONSTRAINT `idProfessor`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `uni4life`.`professor` (`idProfessor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`album` (
  `idAlbum` INT NOT NULL,
  `tituloAlbum` VARCHAR(45) NOT NULL,
  `conteudoAlbum` VARCHAR(45) NOT NULL,
  `visibilidadeAlbum` VARCHAR(45) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idAlbum`),
  UNIQUE INDEX `idAlbum_UNIQUE` (`idAlbum` ASC) VISIBLE,
  INDEX `idUsuario_Album_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario_Album`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `uni4life`.`usuário` (`idUsuário`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`e-books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`e-books` (
  `idEBook` INT NOT NULL,
  `tituloEbook` VARCHAR(45) NOT NULL,
  `descricaoEbook` VARCHAR(45) NOT NULL,
  `precoEbook` INT NOT NULL,
  `arquivoEbook` VARCHAR(45) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idEBook`),
  UNIQUE INDEX `idEBook_UNIQUE` (`idEBook` ASC) VISIBLE,
  UNIQUE INDEX `tituloEbook_UNIQUE` (`tituloEbook` ASC) VISIBLE,
  UNIQUE INDEX `arquivoEbook_UNIQUE` (`arquivoEbook` ASC) VISIBLE,
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `uni4life`.`usuário` (`idUsuário`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`compras` (
  `idCompra` INT NOT NULL,
  `idEbook` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `dataCompra` DATETIME NOT NULL,
  `valorCompra` INT NOT NULL,
  `metodoPagamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompra`),
  UNIQUE INDEX `idCompra_UNIQUE` (`idCompra` ASC) VISIBLE,
  INDEX `idEbook_idx` (`idEbook` ASC) VISIBLE,
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idEbook`
    FOREIGN KEY (`idEbook`)
    REFERENCES `uni4life`.`e-books` (`idEBook`),
  CONSTRAINT `idUsuario_Compra`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `uni4life`.`usuário` (`idUsuário`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`midia` (
  `idMidia` INT NOT NULL,
  `tipoMidia` VARCHAR(45) NOT NULL,
  `dataMidia` VARCHAR(45) NOT NULL,
  `idAlbum` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idMidia`),
  UNIQUE INDEX `idMidia_UNIQUE` (`idMidia` ASC) VISIBLE,
  INDEX `idAlbum_idx` (`idAlbum` ASC) VISIBLE,
  INDEX `idUsuario_Midia_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idAlbum`
    FOREIGN KEY (`idAlbum`)
    REFERENCES `uni4life`.`album` (`idAlbum`),
  CONSTRAINT `idUsuario_Midia`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `uni4life`.`usuário` (`idUsuário`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `uni4life`.`publicacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni4life`.`publicacao` (
  `idPublicacao` INT NOT NULL,
  `tituloPublicacao` VARCHAR(45) NOT NULL,
  `dataPublicacao` DATETIME NOT NULL,
  `idMidia` INT NULL DEFAULT NULL,
  `visibilidadePub` VARCHAR(45) NOT NULL,
  `idUsuario` INT NOT NULL,
  `idAlbum` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idPublicacao`),
  UNIQUE INDEX `idPublicacao_UNIQUE` (`idPublicacao` ASC) VISIBLE,
  INDEX `idMidia_idx` (`idMidia` ASC) INVISIBLE,
  INDEX `idUsuario_fk_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idMidia`
    FOREIGN KEY (`idMidia`)
    REFERENCES `uni4life`.`midia` (`idMidia`),
  CONSTRAINT `idUsuario_Pub`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `uni4life`.`usuário` (`idUsuário`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
