-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 14, 2024 at 04:29 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas-e-wallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Transportasi', 'Biaya transportasi perusahaan update', '2024-11-28 17:38:52', '2024-11-28 17:41:36'),
(3, 'Gaji', 'Gaji 1 minggu', '2024-11-28 17:52:33', '2024-11-28 17:52:33'),
(4, 'Topup', 'Topup Saldo', NULL, NULL),
(5, 'Qris', 'pembayaran melalui qris', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_11_28_234835_create_categories_table', 1),
(6, '2024_11_28_234959_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'YourAppName', '0221fb98034aaa5c7a938232af163255082bd273957a2e3ab76e579ee48daecb', '[\"*\"]', NULL, NULL, '2024-11-28 17:22:41', '2024-11-28 17:22:41'),
(2, 'App\\Models\\User', 1, 'UasEWallet', 'a94d05bbde485c64fe02076c3b4d838d50b08613a1d42a55fa5b45729ce06232', '[\"*\"]', NULL, NULL, '2024-11-28 17:24:06', '2024-11-28 17:24:06'),
(3, 'App\\Models\\User', 2, 'UasEWallet', '4aedf2f3de96a29d5001cb08e3edd6d90f7c83179bb16c4eec593474f5cd25aa', '[\"*\"]', NULL, NULL, '2024-11-28 17:31:38', '2024-11-28 17:31:38'),
(4, 'App\\Models\\User', 2, 'UasEWallet', 'e370737435e9910e37cbb9ac4dc6dcc0c4503893fd375fa9950d038a3c1238f8', '[\"*\"]', '2024-12-13 05:29:25', NULL, '2024-11-28 17:33:18', '2024-12-13 05:29:25'),
(5, 'App\\Models\\User', 1, 'UasEWallet', '5e45635fbcaf489db63bcd22e0c8bb3126b7c39597deb77d7e2247302538b646', '[\"*\"]', '2024-11-28 18:08:36', NULL, '2024-11-28 17:45:43', '2024-11-28 18:08:36'),
(6, 'App\\Models\\User', 2, 'UasEWallet', 'aa123007ce0c75bd48a6d351524727fa4d4d798fe44f317db5fb2c803f14f83d', '[\"*\"]', '2024-12-13 05:31:53', NULL, '2024-12-13 05:29:36', '2024-12-13 05:31:53'),
(7, 'App\\Models\\User', 2, 'UasEWallet', '810a589470f53caee52052b7b3315fe69c217eaa89e52d415f88acd9b0061ad0', '[\"*\"]', '2024-12-13 05:39:46', NULL, '2024-12-13 05:32:25', '2024-12-13 05:39:46'),
(8, 'App\\Models\\User', 2, 'UasEWallet', 'e434d6ffc9e3dea4707754c8b50ec0486982fd7bf60d29f77e1ab28b4febb667', '[\"*\"]', '2024-12-13 07:19:57', NULL, '2024-12-13 07:19:13', '2024-12-13 07:19:57'),
(9, 'App\\Models\\User', 1, 'UasEWallet', 'cc05416b55cb1b09d3e40f64e21bbd54f9cc6c9b60c63eff44f528251d63762b', '[\"*\"]', '2024-12-13 07:20:19', NULL, '2024-12-13 07:20:06', '2024-12-13 07:20:19'),
(10, 'App\\Models\\User', 1, 'UasEWallet', '8ecd3c720ce20e86459fac9262ca2ba8834522a5eece92e812f29025bef52c8f', '[\"*\"]', '2024-12-13 07:38:16', NULL, '2024-12-13 07:35:10', '2024-12-13 07:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('income','expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `type`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '20000.00', 'expense', 1, 'Bensin PP', '2024-11-28 17:49:06', '2024-11-28 17:49:06'),
(2, 1, '1010000.00', 'income', 3, 'Perbaikan gaji', '2024-11-28 17:53:56', '2024-11-28 17:56:21'),
(4, 1, '200000.00', 'income', 4, 'Gopay', '2024-12-13 07:36:08', '2024-12-13 07:36:08'),
(5, 1, '200000.00', 'income', 4, 'Gopay', '2024-12-13 07:37:34', '2024-12-13 07:37:34'),
(6, 1, '20000.00', 'expense', 5, 'Qris Indomaret', '2024-12-13 07:38:16', '2024-12-13 07:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'User 1', 'user@gmail.com', NULL, '$2y$10$zBEreldPlOUVyXVmH0yElelrSjwnUrOhAD/k7Ru1X7y4f8VjOme6u', 'user', NULL, '2024-11-28 17:17:30', '2024-11-28 17:17:30'),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$10$1wQfdJ.arOWo4pcFc3hjv.8mdw1jCQiF2oqeAO3Bw8gCxThuStZQi', 'admin', NULL, '2024-11-28 17:28:17', '2024-11-28 17:28:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
