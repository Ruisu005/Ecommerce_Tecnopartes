-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3309
-- Tiempo de generación: 10-07-2024 a las 00:46:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(1, 9, 1, 4),
(3, 9, 4, 6),
(4, 9, 12, 2),
(5, 13, 8, 1),
(6, 13, 7, 1),
(7, 13, 3, 1),
(8, 13, 13, 1),
(9, 13, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Tarjetas Madres', 'motherboard'),
(2, 'Procesadores', 'cpu'),
(3, 'Almacenamiento', 'storage'),
(4, 'Memorias Ram', 'ram'),
(5, 'Fuentes de Poder', 'psu'),
(6, 'Gabinetes', 'cabinets'),
(7, 'Tarjetas Graficas', 'gpu'),
(8, 'Ventiladores', 'fans'),
(9, 'Enfriamiento de Aire', 'air-cooling'),
(10, 'Enfriamiento Liquido', 'liquid-cooling');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(12, 2, 'Intel Core i9-13900K', '<p>Procesador de alta gama con 24 n&uacute;cleos (8 P-cores y 16 E-cores) y 32 hilos.</p>\r\n\r\n<p>Ideal para tareas exigentes como gaming y edici&oacute;n de video.</p>\r\n', 'intel-core-i9-13900k', 3487, 'intel-core-i9-13900k_1718577407.jpg', '2024-06-17', 2),
(27, 2, 'Amd Ryzen 3 3200g', '<p>Es ideal para jugadores y creadores de contenido que requieran un instrumento de gran ejecuci&oacute;n.</p>\r\n\r\n<p>Memoria cach&eacute; de 4 MB, r&aacute;pida y vol&aacute;til.</p>\r\n\r\n<p>Procesador gr&aacute;fico Radeon Vega 8 Graphics.</p>\r\n\r\n<p>Soporta memoria RAM DDR4.</p>\r\n\r\n<p>Su potencia es de 65 W.</p>\r\n\r\n<p>Cuenta con 4 hilos que favorecen la ejecuci&oacute;n de m&uacute;ltiples programas a la vez.</p>\r\n\r\n<p>Producto en empaque original.</p>\r\n\r\n<p>Procesador innovador desarrollado bajo altos est&aacute;ndares de calidad.</p>\r\n\r\n<p>Z&oacute;calos compatibles: AM4</p>\r\n', 'amd-ryzen-3-3200g', 1449, 'amd-ryzen-3-3200g.jpg', '2024-07-10', 1),
(28, 3, 'Samsung 970 EVO Plus 1TB NVMe M.2', '<p>Unidad SSD de alta velocidad para almacenamiento r&aacute;pido y eficiente.</p>\r\n\r\n<ul>\r\n	<li>1 TB, SATA 2.5&quot;</li>\r\n	<li>550 MB/s lectura</li>\r\n	<li>520 MB/s escritura</li>\r\n</ul>\r\n', 'samsung-970-evo-plus-1tb-nvme-m-2', 1899, 'samsung-970-evo-plus-1tb-nvme-m-2.png', '0000-00-00', 0),
(29, 3, 'WD Black SN750 1TB NVMe M.2', '<p>SSD de alto rendimiento para juegos y aplicaciones.</p>\r\n\r\n<ul>\r\n	<li>1 TB, NVMe M.2</li>\r\n	<li>3430 MB/s lectura</li>\r\n	<li>3000 MB/s escritura</li>\r\n</ul>\r\n', 'wd-black-sn750-1tb-nvme-m-2', 1218, 'wd-black-sn750-1tb-nvme-m-2.png', '0000-00-00', 0),
(30, 3, 'Crucial MX500 1TB SATA 2.5\"', '<p>SSD fiable y r&aacute;pido para almacenamiento general.</p>\r\n\r\n<ul>\r\n	<li>1 TB, SATA 2.5&quot;</li>\r\n	<li>560 MB/s lectura</li>\r\n	<li>510 MB/s escritura</li>\r\n</ul>\r\n', 'crucial-mx500-1tb-sata-2-5', 1799, 'crucial-mx500-1tb-sata-2-5.png', '0000-00-00', 0),
(31, 3, 'Kingston A2000 1TB NVMe M.2', '<p>SSD econ&oacute;mico y r&aacute;pido para mejorar el rendimiento del sistema.</p>\r\n\r\n<ul>\r\n	<li>1 TB, NVMe M.2</li>\r\n	<li>2200 MB/s lectura</li>\r\n	<li>2000 MB/s escritura</li>\r\n</ul>\r\n', 'kingston-a2000-1tb-nvme-m-2', 3559, 'kingston-a2000-1tb-nvme-m-2.png', '0000-00-00', 0),
(32, 3, 'Seagate Barracuda 2TB HDD', '<p>Disco duro de alta capacidad para almacenamiento masivo.</p>\r\n\r\n<ul>\r\n	<li>2 TB, SATA 3.5&quot;</li>\r\n	<li>7200 RPM</li>\r\n	<li>256 MB cach&eacute;</li>\r\n</ul>\r\n', 'seagate-barracuda-2tb-hdd', 1078, 'seagate-barracuda-2tb-hdd.png', '0000-00-00', 0),
(33, 3, 'Samsung 860 EVO 1TB SATA 2.5\"', '<p>SSD de alto rendimiento para almacenamiento r&aacute;pido.</p>\r\n\r\n<ul>\r\n	<li>1 TB, SATA 2.5&quot;</li>\r\n	<li>550 MB/s lectura</li>\r\n	<li>520 MB/s escritura</li>\r\n</ul>\r\n', 'samsung-860-evo-1tb-sata-2-5', 4399, 'samsung-860-evo-1tb-sata-2-5.png', '0000-00-00', 0),
(34, 3, 'ADATA XPG SX8200 Pro 1TB NVMe M.2', '<p>SSD r&aacute;pido y fiable para juegos y aplicaciones.</p>\r\n\r\n<ul>\r\n	<li>1 TB, NVMe M.2</li>\r\n	<li>3500 MB/s lectura</li>\r\n	<li>3000 MB/s escritura</li>\r\n</ul>\r\n', 'adata-xpg-sx8200-pro-1tb-nvme-m-2', 1743, 'adata-xpg-sx8200-pro-1tb-nvme-m-2.png', '0000-00-00', 0),
(35, 3, 'Toshiba X300 4TB HDD', '<p>Disco duro de alta capacidad para almacenamiento masivo.</p>\r\n\r\n<ul>\r\n	<li>4 TB, SATA 3.5&quot;</li>\r\n	<li>7200 RPM</li>\r\n	<li>128 MB cach&eacute;</li>\r\n</ul>\r\n', 'toshiba-x300-4tb-hdd', 3299, 'toshiba-x300-4tb-hdd.png', '0000-00-00', 0),
(36, 3, 'Intel 660p 1TB NVMe M.2', '<p>SSD econ&oacute;mico con buen rendimiento para uso general.</p>\r\n\r\n<ul>\r\n	<li>1 TB, NVMe M.2</li>\r\n	<li>1800 MB/s lectura</li>\r\n	<li>1800 MB/s escritura</li>\r\n</ul>\r\n', 'intel-660p-1tb-nvme-m-2', 1987, 'intel-660p-1tb-nvme-m-2.png', '0000-00-00', 0),
(37, 3, 'Crucial P1 1TB NVMe M.2', '<p>SSD de buena relaci&oacute;n calidad-precio para mejorar el rendimiento del sistema.</p>\r\n\r\n<ul>\r\n	<li>1 TB, NVMe M.2</li>\r\n	<li>2000 MB/s lectura</li>\r\n	<li>1700 MB/s escritura</li>\r\n</ul>\r\n', 'crucial-p1-1tb-nvme-m-2', 2999, 'crucial-p1-1tb-nvme-m-2.png', '0000-00-00', 0),
(38, 9, 'Cooler Master Hyper 212 EVO', '<p>Enfriador de aire para CPU con rendimiento eficiente y dise&ntilde;o de torre.</p>\r\n\r\n<ul>\r\n	<li>600-2000 RPM</li>\r\n	<li>9-36 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'cooler-master-hyper-212-evo', 694, 'cooler-master-hyper-212-evo.png', '0000-00-00', 0),
(39, 9, 'Noctua NH-D15', '<p>Enfriador de aire de alto rendimiento con doble torre y doble ventilador.</p>\r\n\r\n<ul>\r\n	<li>1500 RPM</li>\r\n	<li>24.6 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'noctua-nh-d15', 2599, 'noctua-nh-d15.png', '0000-00-00', 0),
(40, 9, 'be quiet! Dark Rock Pro 4', '<p>Enfriador de aire silencioso y de alto rendimiento.</p>\r\n\r\n<ul>\r\n	<li>1200 RPM</li>\r\n	<li>24.3 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'be-quiet-dark-rock-pro-4', 2118, 'be-quiet-dark-rock-pro-4.png', '0000-00-00', 0),
(41, 9, 'DeepCool Gammaxx 400', '<p>Enfriador de aire econ&oacute;mico y eficiente.</p>\r\n\r\n<ul>\r\n	<li>900-1500 RPM</li>\r\n	<li>21.4-32.1 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 'deepcool-gammaxx-400', 599, 'deepcool-gammaxx-400.png', '0000-00-00', 0),
(42, 9, 'Cryorig H7', '<p>Enfriador de aire compacto y eficiente.</p>\r\n\r\n<ul>\r\n	<li>300-1600 RPM</li>\r\n	<li>25 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'cryorig-h7', 651, 'cryorig-h7.png', '0000-00-00', 0),
(43, 9, 'Thermaltake UX200', '<p>Enfriador de aire con iluminaci&oacute;n RGB y buen rendimiento.</p>\r\n\r\n<ul>\r\n	<li>300-1500 RPM</li>\r\n	<li>26.33 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'thermaltake-ux200', 779, 'thermaltake-ux200.png', '0000-00-00', 0),
(44, 9, 'Scythe Fuma 2', '<p>Enfriador de aire de doble torre y doble ventilador.</p>\r\n\r\n<ul>\r\n	<li>300-1200 RPM</li>\r\n	<li>23 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'scythe-fuma-2', 4425, 'scythe-fuma-2.png', '0000-00-00', 0),
(45, 9, 'Arctic Freezer 34 eSports DUO', '<p>Enfriador de aire con doble ventilador para mayor eficiencia.</p>\r\n\r\n<ul>\r\n	<li>200-2100 RPM</li>\r\n	<li>28 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'arctic-freezer-34-esports-duo', 1175, 'arctic-freezer-34-esports-duo.png', '0000-00-00', 0),
(46, 9, 'Noctua NH-U12S', '<p>Enfriador de aire compacto y silencioso.</p>\r\n\r\n<ul>\r\n	<li>1500 RPM</li>\r\n	<li>22.4 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'noctua-nh-u12s', 1729, 'noctua-nh-u12s.png', '0000-00-00', 0),
(47, 9, 'Cooler Master MasterAir MA410M', '<p>Enfriador de aire con iluminaci&oacute;n RGB y buen rendimiento.</p>\r\n\r\n<ul>\r\n	<li>650-1800 RPM</li>\r\n	<li>31 dBA</li>\r\n	<li>Compatibilidad con Intel y AMD</li>\r\n</ul>\r\n', 'cooler-master-masterair-ma410m', 1159, 'cooler-master-masterair-ma410m.png', '0000-00-00', 0),
(48, 10, 'Corsair Hydro Series H100i RGB PLATINUM', '<p>Sistema de enfriamiento l&iacute;quido todo en uno con iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 240 mm</li>\r\n	<li>400-2400 RPM</li>\r\n	<li>37 dBA</li>\r\n</ul>\r\n', 'corsair-hydro-series-h100i-rgb-platinum', 5429, 'corsair-hydro-series-h100i-rgb-platinum.png', '0000-00-00', 0),
(49, 10, 'NZXT Kraken X63', '<p>Sistema de enfriamiento l&iacute;quido de alto rendimiento con iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 280 mm</li>\r\n	<li>500-1800 RPM</li>\r\n	<li>38 dBA</li>\r\n</ul>\r\n', 'nzxt-kraken-x63', 2999, 'nzxt-kraken-x63.png', '0000-00-00', 0),
(50, 10, 'Cooler Master MasterLiquid ML240R RGB', '<p>Enfriamiento l&iacute;quido con iluminaci&oacute;n RGB y buen rendimiento.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 240 mm</li>\r\n	<li>650-2000 RPM</li>\r\n	<li>30 dBA</li>\r\n</ul>\r\n', 'cooler-master-masterliquid-ml240r-rgb', 2599, 'cooler-master-masterliquid-ml240r-rgb.png', '0000-00-00', 0),
(51, 10, 'EVGA CLC 280', '<p>Enfriamiento l&iacute;quido de alto rendimiento para CPUs exigentes.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 280 mm</li>\r\n	<li>600-2200 RPM</li>\r\n	<li>39.5 dBA</li>\r\n</ul>\r\n', 'evga-clc-280', 4838, 'evga-clc-280.png', '0000-00-00', 0),
(52, 10, 'Thermaltake Floe Riing RGB 360 TT Premium', '<p>Enfriamiento l&iacute;quido con radiador de 360 mm e iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 360 mm</li>\r\n	<li>500-1400 RPM</li>\r\n	<li>25 dBA</li>\r\n</ul>\r\n', 'thermaltake-floe-riing-rgb-360-tt-premium', 3746, 'thermaltake-floe-riing-rgb-360-tt-premium.png', '0000-00-00', 0),
(53, 10, 'Corsair Hydro Series H150i PRO RGB', '<p>Sistema de enfriamiento l&iacute;quido con radiador de 360 mm e iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 360 mm</li>\r\n	<li>400-1600 RPM</li>\r\n	<li>25 dBA</li>\r\n</ul>\r\n', 'corsair-hydro-series-h150i-pro-rgb', 2829, 'corsair-hydro-series-h150i-pro-rgb.png', '0000-00-00', 0),
(54, 10, 'DeepCool Castle 360EX', '<p>Enfriamiento l&iacute;quido con dise&ntilde;o elegante e iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 360 mm</li>\r\n	<li>500-1800 RPM</li>\r\n	<li>32.1 dBA</li>\r\n</ul>\r\n', 'deepcool-castle-360ex', 1929, 'deepcool-castle-360ex.png', '0000-00-00', 0),
(55, 10, 'Asus ROG Strix LC 240 RGB', '<p>Sistema de enfriamiento l&iacute;quido con radiador de 240 mm e iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 240 mm</li>\r\n	<li>800-2500 RPM</li>\r\n	<li>37.6 dBA</li>\r\n</ul>\r\n', 'asus-rog-strix-lc-240-rgb', 3450, 'asus-rog-strix-lc-240-rgb.png', '0000-00-00', 0),
(56, 10, 'Cooler Master MasterLiquid ML360R RGB', '<p>Enfriamiento l&iacute;quido con radiador de 360 mm e iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 360 mm</li>\r\n	<li>650-2000 RPM</li>\r\n	<li>30 dBA</li>\r\n</ul>\r\n', 'cooler-master-masterliquid-ml360r-rgb', 1994, 'cooler-master-masterliquid-ml360r-rgb.png', '0000-00-00', 0),
(57, 10, 'Arctic Liquid Freezer II 280', '<p>Sistema de enfriamiento l&iacute;quido eficiente y silencioso.</p>\r\n\r\n<ul>\r\n	<li>Radiador de 280 mm</li>\r\n	<li>200-1800 RPM</li>\r\n	<li>23.5 dBA</li>\r\n</ul>\r\n', 'arctic-liquid-freezer-ii-280', 3031, 'arctic-liquid-freezer-ii-280.png', '0000-00-00', 0),
(58, 5, 'Corsair RM750x 750W 80+ Gold', '<p>Fuente de poder de alta eficiencia y calidad.</p>\r\n\r\n<ul>\r\n	<li>750 W</li>\r\n	<li>80+ Gold</li>\r\n	<li>Totalmente modular</li>\r\n</ul>\r\n', 'corsair-rm750x-750w-80-gold', 2649, 'corsair-rm750x-750w-80-gold_1720478921.png', '0000-00-00', 0),
(59, 5, 'EVGA SuperNOVA 750 G3 750W 80+ Gold', '<p>Fuente de poder de alta eficiencia y rendimiento.</p>\r\n\r\n<ul>\r\n	<li>750 W</li>\r\n	<li>80+ Gold</li>\r\n	<li>Totalmente modular</li>\r\n</ul>\r\n', 'evga-supernova-750-g3-750w-80-gold', 1795, 'evga-supernova-750-g3-750w-80-gold.png', '0000-00-00', 0),
(60, 5, 'Seasonic Focus GX-750 750W 80+ Gold', '<p>Fuente de poder compacta y eficiente.</p>\r\n\r\n<ul>\r\n	<li>750 W</li>\r\n	<li>80+ Gold</li>\r\n	<li>Totalmente modular</li>\r\n</ul>\r\n', 'seasonic-focus-gx-750-750w-80-gold', 2411, 'seasonic-focus-gx-750-750w-80-gold.png', '0000-00-00', 0),
(61, 5, 'Cooler Master MWE Gold 650W 80+ Gold', '<p>Fuente de poder eficiente y econ&oacute;mica.</p>\r\n\r\n<ul>\r\n	<li>650 W</li>\r\n	<li>80+ Gold</li>\r\n	<li>Semi-modular</li>\r\n</ul>\r\n', 'cooler-master-mwe-gold-650w-80-gold', 2258, 'cooler-master-mwe-gold-650w-80-gold.png', '0000-00-00', 0),
(62, 5, 'Thermaltake Toughpower GF1 850W 80+ Gold', '<p>Fuente de poder de alta capacidad y eficiencia.</p>\r\n\r\n<ul>\r\n	<li>850 W</li>\r\n	<li>80+ Gold</li>\r\n	<li>Totalmente modular</li>\r\n</ul>\r\n', 'thermaltake-toughpower-gf1-850w-80-gold', 2093, 'thermaltake-toughpower-gf1-850w-80-gold.png', '0000-00-00', 0),
(63, 5, 'Corsair CX550M 550W 80+ Bronze', '<p>Fuente de poder de buena calidad y eficiencia.</p>\r\n\r\n<ul>\r\n	<li>550 W</li>\r\n	<li>80+ Bronze</li>\r\n	<li>Semi-modular</li>\r\n</ul>\r\n', 'corsair-cx550m-550w-80-bronze', 1193, 'corsair-cx550m-550w-80-bronze.png', '0000-00-00', 0),
(64, 5, 'EVGA 600 W1 600W 80+ White', '<p>Fuente de poder econ&oacute;mica y fiable.</p>\r\n\r\n<ul>\r\n	<li>600 W</li>\r\n	<li>80+ White</li>\r\n	<li>No modular</li>\r\n</ul>\r\n', 'evga-600-w1-600w-80-white', 3999, 'evga-600-w1-600w-80-white.png', '0000-00-00', 0),
(65, 5, 'Be Quiet! Straight Power 11 750W 80+ Platinum', '<p>Fuente de poder silenciosa y eficiente.</p>\r\n\r\n<ul>\r\n	<li>750 W</li>\r\n	<li>80+ Platinum</li>\r\n	<li>Totalmente modular</li>\r\n</ul>\r\n', 'be-quiet-straight-power-11-750w-80-platinum', 2630, 'be-quiet-straight-power-11-750w-80-platinum.png', '0000-00-00', 0),
(66, 5, 'Cooler Master V850 850W 80+ Gold', '<p>Fuente de poder de alta capacidad y rendimiento.</p>\r\n\r\n<ul>\r\n	<li>850 W</li>\r\n	<li>80+ Gold</li>\r\n	<li>Totalmente modular</li>\r\n</ul>\r\n', 'cooler-master-v850-850w-80-gold', 3916, 'cooler-master-v850-850w-80-gold.png', '0000-00-00', 0),
(67, 5, 'NZXT C650 650W 80+ Gold', '<p>Fuente de poder eficiente y compacta.</p>\r\n\r\n<ul>\r\n	<li>650 W</li>\r\n	<li>80+ Gold</li>\r\n	<li>Totalmente modular</li>\r\n</ul>\r\n', 'nzxt-c650-650w-80-gold', 2579, 'nzxt-c650-650w-80-gold.png', '0000-00-00', 0),
(68, 6, 'NZXT H510', '<p>Gabinete compacto y elegante con panel lateral de vidrio templado.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>2 x 3.5&quot;</li>\r\n	<li>2 x 2.5&quot;</li>\r\n	<li>1 x USB 3.1 Gen 2</li>\r\n	<li>1 x USB 3.1 Gen 1</li>\r\n</ul>\r\n', 'nzxt-h510', 724, 'nzxt-h510.png', '0000-00-00', 0),
(69, 6, 'Corsair 4000D Airflow', '<p>Gabinete con excelente flujo de aire y dise&ntilde;o moderno.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>2 x 3.5&quot;</li>\r\n	<li>2 x 2.5&quot;</li>\r\n	<li>1 x USB 3.1 Gen 1</li>\r\n	<li>1 x USB 3.1 Gen 2</li>\r\n</ul>\r\n', 'corsair-4000d-airflow', 1649, 'corsair-4000d-airflow.png', '0000-00-00', 0),
(70, 6, 'Cooler Master MasterBox Q300L', '<p>Gabinete compacto y vers&aacute;til con excelente ventilaci&oacute;n.</p>\r\n\r\n<ul>\r\n	<li>MicroATX Tower</li>\r\n	<li>1 x 3.5&quot;</li>\r\n	<li>2 x 2.5&quot;</li>\r\n	<li>2 x USB 3.0</li>\r\n</ul>\r\n', 'cooler-master-masterbox-q300l', 1269, 'cooler-master-masterbox-q300l.png', '0000-00-00', 0),
(71, 6, 'Phanteks Eclipse P400A', '<p>Gabinete con panel frontal de malla para un mejor flujo de aire.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>2 x 3.5&quot;</li>\r\n	<li>2 x 2.5&quot;</li>\r\n	<li>2 x USB 3.0</li>\r\n</ul>\r\n', 'phanteks-eclipse-p400a', 2599, 'phanteks-eclipse-p400a.png', '0000-00-00', 0),
(72, 6, 'Fractal Design Meshify C', '<p>Gabinete con dise&ntilde;o angular y excelente flujo de aire.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>2 x 3.5&quot;</li>\r\n	<li>3 x 2.5&quot;</li>\r\n	<li>2 x USB 3.0</li>\r\n</ul>\r\n', 'fractal-design-meshify-c', 2631, 'fractal-design-meshify-c.png', '0000-00-00', 0),
(73, 6, 'Lian Li PC-O11 Dynamic', '<p>Gabinete espacioso con paneles de vidrio templado.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>6 x 3.5&quot;</li>\r\n	<li>3 x 2.5&quot;</li>\r\n	<li>2 x USB 3.0</li>\r\n	<li>1 x USB 3.1 Type-C</li>\r\n</ul>\r\n', 'lian-li-pc-o11-dynamic', 3047, 'lian-li-pc-o11-dynamic.png', '0000-00-00', 0),
(74, 6, 'Thermaltake Core P3', '<p>Gabinete abierto con soporte para montaje en pared.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>2 x 3.5&quot;</li>\r\n	<li>2 x 2.5&quot;</li>\r\n	<li>2 x USB 3.0</li>\r\n</ul>\r\n', 'thermaltake-core-p3', 3999, 'thermaltake-core-p3.png', '0000-00-00', 0),
(75, 6, 'Be Quiet! Pure Base 500DX', '<p>Gabinete con excelente aislamiento ac&uacute;stico y flujo de aire.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>2 x 3.5&quot;</li>\r\n	<li>5 x 2.5&quot;</li>\r\n	<li>1 x USB 3.1 Gen 2</li>\r\n	<li>1 x USB 3.0</li>\r\n</ul>\r\n', 'be-quiet-pure-base-500dx', 2285, 'be-quiet-pure-base-500dx.png', '0000-00-00', 0),
(76, 6, 'Corsair Obsidian Series 500D', '<p>Gabinete premium con paneles de vidrio templado y aluminio.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>2 x 3.5&quot;</li>\r\n	<li>3 x 2.5&quot;</li>\r\n	<li>2 x USB 3.1 Gen 1</li>\r\n	<li>1 x USB 3.1 Type-C</li>\r\n</ul>\r\n', 'corsair-obsidian-series-500d', 4664, 'corsair-obsidian-series-500d.png', '0000-00-00', 0),
(77, 6, 'NZXT H710', '<p>Gabinete espacioso con gesti&oacute;n de cables optimizada.</p>\r\n\r\n<ul>\r\n	<li>ATX Mid Tower</li>\r\n	<li>3 x 3.5&quot;</li>\r\n	<li>6 x 2.5&quot;</li>\r\n	<li>1 x USB 3.1 Gen 2</li>\r\n	<li>2 x USB 3.1 Gen 1</li>\r\n</ul>\r\n', 'nzxt-h710', 3499, 'nzxt-h710.png', '0000-00-00', 0),
(78, 2, 'AMD Ryzen 5 5600X', '<p>Procesador de gama media para juegos y tareas multitarea.</p>\r\n\r\n<ul>\r\n	<li>6 n&uacute;cleos</li>\r\n	<li>12 hilos</li>\r\n	<li>3.7 GHz base</li>\r\n	<li>4.6 GHz turbo</li>\r\n	<li>TDP 65W</li>\r\n</ul>\r\n', 'amd-ryzen-5-5600x', 2739, 'amd-ryzen-5-5600x.png', '2024-07-10', 1),
(79, 2, 'Intel Core i7-10700K', '<p>Procesador de gama media para juegos y tareas multitarea.</p>\r\n\r\n<ul>\r\n	<li>8 n&uacute;cleos</li>\r\n	<li>16 hilos</li>\r\n	<li>3.8 GHz base</li>\r\n	<li>5.1 GHz turbo</li>\r\n	<li>TDP 125W</li>\r\n</ul>\r\n', 'intel-core-i7-10700k', 5797, 'intel-core-i7-10700k.png', '0000-00-00', 0),
(80, 2, 'AMD Ryzen 7 5800X', '<p>Procesador de alto rendimiento para juegos y aplicaciones de productividad.</p>\r\n\r\n<ul>\r\n	<li>8 n&uacute;cleos</li>\r\n	<li>16 hilos</li>\r\n	<li>3.8 GHz base</li>\r\n	<li>4.7 GHz turbo</li>\r\n	<li>TDP 105W</li>\r\n</ul>\r\n', 'amd-ryzen-7-5800x', 3757, 'amd-ryzen-7-5800x.png', '0000-00-00', 0),
(81, 2, 'Intel Core i5-10400F', '<p>Procesador de gama media sin gr&aacute;ficos integrados.</p>\r\n\r\n<ul>\r\n	<li>6 n&uacute;cleos</li>\r\n	<li>12 hilos</li>\r\n	<li>2.9 GHz base</li>\r\n	<li>4.3 GHz turbo</li>\r\n	<li>TDP 65W</li>\r\n</ul>\r\n', 'intel-core-i5-10400f', 3199, 'intel-core-i5-10400f.png', '0000-00-00', 0),
(82, 2, 'AMD Ryzen 9 5950X', '<p>Procesador de gama alta para estaciones de trabajo y juegos extremos.</p>\r\n\r\n<ul>\r\n	<li>16 n&uacute;cleos</li>\r\n	<li>32 hilos</li>\r\n	<li>3.4 GHz base</li>\r\n	<li>4.9 GHz turbo</li>\r\n	<li>TDP 105W</li>\r\n</ul>\r\n', 'amd-ryzen-9-5950x', 7519, 'amd-ryzen-9-5950x.png', '0000-00-00', 0),
(83, 2, 'Intel Core i9-10900K', '<p>Procesador de alto rendimiento para juegos y creaci&oacute;n de contenido.</p>\r\n\r\n<ul>\r\n	<li>10 n&uacute;cleos</li>\r\n	<li>20 hilos</li>\r\n	<li>3.7 GHz base</li>\r\n	<li>5.3 GHz turbo</li>\r\n	<li>TDP 125W</li>\r\n</ul>\r\n', 'intel-core-i9-10900k', 7957, 'intel-core-i9-10900k.png', '0000-00-00', 0),
(84, 2, 'AMD Ryzen 3 3300X', '<p>Procesador econ&oacute;mico para tareas b&aacute;sicas y juegos ligeros.</p>\r\n\r\n<ul>\r\n	<li>4 n&uacute;cleos</li>\r\n	<li>8 hilos</li>\r\n	<li>3.8 GHz base</li>\r\n	<li>4.3 GHz turbo</li>\r\n	<li>TDP 65W</li>\r\n</ul>\r\n', 'amd-ryzen-3-3300x', 2299, 'amd-ryzen-3-3300x.png', '0000-00-00', 0),
(85, 2, 'Intel Core i5-11600K', '<p>Procesador de gama media con buena relaci&oacute;n precio-rendimiento.</p>\r\n\r\n<ul>\r\n	<li>6 n&uacute;cleos</li>\r\n	<li>12 hilos</li>\r\n	<li>3.9 GHz base</li>\r\n	<li>4.9 GHz turbo</li>\r\n	<li>TDP 125W</li>\r\n</ul>\r\n', 'intel-core-i5-11600k', 4199, 'intel-core-i5-11600k.png', '0000-00-00', 0),
(86, 2, 'AMD Ryzen 5 3600', '<p>Procesador de gama media para juegos y tareas diarias.</p>\r\n\r\n<ul>\r\n	<li>6 n&uacute;cleos</li>\r\n	<li>12 hilos</li>\r\n	<li>3.6 GHz base</li>\r\n	<li>4.2 GHz turbo</li>\r\n	<li>TDP 65W</li>\r\n</ul>\r\n', 'amd-ryzen-5-3600', 3650, 'amd-ryzen-5-3600.png', '0000-00-00', 0),
(87, 2, 'Intel Core i3-10100', '<p>Procesador econ&oacute;mico para tareas b&aacute;sicas y juegos ligeros.</p>\r\n\r\n<ul>\r\n	<li>4 n&uacute;cleos</li>\r\n	<li>8 hilos</li>\r\n	<li>3.6 GHz base</li>\r\n	<li>4.3 GHz turbo</li>\r\n	<li>TDP 65W</li>\r\n</ul>\r\n', 'intel-core-i3-10100', 2199, 'intel-core-i3-10100.png', '0000-00-00', 0),
(88, 4, 'Kingston HyperX Fury 16GB', '<p>Kit de memoria RAM de alto rendimiento.</p>\r\n\r\n<ul>\r\n	<li>16 GB (2 x 8 GB)</li>\r\n	<li>3200 MHz</li>\r\n	<li>CL16</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'kingston-hyperx-fury-16gb', 932, 'kingston-hyperx-fury-16gb-2-x-8gb-ddr4-3200mhz_1720481850.png', '0000-00-00', 0),
(89, 4, 'Corsair Vengeance LPX 32GB', '<p>Kit de memoria RAM para tareas intensivas y multitarea.</p>\r\n\r\n<ul>\r\n	<li>32 GB (2 x 16 GB)</li>\r\n	<li>3600 MHz</li>\r\n	<li>CL18</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'corsair-vengeance-lpx-32gb', 2899, 'corsair-vengeance-lpx-32gb-2-x-16gb-ddr4-3600mhz.png', '0000-00-00', 0),
(90, 4, 'G.Skill Ripjaws V 16GB', '<p>Kit de memoria RAM con buena relaci&oacute;n precio-rendimiento.</p>\r\n\r\n<ul>\r\n	<li>16 GB (2 x 8 GB)</li>\r\n	<li>3000 MHz</li>\r\n	<li>CL16</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'g-skill-ripjaws-v-16gb', 1165, 'g-skill-ripjaws-v-16gb-2-x-8gb-ddr4-3000mhz.png', '0000-00-00', 0),
(91, 4, 'Crucial Ballistix 16GB', '<p>Kit de memoria RAM con disipador de calor integrado.</p>\r\n\r\n<ul>\r\n	<li>16 GB (2 x 8 GB)</li>\r\n	<li>3200 MHz</li>\r\n	<li>CL16</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'crucial-ballistix-16gb', 2499, 'crucial-ballistix-16gb-2-x-8gb-ddr4-3200mhz.png', '0000-00-00', 0),
(92, 4, 'Corsair Dominator Platinum RGB 32GB', '<p>Memoria RAM de alto rendimiento con iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>32 GB (2 x 16 GB)</li>\r\n	<li>3200 MHz</li>\r\n	<li>CL16</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'corsair-dominator-platinum-rgb-32gb', 2699, 'corsair-dominator-platinum-rgb-32gb-2-x-16gb-ddr4-3200mhz.png', '0000-00-00', 0),
(93, 4, 'Team T-Force Delta RGB 16GB', '<p>Memoria RAM con iluminaci&oacute;n RGB personalizable.</p>\r\n\r\n<ul>\r\n	<li>16 GB (2 x 8 GB)</li>\r\n	<li>3000 MHz</li>\r\n	<li>CL16</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'team-t-force-delta-rgb-16gb', 1790, 'team-t-force-delta-rgb-16gb-2-x-8gb-ddr4-3000mhz.png', '0000-00-00', 0),
(94, 4, 'Patriot Viper 4 Blackout 16GB', '<p>Kit de memoria RAM de alto rendimiento para gamers.</p>\r\n\r\n<ul>\r\n	<li>16 GB (2 x 8 GB)</li>\r\n	<li>3600 MHz</li>\r\n	<li>CL17</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'patriot-viper-4-blackout-16gb', 1558, 'patriot-viper-4-blackout-16gb.png', '0000-00-00', 0),
(95, 4, 'ADATA XPG Spectrix D60G 16GB', '<p>Memoria RAM con iluminaci&oacute;n RGB y dise&ntilde;o &uacute;nico.</p>\r\n\r\n<ul>\r\n	<li>16 GB (2 x 8 GB)</li>\r\n	<li>3200 MHz</li>\r\n	<li>CL16</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'adata-xpg-spectrix-d60g-16gb', 1299, 'adata-xpg-spectrix-d60g-16gb.png', '0000-00-00', 0),
(96, 4, 'G.Skill Trident Z RGB 32GB', '<p>Memoria RAM de alto rendimiento con iluminaci&oacute;n RGB.</p>\r\n\r\n<ul>\r\n	<li>32 GB (2 x 16 GB)</li>\r\n	<li>3200 MHz</li>\r\n	<li>CL16</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'g-skill-trident-z-rgb-32gb', 1922, 'g-skill-trident-z-rgb-32gb.png', '0000-00-00', 0),
(97, 4, 'Thermaltake ToughRAM RGB 16GB', '<p>Memoria RAM con iluminaci&oacute;n RGB y buen rendimiento.</p>\r\n\r\n<ul>\r\n	<li>16 GB (2 x 8 GB)</li>\r\n	<li>3600 MHz</li>\r\n	<li>CL18</li>\r\n	<li>1.35V</li>\r\n</ul>\r\n', 'thermaltake-toughram-rgb-16gb', 2800, 'thermaltake-toughram-rgb-16gb.png', '0000-00-00', 0),
(98, 7, 'NVIDIA GeForce RTX 3060 Ti', '<p>Tarjeta gr&aacute;fica de gama media-alta para juegos en 1440p.</p>\r\n\r\n<ul>\r\n	<li>8 GB GDDR6</li>\r\n	<li>4864 n&uacute;cleos CUDA</li>\r\n	<li>1410 MHz base</li>\r\n	<li>1665 MHz boost</li>\r\n</ul>\r\n', 'nvidia-geforce-rtx-3060-ti', 13675, 'nvidia-geforce-rtx-3060-ti.png', '0000-00-00', 0),
(99, 7, 'AMD Radeon RX 6800', '<p>Tarjeta gr&aacute;fica de alto rendimiento para juegos en 4K.</p>\r\n\r\n<p>16 GB GDDR6</p>\r\n\r\n<p>3840 procesadores de flujo</p>\r\n\r\n<p>1700 MHz Base</p>\r\n\r\n<p>105 MHz Boost</p>\r\n', 'amd-radeon-rx-6800', 26742, 'amd-radeon-rx-6800.png', '0000-00-00', 0),
(100, 7, 'NVIDIA GeForce RTX 3070', '<p>Tarjeta gr&aacute;fica de gama media-alta para juegos en 1440p y 4K.</p>\r\n\r\n<ul>\r\n	<li>8 GB GDDR6</li>\r\n	<li>5888 n&uacute;cleos CUDA</li>\r\n	<li>1500 MHz base</li>\r\n	<li>1725 MHz boost</li>\r\n</ul>\r\n', 'nvidia-geforce-rtx-3070', 13581, 'nvidia-geforce-rtx-3070.png', '0000-00-00', 0),
(101, 7, 'AMD Radeon RX 6700 XT', '<p>Tarjeta gr&aacute;fica de gama media para juegos en 1440p.</p>\r\n\r\n<ul>\r\n	<li>12 GB GDDR6</li>\r\n	<li>2560 procesadores de flujo</li>\r\n	<li>2321 MHz base</li>\r\n	<li>2581 MHz</li>\r\n</ul>\r\n', 'amd-radeon-rx-6700-xt', 23255, 'amd-radeon-rx-6700-xt.png', '0000-00-00', 0),
(102, 7, 'NVIDIA GeForce GTX 1660 Super', '<p>Tarjeta gr&aacute;fica de gama media para juegos en 1080p.</p>\r\n\r\n<ul>\r\n	<li>6 GB GDDR6</li>\r\n	<li>1408 n&uacute;cleos CUDA</li>\r\n	<li>1530 MHz base</li>\r\n	<li>1785 MHz boost</li>\r\n</ul>\r\n', 'nvidia-geforce-gtx-1660-super', 6417, 'nvidia-geforce-gtx-1660-super.png', '0000-00-00', 0),
(103, 7, 'AMD Radeon RX 5600 XT', '<p>Tarjeta gr&aacute;fica de gama media para juegos en 1080p y 1440p.</p>\r\n\r\n<ul>\r\n	<li>6 GB GDDR6</li>\r\n	<li>2304 procesadores de flujo</li>\r\n	<li>1375 MHz base</li>\r\n	<li>1560 MHz</li>\r\n</ul>\r\n', 'amd-radeon-rx-5600-xt', 4164, 'amd-radeon-rx-5600-xt.png', '0000-00-00', 0),
(104, 7, 'NVIDIA GeForce RTX 3090', '<p>Tarjeta gr&aacute;fica de alta gama para juegos en 4K y tareas profesionales.</p>\r\n\r\n<ul>\r\n	<li>24 GB GDDR6X</li>\r\n	<li>10496 n&uacute;cleos CUDA</li>\r\n	<li>1395 MHz base</li>\r\n	<li>1695 MHz boost</li>\r\n</ul>\r\n', 'nvidia-geforce-rtx-3090', 32043, 'nvidia-geforce-rtx-3090.png', '0000-00-00', 0),
(105, 7, 'AMD Radeon RX 5500 XT', '<p>Tarjeta gr&aacute;fica de gama media-baja para juegos en 1080p.</p>\r\n\r\n<ul>\r\n	<li>8 GB GDDR6</li>\r\n	<li>1408 procesadores de flujo</li>\r\n	<li>1717 MHz base</li>\r\n	<li>1845 MHz</li>\r\n</ul>\r\n', 'amd-radeon-rx-5500-xt', 8105, 'amd-radeon-rx-5500-xt.png', '0000-00-00', 0),
(106, 7, 'NVIDIA GeForce RTX 2060', '<p>Tarjeta gr&aacute;fica de gama media-alta para juegos en 1080p y 1440p.</p>\r\n\r\n<ul>\r\n	<li>6 GB GDDR6</li>\r\n	<li>1920 n&uacute;cleos CUDA</li>\r\n	<li>1365 MHz base</li>\r\n	<li>1680 MHz boost</li>\r\n</ul>\r\n', 'nvidia-geforce-rtx-2060', 8016, 'nvidia-geforce-rtx-2060.png', '0000-00-00', 0),
(107, 7, 'AMD Radeon RX 6900 XT', '<p>Tarjeta gr&aacute;fica de alta gama para juegos en 4K.</p>\r\n\r\n<ul>\r\n	<li>16 GB GDDR6</li>\r\n	<li>5120 procesadores de flujo</li>\r\n	<li>1825 MHz base</li>\r\n	<li>2250 MHz</li>\r\n</ul>\r\n', 'amd-radeon-rx-6900-xt', 47712, 'amd-radeon-rx-6900-xt.png', '0000-00-00', 0),
(108, 1, 'ASUS TUF Gaming B550-PLUS', '<p>Tarjeta madre de gama media con soporte para AMD Ryzen.</p>\r\n\r\n<ul>\r\n	<li>Socket AM4</li>\r\n	<li>Chipset B550</li>\r\n	<li>DDR4 4400 MHz (OC)</li>\r\n	<li>2 x M.2</li>\r\n	<li>6 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'asus-tuf-gaming-b550-plus', 3399, 'asus-tuf-gaming-b550-plus.png', '0000-00-00', 0),
(109, 1, 'MSI MPG Z490 Gaming Edge WiFi', '<p>Tarjeta madre de gama alta para procesadores Intel.</p>\r\n\r\n<ul>\r\n	<li>Socket LGA1200</li>\r\n	<li>Chipset Z490</li>\r\n	<li>DDR4 4800 MHz (OC)</li>\r\n	<li>2 x M.2</li>\r\n	<li>WiFi 6</li>\r\n	<li>Bluetooth 5.1</li>\r\n</ul>\r\n', 'msi-mpg-z490-gaming-edge-wifi', 3563, 'msi-mpg-z490-gaming-edge-wifi.png', '2024-07-09', 1),
(110, 1, 'Gigabyte X570 AORUS Elite', '<p>Tarjeta madre de gama alta con soporte para AMD Ryzen y PCIe 4.0.</p>\r\n\r\n<ul>\r\n	<li>Socket AM4</li>\r\n	<li>Chipset X570</li>\r\n	<li>DDR4 4400 MHz (OC)</li>\r\n	<li>2 x M.2</li>\r\n	<li>6 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'gigabyte-x570-aorus-elite', 6849, 'gigabyte-x570-aorus-elite.png', '2024-07-09', 1),
(111, 1, 'ASRock B450M Steel Legend', '<p>Tarjeta madre de gama media-baja para AMD Ryzen.</p>\r\n\r\n<ul>\r\n	<li>Socket AM4</li>\r\n	<li>Chipset B450</li>\r\n	<li>DDR4 3533 MHz (OC)</li>\r\n	<li>2 x M.2</li>\r\n	<li>4 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'asrock-b450m-steel-legend', 6012, 'asrock-b450m-steel-legend.png', '0000-00-00', 0),
(112, 1, 'MSI B450 TOMAHAWK MAX', '<p>Tarjeta madre de gama media con buena relaci&oacute;n calidad-precio.</p>\r\n\r\n<ul>\r\n	<li>Socket AM4</li>\r\n	<li>Chipset B450</li>\r\n	<li>DDR4 4133 MHz (OC)</li>\r\n	<li>1 x M.2</li>\r\n	<li>6 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'msi-b450-tomahawk-max', 4792, 'msi-b450-tomahawk-max.png', '0000-00-00', 0),
(113, 1, 'ASUS Prime Z390-A', '<p>Tarjeta madre de gama alta para procesadores Intel.</p>\r\n\r\n<ul>\r\n	<li>Socket LGA1151</li>\r\n	<li>Chipset Z390</li>\r\n	<li>DDR4 4266 MHz (OC)</li>\r\n	<li>2 x M.2</li>\r\n	<li>6 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'asus-prime-z390', 3253, 'asus-prime-z390.png', '0000-00-00', 0),
(114, 1, 'Gigabyte B460M DS3H', '<p>Tarjeta madre de gama media-baja para procesadores Intel.</p>\r\n\r\n<ul>\r\n	<li>Socket LGA1200</li>\r\n	<li>Chipset B460</li>\r\n	<li>DDR4 2933 MHz</li>\r\n	<li>1 x M.2</li>\r\n	<li>4 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'gigabyte-b460m-ds3h', 1899, 'gigabyte-b460m-ds3h.png', '0000-00-00', 0),
(115, 1, 'ASRock X570 Phantom Gaming 4', '<p>Tarjeta madre de gama media para procesadores AMD Ryzen.</p>\r\n\r\n<ul>\r\n	<li>Socket AM4</li>\r\n	<li>Chipset X570</li>\r\n	<li>DDR4 4066 MHz (OC)</li>\r\n	<li>2 x M.2</li>\r\n	<li>8 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'asrock-x570-phantom-gaming-4', 2003, 'asrock-x570-phantom-gaming-4.png', '0000-00-00', 0),
(116, 1, 'MSI MEG Z590 ACE', '<p>Tarjeta madre de alta gama para entusiastas de Intel.</p>\r\n\r\n<ul>\r\n	<li>Socket LGA1200</li>\r\n	<li>Chipset Z590</li>\r\n	<li>DDR4 5333 MHz (OC)</li>\r\n	<li>4 x M.2</li>\r\n	<li>WiFi 6E</li>\r\n</ul>\r\n', 'msi-meg-z590-ace', 3622, 'msi-meg-z590-ace.png', '0000-00-00', 0),
(117, 1, 'ASUS ROG Strix B450-F Gaming', '<p>Tarjeta madre de gama media con caracter&iacute;sticas gaming.</p>\r\n\r\n<ul>\r\n	<li>Socket AM4</li>\r\n	<li>Chipset B450</li>\r\n	<li>DDR4 4400 MHz (OC)</li>\r\n	<li>2 x M.2</li>\r\n	<li>6 x SATA 6Gb/s</li>\r\n</ul>\r\n', 'asus-rog-strix-b450-f-gaming', 3182, 'asus-rog-strix-b450-f-gaming.png', '0000-00-00', 0),
(118, 8, 'Noctua NF-A12x25 PWM', '<p>Ventilador de alto rendimiento y bajo nivel de ruido.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>450-2000 RPM</li>\r\n	<li>22.6 dBA</li>\r\n</ul>\r\n', 'noctua-nf-a12x25-pwm', 749, 'noctua-nf-a12x25-pwm.png', '0000-00-00', 0),
(119, 8, 'Corsair ML120 PRO RGB', '<p>Ventilador con tecnolog&iacute;a magn&eacute;tica para mejor rendimiento y RGB.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>400-2400 RPM</li>\r\n	<li>37 dBA</li>\r\n</ul>\r\n', 'corsair-ml120-pro-rgb', 630, 'corsair-ml120-pro-rgb.png', '2024-07-09', 1),
(120, 8, 'NZXT Aer RGB 2', '<p>Ventilador RGB con dise&ntilde;o aerodin&aacute;mico para mejor flujo de aire.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>500-1500 RPM</li>\r\n	<li>33 dBA</li>\r\n</ul>\r\n', 'nzxt-aer-rgb-2', 599, 'nzxt-aer-rgb-2.png', '0000-00-00', 0),
(121, 8, 'Cooler Master MasterFan MF120R ARGB', '<p>Ventilador con iluminaci&oacute;n ARGB y rendimiento eficiente.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>650-2000 RPM</li>\r\n	<li>31 dBA</li>\r\n</ul>\r\n', 'cooler-master-masterfan-mf120r-argb', 299, 'cooler-master-masterfan-mf120r-argb.png', '0000-00-00', 0),
(122, 8, 'be quiet! Silent Wings 3', '<p>Ventilador ultra silencioso con alto rendimiento.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>1450 RPM</li>\r\n	<li>16.4 dBA</li>\r\n</ul>\r\n', 'be-quiet-silent-wings-3', 308, 'be-quiet-silent-wings-3.png', '2024-07-09', 1),
(123, 8, 'Thermaltake Riing Plus 12 RGB', '<p>Ventilador con anillo de iluminaci&oacute;n RGB y buen flujo de aire.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>500-1500 RPM</li>\r\n	<li>24.7 dBA</li>\r\n</ul>\r\n', 'thermaltake-riing-plus-12-rgb', 749, 'thermaltake-riing-plus-12-rgb.png', '0000-00-00', 0),
(124, 8, 'Arctic P12 PWM', '<p>Ventilador eficiente y silencioso con control PWM.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>200-1800 RPM</li>\r\n	<li>22.5 dBA</li>\r\n</ul>\r\n', 'arctic-p12-pwm', 365, 'arctic-p12-pwm.png', '0000-00-00', 0),
(125, 8, 'Phanteks PH-F120MP', '<p>Ventilador de alta presi&oacute;n est&aacute;tica para radiadores y disipadores.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>500-1600 RPM</li>\r\n	<li>25.5 dBA</li>\r\n</ul>\r\n', 'phanteks-ph-f120mp', 399, 'phanteks-ph-f120mp.png', '0000-00-00', 0),
(126, 8, 'DeepCool RF120M', '<p>Ventilador con iluminaci&oacute;n RGB y rendimiento equilibrado.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>500-1500 RPM</li>\r\n	<li>27 dBA</li>\r\n</ul>\r\n', 'deepcool-rf120m', 619, 'deepcool-rf120m.png', '0000-00-00', 0),
(127, 8, 'Lian Li UNI Fan SL120', '<p>Ventilador modular con iluminaci&oacute;n ARGB y alto rendimiento.</p>\r\n\r\n<ul>\r\n	<li>120 mm</li>\r\n	<li>800-1900 RPM</li>\r\n	<li>31 dBA</li>\r\n</ul>\r\n', 'lian-li-uni-fan-sl120', 610, 'lian-li-uni-fan-sl120.png', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$8wY63GX/y9Bq780GBMpxCesV9n1H6WyCqcA2hNy2uhC59hEnOpNaS', 1, 'Luis', 'Caamal', '', '', 'baby_metal.jpg', 1, '', '', '2018-05-01'),
(13, 'reina@gmail.com', '$2y$10$JFytsRRSydouaGQIVX/Pj.vBC5InqocFkfrb.BuFvaIweR/4ASyPW', 0, 'Reina', 'Chable', 'Merida', '9995012757', 'corona.jpg', 1, '', '', '2024-06-11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
