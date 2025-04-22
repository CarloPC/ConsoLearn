-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2025 at 02:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `consolearndb`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `teacher_id`, `course_id`, `content`, `created_at`) VALUES
(3, 5, 24, 'Hello!! Everyone Welcome to our Course Bachelor of Science in Information Technology', '2025-04-19 15:43:06'),
(4, 5, 24, 'Good evening Everyone, Our class starts at 8:00 P.M', '2025-04-22 11:00:20'),
(5, 5, 24, 'Hello everyone', '2025-04-22 11:45:29'),
(6, 5, 24, 'Hello Everyone', '2025-04-22 12:25:49'),
(7, 5, 27, 'Welcome to our Course BSPED', '2025-04-22 12:29:29'),
(8, 4, 28, 'HEllo Everyone', '2025-04-22 12:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_likes`
--

CREATE TABLE `announcement_likes` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement_likes`
--

INSERT INTO `announcement_likes` (`id`, `announcement_id`, `user_id`, `created_at`) VALUES
(4, 3, 12, '2025-04-19 15:43:21'),
(5, 3, 11, '2025-04-19 15:43:48'),
(6, 4, 12, '2025-04-22 11:00:36'),
(7, 5, 12, '2025-04-22 11:45:42'),
(8, 6, 12, '2025-04-22 12:26:50'),
(9, 7, 12, '2025-04-22 12:29:43'),
(10, 8, 12, '2025-04-22 12:33:25');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `answer_1` text NOT NULL,
  `answer_2` text NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `grade` decimal(5,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `graded_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `lesson_id`, `student_id`, `answer_1`, `answer_2`, `file_path`, `file_name`, `submitted_at`, `grade`, `feedback`, `graded_at`) VALUES
