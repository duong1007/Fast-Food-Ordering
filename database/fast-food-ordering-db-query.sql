create database if not exists fast_food_ordering;
use fast_food_ordering;

CREATE TABLE `fast_food_ordering`.`user`
(
 `user_id`   int NOT NULL AUTO_INCREMENT ,
 `user_name` varchar(100) NOT NULL ,
 `phone`     varchar(50) NOT NULL ,
 `gender`    varchar(20) NOT NULL ,
 `email`     varchar(100) NOT NULL ,
 `birthday`  date NULL ,
 `address`   varchar(255) NOT NULL ,
 `avatar`    varchar(255) NOT NULL ,

PRIMARY KEY (`user_id`)
);

CREATE TABLE `fast_food_ordering`.`account`
(
 `account_id`     int NOT NULL AUTO_INCREMENT ,
 `account_name`   varchar(45) NOT NULL ,
 `password`       varchar(255) NOT NULL ,
 `account_enable` bit NOT NULL ,
 `user_id`        int NOT NULL ,

PRIMARY KEY (`account_id`),
KEY `fkIdx_49` (`user_id`),
CONSTRAINT `FK_48` FOREIGN KEY `fkIdx_49` (`user_id`) REFERENCES `fast_food_ordering`.`user` (`user_id`)
);

CREATE TABLE `fast_food_ordering`.`role`
(
 `role_id`   int NOT NULL AUTO_INCREMENT ,
 `role_name` varchar(45) NOT NULL ,

PRIMARY KEY (`role_id`)
);

CREATE TABLE `fast_food_ordering`.`account_role`
(
 `account_role_id` int NOT NULL AUTO_INCREMENT ,
 `account_id`      int NOT NULL ,
 `role_id`         int NOT NULL ,

PRIMARY KEY (`account_role_id`),
KEY `fkIdx_26` (`account_id`),
CONSTRAINT `FK_25` FOREIGN KEY `fkIdx_26` (`account_id`) REFERENCES `fast_food_ordering`.`account` (`account_id`),
KEY `fkIdx_29` (`role_id`),
CONSTRAINT `FK_28` FOREIGN KEY `fkIdx_29` (`role_id`) REFERENCES `fast_food_ordering`.`role` (`role_id`)
);


CREATE TABLE `fast_food_ordering`.`cart`
(
 `cart_id`    int NOT NULL AUTO_INCREMENT ,
 `account_id` int NOT NULL ,

PRIMARY KEY (`cart_id`),
KEY `fkIdx_161` (`account_id`),
CONSTRAINT `FK_160` FOREIGN KEY `fkIdx_161` (`account_id`) REFERENCES `fast_food_ordering`.`account` (`account_id`)
);

CREATE TABLE `fast_food_ordering`.`food`
(
 `food_id`       int NOT NULL AUTO_INCREMENT ,
 `food_name`     varchar(50) NOT NULL ,
 `description`   text NOT NULL ,
 `time_cook`     int NOT NULL ,
 `price`         double NOT NULL ,
 `amount`        int NOT NULL ,
 `new_added_day` date NOT NULL ,

PRIMARY KEY (`food_id`)
);

CREATE TABLE `fast_food_ordering`.`card_detail`
(
 `order_detail_id` int NOT NULL AUTO_INCREMENT ,
 `food_id`         int NOT NULL ,
 `note_for_food`   varchar(255) NOT NULL ,
 `quatity`         int NOT NULL ,
 `cart_id`         int NOT NULL ,

PRIMARY KEY (`order_detail_id`),
KEY `fkIdx_141` (`food_id`),
CONSTRAINT `FK_140` FOREIGN KEY `fkIdx_141` (`food_id`) REFERENCES `fast_food_ordering`.`food` (`food_id`),
KEY `fkIdx_155` (`cart_id`),
CONSTRAINT `FK_154` FOREIGN KEY `fkIdx_155` (`cart_id`) REFERENCES `fast_food_ordering`.`cart` (`cart_id`)
);


CREATE TABLE `fast_food_ordering`.`food_image`
(
 `food_image_id`  int NOT NULL AUTO_INCREMENT ,
 `food_image_url` varchar(255) NOT NULL ,
 `food_id`        int NOT NULL ,

PRIMARY KEY (`food_image_id`),
KEY `fkIdx_135` (`food_id`),
CONSTRAINT `FK_134` FOREIGN KEY `fkIdx_135` (`food_id`) REFERENCES `fast_food_ordering`.`food` (`food_id`)
);

