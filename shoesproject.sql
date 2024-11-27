-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 02:41 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoesproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_cost` decimal(6,2) NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
  `user_id` int(11) NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_cost`, `order_status`, `user_id`, `user_phone`, `user_city`, `user_address`, `order_date`) VALUES
(5, '343.00', 'Not Paid', 1, 1234567, 'dfgh', 'asdfg', '2024-10-06 18:35:51'),
(6, '1234.00', 'Not Paid', 1, 987654, 'dfds', 'gfd', '2024-10-07 00:06:28'),
(7, '1440.00', 'Not Paid', 2, 0, 'Ã¡df', 'Æ°egh', '2024-10-17 05:37:56'),
(8, '188.00', 'not paid', 3, 0, 'Ã¡df', 'Æ°egh', '2024-10-19 18:09:34'),
(9, '188.00', 'not paid', 3, 0, 'Ã¡df', 'Æ°egh', '2024-10-19 18:47:19'),
(10, '722.00', 'not paid', 3, 0, 'Ã¡df', 'Æ°egh', '2024-10-19 19:59:00'),
(11, '165.00', 'not paid', 4, 344501083, 'Ho Chi Minh city', '12345 erfgfds', '2024-10-20 06:49:49'),
(12, '320.00', 'Paid', 5, 1233333, 'HM', 'HM', '2024-10-20 20:55:35'),
(13, '475.00', 'not paid', 5, 122222, 'HM', 'HM', '2024-10-20 21:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `product_name`, `product_image`, `product_price`, `product_quantity`, `user_id`, `order_date`) VALUES
(8, 5, '2', 'Sport shoes', 'featured2.png', '178.00', 1, 1, '2024-10-06 18:35:51'),
(9, 5, '1', 'Sport Shoes SUP', 'featured1.png', '155.00', 1, 1, '2024-10-06 18:35:51'),
(10, 7, '3', 'white shoes', 'featured3.png', '255.00', 5, 2, '2024-10-17 05:37:56'),
(11, 7, '1', 'Sport Shoes SUP', 'featured1.png', '155.00', 1, 2, '2024-10-17 05:37:56'),
(12, 8, '2', 'Sport shoes', 'featured2.png', '178.00', 1, 3, '2024-10-19 18:09:34'),
(13, 9, '2', 'Sport shoes', 'featured2.png', '178.00', 1, 3, '2024-10-19 18:47:19'),
(14, 10, '2', 'Sport shoes', 'featured2.png', '178.00', 4, 3, '2024-10-19 19:59:00'),
(15, 11, '1', 'Sport Shoes SUP', 'featured1.png', '155.00', 1, 4, '2024-10-20 06:49:49'),
(16, 12, '1', 'Sport Shoes SUP', 'featured1.png', '155.00', 2, 5, '2024-10-20 20:55:35'),
(17, 13, '1', 'Sport Shoes SUP', 'featured1.png', '155.00', 3, 5, '2024-10-20 21:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `payment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `user_id`, `transaction_id`, `payment_date`) VALUES
(1, 12, 5, '', '2024-10-20 20:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` varchar(108) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_image2` varchar(255) DEFAULT NULL,
  `product_image3` varchar(255) DEFAULT NULL,
  `product_image4` varchar(255) DEFAULT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_special_offer` int(2) DEFAULT NULL,
  `product_color` varchar(108) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_category`, `product_description`, `product_image`, `product_image2`, `product_image3`, `product_image4`, `product_price`, `product_special_offer`, `product_color`) VALUES
(1, 'Sport Shoes SUP', 'Sport Shoes', 'awesome white shoes', 'featured1.png', 'featured1.png', 'featured1.png', 'featured1.png', '155.00', 0, 'white'),
(2, 'Sport shoes', 'Sport Shoes', 'awesome white shoes', 'featured2.png', 'featured2.png', 'featured2.png', 'featured2.png', '178.00', 10, 'white'),
(3, 'Pink And Gray shoes', 'Sport Shoes', 'awesome pink shoes', 'featured3.png', 'featured3.png', 'featured3.png', 'featured3.png', '176.00', 0, 'Pink'),
(4, 'white shoes', 'Sport Shoes', 'awesome white shoes', 'featured4.png', 'featured4.png', 'featured4.png', 'featured4.png', '195.00', 0, 'white'),
(5, 'white shoes', 'Sandals', 'awesome white shoes', 'sandal1.png', 'sandal1.png', 'sandal1.png', 'sandal1.png', '155.00', 0, 'white'),
(6, 'white shoes', 'Sandals', 'awesome white shoes', 'sandal2.png', 'sandal2.png', 'sandal2.png', 'sandal2.png', '155.00', 0, 'white'),
(7, 'white shoes', 'Sandals', 'awesome white shoes', 'sandal3.png', 'sandal3.png', 'sandal3.png', 'sandal3.png', '155.00', 0, 'white'),
(8, 'Sandal White', 'Sandals', 'dep sang', 'Sandal A1.png', 'Sandal A2.png', 'Sandal A3.png', 'Sandal A4.png', '200.00', 0, 'White'),
(12, 'High Heel Black 1', 'High Heels', 'Comfortable & Unique', 'High Heel Black 11.png', 'High Heel Black 12.png', 'High Heel Black 13.png', 'High Heel Black 14.png', '176.00', 0, 'Black'),
(13, 'High Heel Pink 1', 'High Heels', 'Beautiful', 'High Heel Pink 11.png', 'High Heel Pink 12.png', 'High Heel Pink 13.png', 'High Heel Pink 14.png', '156.00', 10, 'Pink'),
(14, 'Black Line High Heel', 'High Heels', 'Unique', 'Black Line High Heel1.png', 'Black Line High Heel2.png', 'Black Line High Heel3.png', 'Black Line High Heel4.png', '340.00', 12, 'Black'),
(15, 'Gray High Heel', 'High Heels', 'Comfortable', 'Gray High Heel1.png', 'Gray High Heel2.png', 'Gray High Heel3.png', 'Gray High Heel4.png', '250.00', 10, 'Gray'),
(16, 'Short Boots Black', 'Boots', 'Unique', 'Short Boots Black1.png', 'Short Boots Black2.png', 'Short Boots Black3.png', 'Short Boots Black4.png', '349.00', 9, 'Black'),
(17, 'Boots High A', 'Boots', 'beautiful', 'Boots High A1.png', 'Boots High A2.png', 'Boots High A3.png', 'Boots High A4.png', '174.00', 10, 'Black'),
(18, 'White Boots B', 'Boots', 'unique', 'White Boots B1.png', 'White Boots B2.png', 'White Boots B3.png', 'White Boots B4.png', '230.00', 0, 'White'),
(19, 'Brown Boots', 'Boots', 'brown and unique', 'Brown Boots1.png', 'Brown Boots2.png', 'Brown Boots3.png', 'Brown Boots4.png', '230.00', 0, 'Brown');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(108) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'nhi', 'abc@gmail.com', 'c33367701511b4f6020ec61ded352059'),
(2, 'fhk', '21091241.nhi@student.iuh.edu.vn', '25f9e794323b453885f5181f1b624d0b'),
(3, 'a', 'a@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(4, 'd', 'd@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(5, 'Thanh', 'nt@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UX_Constraint` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