(1, 2, 12, 'Answer Testing', 'Answer 2 Testing', NULL, NULL, '2025-04-22 11:55:18', NULL, NULL, NULL),
(2, 2, 12, 'Test1', 'Test2', NULL, NULL, '2025-04-22 11:55:41', NULL, NULL, NULL),
(3, 3, 12, 'Hello', 'World', NULL, NULL, '2025-04-22 12:04:26', NULL, NULL, NULL),
(4, 3, 12, 'sas', 'asa', NULL, NULL, '2025-04-22 12:21:45', NULL, NULL, NULL),
(5, 2, 12, 'asa', 'asa', NULL, NULL, '2025-04-22 12:26:23', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `announcement_id`, `user_id`, `content`, `parent_id`, `created_at`) VALUES
(3, 3, 12, 'Hello Sir', NULL, '2025-04-19 15:43:30'),
(4, 3, 11, 'Yey', NULL, '2025-04-19 15:43:52'),
(5, 3, 22, 'Good Day', 3, '2025-04-19 15:54:24'),
(6, 5, 12, 'Hello sir', NULL, '2025-04-22 11:45:47'),
(7, 8, 12, 'Hello Maam', NULL, '2025-04-22 12:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_likes`
--

INSERT INTO `comment_likes` (`id`, `comment_id`, `user_id`, `created_at`) VALUES
(8, 5, 12, '2025-04-19 15:54:45'),
(9, 3, 12, '2025-04-19 16:34:10'),
(10, 6, 12, '2025-04-22 11:45:49'),
(11, 7, 12, '2025-04-22 12:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `image_path`, `created_at`, `teacher_id`) VALUES
(24, 'BSIT', 'Bachelor of Science in Information Technology', '../uploads/course_images/course_6803c392be005.png', '2025-04-19 15:38:58', 5),
(25, 'BSED', 'Bachelor of Science in Education', '../uploads/course_images/course_6803c3ee7412d.png', '2025-04-19 15:40:30', 5),
(26, 'BSHM', 'Bachelor of Science in Hospitality Management', '../uploads/course_images/course_6803c432c4968.png', '2025-04-19 15:41:38', 5),
(27, 'BSPED', 'Bachelor of Science in Physical Education', '../uploads/course_images/course_6803c44a044ef.png', '2025-04-19 15:42:02', 5),
(28, 'BSIT by Shekay', 'Shekay BSIT', '../uploads/course_images/course_68078c438395e.png', '2025-04-22 12:32:03', 4);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `teacher_id`, `title`, `description`, `content`, `file_path`, `file_name`, `video_url`, `created_at`) VALUES
(2, 24, 5, 'Java Programming', 'Java is a programming language that you will learn today.', 'Java is a programming language that allows you to program something. First download java to your computer and install the necessary files needed.', NULL, NULL, '', '2025-04-22 11:53:24'),
(3, 24, 5, 'Lesson 2', 'This is Short Description', 'This is the Lesson Content', '../uploads/lesson_files/lesson_6807849c32c7e.pdf', 'lesson_6807849c32c7e.pdf', '', '2025-04-22 11:59:24'),
(4, 24, 5, 'Lesson 3', 'Short Description for Lesson 3', 'Lesson 3 Content', '../uploads/lesson_files/lesson_680787325f4b1.pdf', 'lesson_680787325f4b1.pdf', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', '2025-04-22 12:10:26'),
(5, 24, 5, 'Title', 'Short Description', 'This is Lesson Contents', NULL, NULL, '', '2025-04-22 12:27:34'),
(6, 28, 4, 'Lesson 1', 'Short Description', 'This is Lesson Content', NULL, NULL, '', '2025-04-22 12:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `email`, `password`, `created_at`, `user_id`) VALUES
(4, 'Shekina Maurin', 'Shekayteach@gmail.com', '', '2025-04-15 08:51:32', 21),
(5, 'Carlo Cañezares', 'CarloTeach@gmail.com', '', '2025-04-15 08:54:44', 22);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('teacher','student') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(11, 'Shekina Maurin', 'Shekay@gmail.com', 'shekay', 'student', '2025-04-11 12:38:36'),
(12, 'Carlo Cañezares', 'Carlo@gmail.com123', 'carlo', 'student', '2025-04-11 13:07:41'),
(13, 'James Ivan Jimenez', 'James@gmail.com', 'james', 'student', '2025-04-11 14:34:42'),
(16, 'Carlo Cañezares', 'carlostudent@gmail.com', 'carlo', 'student', '2025-04-14 09:47:43'),
(21, 'Shekina Maurin', 'Shekayteach@gmail.com', 'shekay', 'teacher', '2025-04-15 08:51:32'),
(22, 'Carlo Cañezares', 'CarloTeach@gmail.com', 'carlo', 'teacher', '2025-04-15 08:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_courses`
--

INSERT INTO `user_courses` (`id`, `user_id`, `course_id`, `enrolled_at`) VALUES
(14, 12, 24, '2025-04-19 15:42:24'),
(15, 11, 24, '2025-04-19 15:43:43'),
(16, 12, 27, '2025-04-22 12:28:57'),
(17, 12, 28, '2025-04-22 12:33:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_announcement_teacher` (`teacher_id`),
  ADD KEY `fk_announcement_course` (`course_id`);

--
-- Indexes for table `announcement_likes`
--
ALTER TABLE `announcement_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_announcement_unique` (`announcement_id`,`user_id`),
  ADD KEY `fk_announcement_likes_announcement` (`announcement_id`),
  ADD KEY `fk_announcement_likes_user` (`user_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_announcement` (`announcement_id`),
  ADD KEY `fk_comments_user` (`user_id`),
  ADD KEY `fk_comments_parent` (`parent_id`);

--
-- Indexes for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_comment_unique` (`comment_id`,`user_id`),
  ADD KEY `fk_comment_likes_comment` (`comment_id`),
  ADD KEY `fk_comment_likes_user` (`user_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacher` (`teacher_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `announcement_likes`
--
ALTER TABLE `announcement_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_announcement_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_announcement_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcement_likes`
--
ALTER TABLE `announcement_likes`
  ADD CONSTRAINT `fk_announcement_likes_announcement` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_announcement_likes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_announcement` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comments_parent` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `fk_comment_likes_comment` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comment_likes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