CREATE TABLE `fast_food_ordering`.`tag`
(
 `tag_id`  int NOT NULL AUTO_INCREMENT ,
 `tag_name` varchar(45) NOT NULL ,

PRIMARY KEY (`tag_id`)
);

CREATE TABLE `fast_food_ordering`.`food_tag`
(
 `food_tag_id` int NOT NULL AUTO_INCREMENT ,
 `tag_id`     int NOT NULL ,
 `food_id`     int NOT NULL ,

PRIMARY KEY (`food_tag_id`),
KEY `fkIdx_111` (`tag_id`),
CONSTRAINT `FK_110` FOREIGN KEY `fkIdx_111` (`tag_id`) REFERENCES `fast_food_ordering`.`tag` (`tag_id`),
KEY `fkIdx_114` (`food_id`),
CONSTRAINT `FK_113` FOREIGN KEY `fkIdx_114` (`food_id`) REFERENCES `fast_food_ordering`.`food` (`food_id`)
);

CREATE TABLE `fast_food_ordering`.`province`
(
 `province_name` varchar(50) NOT NULL ,
 `province_id`   int NOT NULL AUTO_INCREMENT ,

PRIMARY KEY (`province_id`)
);

CREATE TABLE `fast_food_ordering`.`district`
(
 `district_id`   int NOT NULL AUTO_INCREMENT ,
 `district_name` varchar(45) NOT NULL ,
 `province_id`   int NOT NULL ,

PRIMARY KEY (`district_id`),
KEY `fkIdx_63` (`province_id`),
CONSTRAINT `FK_62` FOREIGN KEY `fkIdx_63` (`province_id`) REFERENCES `fast_food_ordering`.`province` (`province_id`)
);

CREATE TABLE `fast_food_ordering`.`wards`
(
 `ward_id`     int NOT NULL AUTO_INCREMENT ,
 `ward_name`   varchar(45) NOT NULL ,
 `district_id` int NOT NULL ,

PRIMARY KEY (`ward_id`),
KEY `fkIdx_70` (`district_id`),
CONSTRAINT `FK_69` FOREIGN KEY `fkIdx_70` (`district_id`) REFERENCES `fast_food_ordering`.`district` (`district_id`)
);

CREATE TABLE `fast_food_ordering`.`order`
(
 `order_id`       int NOT NULL AUTO_INCREMENT ,
 `payment_method` varchar(50) NOT NULL ,
 `note`           varchar(255) NULL ,
 `ward_id`        int NOT NULL ,
 `street`         varchar(50) NOT NULL ,
 `total`          double NOT NULL ,
 `order_date`     datetime NOT NULL ,
 `cart_id`        int NOT NULL ,
 `time_ship`      datetime NOT NULL ,

PRIMARY KEY (`order_id`),
KEY `fkIdx_127` (`ward_id`),
CONSTRAINT `FK_126` FOREIGN KEY `fkIdx_127` (`ward_id`) REFERENCES `fast_food_ordering`.`wards` (`ward_id`),
KEY `fkIdx_158` (`cart_id`),
CONSTRAINT `FK_157` FOREIGN KEY `fkIdx_158` (`cart_id`) REFERENCES `fast_food_ordering`.`cart` (`cart_id`)
);

CREATE TABLE `fast_food_ordering`.`preview`
(
 `preview_id`   int NOT NULL AUTO_INCREMENT ,
 `user_id`      int NOT NULL ,
 `food_id`      int NOT NULL ,
 `content`      text NOT NULL ,
 `date_preview` date NOT NULL ,
 `point`        double NOT NULL ,

PRIMARY KEY (`preview_id`),
KEY `fkIdx_88` (`user_id`),
CONSTRAINT `FK_87` FOREIGN KEY `fkIdx_88` (`user_id`) REFERENCES `fast_food_ordering`.`user` (`user_id`),
KEY `fkIdx_97` (`food_id`),
CONSTRAINT `FK_96` FOREIGN KEY `fkIdx_97` (`food_id`) REFERENCES `fast_food_ordering`.`food` (`food_id`)
);