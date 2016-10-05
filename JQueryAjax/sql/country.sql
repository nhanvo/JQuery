/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  nhanvo
 * Created: Oct 5, 2016
 */
CREATE SCHEMA `countrydb` ;

CREATE TABLE `countrydb`.`country` (
  `code` VARCHAR(3) NOT NULL,
  `name` VARCHAR(52) NOT NULL,
  `continent` VARCHAR(100) NOT NULL DEFAULT 'Asia',
  `region` VARCHAR(26) NOT NULL,
  `population` INT NOT NULL DEFAULT 0,
  `capital` INT NULL DEFAULT NULL,
  PRIMARY KEY (`code`));

INSERT INTO country VALUES ('ABW', 'Aruba','North America', 'Caribean', 103000, 129);
INSERT INTO country VALUES ('AFG', 'Afganistan','Asia', 'Sounthem and Centrat Asia', 22720000, 1);
INSERT INTO country VALUES ('AGO', 'Angola','Africa', 'Central Africa', 12878000, 56);
INSERT INTO country VALUES ('AIA', 'Anguilla','North America', 'Caribean', 8000, 62);
INSERT INTO country VALUES ('ALB', 'Albania','Europe', 'Souththem Europe', 3401200, 34);
INSERT INTO country VALUES ('AND', 'Andorra','Europe', 'Souththem Europe', 78000, 55);
INSERT INTO country VALUES ('ANT', 'Nethelands Antilles','North America', 'Caribean', 217000, 62);
INSERT INTO country VALUES ('ARE', 'United Arab Emirates','Asia', 'Middle East', 2441000, 65);
INSERT INTO country VALUES ('ARG', 'Argentina','South America', 'South America', 37032000, 69);
INSERT INTO country VALUES ('ARM', 'America','Asia', 'Middle East', 3520000, 126);

