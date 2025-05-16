-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2023 at 01:59 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommercesite`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `categoryTitle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryDescription`, `categoryTitle`) VALUES
(1, 'iphone', 'iphone'),
(2, 'Macbook', 'macbook'),
(3, 'ipad', 'ipad'),
(4, 'watch', 'watch'),
(5, 'Airpods', 'airpods'),
(7, 'desktop computers', 'Desktop');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneno` varchar(12) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `address`, `city`, `landmark`, `name`, `phoneno`, `pincode`, `state`, `order_id`) VALUES
(1, 'abc ', 'Jamnagar ', 'ertyu', 'kc', '1234567890', '361071', 'Andhra Pradesh', 1),
(2, 'abc ', 'rajkot', 'sdfgvfdh', 'kc', '1234567890', '324561', 'Andhra Pradesh', 2),
(3, 'radhika nivas,gulabnagr,jamnagar-21321312, juni sak market,okkkkkkkkkkkkkkkkk ', 'bombay', '12rtyj', 'abc', '3546788909', '894894', 'Andhra Pradesh', 3),
(4, 'radhika nivas,gulabnagr,jamnagar-21321312, juni sak market,okkkkkkkkkkkkkkkkk ', 'agra', 'werdgfhj', 'abc', '3546788909', '948446', 'Andhra Pradesh', 4),
(5, 'yghujkl ', 'morbi', 'qwerfg', 'john32', '7854654660', '864646', 'Andhra Pradesh', 5),
(6, 'yghujkl ', 'tfghjkl', 'tgyuhjnmk', 'john32', '7854654699', '486546', 'Andhra Pradesh', 6),
(7, 'sdgfhgfh ', 'ahemadabad', 'near modi school', 'aastha', '9875465135', '356576', 'Andhra Pradesh', 7),
(8, 'sj highway ', 'sadfgh', 'qsdfg', 'peter', '5989465466', '132453', 'Andhra Pradesh', 8),
(9, 'ghklm ', 'Jamnagar, Gujarat, India', 'rfgh', 'dc', '5987468446', '568784', 'Andhra Pradesh', 9),
(10, 'abcsdfbgh ', 'Jamnagar ', 'wesrdfgh', 'kc', '1234567890', '656416', 'Gujarat', 10),
(11, 'abcsdfbgh ', 'Jamnagar ', 'drtfvgbhnj', 'kc', '1234567890', '895654', 'Andhra Pradesh', 11),
(12, 'abcsdfbgh ', 'Jamnagar ', 'rfgh', 'kc', '1234567890', '878990', 'Andhra Pradesh', 12),
(13, 'abcsdfbgh ', 'surat', 'kamrej', 'kc', '1234567890', '256123', 'Andhra Pradesh', 13),
(14, 'abcsdfbgh ', 'Jamnagar ', 'l;k;lj;', 'kc', '1234567890', '361006', 'Andhra Pradesh', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `Status` varchar(100) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `order_id` varchar(200) DEFAULT NULL,
  `payment_id` longtext DEFAULT NULL,
  `receipt` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `orderDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `Status`, `amount`, `order_id`, `payment_id`, `receipt`, `user_id`, `orderDate`) VALUES
(1, 'paid', 215820, 'order_M7e9a64z7CyfKL', 'pay_M7e9vMvWIS9w98', 'txn_123434', 1, '2023-06-29 11:58:43'),
(2, 'paid', 107910, 'order_M7eAz6RmPOqz4j', 'pay_M7eBET56e52b9Q', 'txn_123434', 1, '2023-06-29 11:59:58'),
(3, 'paid', 76000, 'order_M7eCl8VCsYGTnA', 'pay_M7eCxEutK3RABK', 'txn_123434', 3, '2023-06-29 12:01:35'),
(4, 'paid', 41769, 'order_M7eDxtI7vqerIg', 'pay_M7eEHbe4FbAiRq', 'txn_123434', 3, '2023-06-29 12:02:51'),
(5, 'paid', 157248, 'order_M7eHQNaBKZl4LB', 'pay_M7eHllZ6eEh0iN', 'txn_123434', 11, '2023-06-29 12:06:08'),
(6, 'paid', 195534, 'order_M7eZEm7OWBJqvK', 'pay_M7eZQpJCy4THvv', 'txn_123434', 11, '2023-06-29 12:22:58'),
(7, 'paid', 107910, 'order_M864GHtABPPM3v', 'pay_M864V1l2IuUPRk', 'txn_123434', 5, '2023-06-30 15:17:01'),
(8, 'paid', 17910, 'order_M86MbaZ6pJqndK', 'pay_M86Mx8KaaflOAP', 'txn_123434', 9, '2023-06-30 15:34:29'),
(9, 'paid', 35820, 'order_MAarpZST18YvZt', 'pay_MAas5Ul8guqoKI', 'txn_123434', 8, '2023-07-06 22:42:43'),
(10, 'paid', 116910, 'order_MChojuaMLpItpo', 'pay_MChp2O0yKN5ud8', 'txn_123434', 1, '2023-07-12 06:48:42'),
(11, 'paid', 116910, 'order_MEMI0NahjuLawi', 'pay_MEMIHYLkGKZX1f', 'txn_123434', 1, '2023-07-16 11:03:20'),
(12, 'paid', 76000, 'order_MFsEIofwdzn2y9', 'pay_MFsEe6GIiOwCnq', 'txn_123434', 1, '2023-07-20 06:56:57'),
(13, 'paid', 528, 'order_MLPanTb6Xq4TK3', 'pay_MLPbCbZPTKXB4L', 'txn_123434', 1, '2023-08-03 06:50:09'),
(14, 'paid', 277719, 'order_MLVnECQeCBH0tF', 'pay_MLVnpBX61ooSvY', 'txn_123434', 1, '2023-08-03 12:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `quantity`, `order_id`, `product_id`) VALUES
(1, 2, 1, 3),
(2, 1, 2, 3),
(3, 1, 3, 16),
(4, 1, 4, 5),
(5, 2, 5, 6),
(6, 1, 6, 6),
(7, 1, 6, 9),
(8, 1, 7, 3),
(9, 1, 8, 13),
(10, 2, 9, 13),
(11, 1, 10, 9),
(12, 1, 11, 9),
(13, 1, 12, 34),
(14, 1, 13, 35),
(15, 1, 14, 1),
(16, 1, 14, 2),
(17, 1, 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pId` int(11) NOT NULL,
  `pDescription` longtext DEFAULT NULL,
  `pDiscount` int(11) DEFAULT NULL,
  `pName` varchar(200) DEFAULT NULL,
  `pPic` longtext DEFAULT NULL,
  `pPrice` int(11) DEFAULT NULL,
  `pQuantity` int(11) DEFAULT NULL,
  `category_categoryId` int(11) DEFAULT NULL,
  `pOhterPics` longtext DEFAULT NULL,
  `available_quantity` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pId`, `pDescription`, `pDiscount`, `pName`, `pPic`, `pPrice`, `pQuantity`, `category_categoryId`, `pOhterPics`, `available_quantity`, `active`) VALUES
(1, 'fghbjnm', 15, 'iphone 14 pro', 'iphone 14 pro_0.jpg', 50000, 80, 1, 'iphone 14 pro_1.jpg,iphone 14 pro_2.jpg,iphone 14 pro_3.jpg', 79, 1),
(2, '16.95 cm (6.7) or 15.40 cm (6.1) Super Retina XDR display5 Advanced dual-camera system 12MP Main Ultra Wide Action mode smooths out shaky handheld videos', 9, 'Apple iPhone 14 Pro Max', 'Apple iPhone 14 Pro Max_0.jpg', 139900, 50, 1, 'Apple iPhone 14 Pro Max_1.jpg,Apple iPhone 14 Pro Max_2.jpg,Apple iPhone 14 Pro Max_3.jpg', 49, 1),
(3, 'MacBook Air Laptop with M2 chip: 34.46 cm (13.6-inch) Liquid Retina Display, 8GB RAM, 256GB SSD Storage, Backlit Keyboard, 1080p FaceTime HD Camera. Works with iPhone/iPad; Starlight', 10, 'iphone 15 pro', 'iphone 15 pro_0.jpg', 119900, 79, 1, 'iphone 15 pro_1.jpg,iphone 15 pro_2.jpg,iphone 15 pro_3.jpg', 78, 1),
(4, 'Automatically on, automatically connected Easy setup for all your Apple devices, Quick access to Siri by saying \"Hey Siria\", Double-tap to play or skip forward, New Apple H1 headphone chip delivers faster wireless connection to your devices, Charges quickly in the case, Case can be charged using the Lightning connector', 16, 'AirPods 2nd generation', 'AirPods 2nd generation_0.jpg', 14900, 140, 5, 'AirPods 2nd generation_1.jpg,AirPods 2nd generation_2.jpg,AirPods 2nd generation_3.jpg', 140, 1),
(5, '[GPS 41 mm] Smart Watch w/Midnight Aluminium Case with Midnight Sport Band. Fitness Tracker, Blood Oxygen & ECG Apps, Always-On Retina Display, Water Resistant', 9, 'Watch Series 8', 'Watch Series 8_0.jpg', 45900, 97, 4, 'Watch Series 8_1.jpg,Watch Series 8_2.jpg,Watch Series 8_3.jpg', 97, 1),
(6, 'Brilliant 11-inch Liquid Retina display with ProMotion, True Tone, and P3 wide color, M2 chip with 8-core CPU and 10-core GPU,12MP Wide camera, 10MP Ultra Wide back camera, and LiDAR Scanner for immersive AR', 4, 'iPad Pro', 'iPad Pro_0.jpg', 81900, 90, 3, 'iPad Pro_1.jpg,iPad Pro_2.jpg,iPad Pro_3.jpg', 86, 1),
(7, '4.5K Retina Display (24-inch/60.96 cm, M1 chip with 8-core CPU and 8-core GPU, 8GB RAM, 256GB) - Silver, Six-speaker sound system for a remarkably robust and high-quality audio experience. Apple M1 chip delivers powerful performance with 8-core CPU and 8-core GPU', 6, 'iMac', 'iMac_0.jpg', 139900, 50, 7, 'iMac_1.jpg,iMac_2.jpg,iMac_3.jpg', 49, 1),
(9, 'M2 Pro chip with 10âcore CPU and 16âcore GPU: 33.74 cm (14.2-inch), 16GB Unified Memory, 512GB SSD Storage. Works with iPhone/iPad; Space Grey', 10, 'MacBook Pro 13', 'MacBook Pro 13_0.jpg', 129900, 80, 2, 'MacBook Pro 13_1.jpg,MacBook Pro 13_2.jpg,MacBook Pro 13_3.jpg', 75, 1),
(11, 'sadfghj', 10, 'iphone 14 plus', 'iphone 14 plus_0.jpg', 89900, 50, 1, 'iphone 14 plus_1.jpg,iphone 14 plus_2.jpg,iphone 14 plus_3.jpg', 50, 1),
(13, 'sdfghjkl', 10, 'AirPods 3rd generation', 'AirPods 3rd generation_0.jpg', 19900, 24, 5, 'AirPods 3rd generation_1.jpg,AirPods 3rd generation_2.jpg,AirPods 3rd generation_3.jpg', 21, 1),
(15, 'dsfg', 5, 'AirPods 4th generation', 'AirPods 4th generation_0.jpg', 50000, 87, 5, 'AirPods 4th generation_1.jpg,AirPods 4th generation_2.jpg,AirPods 4th generation_3.jpg', 87, 1),
(16, 'qwefg', 5, 'iphone 13 pro', 'iphone 13 pro_0.jpg', 50000, 12, 1, 'iphone 13 pro_1.jpg,iphone 13 pro_2.jpg,iphone 13 pro_3.jpg', 12, 1),
(32, 'drfghbjn', 5, '24 inch iMac', '24 inch iMac_0.jpg', 58000, 5, 7, '24 inch iMac_1.jpg,24 inch iMac_2.jpg,24 inch iMac_3.jpg', 5, 1),
(33, 'sdfgvbhjn', 2, 'watch 3 pro', 'watch 3 pro_0.jpg', 9000, 500, 4, 'watch 3 pro_1.jpg,watch 3 pro_2.jpg,watch 3 pro_3.jpg', 500, 1),
(34, 'ghjkl;', 5, 'MacBook Pro 12', 'MacBook Pro 12_0.jpg', 80000, 5, 2, 'MacBook Pro 12_1.jpg,MacBook Pro 12_2.jpg,MacBook Pro 12_3.jpg', 4, 1),
(35, 'dfcgvbhjn', 7, 'iPad Pro plus', 'iPad Pro plus_0.jpg', 4500, 678, 3, 'iPad Pro plus_1.jpg,iPad Pro plus_2.jpg,iPad Pro plus_3.jpg', 678, 1),
(36, 'rtfgyhujmkl', 15, 'macbook air', 'macbook air_0.jpg', 81900, 100, 2, 'macbook air_1.jpg,macbook air_2.jpg,macbook air_3.jpg', 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userAddress` longtext DEFAULT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `userPassword` varchar(100) DEFAULT NULL,
  `userPhone` varchar(12) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  `active` text NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userAddress`, `userEmail`, `userName`, `userPassword`, `userPhone`, `userType`, `active`) VALUES
(1, 'abcsdfbgh', 'kc@gmail.com', 'kc', '12345', '1234567890', 'normal', 'active'),
(2, 'delhi', 'admin@gmail.com', 'admin', 'admin', '4865123468', 'admin', 'active'),
(3, 'radhika nivas,gulabnagr,jamnagar-21321312, juni sak market,okkkkkkkkkkkkkkkkk', 'kc12@gmail.com', 'abc', 'abc', '3546788909', 'normal', 'active'),
(5, 'dfghbjkmyhuj', 'aastha@gmail.com', 'aastha', 'aastha486', '8657413542', 'normal', 'active'),
(8, 'ghklm', 'dc@gmail.com', 'dc', 'dc', '5987468446', 'normal', 'active'),
(9, 'tgyhjklm', 'peter@gmail.com', 'peter2', 'peter', '9894164165', 'normal', 'active'),
(10, 'fgvjmkfghbjj', 'jack@gmail.com', 'jack', 'jack', '8948961464', 'normal', 'inactive'),
(11, 'yghujkl', 'john@gmail.com', 'john32', 'john', '78546546569', 'normal', 'inactive'),
(12, 'okkkkkkkkk', 'test@gamil.com', 'test', 'test', '8746874684', 'normal', 'inactive'),
(13, 'ghbnjm', 'sf@gmail.sdf', 'sd', '123', '9845194846', 'normal', 'active'),
(14, 'ghbnjmk,', 'demo@gmail.com', 'demo', 'demo', '486546549', 'normal', 'inactive'),
(15, 'erg', 'tom234@gmail.com', 'kc213', '12345', '1234567', 'normal', 'inactive'),
(16, 'asdfgh', 'aasthavariya@gmail.com', 'sfdsf', 'aastha', '1234567876', 'normal', 'active'),
(18, 'dfghj', 'priya@gmail.com', 'priya', 'priya', '6894616542', 'normal', 'active'),
(19, 'fgvbhnm', 'isha@gmail.com', 'isha', 'isha', '8956253415', 'normal', 'active'),
(20, 'fgvbhn', 'dc213@gmail.com', 'dc213', '213', '9895265663', 'normal', 'active'),
(21, 'fgvbhn', 'dc23@gmail.com', 'dc213', '213', '9895265663', 'normal', 'active'),
(22, 'fghbjn', 'nick@gmail.com', 'nick', 'nick', '9546684640', 'normal', 'active'),
(23, 'ghbjnkm', 'krupali@gmail.com', 'krupali', 'krupali', '4567890987', 'normal', 'active'),
(24, 'fdgdfsfew', 'tom@gmail.com', 'tom', 'tom', '9563365656', 'normal', 'active'),
(25, 'Jamnagar', 'finch0108@gmail.com', 'steve', 'steve', '6354643095', 'normal', 'active');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_demo`
-- (See below for the actual view)
--
CREATE TABLE `view_demo` (
`order_id` varchar(200)
,`payment_id` longtext
,`Status` varchar(100)
,`amount` bigint(20)
,`receipt` varchar(200)
,`orderDate` datetime
,`quantity` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_demo`
--
DROP TABLE IF EXISTS `view_demo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_demo`  AS SELECT `orders`.`order_id` AS `order_id`, `orders`.`payment_id` AS `payment_id`, `orders`.`Status` AS `Status`, `orders`.`amount` AS `amount`, `orders`.`receipt` AS `receipt`, `orders`.`orderDate` AS `orderDate`, `order_product`.`quantity` AS `quantity` FROM (`orders` join `order_product`) WHERE `orders`.`id` = `order_product`.`order_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD UNIQUE KEY `categoryTitle` (`categoryTitle`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_naxn6r7m3tq604x3s4ja1phbf` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5o21t3sr1d00xjrras17vc723` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_dc9i67o6dcmx5cx9wiyub0bpe` (`order_id`),
  ADD KEY `FK_1ndrwdgvvhrxwu56fth2x9ujd` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pId`),
  ADD KEY `FK_gphcf7smyfwgojvmyxgwig4l8` (`category_categoryId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `FK_naxn6r7m3tq604x3s4ja1phbf` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_5o21t3sr1d00xjrras17vc723` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `FK_1ndrwdgvvhrxwu56fth2x9ujd` FOREIGN KEY (`product_id`) REFERENCES `product` (`pId`),
  ADD CONSTRAINT `FK_dc9i67o6dcmx5cx9wiyub0bpe` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_gphcf7smyfwgojvmyxgwig4l8` FOREIGN KEY (`category_categoryId`) REFERENCES `category` (`categoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
