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
-- Table `amazon`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`product` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `rating` BIT(1) NULL DEFAULT NULL,
  `available` TINYINT(4) NOT NULL,
  `delivery_in_days` INT(11) NOT NULL,
  `image_url` VARCHAR(200) NOT NULL,
  `available_quantity` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazon`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`user` (
  `id` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazon`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`cart` (
  `id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `cart_ibfk_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `amazon`.`product` (`id`),
  CONSTRAINT `cart_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `amazon`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazon`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`order` (
  `id` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `order_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `amazon`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `amazon`.`order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`order_product` (
  `id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  UNIQUE INDEX `uk_order_product` (`order_id` ASC, `product_id` ASC) VISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `order_product_ibfk_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `amazon`.`order` (`id`),
  CONSTRAINT `order_product_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `amazon`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
