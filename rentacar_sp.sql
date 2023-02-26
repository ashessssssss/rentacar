-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: rentacar2
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arreglos_vhc`
--

DROP TABLE IF EXISTS `arreglos_vhc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arreglos_vhc` (
  `cod_inc` int NOT NULL,
  `cod_tall` int NOT NULL,
  `arreglos_realizados` text NOT NULL,
  `arreglos_adicionales` text,
  `costo_arreglos` float NOT NULL,
  `fecha_arreglos` date NOT NULL,
  KEY `cod_inc` (`cod_inc`),
  KEY `cod_tall` (`cod_tall`),
  CONSTRAINT `arreglos_vhc_ibfk_1` FOREIGN KEY (`cod_inc`) REFERENCES `incidente` (`cod_inc`),
  CONSTRAINT `arreglos_vhc_ibfk_2` FOREIGN KEY (`cod_tall`) REFERENCES `taller_afiliado` (`cod_tall`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arreglos_vhc`
--

LOCK TABLES `arreglos_vhc` WRITE;
/*!40000 ALTER TABLE `arreglos_vhc` DISABLE KEYS */;
/*!40000 ALTER TABLE `arreglos_vhc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asociado`
--

DROP TABLE IF EXISTS `asociado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asociado` (
  `cod_asoc` int NOT NULL,
  `rnc_asoc` varchar(15) NOT NULL,
  `moneda_asoc` varchar(35) NOT NULL,
  `estado_asoc` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_per` int NOT NULL,
  PRIMARY KEY (`cod_asoc`),
  KEY `cod_per` (`cod_per`),
  CONSTRAINT `asociado_ibfk_1` FOREIGN KEY (`cod_per`) REFERENCES `persona` (`cod_per`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asociado`
--

LOCK TABLES `asociado` WRITE;
/*!40000 ALTER TABLE `asociado` DISABLE KEYS */;
/*!40000 ALTER TABLE `asociado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cod_cli` int NOT NULL,
  `num_lic` char(11) NOT NULL,
  `fecha_emision_lic` date NOT NULL,
  `fecha_expiracion_lic` date NOT NULL,
  `categoria_lic` int NOT NULL,
  `estado_cli` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_per` int NOT NULL,
  PRIMARY KEY (`cod_cli`),
  KEY `cod_per` (`cod_per`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`cod_per`) REFERENCES `persona` (`cod_per`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'01234567987','2022-03-21','2023-03-21',1,'ACTIVO',1),(2,'54378923489','2022-05-20','2023-06-20',1,'ACTIVO',4),(3,'13890923478','2022-06-10','2023-07-10',1,'INACTIVO',3),(4,'43578912389','2022-04-15','2023-05-15',1,'INACTIVO',2),(5,'24783812378','2022-03-18','2023-04-18',2,'INACTIVO',5);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_renta`
--

DROP TABLE IF EXISTS `cliente_renta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_renta` (
  `cod_rent` int NOT NULL,
  `cod_cli` int NOT NULL,
  KEY `cod_rent` (`cod_rent`),
  KEY `cod_cli` (`cod_cli`),
  CONSTRAINT `cliente_renta_ibfk_1` FOREIGN KEY (`cod_rent`) REFERENCES `renta` (`cod_rent`),
  CONSTRAINT `cliente_renta_ibfk_2` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_renta`
--

LOCK TABLES `cliente_renta` WRITE;
/*!40000 ALTER TABLE `cliente_renta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_renta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compania_seg`
--

DROP TABLE IF EXISTS `compania_seg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compania_seg` (
  `cod_comp` int NOT NULL,
  `nom_comp` varchar(50) NOT NULL,
  `telefono_comp` char(12) DEFAULT NULL,
  `correo_comp` varchar(50) DEFAULT NULL,
  `estado_comp` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `direccion_comp` text NOT NULL,
  `cod_provi` int NOT NULL,
  `cod_muni` int NOT NULL,
  `cod_sect` int NOT NULL,
  PRIMARY KEY (`cod_comp`),
  KEY `cod_provi` (`cod_provi`),
  KEY `cod_muni` (`cod_muni`),
  KEY `cod_sect` (`cod_sect`),
  CONSTRAINT `compania_seg_ibfk_1` FOREIGN KEY (`cod_provi`) REFERENCES `provincia` (`cod_provi`),
  CONSTRAINT `compania_seg_ibfk_2` FOREIGN KEY (`cod_muni`) REFERENCES `municipio` (`cod_muni`),
  CONSTRAINT `compania_seg_ibfk_3` FOREIGN KEY (`cod_sect`) REFERENCES `sector` (`cod_sect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compania_seg`
--

LOCK TABLES `compania_seg` WRITE;
/*!40000 ALTER TABLE `compania_seg` DISABLE KEYS */;
INSERT INTO `compania_seg` VALUES (1,'Seguros Pepín','809-412-1006','','ACTIVO','Avenida 27 de febrero, edificio corporacion corominas pepin, ensanche naco',1,1,1);
/*!40000 ALTER TABLE `compania_seg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_entrada_vh`
--

DROP TABLE IF EXISTS `det_entrada_vh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_entrada_vh` (
  `cod_entrada` int NOT NULL,
  `Cod_vh` int NOT NULL,
  `porc_a_pagar` varchar(5) DEFAULT NULL,
  `frecuencia_pago` varchar(20) NOT NULL,
  KEY `cod_entrada` (`cod_entrada`),
  KEY `Cod_vh` (`Cod_vh`),
  CONSTRAINT `det_entrada_vh_ibfk_1` FOREIGN KEY (`cod_entrada`) REFERENCES `entrada_vh` (`cod_entrada`),
  CONSTRAINT `det_entrada_vh_ibfk_2` FOREIGN KEY (`Cod_vh`) REFERENCES `vehiculo` (`Cod_vh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_entrada_vh`
--

LOCK TABLES `det_entrada_vh` WRITE;
/*!40000 ALTER TABLE `det_entrada_vh` DISABLE KEYS */;
/*!40000 ALTER TABLE `det_entrada_vh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_mantenimiento`
--

DROP TABLE IF EXISTS `det_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_mantenimiento` (
  `num_mantenimiento` int NOT NULL,
  `cod_tall` int NOT NULL,
  `costo_mant` float NOT NULL,
  `descripcion_mant` text NOT NULL,
  KEY `num_mantenimiento` (`num_mantenimiento`),
  KEY `cod_tall` (`cod_tall`),
  CONSTRAINT `det_mantenimiento_ibfk_1` FOREIGN KEY (`num_mantenimiento`) REFERENCES `mantenimiento_vh` (`num_mantenimiento`),
  CONSTRAINT `det_mantenimiento_ibfk_2` FOREIGN KEY (`cod_tall`) REFERENCES `taller_afiliado` (`cod_tall`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_mantenimiento`
--

LOCK TABLES `det_mantenimiento` WRITE;
/*!40000 ALTER TABLE `det_mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `det_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_nomina`
--

DROP TABLE IF EXISTS `det_nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_nomina` (
  `num_nom` int NOT NULL,
  `cod_emp` int NOT NULL,
  `monto_bruto` float NOT NULL,
  `fecha_pago` date NOT NULL,
  `descuento_ars` float NOT NULL,
  `descuento_afp` float NOT NULL,
  `descuento_arl` float NOT NULL,
  `tipo_descuento` varchar(25) NOT NULL,
  `incentivo_nom` float DEFAULT NULL,
  `monto_neto` float NOT NULL,
  KEY `num_nom` (`num_nom`),
  KEY `cod_emp` (`cod_emp`),
  CONSTRAINT `det_nomina_ibfk_1` FOREIGN KEY (`num_nom`) REFERENCES `nomina` (`num_nom`),
  CONSTRAINT `det_nomina_ibfk_2` FOREIGN KEY (`cod_emp`) REFERENCES `empleado` (`cod_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_nomina`
--

LOCK TABLES `det_nomina` WRITE;
/*!40000 ALTER TABLE `det_nomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `det_nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_seguro`
--

DROP TABLE IF EXISTS `det_seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_seguro` (
  `cod_seg` int NOT NULL,
  `Cod_vh` int NOT NULL,
  KEY `cod_seg` (`cod_seg`),
  KEY `Cod_vh` (`Cod_vh`),
  CONSTRAINT `det_seguro_ibfk_1` FOREIGN KEY (`cod_seg`) REFERENCES `seguro_vh` (`cod_seg`),
  CONSTRAINT `det_seguro_ibfk_2` FOREIGN KEY (`Cod_vh`) REFERENCES `vehiculo` (`Cod_vh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_seguro`
--

LOCK TABLES `det_seguro` WRITE;
/*!40000 ALTER TABLE `det_seguro` DISABLE KEYS */;
/*!40000 ALTER TABLE `det_seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_fact`
--

DROP TABLE IF EXISTS `detalle_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_fact` (
  `num_fact` int NOT NULL,
  `num_pagorent` int NOT NULL,
  `descripcion_fact` text NOT NULL,
  `monto_a_pagar` float NOT NULL,
  `itbis_fact` float NOT NULL,
  `descuentos_espec` float DEFAULT NULL,
  KEY `num_fact` (`num_fact`),
  KEY `num_pagorent` (`num_pagorent`),
  CONSTRAINT `detalle_fact_ibfk_1` FOREIGN KEY (`num_fact`) REFERENCES `factura_rent` (`num_fact`),
  CONSTRAINT `detalle_fact_ibfk_2` FOREIGN KEY (`num_pagorent`) REFERENCES `pago_rent` (`num_pagorent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_fact`
--

LOCK TABLES `detalle_fact` WRITE;
/*!40000 ALTER TABLE `detalle_fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion` (
  `num_pagorent` int NOT NULL,
  `num_fact` int NOT NULL,
  `porcentaje_dev` varchar(5) NOT NULL,
  `monto_dev` float NOT NULL,
  `fecha_dev` date NOT NULL,
  `motivo_dev` text NOT NULL,
  KEY `num_pagorent` (`num_pagorent`),
  KEY `num_fact` (`num_fact`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`num_pagorent`) REFERENCES `pago_rent` (`num_pagorent`),
  CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`num_fact`) REFERENCES `factura_rent` (`num_fact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion`
--

LOCK TABLES `devolucion` WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `cod_emp` int NOT NULL,
  `fecha_ingreso_emp` date NOT NULL,
  `fecha_salida_emp` date DEFAULT NULL,
  `estado_emp` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_per` int NOT NULL,
  `cod_puesto` int NOT NULL,
  PRIMARY KEY (`cod_emp`),
  KEY `cod_per` (`cod_per`),
  KEY `cod_puesto` (`cod_puesto`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cod_per`) REFERENCES `persona` (`cod_per`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`cod_puesto`) REFERENCES `puesto_emp` (`cod_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_vh`
--

DROP TABLE IF EXISTS `entrada_vh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_vh` (
  `cod_entrada` int NOT NULL,
  `ncf_entrada` varchar(20) NOT NULL,
  `tipo_entrada` varchar(15) NOT NULL,
  `fecha_entrada_vh` date NOT NULL,
  `fecha_dev_vh` date DEFAULT NULL,
  `cod_asoc` int NOT NULL,
  PRIMARY KEY (`cod_entrada`),
  KEY `cod_asoc` (`cod_asoc`),
  CONSTRAINT `entrada_vh_ibfk_1` FOREIGN KEY (`cod_asoc`) REFERENCES `asociado` (`cod_asoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_vh`
--

LOCK TABLES `entrada_vh` WRITE;
/*!40000 ALTER TABLE `entrada_vh` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_vh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_rent`
--

DROP TABLE IF EXISTS `factura_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_rent` (
  `num_fact` int NOT NULL,
  `fecha_hora_fact` datetime NOT NULL,
  `tipo_fact` varchar(50) NOT NULL,
  `rnc_fact` varchar(15) NOT NULL,
  `ncf_fact` varchar(20) DEFAULT NULL,
  `cod_rent` int NOT NULL,
  `cod_cli` int NOT NULL,
  PRIMARY KEY (`num_fact`),
  KEY `cod_rent` (`cod_rent`),
  KEY `cod_cli` (`cod_cli`),
  CONSTRAINT `factura_rent_ibfk_1` FOREIGN KEY (`cod_rent`) REFERENCES `renta` (`cod_rent`),
  CONSTRAINT `factura_rent_ibfk_2` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_rent`
--

LOCK TABLES `factura_rent` WRITE;
/*!40000 ALTER TABLE `factura_rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario_datos_vehiculo`
--

DROP TABLE IF EXISTS `formulario_datos_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario_datos_vehiculo` (
  `num_form_vhc` int NOT NULL,
  `fecha_hr_form` datetime NOT NULL,
  `estado_general_vhc` varchar(45) NOT NULL,
  PRIMARY KEY (`num_form_vhc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario_datos_vehiculo`
--

LOCK TABLES `formulario_datos_vehiculo` WRITE;
/*!40000 ALTER TABLE `formulario_datos_vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario_datos_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `cod_horario` int NOT NULL,
  `tanda_hor` varchar(25) NOT NULL,
  `hora_inico` time NOT NULL,
  `hora_finalizacion` time NOT NULL,
  `estado_hr` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_emp`
--

DROP TABLE IF EXISTS `horario_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_emp` (
  `cod_horario` int NOT NULL,
  `cod_emp` int NOT NULL,
  KEY `cod_horario` (`cod_horario`),
  KEY `cod_emp` (`cod_emp`),
  CONSTRAINT `horario_emp_ibfk_1` FOREIGN KEY (`cod_horario`) REFERENCES `horario` (`cod_horario`),
  CONSTRAINT `horario_emp_ibfk_2` FOREIGN KEY (`cod_emp`) REFERENCES `empleado` (`cod_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_emp`
--

LOCK TABLES `horario_emp` WRITE;
/*!40000 ALTER TABLE `horario_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidente`
--

DROP TABLE IF EXISTS `incidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidente` (
  `cod_inc` int NOT NULL,
  `fecha_inc` date NOT NULL,
  `descripcion_inc` text NOT NULL,
  `tipo_inc` varchar(25) NOT NULL,
  `estado_vh` varchar(30) NOT NULL,
  `cotizacion_daños` text,
  `costo_daños` float DEFAULT NULL,
  `dias_excedidos` int DEFAULT NULL,
  `costo_exc_dias` float DEFAULT NULL,
  `costo_deducible` float NOT NULL,
  `cod_rent` int NOT NULL,
  `cod_cli` int NOT NULL,
  PRIMARY KEY (`cod_inc`),
  KEY `cod_rent` (`cod_rent`),
  KEY `cod_cli` (`cod_cli`),
  CONSTRAINT `incidente_ibfk_1` FOREIGN KEY (`cod_rent`) REFERENCES `renta` (`cod_rent`),
  CONSTRAINT `incidente_ibfk_2` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidente`
--

LOCK TABLES `incidente` WRITE;
/*!40000 ALTER TABLE `incidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento_vh`
--

DROP TABLE IF EXISTS `mantenimiento_vh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento_vh` (
  `num_mantenimiento` int NOT NULL,
  `tipo_mant` varchar(30) NOT NULL,
  `fecha_mant` date NOT NULL,
  `Cod_vh` int NOT NULL,
  PRIMARY KEY (`num_mantenimiento`),
  KEY `Cod_vh` (`Cod_vh`),
  CONSTRAINT `mantenimiento_vh_ibfk_1` FOREIGN KEY (`Cod_vh`) REFERENCES `vehiculo` (`Cod_vh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento_vh`
--

LOCK TABLES `mantenimiento_vh` WRITE;
/*!40000 ALTER TABLE `mantenimiento_vh` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento_vh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca_vhc`
--

DROP TABLE IF EXISTS `marca_vhc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca_vhc` (
  `cod_marca` int NOT NULL,
  `nom_marca` varchar(40) NOT NULL,
  `estado_marca` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca_vhc`
--

LOCK TABLES `marca_vhc` WRITE;
/*!40000 ALTER TABLE `marca_vhc` DISABLE KEYS */;
INSERT INTO `marca_vhc` VALUES (1,'Ford','ACTIVO'),(2,'Bugatti','ACTIVO'),(3,'Lamborghini','ACTIVO');
/*!40000 ALTER TABLE `marca_vhc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `cod_muni` int NOT NULL,
  `nom_muni` varchar(100) NOT NULL,
  `estado_muni` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_provi` int NOT NULL,
  PRIMARY KEY (`cod_muni`),
  KEY `cod_provi` (`cod_provi`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`cod_provi`) REFERENCES `provincia` (`cod_provi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Los pepines','ACTIVO',1),(2,'Santo Domingo Este','ACTIVO',2),(3,'Moca','ACTIVO',3);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina` (
  `num_nom` int NOT NULL,
  `fecha_nom` date NOT NULL,
  `dias_lab` int NOT NULL,
  `estado_nom` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`num_nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_rent`
--

DROP TABLE IF EXISTS `pago_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_rent` (
  `num_pagorent` int NOT NULL,
  `tipo_pago` varchar(20) NOT NULL,
  `forma_de_pago` varchar(30) NOT NULL,
  `moneda_pag` varchar(30) NOT NULL,
  `monto_a_pagar` float NOT NULL,
  `cod_cli` int NOT NULL,
  PRIMARY KEY (`num_pagorent`),
  KEY `cod_cli` (`cod_cli`),
  CONSTRAINT `pago_rent_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_rent`
--

LOCK TABLES `pago_rent` WRITE;
/*!40000 ALTER TABLE `pago_rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `cod_pais` int NOT NULL,
  `nom_pais` varchar(75) NOT NULL,
  `estado_pais` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'República Dominicana','ACTIVO'),(2,'Estados Unidos','ACTIVO');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `cod_per` int NOT NULL,
  `cedula_per` char(13) NOT NULL,
  `nombres_per` varchar(100) NOT NULL,
  `apellidos_per` varchar(100) NOT NULL,
  `sexo_per` varchar(6) NOT NULL,
  `fecha_de_nac_per` date NOT NULL,
  `telefono_per` char(12) DEFAULT NULL,
  `celular_per` char(12) DEFAULT NULL,
  `correo_elec_per` varchar(75) DEFAULT NULL,
  `pasaporte_per` char(9) DEFAULT NULL,
  `estado_per` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `direccion_per` text,
  `cod_sect` int NOT NULL,
  `cod_muni` int NOT NULL,
  `cod_provi` int NOT NULL,
  `cod_pais` int NOT NULL,
  PRIMARY KEY (`cod_per`),
  KEY `cod_sect` (`cod_sect`),
  KEY `cod_muni` (`cod_muni`),
  KEY `cod_provi` (`cod_provi`),
  KEY `cod_pais` (`cod_pais`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`cod_sect`) REFERENCES `sector` (`cod_sect`),
  CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`cod_muni`) REFERENCES `municipio` (`cod_muni`),
  CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`cod_provi`) REFERENCES `provincia` (`cod_provi`),
  CONSTRAINT `persona_ibfk_4` FOREIGN KEY (`cod_pais`) REFERENCES `pais` (`cod_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'001-0000000-2','Maria','Perez','FEM','1992-12-25','809-582-5993','','','','ACTIVO','Pueblo Nuevo, c. 17 de abril',1,1,1,1),(2,'001-0678000-3','Ramon','Guzman','MASC','1982-02-25','809-586-5233','','ramonguzman@gmail.com','','ACTIVO','Pueblo Nuevo, c. anacaona',1,1,1,1),(3,'001-4250000-1','Rafaela','Peralta','FEM','1993-01-01','809-612-2854','829-987-6933','','','ACTIVO','Pueblo Nuevo, c. rodriguez obijo',1,1,1,1),(4,'002-5762367-4','Danilo','Martin','MASC','1951-11-10','829-132-8364','','','','ACTIVO','Ensanche la paz, C. heroes de luperon',2,2,2,1),(5,'004-7980912-8','Julia','Mustard','FEM','1989-12-01','','','','ACH09321C','ACTIVO','C. jaquez, esq. manuel valerio',3,3,3,1),(6,'034-7982712-8','Reina','Castillo','FEM','1987-12-01','809-621-3243','','','','ACTIVO','C. jaquez, esq. manuel valerio',3,3,3,1),(7,'004-7980912-8','Rafael','Ferrero','MASC','1992-01-01','','','','KHJ12341D','ACTIVO','C. jaquez, esq. manuel valerio',3,3,3,1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `cod_provi` int NOT NULL,
  `nom_provi` varchar(100) NOT NULL,
  `estado_prov` varchar(15) NOT NULL DEFAULT 'ACTIVO ',
  PRIMARY KEY (`cod_provi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Santiago','ACTIVO'),(2,'Santo Domingo','ACTIVO'),(3,'Espaillat','ACTIVO');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto_emp`
--

DROP TABLE IF EXISTS `puesto_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto_emp` (
  `cod_puesto` int NOT NULL,
  `nomb_puest` varchar(50) NOT NULL,
  `estado_puest` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto_emp`
--

LOCK TABLES `puesto_emp` WRITE;
/*!40000 ALTER TABLE `puesto_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renta`
--

DROP TABLE IF EXISTS `renta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renta` (
  `cod_rent` int NOT NULL,
  `dias_solicitados_rent` int NOT NULL,
  `fecha_y_hora_entrega_rent` datetime NOT NULL,
  `fecha_devolucion_rent` date NOT NULL,
  `precio_dia_rent` float NOT NULL,
  `maximo_dias_rent` int NOT NULL,
  `minimo_dias_rent` int NOT NULL,
  `cantidad_conductores_rent` int NOT NULL,
  `estado_rent` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `Cod_vh` int NOT NULL,
  `precio_total_rent` float DEFAULT NULL,
  PRIMARY KEY (`cod_rent`),
  KEY `Cod_vh` (`Cod_vh`),
  CONSTRAINT `renta_ibfk_1` FOREIGN KEY (`Cod_vh`) REFERENCES `vehiculo` (`Cod_vh`),
  CONSTRAINT `renta_chk_1` CHECK (((`cantidad_conductores_rent` = 1) or (0 <> 2)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renta`
--

LOCK TABLES `renta` WRITE;
/*!40000 ALTER TABLE `renta` DISABLE KEYS */;
/*!40000 ALTER TABLE `renta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `cod_sect` int NOT NULL,
  `nom_sect` varchar(100) NOT NULL,
  `estado_sect` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_muni` int NOT NULL,
  PRIMARY KEY (`cod_sect`),
  KEY `cod_muni` (`cod_muni`),
  CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`cod_muni`) REFERENCES `municipio` (`cod_muni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Pueblo Nuevo','ACTIVO',1),(2,'Los Alcarrizos','ACTIVO',2),(3,'Villa Olga','ACTIVO',3);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro_vh`
--

DROP TABLE IF EXISTS `seguro_vh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_vh` (
  `cod_seg` int NOT NULL,
  `fecha_emision_seg` date NOT NULL,
  `fecha_renovacion_seg` date NOT NULL,
  `poliza_seg` char(9) NOT NULL,
  `estado_seg` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_comp` int NOT NULL,
  `cod_tipo_seg` int NOT NULL,
  PRIMARY KEY (`cod_seg`),
  KEY `cod_comp` (`cod_comp`),
  KEY `cod_tipo_seg` (`cod_tipo_seg`),
  CONSTRAINT `seguro_vh_ibfk_1` FOREIGN KEY (`cod_comp`) REFERENCES `compania_seg` (`cod_comp`),
  CONSTRAINT `seguro_vh_ibfk_2` FOREIGN KEY (`cod_tipo_seg`) REFERENCES `tipo_seg` (`cod_tipo_seg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro_vh`
--

LOCK TABLES `seguro_vh` WRITE;
/*!40000 ALTER TABLE `seguro_vh` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguro_vh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller_afiliado`
--

DROP TABLE IF EXISTS `taller_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller_afiliado` (
  `cod_tall` int NOT NULL,
  `nombre_tall` varchar(75) NOT NULL,
  `telefono_tall` char(12) DEFAULT NULL,
  `correo_tall` varchar(75) DEFAULT NULL,
  `estado_tall` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `direccion_tall` text NOT NULL,
  `cod_sect` int NOT NULL,
  `cod_muni` int NOT NULL,
  `cod_provi` int NOT NULL,
  PRIMARY KEY (`cod_tall`),
  KEY `cod_sect` (`cod_sect`),
  KEY `cod_muni` (`cod_muni`),
  KEY `cod_provi` (`cod_provi`),
  CONSTRAINT `taller_afiliado_ibfk_1` FOREIGN KEY (`cod_sect`) REFERENCES `sector` (`cod_sect`),
  CONSTRAINT `taller_afiliado_ibfk_2` FOREIGN KEY (`cod_muni`) REFERENCES `municipio` (`cod_muni`),
  CONSTRAINT `taller_afiliado_ibfk_3` FOREIGN KEY (`cod_provi`) REFERENCES `provincia` (`cod_provi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller_afiliado`
--

LOCK TABLES `taller_afiliado` WRITE;
/*!40000 ALTER TABLE `taller_afiliado` DISABLE KEYS */;
/*!40000 ALTER TABLE `taller_afiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_seg`
--

DROP TABLE IF EXISTS `tipo_seg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_seg` (
  `cod_tipo_seg` int NOT NULL,
  `nom_tipo_seg` varchar(20) NOT NULL,
  `coberturas_tipo_seg` text NOT NULL,
  `estado_tipo_seg` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_comp` int NOT NULL,
  PRIMARY KEY (`cod_tipo_seg`),
  KEY `cod_comp` (`cod_comp`),
  CONSTRAINT `tipo_seg_ibfk_1` FOREIGN KEY (`cod_comp`) REFERENCES `compania_seg` (`cod_comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_seg`
--

LOCK TABLES `tipo_seg` WRITE;
/*!40000 ALTER TABLE `tipo_seg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_seg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Cod_usu` int NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Nombre_usu` varchar(50) NOT NULL,
  `Apellido_usu` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `Cod_vh` int NOT NULL,
  `matricula_vh` varchar(15) NOT NULL,
  `ano_de_salida_vh` date NOT NULL,
  `distintivo_vh` text,
  `categoria_vh` varchar(20) NOT NULL,
  `estado_vh` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cod_marca` int NOT NULL,
  PRIMARY KEY (`Cod_vh`),
  KEY `cod_marca` (`cod_marca`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`cod_marca`) REFERENCES `marca_vhc` (`cod_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-26 19:27:06
