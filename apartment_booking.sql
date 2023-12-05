-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2023 at 12:50 PM
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
-- Database: `apartment_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `description`, `price`, `is_available`) VALUES
(1, 'Deluxe Suite', 'Spacious deluxe suite with a view', 150.00, 1),
(2, 'Standard Room', 'Comfortable standard room for a relaxing stay', 100.00, 1),
(3, 'Executive Suite', 'Luxurious executive suite with modern amenities', 200.00, 1),
(4, 'Family Suite', 'Perfect for family vacations with multiple bedrooms', 180.00, 1),
(5, 'Penthouse', 'Exclusive penthouse with panoramic city views', 250.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `apartment_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `reservation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `apartment_id`, `name`, `email`, `phone`, `checkin_date`, `checkout_date`, `reservation_date`) VALUES
(39, NULL, NULL, 'Melānija Miķelsone', 'mmelushha@gmail.com', '26867482', '2023-11-29', '2023-12-20', '2023-12-04 19:18:16'),
(40, 24, 1, 'NAP Napy', 'nap@gmail.com', '22234566', '2023-12-05', '2023-12-18', '2023-12-04 20:25:17'),
(41, 24, 5, 'NAP Napy', 'nap@gmail.com', '22234566', '2023-12-05', '2023-12-18', '2023-12-04 20:26:09'),
(42, 24, 5, 'Mantis ', 'mantyyy@gmail.com', '26667482', '2023-12-06', '2024-01-05', '2023-12-04 20:47:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `full_name`) VALUES
(1, 'root', 'mel@gmail.com', 'mel', NULL),
(2, 'root', 'mel@gmail.com', 'mel1', NULL),
(3, 'john_doe', 'john.doe@example.com', 'secure_password', 'John Doe'),
(4, 'john_doe', 'john.doe@example.com', 'secure_password', 'John Doe'),
(5, 'sal', 'sal@gmail.com', '$2y$10$WXuNd/YztdqfXv1GQRZ9LuGSR9Oa47JL.MetUIXBCLDk6/YwnuDfS', 'sal salis'),
(6, 'sal', 'sal@gmail.com', '$2y$10$3AsiCs.JKIYeo/KxxBEhr.WK7zV.VwvYaZVADQGDHV9eVb1yMWTQq', 'sal salis'),
(7, 'sal', 'sal@gmail.com', '$2y$10$w.HR.tFhVFzQyAkBA5nywOvo6Q2iiLAAP8omEHYOY6fUnBLb/I6ea', 'sal salis'),
(8, 'sal', 'sal@gmail.com', '$2y$10$w0qyCo8oS1E2wzzpxSHB3O9bh7buCfY6nav/PHDGa7uJx/NeLVIxm', 'sal salis'),
(9, 'sal', 'sal@gmail.com', '$2y$10$w8AsUFfJ7ADr6BJPe4yjCemp4UQoT4MQQ5Qb4yIhPF25aR8IXf8HO', 'sal salis'),
(10, 'sal', 'sal@gmail.com', '$2y$10$nMTbnKOLaK6SJPp8/Xc13.wqoxqUbkPhao.ersfPeyDdfyk77YJQe', 'sal salis'),
(11, 'melis', 'meliy@gmail.com', '$2y$10$L0u.tdbt7N8Re0LkhOfAVOpRi4UVGlmAN4avYdotR/jCUxcJY5qOe', 'melis kart'),
(12, 'melis', 'meliy@gmail.com', '$2y$10$MxRDJsuEFFrYMNL6TqkofOnqWnuWngrNeFynjfMJ.2ZackZyG4dNa', 'melis kart'),
(13, 'Maiks', 'maikolis@gmail.com', '$2y$10$XlUwo.KEWwdfCBTi/Ws7huWhDdHwgR6WnxmdKM5ivjsMtEaybm1BK', 'Maiks Felfs'),
(14, '', 'maikolis@gmail.com', '$2y$10$jLkcZx4VHyML/01FJTE.bu0cUZuX.jNrfKXER8ITGnl2Zf.EdUzvu', 'Maiks Felfs'),
(15, 'mark', 'mark@gmail.com', '$2y$10$x7gSU7HWJbycm6ivK5VCEe5YXmTIpfuu.IzwOMpFykmrwTq2ALJBi', 'marky mak'),
(16, 'man', 'man@gmail.com', '$2y$10$8TYUOoRiYndXeqXOlz60iu1YwK3gg/SkXM6nSCymE08VeuJSq3EqC', 'man mannn'),
(17, 'his', 'his@gmail.com', '$2y$10$Rfqjgk.dgXZcopbQKx52Pek8kEH1FXvZ0UIFZk3NITUe8VFxW5kDS', 'hios hiiiss'),
(18, 'tavs', 'tavs@gmail.com', '$2y$10$PCjkjjvBq9Q.EKzmZe26jeZc5xg6id.haxYYqt7Z9RMBCncHMUQES', 'tavs tavvs'),
(19, 'tavijs', 'tavijs@gmail.com', '$2y$10$uSju3oR0GHsbBp9uSEZj2.MHABZmyf4IheSXYNhSvneyKUoWkeGEW', 'tavijs tavijsss'),
(20, 'madars', 'madars@gmail.com', '$2y$10$Tf99auQOD4O6zMGKg2ofFu6MiAtL/6woif8qyeLX63MeiXS4bIUxW', 'madars rutsk'),
(21, 'make', 'make@gmail.com', '$2y$10$vSpLi2VQNWyTS95O5sd/hemVjWlGqN50WBrYQ9c7RWyZWze2ScK8O', 'make make'),
(22, 'wap', 'wap@gmail.com', '$2y$10$3GVNe7lR7WI9Tv0HCunjNOVXOsbEyDlyA0HPjTaWiTw8f0SIBK0wG', 'wap waps'),
(23, 'hal', 'hal@gmail.com', '$2y$10$MHwYQpRrJXjUKPDMdgozj.VHn5tMwuraGJrnmGcT.mWqR.RdKI/eS', 'hal haly'),
(24, 'nap', 'nap@gmail.com', '$2y$10$gKovRXp5lEs/mMAMu7tux.U5t2w8zJS5AoZOBnFhWIkSCE3/0pNS6', 'nap napyy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `apartment_id` (`apartment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
