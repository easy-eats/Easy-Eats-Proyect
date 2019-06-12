-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2019 a las 16:04:10
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

CREATE TABLE `barrios` (
  `cod_barrio` int(11) NOT NULL,
  `nombre_barrio` varchar(35) NOT NULL,
  `puntos_venta_cod_punto_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_credito`
--

CREATE TABLE `cliente_credito` (
  `cod_credito` int(11) NOT NULL,
  `credito_abierto_cod_abierto` int(11) NOT NULL,
  `credito_cerrado_cod_cerrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision`
--

CREATE TABLE `comision` (
  `cod_comision` int(11) NOT NULL,
  `comision_valor` int(11) DEFAULT NULL,
  `comision_meta` int(11) DEFAULT NULL,
  `personas_cod_identificacion` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito_abierto`
--

CREATE TABLE `credito_abierto` (
  `cod_abierto` int(11) NOT NULL,
  `empresa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito_cerrado`
--

CREATE TABLE `credito_cerrado` (
  `cod_cerrado` int(11) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `doc_cerrado` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito_menu`
--

CREATE TABLE `credito_menu` (
  `cod_credito_menu` int(11) NOT NULL,
  `menu_cod_menu` int(11) NOT NULL,
  `credito_abierto_cod_abierto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `cod_ingreso` int(11) NOT NULL,
  `fecha_ingreso` varchar(15) NOT NULL,
  `tiempo_en_sistema` varchar(10) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `usuarios_nick_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `malla_turnos`
--

CREATE TABLE `malla_turnos` (
  `cod_malla` int(11) NOT NULL,
  `doc_malla` mediumblob NOT NULL,
  `personas_cod_identificacion` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `cod_marca` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `cod_menu` int(11) NOT NULL,
  `menu` mediumblob NOT NULL,
  `precio1` int(11) NOT NULL,
  `precio2` int(11) NOT NULL,
  `precio3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_puntos_venta`
--

CREATE TABLE `menus_puntos_venta` (
  `cod_menu_punto` int(11) NOT NULL,
  `menu_cod_menu` int(11) NOT NULL,
  `puntos_venta_cod_punto_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `cod_permiso` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `icono` mediumblob NOT NULL,
  `cod_padre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cod_identificacion` bigint(10) NOT NULL,
  `prirmer_nombre` varchar(25) NOT NULL,
  `segundo_nombre` varchar(25) DEFAULT NULL,
  `primer_apellido` varchar(25) NOT NULL,
  `segundo_apellido` varchar(25) DEFAULT NULL,
  `telefono` bigint(12) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `fecha_nacimiento` varchar(20) NOT NULL,
  `usuarios_nick_name` int(11) NOT NULL,
  `rol_cod_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `cantidad_producto` bigint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_menus`
--

CREATE TABLE `productos_menus` (
  `cod_producto_menu` int(11) NOT NULL,
  `producto_cod_producto` int(11) NOT NULL,
  `menu_cod_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_venta`
--

CREATE TABLE `puntos_venta` (
  `cod_punto_venta` int(11) NOT NULL,
  `nombre_punto` varchar(45) NOT NULL,
  `direccion_punto` varchar(45) NOT NULL,
  `personas_cod_identificacion` bigint(10) NOT NULL,
  `marcas_cod_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `cod_rol` int(11) NOT NULL,
  `tipo_rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_permisos`
--

CREATE TABLE `roles_permisos` (
  `cod_rolper` int(11) NOT NULL,
  `rol_cod_rol` int(11) NOT NULL,
  `permisos_cod_permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nick_name` int(11) NOT NULL,
  `clave` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD PRIMARY KEY (`cod_barrio`),
  ADD KEY `fk_barrios_puntos_venta1_idx` (`puntos_venta_cod_punto_venta`);

--
-- Indices de la tabla `cliente_credito`
--
ALTER TABLE `cliente_credito`
  ADD PRIMARY KEY (`cod_credito`),
  ADD KEY `fk_cliente_credito_credito_abierto1_idx` (`credito_abierto_cod_abierto`),
  ADD KEY `fk_cliente_credito_credito_cerrado1_idx` (`credito_cerrado_cod_cerrado`);

--
-- Indices de la tabla `comision`
--
ALTER TABLE `comision`
  ADD PRIMARY KEY (`cod_comision`),
  ADD KEY `fk_comision_personas1_idx` (`personas_cod_identificacion`);

--
-- Indices de la tabla `credito_abierto`
--
ALTER TABLE `credito_abierto`
  ADD PRIMARY KEY (`cod_abierto`);

--
-- Indices de la tabla `credito_cerrado`
--
ALTER TABLE `credito_cerrado`
  ADD PRIMARY KEY (`cod_cerrado`);

--
-- Indices de la tabla `credito_menu`
--
ALTER TABLE `credito_menu`
  ADD PRIMARY KEY (`cod_credito_menu`),
  ADD KEY `fk_credito_menu_menu1_idx` (`menu_cod_menu`),
  ADD KEY `fk_credito_menu_credito_abierto1_idx` (`credito_abierto_cod_abierto`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`cod_ingreso`),
  ADD KEY `fk_ingresos_usuarios1_idx` (`usuarios_nick_name`);

--
-- Indices de la tabla `malla_turnos`
--
ALTER TABLE `malla_turnos`
  ADD PRIMARY KEY (`cod_malla`),
  ADD KEY `fk_malla_turnos_personas1_idx` (`personas_cod_identificacion`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`cod_marca`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`cod_menu`);

--
-- Indices de la tabla `menus_puntos_venta`
--
ALTER TABLE `menus_puntos_venta`
  ADD PRIMARY KEY (`cod_menu_punto`),
  ADD KEY `fk_menus_puntos_venta_menu1_idx` (`menu_cod_menu`),
  ADD KEY `fk_menus_puntos_venta_puntos_venta1_idx` (`puntos_venta_cod_punto_venta`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`cod_permiso`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`cod_identificacion`),
  ADD KEY `fk_personas_usuarios1_idx` (`usuarios_nick_name`),
  ADD KEY `fk_personas_rol1_idx` (`rol_cod_rol`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cod_producto`);

--
-- Indices de la tabla `productos_menus`
--
ALTER TABLE `productos_menus`
  ADD PRIMARY KEY (`cod_producto_menu`),
  ADD KEY `fk_productos_menus_producto1_idx` (`producto_cod_producto`),
  ADD KEY `fk_productos_menus_menu1_idx` (`menu_cod_menu`);

--
-- Indices de la tabla `puntos_venta`
--
ALTER TABLE `puntos_venta`
  ADD PRIMARY KEY (`cod_punto_venta`),
  ADD KEY `fk_puntos_venta_personas1_idx` (`personas_cod_identificacion`),
  ADD KEY `fk_puntos_venta_marcas1_idx` (`marcas_cod_marca`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Indices de la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD PRIMARY KEY (`cod_rolper`),
  ADD KEY `fk_roles_permisos_rol1_idx` (`rol_cod_rol`),
  ADD KEY `fk_roles_permisos_permisos1_idx` (`permisos_cod_permiso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`nick_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barrios`
--
ALTER TABLE `barrios`
  MODIFY `cod_barrio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente_credito`
--
ALTER TABLE `cliente_credito`
  MODIFY `cod_credito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comision`
--
ALTER TABLE `comision`
  MODIFY `cod_comision` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito_abierto`
--
ALTER TABLE `credito_abierto`
  MODIFY `cod_abierto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito_cerrado`
--
ALTER TABLE `credito_cerrado`
  MODIFY `cod_cerrado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito_menu`
--
ALTER TABLE `credito_menu`
  MODIFY `cod_credito_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `cod_ingreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `malla_turnos`
--
ALTER TABLE `malla_turnos`
  MODIFY `cod_malla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `cod_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `cod_permiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `cod_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_menus`
--
ALTER TABLE `productos_menus`
  MODIFY `cod_producto_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puntos_venta`
--
ALTER TABLE `puntos_venta`
  MODIFY `cod_punto_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `cod_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  MODIFY `cod_rolper` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `nick_name` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD CONSTRAINT `fk_barrios_puntos_venta1` FOREIGN KEY (`puntos_venta_cod_punto_venta`) REFERENCES `puntos_venta` (`cod_punto_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente_credito`
--
ALTER TABLE `cliente_credito`
  ADD CONSTRAINT `fk_cliente_credito_credito_abierto1` FOREIGN KEY (`credito_abierto_cod_abierto`) REFERENCES `credito_abierto` (`cod_abierto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_credito_credito_cerrado1` FOREIGN KEY (`credito_cerrado_cod_cerrado`) REFERENCES `credito_cerrado` (`cod_cerrado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comision`
--
ALTER TABLE `comision`
  ADD CONSTRAINT `fk_comision_personas1` FOREIGN KEY (`personas_cod_identificacion`) REFERENCES `personas` (`cod_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `credito_menu`
--
ALTER TABLE `credito_menu`
  ADD CONSTRAINT `fk_credito_menu_credito_abierto1` FOREIGN KEY (`credito_abierto_cod_abierto`) REFERENCES `credito_abierto` (`cod_abierto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_credito_menu_menu1` FOREIGN KEY (`menu_cod_menu`) REFERENCES `menu` (`cod_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `fk_ingresos_usuarios1` FOREIGN KEY (`usuarios_nick_name`) REFERENCES `usuarios` (`nick_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `malla_turnos`
--
ALTER TABLE `malla_turnos`
  ADD CONSTRAINT `fk_malla_turnos_personas1` FOREIGN KEY (`personas_cod_identificacion`) REFERENCES `personas` (`cod_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menus_puntos_venta`
--
ALTER TABLE `menus_puntos_venta`
  ADD CONSTRAINT `fk_menus_puntos_venta_menu1` FOREIGN KEY (`menu_cod_menu`) REFERENCES `menu` (`cod_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menus_puntos_venta_puntos_venta1` FOREIGN KEY (`puntos_venta_cod_punto_venta`) REFERENCES `puntos_venta` (`cod_punto_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `fk_personas_rol1` FOREIGN KEY (`rol_cod_rol`) REFERENCES `rol` (`cod_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personas_usuarios1` FOREIGN KEY (`usuarios_nick_name`) REFERENCES `usuarios` (`nick_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos_menus`
--
ALTER TABLE `productos_menus`
  ADD CONSTRAINT `fk_productos_menus_menu1` FOREIGN KEY (`menu_cod_menu`) REFERENCES `menu` (`cod_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_menus_producto1` FOREIGN KEY (`producto_cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `puntos_venta`
--
ALTER TABLE `puntos_venta`
  ADD CONSTRAINT `fk_puntos_venta_marcas1` FOREIGN KEY (`marcas_cod_marca`) REFERENCES `marcas` (`cod_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_puntos_venta_personas1` FOREIGN KEY (`personas_cod_identificacion`) REFERENCES `personas` (`cod_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD CONSTRAINT `fk_roles_permisos_permisos1` FOREIGN KEY (`permisos_cod_permiso`) REFERENCES `permisos` (`cod_permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_roles_permisos_rol1` FOREIGN KEY (`rol_cod_rol`) REFERENCES `rol` (`cod_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
