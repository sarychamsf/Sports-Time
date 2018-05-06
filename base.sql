-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.11 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sports_time
CREATE DATABASE IF NOT EXISTS `sports_time` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sports_time`;

-- Dumping structure for table sports_time.asistance
CREATE TABLE IF NOT EXISTS `asistance` (
  `Date1` varchar(100) DEFAULT NULL,
  `Name_Athele` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Name_Coach` varchar(100) DEFAULT NULL,
  `Jornada` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.asistance: ~19 rows (approximately)
/*!40000 ALTER TABLE `asistance` DISABLE KEYS */;
INSERT INTO `asistance` (`Date1`, `Name_Athele`, `State`, `Name_Coach`, `Jornada`) VALUES
	('2018/03/04', 'diego leon', 'No Asistio', 'Camilo botonero', 'Tarde'),
	('2018/03/05', 'mario bolaños', 'Asistio', 'Camilo botonero', 'Tarde'),
	('2018/03/04', 'armando bolaños', 'No Asistio', 'Camilo botonero', 'Tarde'),
	('2018/03/04', 'amaya leon', 'No Asistio', 'Camilo botonero', 'Tarde'),
	('2018/03/04', 'andres leon', 'Asistio', 'Camilo botonero', 'Tarde'),
	('2018/03/04', 'pedro leon', 'Asistio', 'Camilo botonero', 'Tarde'),
	('2018/03/04', 'sebastian rojas', 'Asistio', 'sara chamsedine', 'Mañana'),
	('2018/03/04', 'felipe rojas', 'No Asistio', 'sara chamsedine', 'Mañana'),
	('2018/03/04', 'carlos rojas', 'No Asistio', 'sara chamsedine', 'Mañana'),
	('2018/03/12', 'fernado rojas', 'Asistio', 'sara chamsedine', 'Mañana'),
	('2018/03/05', 'andres rojas', 'No Asistio', 'sara chamsedine', 'Mañana'),
	('2018/03/09', 'david rojas', 'Asistio', 'sara chamsedine', 'Mañana'),
	('2018/04/22', 'mario bolaños', 'Asistio', 'Camilo botonero', 'Tarde'),
	('2018/04/22', 'diego leon', 'No Asistio', 'Camilo botonero', 'Tarde'),
	('2018/04/22', 'sebastian rojas', 'Asistio', 'Camilo botonero', 'Tarde'),
	('2018/04/22', 'armando bolaños', 'No Asistio', 'Camilo botonero', 'Tarde'),
	('2018/04/22', 'amaya leon', 'No Asistio', 'Camilo botonero', 'Tarde'),
	('2018/04/22', 'andres leon', 'Asistio', 'Camilo botonero', 'Tarde'),
	('2018/04/22', 'pedro leon', 'No Asistio', 'Camilo botonero', 'Tarde');
/*!40000 ALTER TABLE `asistance` ENABLE KEYS */;

