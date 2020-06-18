-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `amazon` DEFAULT CHARACTER SET latin1 ;
USE `amazon` ;

-- -----------------------------------------------------
-- Table `amazon`.`applicationUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`applicationUser` (
  `applicationUserID` INT(11) NOT NULL,
  `applicationUserEmail` VARCHAR(45) NULL DEFAULT NULL,
  `applicationUserPassword` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`applicationUserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazon`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`cart` (
  `cartID` INT(11) NOT NULL,
  `cartProductID` INT(11) NOT NULL,
  `cartUserID` INT(11) NOT NULL,
  PRIMARY KEY (`cartID`),
  INDEX `cartUserID` (`cartUserID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazon`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`product` (
  `productID` INT(11) NOT NULL,
  `productTitle` VARCHAR(50) NOT NULL,
  `productDescription` VARCHAR(200) NOT NULL,
  `productRating` INT(11) NULL DEFAULT NULL,
  `productAvailable` TINYINT(4) NOT NULL,
  `productDeliveryTime` INT(11) NOT NULL,
  `productImageUrl` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`productID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazon`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`purchase` (
  `purchaseID` INT(11) NOT NULL,
  `purchaseDate` DATE NOT NULL,
  `purchaseUser` INT(11) NOT NULL,
  `purchaseProductID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`purchaseID`),
  INDEX `purchaseUser` (`purchaseUser` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
