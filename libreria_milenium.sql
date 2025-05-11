-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2025 a las 06:29:49
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
-- Base de datos: `libreria_milenium`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID`, `Nombre`, `Correo`, `Telefono`) VALUES
(1, 'Juan Pérez', 'juan.perez@mail.com', '1234567890'),
(2, 'Ana Gómez', 'ana.gomez@mail.com', '0987654321'),
(3, 'Carlos López', 'carlos.lopez@mail.com', '1122334455');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Autor` varchar(255) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `AñoPublicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID`, `Titulo`, `Autor`, `Genero`, `AñoPublicacion`) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', 'Realismo Mágico', 1967),
(2, 'El Principito', 'Antoine de Saint-Exupéry', 'Ficción', 1943),
(3, '1984', 'George Orwell', 'Distopía', 1949),
(4, 'Orgullo y Prejuicio', 'Jane Austen', 'Romance', 1813),
(5, 'El Hobbit', 'J.R.R. Tolkien', 'Fantasía', 1937);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `LibroID` int(11) DEFAULT NULL,
  `FechaPrestamo` date DEFAULT NULL,
  `FechaDevolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID`, `ClienteID`, `LibroID`, `FechaPrestamo`, `FechaDevolucion`) VALUES
(1, 1, 1, '2024-11-01', NULL),
(2, 2, 3, '2024-11-02', '2024-11-10'),
(3, 3, 5, '2024-11-03', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClienteID` (`ClienteID`),
  ADD KEY `LibroID` (`LibroID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ID`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libros` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