-- Dumping structure for table sports_time.athele_register
CREATE TABLE IF NOT EXISTS `athele_register` (
  `Name` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `Password1` varchar(100) NOT NULL,
  `Identification_Card` varchar(100) DEFAULT NULL,
  `Coach` varchar(100) DEFAULT NULL,
  `Jornada` varchar(100) DEFAULT NULL,
  `Genre` varchar(100) DEFAULT NULL,
  `Born_Date` varchar(100) DEFAULT NULL,
  `Height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Cellphone` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Eps` varchar(100) DEFAULT NULL,
  `Emergency_Number` varchar(100) DEFAULT NULL,
  `Allergies` varchar(100) DEFAULT NULL,
  `Diseases` varchar(100) DEFAULT NULL,
  `FotoName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.athele_register: ~12 rows (approximately)
/*!40000 ALTER TABLE `athele_register` DISABLE KEYS */;
INSERT INTO `athele_register` (`Name`, `Lastname`, `Password1`, `Identification_Card`, `Coach`, `Jornada`, `Genre`, `Born_Date`, `Height`, `weight`, `Category`, `Cellphone`, `Role`, `Description`, `Eps`, `Emergency_Number`, `Allergies`, `Diseases`, `FotoName`) VALUES
	('mario', 'bolaños', '1', '1075682856', 'Camilo botonero', 'Tarde', 'masculino', '3434', '175', '67', 'profesional', '3212527612', '2', 'amigable', 'sura', '3115271381', 'polvo', 'rinitis', 'mario.jpg'),
	('diego', 'leon', '1234', '1075682856', 'Camilo botonero', 'Tarde', 'female', '21 abril del 1997', '175', '45', 'semi', '3212527612', '2', 'pedofilo', 'colsanitas', '3115271381', 'polvo', 'rinitis', 'diego.jpg'),
	('sebastian', 'rojas', '12345', '1075682856', 'Camilo botonero', 'Tarde', 'masculino', '3434', '175', '89', 'semi', '3212527612', '2', 'amigable', 'nueva eps', '3115271381', 'polvo', 'telegux2', 'sebas.jpg'),
	('felipe', 'rojas', 'ikkjj', '1075682856', 'sara chamsedine', 'Mañana', 'masculino', '3434', '175', '89', 'semi', '3212527612', '2', 'amigable', 'nueva eps', '3115271381', 'polvo', 'telegux2', NULL),
	('carlos', 'rojas', 'kkil', '1075682856', 'sara chamsedine', 'Mañana', 'masculino', '3434', '175', '89', 'semi', '3212527612', '2', 'amigable', 'nueva eps', '3115271381', 'polvo', 'telegux2', NULL),
	('armando', 'bolaños', 'okik', '1075682856', 'Camilo botonero', 'Tarde', 'masculino', '3434', '175', '67', 'profesional', '3212527612', '2', 'amigable', 'sura', '3115271381', 'polvo', 'rinitis', NULL),
	('fernado', 'rojas', 'ujk', '1075682856', 'sara chamsedine', 'Mañana', 'masculino', '3434', '175', '89', 'semi', '3212527612', '2', 'amigable', 'nueva eps', '3115271381', 'polvo', 'telegux2', NULL),
	('amaya', 'leon', 'wrra', '1075682856', 'Camilo botonero', 'Tarde', 'female', '21 abril del 1997', '175', '45', 'semi', '3212527612', '2', 'pedofilo', 'colsanitas', '3115271381', 'polvo', 'rinitis', NULL),
	('andres', 'rojas', 'yht', '1075682856', 'sara chamsedine', 'Mañana', 'masculino', '3434', '175', '89', 'semi', '3212527612', '2', 'amigable', 'nueva eps', '3115271381', 'polvo', 'telegux2', NULL),
	('andres', 'leon', 'yhu', '1075682856', 'Camilo botonero', 'Tarde', 'female', '21 abril del 1997', '175', '45', 'semi', '3212527612', '2', 'pedofilo', 'colsanitas', '3115271381', 'polvo', 'rinitis', NULL),
	('pedro', 'leon', 'ytgr', '1075682856', 'Camilo botonero', 'Tarde', 'female', '21 abril del 1997', '175', '45', 'semi', '3212527612', '2', 'pedofilo', 'colsanitas', '3115271381', 'polvo', 'rinitis', NULL),
	('david', 'rojas', 'yuio', '1075682856', 'sara chamsedine', 'Mañana', 'masculino', '3434', '175', '89', 'semi', '3212527612', '2', 'amigable', 'nueva eps', '3115271381', 'polvo', 'telegux2', NULL);
/*!40000 ALTER TABLE `athele_register` ENABLE KEYS */;

-- Dumping structure for table sports_time.coach_register
CREATE TABLE IF NOT EXISTS `coach_register` (
  `Name` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `Password1` varchar(100) NOT NULL,
  `Identification_Card` varchar(100) DEFAULT NULL,
  `Genre` varchar(100) DEFAULT NULL,
  `Born_Date` varchar(100) DEFAULT NULL,
  `Height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Cellphone` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Eps` varchar(100) DEFAULT NULL,
  `Emergency_Number` varchar(100) DEFAULT NULL,
  `Allergies` varchar(100) DEFAULT NULL,
  `Diseases` varchar(100) DEFAULT NULL,
  `FotoName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.coach_register: ~2 rows (approximately)
/*!40000 ALTER TABLE `coach_register` DISABLE KEYS */;
INSERT INTO `coach_register` (`Name`, `Lastname`, `Password1`, `Identification_Card`, `Genre`, `Born_Date`, `Height`, `weight`, `Category`, `Cellphone`, `Role`, `Description`, `Eps`, `Emergency_Number`, `Allergies`, `Diseases`, `FotoName`) VALUES
	('Camilo', 'botonero', '321', '1075682856', NULL, '21 abril del 1997', '175', '82', 'profesional', '3212527612', '1', 'amigable', 'nueva eps', '3115271381', 'polvo', 'rinitis', 'boto.jpg'),
	('sara', 'chamsedine', 'holis', '1075682856', 'female', '21 abril del 1997', '160', '56', 'profesional', '3212527612', '1', 'amigable', 'nueva eps', '3115271381', 'polvo', 'rinitis', 'sara.jpg');
/*!40000 ALTER TABLE `coach_register` ENABLE KEYS */;

-- Dumping structure for table sports_time.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `text` varchar(400) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.comments: ~0 rows (approximately)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `name`, `text`, `date`) VALUES
	('Camilo botonero', 'No hay clase', 'Buenos dias por motivos personales no habrá clase mañana', '2018/04/07');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table sports_time.comment_user
CREATE TABLE IF NOT EXISTS `comment_user` (
  `idcomment` varchar(50) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  `text` varchar(400) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.comment_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `comment_user` DISABLE KEYS */;
INSERT INTO `comment_user` (`idcomment`, `id`, `text`, `date`) VALUES
	('0', 'mario bolaños', 'listo a beber', '2018/04/08');
/*!40000 ALTER TABLE `comment_user` ENABLE KEYS */;

-- Dumping structure for table sports_time.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `title` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.events: ~0 rows (approximately)
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;

-- Dumping structure for table sports_time.requests
CREATE TABLE IF NOT EXISTS `requests` (
  `user` varchar(100) DEFAULT NULL,
  `destiny` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.requests: ~0 rows (approximately)
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` (`user`, `destiny`, `state`) VALUES
	('g', 'g', 'f');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;

-- Dumping structure for table sports_time.routing
CREATE TABLE IF NOT EXISTS `routing` (
  `Number` int(100) NOT NULL AUTO_INCREMENT,
  `Quantity` varchar(100) DEFAULT NULL,
  `Distance` varchar(100) DEFAULT NULL,
  `Style` varchar(100) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.routing: ~17 rows (approximately)
/*!40000 ALTER TABLE `routing` DISABLE KEYS */;
INSERT INTO `routing` (`Number`, `Quantity`, `Distance`, `Style`, `Date`) VALUES
	(34, '10', '100', 'Espalda', '2018/03/04'),
	(35, '20', '200', 'Libre', '2018/03/04'),
	(36, '30', '300', 'Pecho', '2018/03/04'),
	(37, '20', '400', 'Espalda', '2018/03/04'),
	(38, '40', '700', 'Libre', '2018/03/12'),
	(39, '67', '788', 'Pecho', '2018/03/04'),
	(40, '10', '200', 'Espalda', '2018/03/04'),
	(41, '10', '200', 'Espalda', '2018/03/05'),
	(42, '10', '200', 'Espalda', '2018/03/06'),
	(43, '40', '700', 'Libre', '2018/03/05'),
	(44, '67', '788', 'Pecho', '2018/03/06'),
	(69, '2', '100', 'Espalda', '2018/04/22'),
	(70, '1', '100', 'Espalda', '2018/04/22'),
	(71, '2', '400', 'Libre', '2018/04/22'),
	(72, '1', '400', 'Libre', '2018/04/22'),
	(73, '3', '900', 'Pecho', '2018/04/22'),
	(74, '2', '900', 'Pecho', '2018/04/22'),
	(75, '1', '900', 'Pecho', '2018/04/22');
/*!40000 ALTER TABLE `routing` ENABLE KEYS */;

-- Dumping structure for table sports_time.times
CREATE TABLE IF NOT EXISTS `times` (
  `ID_Time` int(100) DEFAULT NULL,
  `ID_Routing` int(100) DEFAULT NULL,
  `ID_Athele` varchar(100) DEFAULT NULL,
  `Time1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sports_time.times: ~63 rows (approximately)
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
INSERT INTO `times` (`ID_Time`, `ID_Routing`, `ID_Athele`, `Time1`) VALUES
	(34, 1, 'mario bolaños', '0:3:33:97'),
	(34, 1, 'andres leon', '0:4:34:40'),
	(34, 1, 'pedro leon', '0:3:00:40'),
	(35, 2, 'mario bolaños', '0:3:34:40'),
	(35, 2, 'andres leon', '0:3:34:40'),
	(35, 2, 'pedro leon', '0:3:34:40'),
	(36, 3, 'mario bolaños', '0:3:34:40'),
	(36, 3, 'andres leon', '0:3:34:40'),
	(36, 3, 'pedro leon', '0:3:34:40'),
	(37, 1, 'sebastian rojas', '0:6:34:40'),
	(37, 1, 'fernado rojas', '0:2:34:40'),
	(37, 1, 'david rojas', '0:1:34:40'),
	(38, 2, 'sebastian rojas', '0:3:34:40'),
	(38, 2, 'fernado rojas', '0:3:34:40'),
	(38, 2, 'david rojas', '0:3:34:40'),
	(39, 3, 'sebastian rojas', '0:3:34:40'),
	(39, 3, 'fernado rojas', '0:3:34:40'),
	(39, 3, 'david rojas', '0:3:34:40'),
	(34, 1, 'mario bolaños', '0:3:24:40'),
	(34, 1, 'mario bolaños', '0:2:34:40'),
	(34, 1, 'mario bolaños', '0:3:14:40'),
	(34, 1, 'mario bolaños', '0:2:54:40'),
	(34, 1, 'mario bolaños', '0:3:34:40'),
	(40, 2, 'mario bolaños', '0:1:34:40'),
	(40, 2, 'mario bolaños', '0:1:54:40'),
	(40, 2, 'mario bolaños', '0:1:14:40'),
	(44, 1, 'mario bolaños', '0:0:06:17'),
	(44, 1, 'diego leon', '0:0:05:03'),
	(44, 1, 'armando bolaños', '0:0:02:98'),
	(44, 1, 'amaya leon', '0:0:01:85'),
	(44, 1, 'mario bolaños', '0:0:06:42'),
	(44, 1, 'diego leon', '0:0:04:64'),
	(44, 1, 'armando bolaños', '0:0:02:88'),
	(44, 1, 'amaya leon', '0:0:01:96'),
	(44, 2, 'mario bolaños', '0:0:06:15'),
	(44, 2, 'diego leon', '0:0:04:16'),
	(44, 2, 'armando bolaños', '0:0:02:51'),
	(44, 2, 'amaya leon', '0:0:01:49'),
	(44, 2, 'mario bolaños', '0:0:05:89'),
	(44, 2, 'diego leon', '0:0:05:66'),
	(44, 2, 'armando bolaños', '0:0:05:14'),
	(44, 2, 'amaya leon', '0:0:04:44'),
	(69, 1, 'mario bolaños', '0:0:03:98'),
	(69, 1, 'sebastian rojas', '0:0:03:47'),
	(69, 1, 'andres leon', '0:0:03:44'),
	(70, 1, 'mario bolaños', '0:0:03:74'),
	(70, 1, 'sebastian rojas', '0:0:03:69'),
	(70, 1, 'andres leon', '0:0:04:02'),
	(71, 1, 'mario bolaños', '0:0:03:85'),
	(71, 1, 'sebastian rojas', '0:0:05:11'),
	(71, 1, 'andres leon', '0:0:03:33'),
	(72, 1, 'mario bolaños', '0:0:03:19'),
	(72, 1, 'sebastian rojas', '0:0:03:38'),
	(72, 1, 'andres leon', '0:0:03:54'),
	(73, 1, 'mario bolaños', '0:0:04:01'),
	(73, 1, 'sebastian rojas', '0:0:03:61'),
	(73, 1, 'andres leon', '0:0:03:54'),
	(74, 1, 'mario bolaños', '0:0:04:13'),
	(74, 1, 'sebastian rojas', '0:0:03:88'),
	(74, 1, 'andres leon', '0:0:03:70'),
	(75, 1, 'mario bolaños', '0:0:03:91'),
	(75, 1, 'sebastian rojas', '0:0:04:00'),
	(75, 1, 'andres leon', '0:0:03:81');
/*!40000 ALTER TABLE `times` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- Volcando estructura para tabla sports_time.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `ID_Evento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `Tipo` varchar(150) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `lugar` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_Evento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sports_time.eventos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` (`ID_Evento`, `nombre`, `Tipo`, `fecha`, `lugar`) VALUES
	(1, 'nacional', 'Interligas', '2018-04-15', 'Medellin'),
	(2, 'open aguar abiertas', 'open', '2018-04-20', 'Cali'),
	(3, 'open aguar abiertas', 'open', '2018-04-20', 'Cali');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
