-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2024 at 06:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-space2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(2, 'admin', 'admin@espace.com', '$2y$10$cdfLhZKHeaQlVslx7uaVR.d73qNIYVC3D6GVb8tpqVgIDhZjBGfG.');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(7, 'Microsoft'),
(8, 'JBL'),
(9, 'Dell'),
(10, 'Sony'),
(11, 'Ninja');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(213, 74, '::1', 9, 1),
(214, 1, '::1', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(6, 'Home Appliances'),
(8, 'Laptops'),
(9, 'Headphones'),
(10, 'Phone Accessories'),
(11, 'Desktop Accessories'),
(12, 'Gaming'),
(13, 'Cellphones'),
(14, 'Tablets');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@apricotstore.com'),
(4, 'help.shohan@gmail.com'),
(5, 'info.shohan@yahoo.com'),
(6, 'maria.anntoms1997@gmail.com'),
(7, 'zon@gmail.com'),
(8, 'tempuser@gmail.com'),
(9, 'xyz@gmail.com'),
(10, 'grp1@gmail.com'),
(11, 'tony@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `trx_id`, `p_status`, `order_date`) VALUES
(1, 12, '07M47684BS5725041', 'Completed', NULL),
(2, 14, '07M47684BS5725041', 'Completed', NULL),
(15, 983, '662d786f92ba5', 'Completed', NULL),
(16, 983, '662d7b1cd837c', 'Completed', NULL),
(17, 983, '662d7e9b3348e', 'Completed', NULL),
(18, 983, '662d819fcfa50', 'Completed', NULL),
(19, 983, '662d82c53c1b9', 'Completed', NULL),
(20, 983, '662d83c2b26c0', 'Completed', NULL),
(21, 983, '662d860b0f7e1', 'Completed', NULL),
(22, 982, '662d87fa86108', 'Completed', NULL),
(23, 982, '662d8b0a8dfc0', 'Completed', NULL),
(24, 982, '662d91e08a733', 'Completed', NULL),
(25, 982, '662d945e82dee', 'Completed', '2024-04-28'),
(26, 982, '662d97c86d61a', 'Completed', '2024-04-28'),
(27, 13, '662dc557dc2fa', 'Completed', '2024-04-28'),
(28, 9, '662dd24fe06ec', 'Completed', '2024-04-28'),
(29, 18, '662ddf9fa02a5', 'Completed', '2024-04-28');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(100) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Shohan', 'help.shohan@gmail.com', 'Dhaka, Khulna, Barisal', 'Daffodil Smart City', 'Barisal', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, '1234'),
(2, 26, 'Derek Montanez', 'derekmont02@gmail.com', '12 Westheimer', 'Houston', 'Texas', 654321, 'Derek Montanez', '12345', '12/22', 1, 32000, '292'),
(3, 27, 'Test User', 'test@gmail.com', '931 Elgin', 'Houston', 'Tx', 654321, 'Test User', '123', '12/22', 1, 50, '121'),
(4, 26, 'Derek Montanez', 'derekmont02@gmail.com', '12 Westheimer', 'Houston', 'TX', 654321, 'Derek Montanez', '123', '12/22', 4, 89500, '121'),
(5, 26, 'Derek Montanez', 'derekmont02@gmail.com', '12 Westheimer', 'Houston', 'TX', 654321, 'Derek Montanez', '123', '12/22', 1, 50, '121'),
(6, 26, 'Derek Montanez', 'derekmont02@gmail.com', '12 Westheimer', 'Houston', 'TX', 654321, 'Derek Montanez', '123', '12/22', 1, 10000, '121'),
(7, 26, 'Derek Montanez', 'derekmont02@gmail.com', '12 Westheimer', 'Houston', 'TX', 654321, 'Derek Montanez', '123', '12/22', 1, 35000, '121'),
(8, 229, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', 'Lucy Fence, Chirammal House', 'Thrissur', 'Kerala', 680308, 'MARIA', '1234567876543', '12/22', 1, 350, '433'),
(9, 979, 'Jay R', 'jayr@gmail.com', 'Calhoun Road', 'Houston', 'Texas', 112233, 'Jay R', '1234567812345678', '10/28', 1, 1000, '555'),
(10, 983, 'zon P', 'zon@gmail.com', 'Houston', 'United States', 'Texas', 774742, 'Zon', '12345678765432', '12/28', 1, 1400, '234'),
(11, 983, 'zon P', 'zon@gmail.com', 'Houston', 'United States', 'TX', 778898, 'Zon', '12345675432134', '12/26', 1, 1200, '234'),
(12, 983, 'zon P', 'mariaanntoms7@gmail.com', 'Apt # 1047,4010 Linkwood Dr', 'Houston', 'Texas', 770256, 'Zon', '1456765434567876', '09/24', 1, 1200, '234'),
(13, 983, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', 'Apt# 1047, Stratford House Apartments,4010 Linkwood Dr', 'Houston', 'Texas', 770257, 'Zon', '4567 8987 6546 7890', '12/27', 1, 1200, '876'),
(14, 983, 'Maria Ann', 'maria.anntoms1997@gmail.com', 'Apt # 1047,4010 Linkwood Dr', 'Houston', 'Tex', 770252, 'MARIA', '4567 8976 5678 7678', '12/26', 1, 800, '234'),
(15, 983, 'Mathews', 'mathews@gmail.com', 'Houston', 'United States', 'Tx', 737373, 'Mathews', '1234644453203223', '12/26', 1, 500, '276'),
(16, 983, 'zon P', 'mariaanntoms7@gmail.com', 'Apt # 1047,4010 Linkwood Dr', 'Houston', 'Texas', 770257, 'Zon', '$2y$10$SyOehoX4c0vbjt0LAmcvDeSvYQneIxlJgMfa/B1kJVIIh/TJaQIDy', '12/25', 1, 50, '$2y$10$/ZL/WU8A4LL3H2Z2SNCj5eP542t/MY8KpErzg.x.IRczXcuyI4fYG'),
(17, 983, 'Maria Ann', 'maria.anntoms1997@gmail.com', 'Apt # 1047,4010 Linkwood Dr', 'Houston', 'TX', 770253, 'MARIA', '$2y$10$rv/oMjcfvNrBzeRnWND8f..UqilSL5z52dhxKhuz.aHmdwqTlwTUO', '11/25', 1, 900, '$2y$10$A9Y01mId6EHqlvGR.oje9.iE38y03yP2FHT73p3oqlunyGlKvmmbe'),
(18, 983, 'Maria Ann', 'maria.anntoms1997@gmail.com', 'Apt # 1047,4010 Linkwood Dr', 'Houston', 'TX', 770253, 'MARIA', '$2y$10$CQa8dD.CeHRlfJVJRsqpP.OXLg3bg4UcACzyGDxHyeJlp7Pbq7Phu', '12/23', 2, 1249, '$2y$10$gDXGJx7YQ5I9I0PwtU5zFOaRh51pGniuU6D1yvz3pksHRL6gXCFhW'),
(19, 983, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', 'Apt# 1047, Stratford House Apartments,4010 Linkwood Dr', 'Houston', 'Texas', 770257, 'MARIA', '$2y$10$fu7veWKUa/gy8qLfT59tzOg5IAjjAgb54pnNChKukCU/FgtdwxkDi', '12/24', 2, 80, '$2y$10$R/4vb9wRT1skGzy1umvkjO1Ryvx..1mOeOUW47i4cXSDiZCbjbJBa'),
(20, 983, 'zon P', 'zon@gmail.com', 'Houston', 'United States', 'tx', 123532, 'MARIA', '$2y$10$YlsBVp7yvddaCajDITQYfOrbAgaMHCwJxhCw7AzufWP08Jqq7Ka1G', '12/31', 3, 1599, '$2y$10$RxCn.jevmuAZaWdtxddDy.j3dETBeMD.JOe5gPDjaHKLFpvmk0I3G'),
(21, 983, 'zon P', 'zon@gmail.com', 'Houston', 'United States', 'aa', 666777, 'MARIA', '$2y$10$TRCk1Sk704BOe.YvFnVbuec60Yz0esB6jZwb2d.8CnlUIvURouK7W', '12/28', 3, 1350, '$2y$10$iw5tcHzLUpGlUWXxahRbF.TuuVLDdurDd18EsZzavWn/7NSyG8Wo2'),
(22, 982, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', '4010 Linkwood Dr', 'Houston', 'tx', 888908, 'MARIA', '$2y$10$9PXoEsWTXpxcHQ7hIsby2OSMTO5OaL.F9gWWhRzmpUPvFS5sSil1e', '05/29', 4, 2900, '$2y$10$V/6S8XWZQIV.uPSozrA7vOV1bLCRJExFC69T7B4Nha8ZXkMEnfO2u'),
(23, 982, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', '4010 Linkwood Dr', 'Houston', 'tc', 990990, 'MARIA', '$2y$10$Iu454BfooNN8XOxvljwVY.os/AqB9IUDP6xj9mRy.2b70Ay6wgjO2', '07/29', 3, 1080, '$2y$10$LscbMrP89fGpxQXsCns/i.IE.sMo/gb/Great9wMkx1DARIuMMNiO'),
(24, 982, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', '4010 Linkwood Dr', 'Houston', 'tx', 891919, 'MARIA', '$2y$10$iGM/KX9XG.m0aIg/gQIZtuhPXT9bHb/7gMGwStV1RZYRjnBsr8irO', '09/12', 3, 1599, '$2y$10$kvGvU4wP8frAmEaHs8Aosu0t3XwmiP8uHGqq2atKOHRgVsP92Og0a'),
(25, 982, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', '4010 Linkwood Dr', 'Houston', 'jj', 890890, 'MARIA', '$2y$10$HFJB0/hbPVJmy5BTd/XXw.jvhDrZ9OJe/xUjKDdC.RbQfKAAbRLt2', '11/44', 2, 519, '$2y$10$utBMu0jLyVkSS.gq6dsqUe9VCDC40.z3QwzLd37bR.YiXgXSjzbQy'),
(26, 982, 'Maria Ann Toms', 'maria.anntoms1997@gmail.com', 'Apt# 1047, Stratford House Apartments,4010 Linkwood Dr', 'Houston', 'Texas', 77025, 'MARIA', '$2y$10$Urx6g18kvMb2hNLyQ7K./ORHS1oCvAec9593Gm2OI.x2UlCe2b9fu', '12/22', 1, 350, '$2y$10$0iDqBu5K2F4S7EbLAA2i5.YeesPOhiqnZsv4BCShgYtssG8KvuVPO'),
(27, 13, 'Ray K', 'ray@gmail.com', 'tx', 'Houston', 'tx', 12345, 'Ray', '$2y$10$u9yI1L.4AVadYTfD2HdZhuH5XLWRHswvCATWpxrb32707APHyy7eq', '11/28', 2, 769, '$2y$10$lDXqNaGZvawOGmze7RxaUegPV136Sj340j/MH/imC4Az/y0QRZXky'),
(28, 9, 'Jim k', 'jim@gmail.com', 'Tx', 'Hou', 'tx', 90909, 'MARIA', '$2y$10$BqOoz4IlZQ26z8ZWeTe7mOr/zWOHrrVHZqq6U7reEI5IK.cXWTN3K', '11/27', 2, 1249, '$2y$10$kpHr.gBwfHyup7qU1GS17umClz9wG3I/FoIAslH2G02So0GC9TdCy'),
(29, 18, 'Kiran S', 'kiran@gmail.com', 'TZ', 'Houston', 'TX', 12344, 'Kiran', '$2y$10$Z/xU6SB7h5QFlbr7GOtZee4Nn0CTCklYM8G.vI4xQIa2v9.xQHhwy', '10/27', 2, 900, '$2y$10$RjGR6VA3PDcMzRKuBhQ0W.V3rMoQTrAJajjrnNuCokDNRqvZXVdx2');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 4, 1, 32000),
(92, 3, 93, 1, 50),
(93, 4, 2, 1, 25000),
(94, 4, 3, 1, 30000),
(95, 4, 4, 1, 32000),
(96, 4, 39, 1, 2500),
(97, 5, 95, 1, 50),
(98, 6, 45, 1, 10000),
(99, 7, 6, 1, 35000),
(100, 8, 73, 1, 350),
(101, 9, 2, 1, 1000),
(102, 10, 1, 1, 1400),
(103, 11, 6, 2, 4800),
(104, 12, 6, 2, 4800),
(105, 13, 4, 1, 1200),
(106, 14, 6, 1, 800),
(107, 15, 96, 1, 500),
(108, 16, 93, 1, 50),
(109, 17, 8, 1, 900),
(110, 18, 72, 1, 350),
(111, 19, 89, 1, 50),
(112, 19, 90, 1, 30),
(113, 20, 9, 1, 1400),
(114, 20, 104, 1, 169),
(115, 21, 92, 1, 50),
(116, 21, 97, 1, 500),
(117, 21, 6, 1, 800),
(118, 22, 5, 1, 600),
(119, 22, 33, 1, 2000),
(120, 22, 48, 1, 250),
(121, 22, 95, 1, 50),
(122, 23, 2, 1, 1000),
(123, 23, 89, 1, 50),
(124, 23, 90, 1, 30),
(125, 24, 72, 2, 700),
(126, 24, 74, 1, 899),
(127, 24, 73, 3, 1050),
(128, 25, 104, 2, 338),
(129, 25, 72, 2, 700),
(130, 26, 72, 1, 350),
(131, 27, 5, 1, 600),
(132, 27, 104, 2, 338),
(133, 28, 74, 1, 899),
(134, 28, 73, 1, 350),
(135, 29, 47, 1, 650),
(136, 29, 48, 1, 250);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  `product_quantity` int(11) DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`, `product_quantity`) VALUES
(1, 13, 2, 'Samsung Galaxy S24', 1400, 'Samsung galaxy s7 edge', 'samsung-s24.png', 'samsung mobile electronics', 50),
(2, 13, 3, 'iPhone 14', 1000, 'iphone 5s', 'iphone-14-fixed.png', 'mobile iphone apple', 49),
(3, 14, 3, 'Apple iPad 11th Gen', 1200, 'ipad apple brand', 'apple-light.jpg', 'apple ipad tablet', 50),
(4, 13, 3, 'iPhone 14 Pro Max', 1200, 'Apple iPhone ', 'iphone-14-pro.png', 'iphone apple mobile', 50),
(5, 14, 3, 'Apple iPad 10th Gen ', 600, 'samsung ipad', 'ipad-pink.jpg', 'ipad tablet samsung', 49),
(6, 8, 2, 'Samsung Galaxy Book', 800, 'samsung Black combination Laptop', 'laptop_PNG5939.png', 'samsung laptop ', 50),
(7, 1, 1, 'LG Ultra PC', 1200, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion', 50),
(8, 1, 4, 'Sony', 900, 'Sony Mobile', '530201353846AM_635_sony_xperia_z.png', 'sony mobile', 50),
(9, 13, 3, 'iPhone 14 Pro Max Plus', 1400, 'iphone', 'iphone-14-pro-max.png', 'iphone apple mobile', 50),
(33, 6, 2, 'Samsung Smart Refrigerator', 2000, 'Refrigerator', 'samsung-fridge.png', 'refrigerator samsung', 50),
(39, 6, 11, 'Ninja Blender', 250, 'Mixer Grinder', 'blender.jpg', 'Mixer Grinder', 50),
(45, 13, 2, 'Samsung Galaxy Note 20', 1000, '0', 'samsung-note.png', 'samsung galaxy Note 3 neo', 50),
(46, 13, 2, 'Samsung Galaxy Note 20 Plus', 1100, '', 'samsung-note-plus.jpg', 'samsung galxaxy note 3 neo', 50),
(47, 8, 9, 'Dell Inspiron', 650, 'nbk', 'product01.png', 'Dell Laptop', 49),
(48, 9, 8, 'JBL Max Pro', 250, 'Headphones', 'jbl-headphones.jpg', 'Headphones Sony', 49),
(49, 9, 8, 'JBL Tune 510', 250, 'Headphones', 'jbl-earbuds.jpg', 'Headphones Sony', 50),
(71, 1, 2, 'Samsung galaxy s7', 500, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics', 50),
(72, 9, 10, 'sony Headphones', 350, 'sony Headphones', 'sony-headphones.jpg', 'sony Headphones electronics gadgets', 45),
(73, 9, 2, 'samsung Headphones', 350, 'samsung Headphones', 'samsung-headphones.jpg', 'samsung Headphones electronics gadgets', 46),
(74, 8, 1, 'HP Stream', 899, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics', 48),
(75, 8, 1, 'HP Pavilion', 990, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics', 50),
(76, 14, 2, 'Samsung Galaxy Tab', 450, 'sony note 6gb ram', 'samsung-tablet.jpg', 'sony note 6gb ram mobile electronics', 50),
(77, 8, 3, 'Apple MacBook', 1644, 'MSV laptop 16gb ram', 'apple-macbook.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics', 50),
(78, 8, 3, 'Apple MacBook Pro', 1899, 'dell laptop 8gb ram intel integerated Graphics', 'apple-macbook-pro.png', 'dell laptop 8gb ram intel integerated Graphics electronics', 50),
(82, 8, 7, 'Microsoft Surface Book Pro', 1490, 'Microsoft Surface Pro', 'product10.png', 'microsoft laptop', 50),
(83, 8, 7, 'Microsoft Surface Pro', 1490, 'Microsoft Surface Pro Deluxe', 'product10.png', 'microsoft laptop deluxe', 50),
(88, 9, 3, 'Beats Pro 3', 299, 'Beats Pro 3', 'product13.png', 'apple headphones beats', 50),
(89, 10, 2, 'Samsung Wireless Charger', 50, 'Samsung Wireless Phone Charger', 'product14.png', 'samsung mobile electronics', 49),
(90, 10, 3, 'iPhone Phone Case', 30, 'iPhone phone case', 'apple-cover.png', 'apple mobile electronics', 49),
(91, 6, 5, 'LG OED TV', 5000, 'lg oed tv', 'lg-tv.png', 'lg tv', 50),
(92, 6, 11, 'Ninja Air Fryer', 50, 'ninja air fryer', 'air-fryer.png', 'food home', 50),
(93, 11, 7, 'Microsoft Mouse', 50, 'microsoft mouse', 'microsoft-mouse.jpg', 'desktop mouse', 50),
(94, 11, 7, 'Microsoft Wireless Keyboard', 50, 'microsoft keyboard', 'microsoft-kb.jpg', 'desktop keyboard', 50),
(95, 11, 3, 'Apple Wireless Keyboard', 50, 'apple keyboard', 'apple-kb.jpg', 'desktop laptop', 50),
(96, 12, 10, 'PlayStation 5', 500, 'playstation 5', 'ps5.jpg', 'gaming console ps5', 50),
(97, 12, 7, 'Xbox Series X', 500, 'xbox series x', 'xbox.jpg', 'gaming console xbox', 50),
(98, 12, 7, 'Xbox Series X Controller', 65, 'xbox series x controller', 'xbox-controller.jpg', 'gaming console xbox', 50),
(103, 13, 3, 'iPhone 15', 1100, 'Iphone 15', 'iphone-15.png', 'iPhone 15', 50),
(106, 9, 3, 'AirPods123', 169, 'Airpods apple', 'AirPods.jpeg', 'Headphones Apple', 50);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(2, 'Temp', 'User', 'tempuser@gmail.com', '$2y$10$ysLu0tIdFHgwyZ.rrEaACO9nmNAthHUIqPsu4eNZaz8CpJYgpc7lm', '3466269824', '4010 Linkwood Dr', 'Houston'),
(3, 'Sam', 'J', 'sam@gmail.com', '$2y$10$K.pxQDrAxT9lSgijAim0x.Qm3tX5rxHkQ6FHb7ub7JGEMenq9MpIS', '1122334455', 'Thrissur', 'India'),
(4, 'Maria Ann', 'Toms', 'maria.anntoms1997@gmail.com', '$2y$10$.aoTpfy7hiPyZMAWozUMEu9aQYeVeBdO5mIeiowlOp5B5nbmJbAyy', '3466269824', '4010 Linkwood Dr', 'Houston'),
(5, 'zon', 'P', 'zon@gmail.com', '$2y$10$OOt68bqJxHOHTHAFzUbhbeDFEYqdZHS7O811hWdPGhZqPW7Vz2zT.', '1234567890', 'Houston', 'United States'),
(6, 'Don', 'P', 'don@gmail.com', '$2y$10$qmAPOFLpkwwXcuWY3RnUqeqoyBrWgaB.7Z859SBstkwe3Z5zW3qhS', '1234567890', 'Thrissur', 'India'),
(7, 'Tom', 'Jerry', 'tom@gmail.com', '$2y$10$Xn.k2ydFn4sjss6.MP2P7.tklTDlMMELaEURSXyxct4d3UaVuZtyq', '1122334455', 'Thrissur', 'India'),
(8, 'Mat', 'J', 'mat@gmail.com', '$2y$10$qGUPbRp9aW22FePqt/asyup771U3jDj5WIAEnWMnCIh0B.FtMKfN2', '1122334455', 'Sydney', 'Aus'),
(9, 'Jim', 'k', 'jim@gmail.com', '$2y$10$OH0x3sT.i.suBLGIZyf7XejMf9P/nQRc.328HaO0VB0e3dPdsIyii', '1234567890', 'Tx', 'Hou'),
(10, 'maria', 'toms', 'maria@gmail.com', '$2y$10$4W/7Ke3A8AnWaCy6yQIsRu7yjL5.8NAwJnVJOLpTaev6LmCFTXSgC', '1122334455', 'yx', 'Houston'),
(11, 'test', 'x', 'test@gmail.com', '$2y$10$u/9q0TL2NujAg92liI6sL.NG.TuYiPSLs64hxq290EHUdxwR7edTO', '1122334455', 'as', 'Houston'),
(13, 'Ray', 'K', 'ray@gmail.com', '$2y$10$3zgCpEr/IeX77g97JXvWReFapZMvy1oCzvDzR9.rndVKOxt5wY2ny', '1122334455', 'tx', 'Houston'),
(14, 'Kate', 'R', 'kate@gmail.com', '$2y$10$cdfLhZKHeaQlVslx7uaVR.d73qNIYVC3D6GVb8tpqVgIDhZjBGfG.', '9090909090', 'CA', 'xyz'),
(15, 'ron', 't', 'ron@gmail.com', '$2y$10$10hUJVHiyRwvpxjzXvSnAu84o/8Yv4S6wRbzpMmnEqSQX90wp0A5i', '3636363636', 'Tx', 'Hou'),
(16, 'tim', 'k', 'tim@gmail.com', '$2y$10$WE3SkQiBsPNow5kcdwY2X.6KCl23/tcpcIAThsDXfY/j2H0EIg0wy', '2727272727', 'Tx', 'Houston'),
(17, 'Maria', 'T', 'mariat@gmail.com', '$2y$10$gbDdRDfPvsBA80HDflHr4ebgQiVWxYAPNSRWZNCnOCAPY.kXkBsBy', '1212121212', 'tx', 'Houston'),
(18, 'Kiran', 'S', 'kiran@gmail.com', '$2y$10$zEjRsGH3f2WJ6Y8szlhI5.25UmQ7/ALUAyEuFlLxL3WNcZ1aX2ruW', '7878787878', 'TZ', 'Houston'),
(19, 'Kevin', 'J', 'kevin@gmail.com', '$2y$10$68XSOVAwzdPZOHrX7uTm7u4MQtBI3toZTl5.vTMXHikbRFg3TSKoK', '1231231231', 'Houston', 'United States');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(2, 'Temp', 'User', 'tempuser@gmail.com', '$2y$10$ysLu0tIdFHgwyZ.rrEaACO9nmNAthHUIqPsu4eNZaz8CpJYgpc7lm', '3466269824', '4010 Linkwood Dr', 'Houston'),
(3, 'Sam', 'J', 'sam@gmail.com', '$2y$10$K.pxQDrAxT9lSgijAim0x.Qm3tX5rxHkQ6FHb7ub7JGEMenq9MpIS', '1122334455', 'Thrissur', 'India'),
(4, 'Maria Ann', 'Toms', 'maria.anntoms1997@gmail.com', '$2y$10$.aoTpfy7hiPyZMAWozUMEu9aQYeVeBdO5mIeiowlOp5B5nbmJbAyy', '3466269824', '4010 Linkwood Dr', 'Houston'),
(5, 'zon', 'P', 'zon@gmail.com', '$2y$10$OOt68bqJxHOHTHAFzUbhbeDFEYqdZHS7O811hWdPGhZqPW7Vz2zT.', '1234567890', 'Houston', 'United States'),
(6, 'Don', 'P', 'don@gmail.com', '$2y$10$qmAPOFLpkwwXcuWY3RnUqeqoyBrWgaB.7Z859SBstkwe3Z5zW3qhS', '1234567890', 'Thrissur', 'India'),
(7, 'Tom', 'Jerry', 'tom@gmail.com', '$2y$10$Xn.k2ydFn4sjss6.MP2P7.tklTDlMMELaEURSXyxct4d3UaVuZtyq', '1122334455', 'Thrissur', 'India'),
(8, 'Mat', 'J', 'mat@gmail.com', '$2y$10$qGUPbRp9aW22FePqt/asyup771U3jDj5WIAEnWMnCIh0B.FtMKfN2', '1122334455', 'Sydney', 'Aus'),
(9, 'Jim', 'k', 'jim@gmail.com', '$2y$10$OH0x3sT.i.suBLGIZyf7XejMf9P/nQRc.328HaO0VB0e3dPdsIyii', '1234567890', 'Tx', 'Hou'),
(10, 'maria', 'toms', 'maria@gmail.com', '$2y$10$4W/7Ke3A8AnWaCy6yQIsRu7yjL5.8NAwJnVJOLpTaev6LmCFTXSgC', '1122334455', 'yx', 'Houston'),
(11, 'test', 'x', 'test@gmail.com', '$2y$10$u/9q0TL2NujAg92liI6sL.NG.TuYiPSLs64hxq290EHUdxwR7edTO', '1122334455', 'as', 'Houston'),
(13, 'Ray', 'K', 'ray@gmail.com', '$2y$10$3zgCpEr/IeX77g97JXvWReFapZMvy1oCzvDzR9.rndVKOxt5wY2ny', '1122334455', 'tx', 'Houston'),
(14, 'Kate', 'R', 'kate@gmail.com', '$2y$10$cdfLhZKHeaQlVslx7uaVR.d73qNIYVC3D6GVb8tpqVgIDhZjBGfG.', '9090909090', 'CA', 'xyz'),
(15, 'ron', 't', 'ron@gmail.com', '$2y$10$10hUJVHiyRwvpxjzXvSnAu84o/8Yv4S6wRbzpMmnEqSQX90wp0A5i', '3636363636', 'Tx', 'Hou'),
(16, 'tim', 'k', 'tim@gmail.com', '$2y$10$WE3SkQiBsPNow5kcdwY2X.6KCl23/tcpcIAThsDXfY/j2H0EIg0wy', '2727272727', 'Tx', 'Houston'),
(17, 'Maria', 'T', 'mariat@gmail.com', '$2y$10$gbDdRDfPvsBA80HDflHr4ebgQiVWxYAPNSRWZNCnOCAPY.kXkBsBy', '1212121212', 'tx', 'Houston'),
(18, 'Kiran', 'S', 'kiran@gmail.com', '$2y$10$zEjRsGH3f2WJ6Y8szlhI5.25UmQ7/ALUAyEuFlLxL3WNcZ1aX2ruW', '7878787878', 'TZ', 'Houston'),
(19, 'Kevin', 'J', 'kevin@gmail.com', '$2y$10$68XSOVAwzdPZOHrX7uTm7u4MQtBI3toZTl5.vTMXHikbRFg3TSKoK', '1231231231', 'Houston', 'United States');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
