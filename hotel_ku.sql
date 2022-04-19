/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.18-MariaDB : Database - hotel_ku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel_ku` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `hotel_ku`;

/*Table structure for table `tb_fasilitas_kamar` */

DROP TABLE IF EXISTS `tb_fasilitas_kamar`;

CREATE TABLE `tb_fasilitas_kamar` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_kamar` INT(11) NOT NULL,
  `fasilitas` VARCHAR(100) NOT NULL,
  `gambar` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kamar` (`id_kamar`),
  CONSTRAINT `tb_fasilitas_kamar_ibfk_1` FOREIGN KEY (`id_kamar`) REFERENCES `tb_kamar` (`id_kamar`)
) ENGINE=INNODB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_fasilitas_kamar` */

LOCK TABLES `tb_fasilitas_kamar` WRITE;

INSERT  INTO `tb_fasilitas_kamar`(`id`,`id_kamar`,`fasilitas`,`gambar`) VALUES 
(1,1,'TV 42 Inc','image/TV42Inc20220313110820pm.jpg'),
(2,1,'AC Pendingin Ruang','image/ACPendinginRuang20220313110855pm.jpg'),
(3,2,'Restaurant','');

UNLOCK TABLES;

/*Table structure for table `tb_fasilitas_umum` */

DROP TABLE IF EXISTS `tb_fasilitas_umum`;

CREATE TABLE `tb_fasilitas_umum` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_fasilitas` VARCHAR(50) NOT NULL,
  `keterangan` TEXT NOT NULL,
  `gambar` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_fasilitas_umum` */

LOCK TABLES `tb_fasilitas_umum` WRITE;

INSERT  INTO `tb_fasilitas_umum`(`id`,`nama_fasilitas`,`keterangan`,`gambar`) VALUES 
(2,'Kolam Renang Anak','Berada pada lantai 5 dengan luas 500m persegi','image/LapanganBadminton20220313101526pm.jpeg'),
(3,'Tempat Santai','Berada pada Lantai 12 menghadap Sunrise','image/TempatSantai20220313101501pm.jpg'),
(10,'Restaurant','Berada di lantai 1','image/fasilitasumumrestoran.jpg');

UNLOCK TABLES;

/*Table structure for table `tb_kamar` */

DROP TABLE IF EXISTS `tb_kamar`;

CREATE TABLE `tb_kamar` (
  `id_kamar` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_kamar` VARCHAR(50) NOT NULL,
  `total_kamar` INT(5) NOT NULL,
  PRIMARY KEY (`id_kamar`)
) ENGINE=INNODB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_kamar` */

LOCK TABLES `tb_kamar` WRITE;

INSERT  INTO `tb_kamar`(`id_kamar`,`nama_kamar`,`total_kamar`) VALUES 
(1,'Rooftop Room',5),
(2,'Standard Double Room',5),
(3,'Suite',5),
(4,'Family Suite',5),
(5,'Deluxe Double Room',5);

UNLOCK TABLES;

/*Table structure for table `tb_pelanggan` */

DROP TABLE IF EXISTS `tb_pelanggan`;

CREATE TABLE `tb_pelanggan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_pemesan` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `hp` VARCHAR(12) NOT NULL,
  `nama_tamu` VARCHAR(50) NOT NULL,
  `tgl_pesan` DATETIME NOT NULL,
  `checkin` DATE NOT NULL,
  `checkout` DATE NOT NULL,
  `jml_kamar` INT(2) NOT NULL,
  `status` ENUM('0','1') NOT NULL,
  `id_kamar` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pelanggan` */

LOCK TABLES `tb_pelanggan` WRITE;

INSERT  INTO `tb_pelanggan`(`id`,`nama_pemesan`,`email`,`hp`,`nama_tamu`,`tgl_pesan`,`checkin`,`checkout`,`jml_kamar`,`status`,`id_kamar`) VALUES 
(1,'Maklon Frare','maklon@gmail.com','085234442455','Maklon Frare','2022-02-05 07:09:59','2022-02-05','2022-02-05',2,'',1),
(3,'Ferdy Durhan','kallonjuve@gmail.com','23423','Ardy Wela','2022-02-05 05:10:45','2022-02-05','2022-02-08',2,'1',1),
(4,'Remigius Agut','kallonjuve@gmail.com','23423','Noldy Saputra','2022-02-05 05:14:59','2022-02-07','2022-02-10',2,'1',1),
(5,'Rivan Manafe','admin@smkn1kuwus.sch.id','085253227734','Juliana Mbau','2022-02-05 05:58:59','2022-02-05','2022-02-08',1,'1',1),
(6,'Lonida Ruth Manisa','maklonjacob.frare@gmail.com','085253332244','Maklon Frare','2022-02-06 12:28:41','2022-02-09','2022-02-24',2,'1',1),
(7,'Egideus Helmon, S.P','egi@gmail.com','085344225422','Hermanus Lando, S.Pd','2022-02-06 12:31:27','2022-02-07','2022-02-10',1,'',2),
(8,'Marsellina Patii','Marsel@gmail.com','085664322455','John Umbu Pati','2022-02-06 12:36:39','2022-02-07','2022-02-10',2,'0',2),
(9,'Ipank','ipank@gmail.com','678658755','Artho','2022-02-07 07:04:41','2022-02-12','2022-02-15',1,'0',2),
(10,'Maklon','maklonjacob.frare@gmail.com','085253332245','Misel Jebabun','2022-02-09 10:06:00','2022-02-14','2022-02-17',1,'',2),
(11,'Zilan','nk8egc@erapor-smk.net','085253332244','Richard','2022-02-09 10:07:16','2022-02-15','2022-02-17',1,'1',1),
(12,'Mizel','maklon@gmail.com','085253332244','Maklom','2022-02-09 12:57:04','2022-02-10','2022-02-12',1,'',2),
(13,'Intan Puja Zaeni','intan@gmail.com','08210000000','Intan','2022-04-08 08:23:37','2022-04-08','2022-04-09',1,'0',7),
(14,'Intan Puja Zaeni','intan@gmail.com','00000','Intan','2022-04-08 11:06:48','2022-04-08','2022-04-09',1,'0',3);

UNLOCK TABLES;

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `tipe` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_user` */

LOCK TABLES `tb_user` WRITE;

INSERT  INTO `tb_user`(`id`,`username`,`password`,`tipe`) VALUES 
(1,'admin','123','admin'),
(2,'resepsionis','321','resepsionis');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
