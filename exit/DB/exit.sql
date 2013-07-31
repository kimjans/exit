SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `exit_proj` ;
CREATE SCHEMA IF NOT EXISTS `exit_proj` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `exit_proj` ;

-- -----------------------------------------------------
-- Table `free_board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `free_board` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `free_board` (
  `idx` INT NOT NULL AUTO_INCREMENT ,
  `cate` VARCHAR(20) CHARACTER SET 'utf8' NULL ,
  `title` VARCHAR(45) NULL ,
  `contents` MEDIUMTEXT NULL ,
  `writer_nick` VARCHAR(20) NOT NULL ,
  `writer_email` VARCHAR(45) NOT NULL ,
  `writer_ip` VARCHAR(20) NOT NULL ,
  `view_count` INT NOT NULL DEFAULT 0 ,
  `recommand_count` SMALLINT NULL DEFAULT 0 ,
  `report_count` TINYINT NULL DEFAULT 0 ,
  `date` DATETIME NOT NULL DEFAULT getdate() ,
  `visible` TINYINT(1) NOT NULL DEFAULT TRUE ,
  `blind` TINYINT(1) NOT NULL DEFAULT FALSE ,
  PRIMARY KEY (`idx`) );

SHOW WARNINGS;
CREATE UNIQUE INDEX `idx_UNIQUE` ON `free_board` (`idx` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user` (
  `idx` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(45) NOT NULL ,
  `nick` VARCHAR(20) NOT NULL ,
  `level` TINYINT NOT NULL DEFAULT 1 ,
  `reg_type` VARCHAR(45) NOT NULL ,
  `reg_date` DATETIME NOT NULL DEFAULT getdate() ,
  `login_date` DATETIME NOT NULL DEFAULT getdate() ,
  `blocked` TINYINT(1) NULL DEFAULT FALSE ,
  PRIMARY KEY (`idx`) )
DEFAULT CHARACTER SET = big5;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idx_UNIQUE` ON `user` (`idx` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `email_UNIQUE` ON `user` (`email` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `nick_UNIQUE` ON `user` (`nick` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `comment_free_board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment_free_board` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `comment_free_board` (
  `idx` INT NOT NULL AUTO_INCREMENT ,
  `board_idx` INT NOT NULL ,
  `reply_idx` INT NULL DEFAULT NULL ,
  `commment` TEXT NOT NULL ,
  `writer_nick` VARCHAR(20) NOT NULL ,
  `writer_email` VARCHAR(45) NOT NULL ,
  `writer_ip` VARCHAR(20) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `visible` TINYINT(1) NOT NULL DEFAULT TRUE ,
  `blind` TINYINT(1) NOT NULL DEFAULT FALSE ,
  PRIMARY KEY (`idx`, `board_idx`) ,
  CONSTRAINT `fk_comment_board`
    FOREIGN KEY (`board_idx` )
    REFERENCES `free_board` (`idx` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idx_UNIQUE` ON `comment_free_board` (`idx` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_comment_board_idx` ON `comment_free_board` (`board_idx` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `writer_UNIQUE` ON `comment_free_board` (`writer_nick` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `email_UNIQUE` ON `comment_free_board` (`writer_email` ASC) ;

SHOW WARNINGS;
USE `exit_proj` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
