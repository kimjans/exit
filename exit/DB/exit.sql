SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `exit_proj` ;
CREATE SCHEMA IF NOT EXISTS `exit_proj` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `exit_proj` ;

-- -----------------------------------------------------
-- Table `board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `board` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `board` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `type` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL ,
  `title` VARCHAR(45) NULL ,
  `contents` MEDIUMTEXT NULL ,
  `writer` VARCHAR(20) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `views` INT NULL DEFAULT 0 ,
  `visible` TINYINT(1) NOT NULL DEFAULT TRUE ,
  PRIMARY KEY (`id`) );

SHOW WARNINGS;
CREATE UNIQUE INDEX `type_UNIQUE` ON `board` (`type` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `board` (`id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(45) NOT NULL ,
  `nick` VARCHAR(20) NOT NULL ,
  `level` TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) )
DEFAULT CHARACTER SET = big5;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `user` (`id` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `email_UNIQUE` ON `user` (`email` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `nick_UNIQUE` ON `user` (`nick` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `board_id` INT NOT NULL ,
  `commment` TEXT NOT NULL ,
  `writer` VARCHAR(20) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `reply_id` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`, `board_id`) ,
  CONSTRAINT `fk_comment_board`
    FOREIGN KEY (`board_id` )
    REFERENCES `board` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_UNIQUE` ON `comment` (`id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_comment_board_idx` ON `comment` (`board_id` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `writer_UNIQUE` ON `comment` (`writer` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `email_UNIQUE` ON `comment` (`email` ASC) ;

SHOW WARNINGS;
USE `exit_proj` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
