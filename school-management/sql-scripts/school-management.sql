-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema school_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `school_management` ;

-- -----------------------------------------------------
-- Table `school_management`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(100) NULL DEFAULT NULL,
  `City` VARCHAR(100) NULL DEFAULT NULL,
  `Province` VARCHAR(100) NULL DEFAULT NULL,
  `Postal_Code` VARCHAR(7) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_management`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management`.`instructor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `school_management`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(8) NOT NULL,
  `course_name` VARCHAR(128) NULL DEFAULT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `instructor_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `COURSE_UNIQUE` (`course_code` ASC) VISIBLE,
  INDEX `FK_INSTRUCTOR_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `FK_INSTRUCTOR`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `school_management`.`instructor` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `school_management`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone_no` VARCHAR(20) NULL DEFAULT NULL,
  `addressId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_ADDRESS_idx` (`addressId` ASC) VISIBLE,
  CONSTRAINT `FK_ADDRESS`
    FOREIGN KEY (`addressId`)
    REFERENCES `school_management`.`address` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `school_management`.`course_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_management`.`course_student` (
  `course_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `student_id`),
  INDEX `FK_STUDENT_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `FK_COURSE_05`
    FOREIGN KEY (`course_id`)
    REFERENCES `school_management`.`course` (`id`),
  CONSTRAINT `FK_STUDENT`
    FOREIGN KEY (`student_id`)
    REFERENCES `school_management`.`student` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
