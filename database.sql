-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2021 at 08:00 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `attempt_id` int(11) DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `q_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q_score` decimal(5,1) DEFAULT NULL,
  `r_score` decimal(5,1) DEFAULT NULL,
  `is_correct` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `quiz_id`, `question_id`, `user_id`, `attempt_id`, `answer`, `q_type`, `q_score`, `r_score`, `is_correct`) VALUES
(1, 4, 2, 3, 1, 'answer', 'textarea', '10.0', '0.0', 0),
(2, 4, 1, 3, 1, 'answer', 'textarea', '10.0', '0.0', 0),
(3, 4, 1, 3, 1, 'answer', 'textarea', '10.0', '0.0', 0),
(4, 9, 5, 1, 2, '7', 'radio', '10.0', '0.0', 0),
(5, 9, 4, 1, 2, '3', 'radio', '10.0', '0.0', 0),
(6, 9, 3, 1, 2, '1', 'radio', '10.0', '10.0', 1),
(7, 9, 3, 4, 3, '1', 'radio', '10.0', '10.0', 1),
(8, 9, 5, 4, 3, '10', 'radio', '10.0', '0.0', 0),
(9, 9, 4, 4, 3, '4', 'radio', '10.0', '0.0', 0),
(10, 4, 1, 4, 4, 'answer', 'textarea', '10.0', '0.0', 0),
(11, 12, 6, 4, 5, '12', 'radio', '10.0', '10.0', 1),
(12, 4, 2, 4, 4, 'answer', 'textarea', '10.0', '0.0', 0),
(13, 9, 3, 6, 6, '1', 'radio', '10.0', '10.0', 1),
(14, 9, 5, 6, 6, '10', 'radio', '10.0', '0.0', 0),
(15, 9, 4, 6, 6, '6', 'radio', '10.0', '0.0', 0),
(16, 9, 4, 7, 7, '3', 'radio', '10.0', '10.0', 1),
(17, 9, 5, 7, 7, '9', 'radio', '10.0', '10.0', 1),
(18, 9, 3, 7, 7, '1', 'radio', '10.0', '10.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `text_submission` longtext COLLATE utf8mb4_unicode_ci,
  `earned_numbers` decimal(8,2) DEFAULT NULL,
  `instructors_note` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_evaluated` tinyint(4) DEFAULT '0',
  `evaluated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignment_submissions`
--

INSERT INTO `assignment_submissions` (`id`, `user_id`, `course_id`, `assignment_id`, `instructor_id`, `text_submission`, `earned_numbers`, `instructors_note`, `status`, `is_evaluated`, `evaluated_at`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 5, NULL, '<p>answers</p>', NULL, NULL, 'submitted', 0, NULL, '2020-08-31 13:00:39', '2020-08-31 13:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `belongs_course_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `hash_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `course_id`, `belongs_course_id`, `content_id`, `user_id`, `media_id`, `hash_id`) VALUES
(1, NULL, 5, 6, 1, 15, '8xchkybngvfoj746398nutgdwec6vplx');

-- --------------------------------------------------------

--
-- Table structure for table `attempts`
--

CREATE TABLE `attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `questions_limit` int(11) DEFAULT NULL,
  `total_answered` int(11) DEFAULT NULL,
  `total_scores` decimal(5,1) DEFAULT NULL,
  `earned_scores` decimal(5,1) DEFAULT NULL,
  `passing_percent` int(11) DEFAULT NULL,
  `earned_percent` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quiz_gradable` tinyint(4) DEFAULT '0',
  `is_reviewed` tinyint(4) DEFAULT '0',
  `ended_at` timestamp NULL DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `passed` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attempts`
--

INSERT INTO `attempts` (`id`, `course_id`, `quiz_id`, `user_id`, `reviewer_id`, `questions_limit`, `total_answered`, `total_scores`, `earned_scores`, `passing_percent`, `earned_percent`, `status`, `quiz_gradable`, `is_reviewed`, `ended_at`, `reviewed_at`, `passed`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 3, NULL, 10, 2, '20.0', '0.0', 5, 0, 'in_review', 1, 0, '2020-08-31 12:52:17', NULL, 0, '2020-08-31 12:51:48', '2020-08-31 12:52:17'),
(2, 5, 9, 1, NULL, 10, 3, '30.0', '10.0', 20, 33, 'in_review', NULL, 0, '2020-09-10 17:19:24', NULL, 1, '2020-09-10 17:19:01', '2020-09-10 17:19:24'),
(3, 5, 9, 4, NULL, 10, 3, '30.0', '10.0', 20, 33, 'in_review', 1, 0, '2020-11-01 14:06:30', NULL, 1, '2020-11-01 14:05:16', '2020-11-01 14:06:30'),
(4, 1, 4, 4, NULL, 10, 2, '20.0', '0.0', 5, 0, 'in_review', 1, 0, '2020-11-01 14:25:31', NULL, 0, '2020-11-01 14:17:48', '2020-11-01 14:25:31'),
(5, 1, 12, 4, NULL, 10, 1, '10.0', '10.0', 10, 100, 'in_review', NULL, 0, '2020-11-01 14:18:21', NULL, 1, '2020-11-01 14:18:14', '2020-11-01 14:18:21'),
(6, 5, 9, 6, NULL, 10, 3, '30.0', '10.0', 20, 33, 'in_review', 1, 0, '2020-11-02 12:13:01', NULL, 1, '2020-11-02 12:07:44', '2020-11-02 12:13:01'),
(7, 5, 9, 7, 1, 10, 3, '30.0', '30.0', 20, 100, 'finished', 1, 1, '2020-11-03 17:59:40', '2020-11-03 18:03:57', 1, '2020-11-03 17:59:22', '2020-11-03 18:03:58');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT '0',
  `thumbnail_id` int(11) DEFAULT NULL,
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `category_name`, `slug`, `category_id`, `thumbnail_id`, `icon_class`, `step`, `status`) VALUES
(1, 1, 'الهندسة', 'information-technology', 0, NULL, '0', 0, 1),
(2, 1, 'المواد المشتركة', 'web-development', 1, NULL, '0', 1, 1),
(3, 1, 'الرياضيات 101', 'php', 2, NULL, '0', 2, 1),
(4, 1, 'هندسة الاتصالات', 'cat-1', 0, NULL, '0', 0, 1),
(5, 1, 'فيزياء 101', 'fyzyaaa-101', 2, NULL, '0', 2, 1),
(6, 1, 'التحليل العددي', 'althlyl-alaaddy', 2, NULL, '0', 2, 1),
(7, 1, 'الطب البشري', 'altb-albshry', 0, NULL, '0', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `completes`
--

CREATE TABLE `completes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `completed_course_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `completed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `completes`
--

INSERT INTO `completes` (`id`, `user_id`, `completed_course_id`, `course_id`, `content_id`, `completed_at`) VALUES
(1, 3, NULL, 1, 4, '2020-08-31 12:52:17'),
(2, 3, NULL, 1, 5, '2020-08-31 13:00:48'),
(3, 3, 1, NULL, NULL, '2020-08-31 13:10:00'),
(4, 1, NULL, 5, 9, '2020-09-10 17:19:24'),
(5, 4, 5, NULL, NULL, '2020-11-01 13:21:53'),
(6, 4, NULL, 5, 6, '2020-11-01 13:23:16'),
(7, 3, NULL, 1, 1, '2020-11-01 13:46:52'),
(8, 3, NULL, 1, 2, '2020-11-01 13:46:56'),
(9, 3, NULL, 1, 3, '2020-11-01 13:47:00'),
(10, 4, NULL, 5, 9, '2020-11-01 14:06:30'),
(11, 4, NULL, 1, 12, '2020-11-01 14:18:21'),
(12, 4, NULL, 1, 4, '2020-11-01 14:25:32'),
(13, 4, 1, NULL, NULL, '2020-11-01 14:29:14'),
(14, 4, NULL, 1, 1, '2020-11-01 19:54:42'),
(15, 4, NULL, 5, 7, '2020-11-02 11:57:16'),
(16, 4, NULL, 5, 8, '2020-11-02 11:57:21'),
(17, 6, NULL, 5, 6, '2020-11-02 12:00:20'),
(18, 6, NULL, 5, 9, '2020-11-02 12:13:01'),
(19, 7, NULL, 5, 6, '2020-11-03 17:58:58'),
(20, 7, NULL, 5, 7, '2020-11-03 17:59:03'),
(21, 7, NULL, 5, 8, '2020-11-03 17:59:07'),
(22, 7, NULL, 5, 9, '2020-11-03 17:59:40'),
(23, 7, NULL, 5, 10, '2020-11-03 18:00:22'),
(24, 7, NULL, 5, 11, '2020-11-03 18:00:29'),
(25, 7, 5, NULL, NULL, '2020-11-03 18:05:17'),
(26, 1, 5, NULL, NULL, '2020-11-04 15:50:58'),
(27, 3, 5, NULL, NULL, '2020-11-04 16:09:54'),
(28, 3, NULL, 5, 6, '2020-11-04 16:10:06'),
(29, 6, NULL, 5, 7, '2020-11-04 16:14:46'),
(30, 6, NULL, 5, 8, '2020-11-04 16:14:50'),
(31, 6, NULL, 5, 10, '2020-11-04 16:14:57'),
(32, 6, NULL, 5, 11, '2020-11-04 16:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `video_src` text COLLATE utf8mb4_unicode_ci,
  `video_time` int(11) DEFAULT NULL,
  `item_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_preview` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `sort_order` tinyint(4) DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `quiz_gradable` tinyint(4) DEFAULT NULL,
  `unlock_date` timestamp NULL DEFAULT NULL,
  `unlock_days` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `user_id`, `course_id`, `section_id`, `title`, `slug`, `text`, `video_src`, `video_time`, `item_type`, `is_preview`, `status`, `sort_order`, `options`, `quiz_gradable`, `unlock_date`, `unlock_days`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 'الدرس الأول', 'aldrs-alaol', '<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>', NULL, 0, 'lecture', NULL, 1, 1, NULL, NULL, NULL, NULL, '2020-08-31 11:35:22', '2020-08-31 11:35:23'),
(2, 2, 1, 2, 'الدرس الأول', 'aldrs-alaol-1', '<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>', NULL, 0, 'lecture', NULL, 1, 2, NULL, NULL, NULL, NULL, '2020-08-31 11:35:52', '2020-08-31 12:39:24'),
(3, 2, 1, 2, 'الدرس الثاني', 'aldrs-althany', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام &quot;هنا يوجد محتوى نصي، هنا يوجد محتوى نصي&quot; فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال &quot;lorem ipsum&quot; في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.</p>', '{\"source\":\"youtube\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":null,\"source_youtube\":\"https:\\/\\/www.youtube.com\\/watch?v=OK_JCtrrv-c\",\"source_vimeo\":null,\"source_embedded\":null,\"runtime\":{\"hours\":\"40\",\"mins\":\"10\",\"secs\":\"10\"}}', 0, 'lecture', NULL, 1, 3, NULL, NULL, NULL, NULL, '2020-08-31 12:40:34', '2020-08-31 12:41:24'),
(4, 2, 1, 2, 'اختبار 1', 'akhtbar-1', '<p dir=\"rtl\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام &quot;هنا يوجد محتوى نصي، هنا يوجد محتوى نصي&quot; فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال &quot;lorem ipsum&quot; في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.</p>', NULL, 0, 'quiz', 0, 1, 4, '{\"time_limit\":\"30\",\"passing_score\":\"5\",\"questions_limit\":\"10\"}', 1, NULL, NULL, '2020-08-31 12:43:07', '2020-08-31 12:51:18'),
(5, 2, 1, 2, 'واجب', 'oagb', '<p dir=\"rtl\">هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام &quot;هنا يوجد محتوى نصي، هنا يوجد محتوى نصي&quot; فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص، وإذا قمت بإدخال &quot;lorem ipsum&quot; في أي محرك بحث ستظهر العديد من المواقع الحديثة العهد في نتائج البحث. على مدى السنين ظهرت نسخ جديدة ومختلفة من نص لوريم إيبسوم، أحياناً عن طريق الصدفة، وأحياناً عن عمد كإدخال بعض العبارات الفكاهية إليها.</p>', NULL, NULL, 'assignment', 0, 1, 5, '{\"time_duration\":{\"time_value\":\"1\",\"time_type\":\"days\"},\"total_number\":\"10\",\"pass_number\":\"5\",\"upload_attachment_limit\":\"1\",\"upload_attachment_size_limit\":\"5\"}', NULL, NULL, NULL, '2020-08-31 12:45:10', '2020-08-31 12:45:10'),
(6, 1, 5, 4, 'ما هي الاقترانات؟', 'ma-hy-alaktranat', '<p>مدى دالة هو مجموعة القيم الفعلية للدالة&nbsp;{\\displaystyle f\\!}<img alt=\"{\\displaystyle f\\!}\" aria-hidden=\"true\" src=\"https://wikimedia.org/api/rest_v1/media/math/render/svg/e8e5892a78a5fde92fb689f3fe6721034bac8d40\" />.</p>\r\n\r\n<p>مدى الدالة هو مجموعة&nbsp;<a href=\"https://ar.wikipedia.org/wiki/%D9%82%D9%8A%D9%85%D8%A9_(%D8%B1%D9%8A%D8%A7%D8%B6%D9%8A%D8%A7%D8%AA)\" title=\"قيمة (رياضيات)\">القيم</a>&nbsp;المحتمل خروجها ناتجًا للدالة بعد التعويض بالقيم الخاصة بمجال الدالة فمثلًا&nbsp;{\\displaystyle f(x)=y=4x+1\\!}<img alt=\"{\\displaystyle f(x)=y=4x+1\\!}\" aria-hidden=\"true\" src=\"https://wikimedia.org/api/rest_v1/media/math/render/svg/6292c2e63d928090d3adbaeba97f26da1f782bf1\" />&nbsp;فإن هذه الدالة تتكون من مجال يمثل كل قيم&nbsp;{\\displaystyle x\\!}<img alt=\"{\\displaystyle x\\!}\" aria-hidden=\"true\" src=\"https://wikimedia.org/api/rest_v1/media/math/render/svg/13b85d29899b2b2e4931388408d51f4fb086e7ec\" />&nbsp;الممكنة أما مدى الدالة فهو يمثل كل قيم&nbsp;{\\displaystyle y\\!}<img alt=\"{\\displaystyle y\\!}\" aria-hidden=\"true\" src=\"https://wikimedia.org/api/rest_v1/media/math/render/svg/d87c11b926dd5c0bb5b20c5548b08715be57619a\" />&nbsp;المحتمل خروجها ناتجًا للتعويض في هذه الدالة.</p>\r\n\r\n<p>ويجب عدم الخلط بين المدى والمستقر حيث يمكن للدالة ألا تغطي جميع قيم المستقر فيكون المدى مجرد&nbsp;<a href=\"https://ar.wikipedia.org/wiki/%D9%85%D8%AC%D9%85%D9%88%D8%B9%D8%A9_%D8%AC%D8%B2%D8%A6%D9%8A%D8%A9\" title=\"مجموعة جزئية\">مجموعة جزئية</a>&nbsp;من المستقر.</p>', '{\"source\":\"youtube\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":null,\"source_youtube\":\"https:\\/\\/www.youtube.com\\/watch?v=kvGsIo1TmsM\",\"source_vimeo\":null,\"source_embedded\":null,\"runtime\":{\"hours\":\"07\",\"mins\":\"00\",\"secs\":\"00\"}}', 25200, 'lecture', 1, 1, 1, NULL, NULL, NULL, NULL, '2020-09-10 16:57:56', '2020-09-10 16:59:57'),
(7, 1, 5, 4, 'مجال الاقترانات (الجزء الأول)', 'mgal-alaktranat-algzaa-alaol', NULL, '{\"source\":\"youtube\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":null,\"source_youtube\":\"https:\\/\\/www.youtube.com\\/watch?v=JCm3rzPf0Wg&list=PLVgrGgkWLpZYgj7_o8nQCdf7TFwb33ZH_\",\"source_vimeo\":null,\"source_embedded\":null,\"runtime\":{\"hours\":\"27\",\"mins\":\"00\",\"secs\":\"00\"}}', 0, 'lecture', NULL, 1, 2, NULL, NULL, NULL, NULL, '2020-09-10 17:08:45', '2020-09-10 17:08:59'),
(8, 1, 5, 4, 'مجال الاقترانات (الجزء الثاني)', 'mgal-alaktranat-algzaa-althany', NULL, '{\"source\":\"external_url\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":\"https:\\/\\/www.youtube.com\\/watch?v=EpxDnQoERxc&list=PLVgrGgkWLpZYgj7_o8nQCdf7TFwb33ZH_&index=2\",\"source_youtube\":null,\"source_vimeo\":null,\"source_embedded\":null,\"runtime\":{\"hours\":\"20\",\"mins\":\"00\",\"secs\":\"00\"}}', 0, 'lecture', NULL, 1, 3, NULL, NULL, NULL, NULL, '2020-09-10 17:09:15', '2020-09-10 17:09:44'),
(9, 1, 5, 4, 'اختبار الفصل الأول (مقدمة حول الاقترانات)', 'akhtbar-alfsl-alaol-mkdm-hol-alaktranat', NULL, NULL, 0, 'quiz', 0, 1, 4, '{\"time_limit\":null,\"passing_score\":\"20\",\"questions_limit\":\"10\"}', 1, NULL, NULL, '2020-09-10 17:10:21', '2020-09-10 17:20:19'),
(10, 1, 5, 5, 'تعريف المجال', 'taaryf-almgal', NULL, '{\"source\":\"external_url\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":\"https:\\/\\/www.youtube.com\\/watch?v=JCm3rzPf0Wg&list=PLVgrGgkWLpZYgj7_o8nQCdf7TFwb33ZH_&index=1\",\"source_youtube\":null,\"source_vimeo\":null,\"source_embedded\":null,\"runtime\":{\"hours\":\"10\",\"mins\":\"00\",\"secs\":\"00\"}}', 0, 'lecture', NULL, 1, 5, NULL, NULL, NULL, NULL, '2020-09-10 17:16:30', '2020-09-10 17:16:58'),
(11, 1, 5, 5, 'مجال الاقتران المثلثي', 'mgal-alaktran-almthlthy', NULL, '{\"source\":\"external_url\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":\"https:\\/\\/www.youtube.com\\/watch?v=EpxDnQoERxc&list=PLVgrGgkWLpZYgj7_o8nQCdf7TFwb33ZH_&index=2\",\"source_youtube\":null,\"source_vimeo\":null,\"source_embedded\":null,\"runtime\":{\"hours\":\"12\",\"mins\":\"00\",\"secs\":\"00\"}}', 0, 'lecture', NULL, 1, 6, NULL, NULL, NULL, NULL, '2020-09-10 17:17:18', '2020-09-10 17:17:40'),
(12, 2, 1, 1, 'اختبار 1', 'akhtbar-1-1', '<p>وصف الاختبار</p>', NULL, 0, 'quiz', 0, 1, 6, '{\"show_time\":\"1\",\"time_limit\":\"5\",\"passing_score\":\"10\",\"questions_limit\":\"10\"}', NULL, NULL, NULL, '2020-11-01 14:15:14', '2020-11-01 14:16:31'),
(13, 1, 6, 6, 'محتوى أول', 'mhto-aol', '<p>وصف المحتوى</p>', NULL, 0, 'lecture', 1, 1, 1, NULL, NULL, NULL, NULL, '2020-11-26 14:41:01', '2020-11-26 14:41:01'),
(14, 1, 6, 6, 'اختبار أول', 'akhtbar-aol', '<p>وصف الاختبار</p>', NULL, 0, 'quiz', 0, 1, 2, NULL, NULL, NULL, NULL, '2020-11-26 14:43:34', '2020-11-26 14:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_decimals` int(11) DEFAULT NULL,
  `iso2` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso3` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent_code` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calling_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `currency_code`, `currency_symbol`, `currency_decimals`, `iso2`, `iso3`, `continent_code`, `name`, `calling_code`, `flag`) VALUES
(1, '004', 'AFN', '؋', 2, 'AF', 'AFG', 'AS', 'Afghanistan', '93', 'AF.png'),
(2, '008', 'ALL', 'Lek', 2, 'AL', 'ALB', 'EU', 'Albania', '355', 'AL.png'),
(3, '010', '', '', 2, 'AQ', 'ATA', 'AN', 'Antarctica', '672', 'AQ.png'),
(4, '012', 'DZD', 'DZD', 2, 'DZ', 'DZA', 'AF', 'Algeria', '213', 'DZ.png'),
(5, '016', 'USD', '$', 2, 'AS', 'ASM', 'OC', 'American Samoa', '1', 'AS.png'),
(6, '020', 'EUR', '€', 2, 'AD', 'AND', 'EU', 'Andorra', '376', 'AD.png'),
(7, '024', 'AOA', 'Kz', 2, 'AO', 'AGO', 'AF', 'Angola', '244', 'AO.png'),
(8, '028', 'XCD', '$', 2, 'AG', 'ATG', 'NA', 'Antigua and Barbuda', '1', 'AG.png'),
(9, '031', 'AZN', 'ман', 2, 'AZ', 'AZE', 'AS', 'Azerbaijan', '994', 'AZ.png'),
(10, '032', 'ARS', '$', 2, 'AR', 'ARG', 'SA', 'Argentina', '54', 'AR.png'),
(11, '036', 'AUD', '$', 2, 'AU', 'AUS', 'OC', 'Australia', '61', 'AU.png'),
(12, '040', 'EUR', '€', 2, 'AT', 'AUT', 'EU', 'Austria', '43', 'AT.png'),
(13, '044', 'BSD', '$', 2, 'BS', 'BHS', 'NA', 'Bahamas', '1', 'BS.png'),
(14, '048', 'BHD', 'BHD', 3, 'BH', 'BHR', 'AS', 'Bahrain', '973', 'BH.png'),
(15, '050', 'BDT', 'BDT', 2, 'BD', 'BGD', 'AS', 'Bangladesh', '880', 'BD.png'),
(16, '051', 'AMD', 'AMD', 2, 'AM', 'ARM', 'AS', 'Armenia', '374', 'AM.png'),
(17, '052', 'BBD', '$', 2, 'BB', 'BRB', 'NA', 'Barbados', '1', 'BB.png'),
(18, '056', 'EUR', '€', 2, 'BE', 'BEL', 'EU', 'Belgium', '32', 'BE.png'),
(19, '060', 'BMD', '$', 2, 'BM', 'BMU', 'NA', 'Bermuda', '1', 'BM.png'),
(20, '064', 'BTN', 'BTN', 2, 'BT', 'BTN', 'AS', 'Bhutan', '975', 'BT.png'),
(21, '068', 'BOB', '$b', 2, 'BO', 'BOL', 'SA', 'Bolivia, Plurinational State of', '591', 'BO.png'),
(22, '070', 'BAM', 'KM', 2, 'BA', 'BIH', 'EU', 'Bosnia and Herzegovina', '387', 'BA.png'),
(23, '072', 'BWP', 'P', 2, 'BW', 'BWA', 'AF', 'Botswana', '267', 'BW.png'),
(24, '074', '', 'kr', 2, 'BV', 'BVT', 'AN', 'Bouvet Island', '47', 'BV.png'),
(25, '076', 'BRL', 'R$', 2, 'BR', 'BRA', 'SA', 'Brazil', '55', 'BR.png'),
(26, '084', 'BZD', 'BZ$', 2, 'BZ', 'BLZ', 'NA', 'Belize', '501', 'BZ.png'),
(27, '086', 'USD', '$', 2, 'IO', 'IOT', 'AS', 'British Indian Ocean Territory', '246', 'IO.png'),
(28, '090', 'SBD', '$', 2, 'SB', 'SLB', 'OC', 'Solomon Islands', '677', 'SB.png'),
(29, '092', 'USD', '$', 2, 'VG', 'VGB', 'NA', 'Virgin Islands, British', '1', 'VG.png'),
(30, '096', 'BND', '$', 2, 'BN', 'BRN', 'AS', 'Brunei Darussalam', '673', 'BN.png'),
(31, '100', 'BGN', 'лв', 2, 'BG', 'BGR', 'EU', 'Bulgaria', '359', 'BG.png'),
(32, '104', 'MMK', 'K', 2, 'MM', 'MMR', 'AS', 'Myanmar', '95', 'MM.png'),
(33, '108', 'BIF', 'BIF', 0, 'BI', 'BDI', 'AF', 'Burundi', '257', 'BI.png'),
(34, '112', 'BYR', 'p.', 2, 'BY', 'BLR', 'EU', 'Belarus', '375', 'BY.png'),
(35, '116', 'KHR', '៛', 2, 'KH', 'KHM', 'AS', 'Cambodia', '855', 'KH.png'),
(36, '120', 'XAF', 'FCF', 0, 'CM', 'CMR', 'AF', 'Cameroon', '237', 'CM.png'),
(37, '124', 'CAD', '$', 2, 'CA', 'CAN', 'NA', 'Canada', '1', 'CA.png'),
(38, '132', 'CVE', 'CVE', 2, 'CV', 'CPV', 'AF', 'Cape Verde', '238', 'CV.png'),
(39, '136', 'KYD', '$', 2, 'KY', 'CYM', 'NA', 'Cayman Islands', '1', 'KY.png'),
(40, '140', 'XAF', 'CFA', 0, 'CF', 'CAF', 'AF', 'Central African Republic', '236', 'CF.png'),
(41, '144', 'LKR', '₨', 2, 'LK', 'LKA', 'AS', 'Sri Lanka', '94', 'LK.png'),
(42, '148', 'XAF', 'XAF', 0, 'TD', 'TCD', 'AF', 'Chad', '235', 'TD.png'),
(43, '152', 'CLP', 'CLP', 0, 'CL', 'CHL', 'SA', 'Chile', '56', 'CL.png'),
(44, '156', 'CNY', '¥', 2, 'CN', 'CHN', 'AS', 'China', '86', 'CN.png'),
(45, '158', 'TWD', 'NT$', 2, 'TW', 'TWN', 'AS', 'Taiwan, Province of China', '886', 'TW.png'),
(46, '162', 'AUD', '$', 2, 'CX', 'CXR', 'AS', 'Christmas Island', '61', 'CX.png'),
(47, '166', 'AUD', '$', 2, 'CC', 'CCK', 'AS', 'Cocos (Keeling) Islands', '61', 'CC.png'),
(48, '170', 'COP', '$', 2, 'CO', 'COL', 'SA', 'Colombia', '57', 'CO.png'),
(49, '174', 'KMF', 'KMF', 0, 'KM', 'COM', 'AF', 'Comoros', '269', 'KM.png'),
(50, '175', 'EUR', '€', 2, 'YT', 'MYT', 'AF', 'Mayotte', '262', 'YT.png'),
(51, '178', 'XAF', 'FCF', 0, 'CG', 'COG', 'AF', 'Congo', '242', 'CG.png'),
(52, '180', 'CDF', 'CDF', 2, 'CD', 'COD', 'AF', 'Congo, the Democratic Republic of the', '243', 'CD.png'),
(53, '184', 'NZD', '$', 2, 'CK', 'COK', 'OC', 'Cook Islands', '682', 'CK.png'),
(54, '188', 'CRC', '₡', 2, 'CR', 'CRI', 'NA', 'Costa Rica', '506', 'CR.png'),
(55, '191', 'HRK', 'kn', 2, 'HR', 'HRV', 'EU', 'Croatia', '385', 'HR.png'),
(56, '192', 'CUP', '₱', 2, 'CU', 'CUB', 'NA', 'Cuba', '53', 'CU.png'),
(57, '196', 'EUR', 'CYP', 2, 'CY', 'CYP', 'AS', 'Cyprus', '357', 'CY.png'),
(58, '203', 'CZK', 'Kč', 2, 'CZ', 'CZE', 'EU', 'Czech Republic', '420', 'CZ.png'),
(59, '204', 'XOF', 'XOF', 0, 'BJ', 'BEN', 'AF', 'Benin', '229', 'BJ.png'),
(60, '208', 'DKK', 'kr', 2, 'DK', 'DNK', 'EU', 'Denmark', '45', 'DK.png'),
(61, '212', 'XCD', '$', 2, 'DM', 'DMA', 'NA', 'Dominica', '1', 'DM.png'),
(62, '214', 'DOP', 'RD$', 2, 'DO', 'DOM', 'NA', 'Dominican Republic', '1', 'DO.png'),
(63, '218', 'USD', '$', 2, 'EC', 'ECU', 'SA', 'Ecuador', '593', 'EC.png'),
(64, '222', 'SVC', '$', 2, 'SV', 'SLV', 'NA', 'El Salvador', '503', 'SV.png'),
(65, '226', 'XAF', 'FCF', 2, 'GQ', 'GNQ', 'AF', 'Equatorial Guinea', '240', 'GQ.png'),
(66, '231', 'ETB', 'ETB', 2, 'ET', 'ETH', 'AF', 'Ethiopia', '251', 'ET.png'),
(67, '232', 'ERN', 'Nfk', 2, 'ER', 'ERI', 'AF', 'Eritrea', '291', 'ER.png'),
(68, '233', 'EUR', 'kr', 2, 'EE', 'EST', 'EU', 'Estonia', '372', 'EE.png'),
(69, '234', 'DKK', 'kr', 2, 'FO', 'FRO', 'EU', 'Faroe Islands', '298', 'FO.png'),
(70, '238', 'FKP', '£', 2, 'FK', 'FLK', 'SA', 'Falkland Islands (Malvinas)', '500', 'FK.png'),
(71, '239', '', '£', 2, 'GS', 'SGS', 'AN', 'South Georgia and the South Sandwich Islands', '44', 'GS.png'),
(72, '242', 'FJD', '$', 2, 'FJ', 'FJI', 'OC', 'Fiji', '679', 'FJ.png'),
(73, '246', 'EUR', '€', 2, 'FI', 'FIN', 'EU', 'Finland', '358', 'FI.png'),
(74, '248', 'EUR', NULL, NULL, 'AX', 'ALA', 'EU', 'Åland Islands', '358', NULL),
(75, '250', 'EUR', '€', 2, 'FR', 'FRA', 'EU', 'France', '33', 'FR.png'),
(76, '254', 'EUR', '€', 2, 'GF', 'GUF', 'SA', 'French Guiana', '594', 'GF.png'),
(77, '258', 'XPF', 'XPF', 0, 'PF', 'PYF', 'OC', 'French Polynesia', '689', 'PF.png'),
(78, '260', 'EUR', '€', 2, 'TF', 'ATF', 'AN', 'French Southern Territories', '33', 'TF.png'),
(79, '262', 'DJF', 'DJF', 0, 'DJ', 'DJI', 'AF', 'Djibouti', '253', 'DJ.png'),
(80, '266', 'XAF', 'FCF', 0, 'GA', 'GAB', 'AF', 'Gabon', '241', 'GA.png'),
(81, '268', 'GEL', 'GEL', 2, 'GE', 'GEO', 'AS', 'Georgia', '995', 'GE.png'),
(82, '270', 'GMD', 'D', 2, 'GM', 'GMB', 'AF', 'Gambia', '220', 'GM.png'),
(83, '275', NULL, '₪', 2, 'PS', 'PSE', 'AS', 'Palestinian Territory, Occupied', '970', 'PS.png'),
(84, '276', 'EUR', '€', 2, 'DE', 'DEU', 'EU', 'Germany', '49', 'DE.png'),
(85, '288', 'GHS', '¢', 2, 'GH', 'GHA', 'AF', 'Ghana', '233', 'GH.png'),
(86, '292', 'GIP', '£', 2, 'GI', 'GIB', 'EU', 'Gibraltar', '350', 'GI.png'),
(87, '296', 'AUD', '$', 2, 'KI', 'KIR', 'OC', 'Kiribati', '686', 'KI.png'),
(88, '300', 'EUR', '€', 2, 'GR', 'GRC', 'EU', 'Greece', '30', 'GR.png'),
(89, '304', 'DKK', 'kr', 2, 'GL', 'GRL', 'NA', 'Greenland', '299', 'GL.png'),
(90, '308', 'XCD', '$', 2, 'GD', 'GRD', 'NA', 'Grenada', '1', 'GD.png'),
(91, '312', 'EUR ', '€', 2, 'GP', 'GLP', 'NA', 'Guadeloupe', '590', 'GP.png'),
(92, '316', 'USD', '$', 2, 'GU', 'GUM', 'OC', 'Guam', '1', 'GU.png'),
(93, '320', 'GTQ', 'Q', 2, 'GT', 'GTM', 'NA', 'Guatemala', '502', 'GT.png'),
(94, '324', 'GNF', 'GNF', 0, 'GN', 'GIN', 'AF', 'Guinea', '224', 'GN.png'),
(95, '328', 'GYD', '$', 2, 'GY', 'GUY', 'SA', 'Guyana', '592', 'GY.png'),
(96, '332', 'HTG', 'G', 2, 'HT', 'HTI', 'NA', 'Haiti', '509', 'HT.png'),
(97, '334', '', '$', 2, 'HM', 'HMD', 'AN', 'Heard Island and McDonald Islands', '61', 'HM.png'),
(98, '336', 'EUR', '€', 2, 'VA', 'VAT', 'EU', 'Holy See (Vatican City State)', '39', 'VA.png'),
(99, '340', 'HNL', 'L', 2, 'HN', 'HND', 'NA', 'Honduras', '504', 'HN.png'),
(100, '344', 'HKD', '$', 2, 'HK', 'HKG', 'AS', 'Hong Kong', '852', 'HK.png'),
(101, '348', 'HUF', 'Ft', 2, 'HU', 'HUN', 'EU', 'Hungary', '36', 'HU.png'),
(102, '352', 'ISK', 'kr', 0, 'IS', 'ISL', 'EU', 'Iceland', '354', 'IS.png'),
(103, '356', 'INR', '₹', 2, 'IN', 'IND', 'AS', 'India', '91', 'IN.png'),
(104, '360', 'IDR', 'Rp', 2, 'ID', 'IDN', 'AS', 'Indonesia', '62', 'ID.png'),
(105, '364', 'IRR', '﷼', 2, 'IR', 'IRN', 'AS', 'Iran, Islamic Republic of', '98', 'IR.png'),
(106, '368', 'IQD', 'IQD', 3, 'IQ', 'IRQ', 'AS', 'Iraq', '964', 'IQ.png'),
(107, '372', 'EUR', '€', 2, 'IE', 'IRL', 'EU', 'Ireland', '353', 'IE.png'),
(108, '376', 'ILS', '₪', 2, 'IL', 'ISR', 'AS', 'Israel', '972', 'IL.png'),
(109, '380', 'EUR', '€', 2, 'IT', 'ITA', 'EU', 'Italy', '39', 'IT.png'),
(110, '384', 'XOF', 'XOF', 0, 'CI', 'CIV', 'AF', 'Côte d\'Ivoire', '225', 'CI.png'),
(111, '388', 'JMD', '$', 2, 'JM', 'JAM', 'NA', 'Jamaica', '1', 'JM.png'),
(112, '392', 'JPY', '¥', 0, 'JP', 'JPN', 'AS', 'Japan', '81', 'JP.png'),
(113, '398', 'KZT', 'лв', 2, 'KZ', 'KAZ', 'AS', 'Kazakhstan', '7', 'KZ.png'),
(114, '400', 'JOD', 'JOD', 2, 'JO', 'JOR', 'AS', 'Jordan', '962', 'JO.png'),
(115, '404', 'KES', 'KES', 2, 'KE', 'KEN', 'AF', 'Kenya', '254', 'KE.png'),
(116, '408', 'KPW', '₩', 2, 'KP', 'PRK', 'AS', 'Korea, Democratic People\'s Republic of', '850', 'KP.png'),
(117, '410', 'KRW', '₩', 0, 'KR', 'KOR', 'AS', 'Korea, Republic of', '82', 'KR.png'),
(118, '414', 'KWD', 'KWD', 3, 'KW', 'KWT', 'AS', 'Kuwait', '965', 'KW.png'),
(119, '417', 'KGS', 'лв', 2, 'KG', 'KGZ', 'AS', 'Kyrgyzstan', '996', 'KG.png'),
(120, '418', 'LAK', '₭', 0, 'LA', 'LAO', 'AS', 'Lao People\'s Democratic Republic', '856', 'LA.png'),
(121, '422', 'LBP', '£', 2, 'LB', 'LBN', 'AS', 'Lebanon', '961', 'LB.png'),
(122, '426', 'LSL', 'L', 2, 'LS', 'LSO', 'AF', 'Lesotho', '266', 'LS.png'),
(123, '428', 'EUR', 'Ls', 2, 'LV', 'LVA', 'EU', 'Latvia', '371', 'LV.png'),
(124, '430', 'LRD', '$', 2, 'LR', 'LBR', 'AF', 'Liberia', '231', 'LR.png'),
(125, '434', 'LYD', 'LYD', 3, 'LY', 'LBY', 'AF', 'Libya', '218', 'LY.png'),
(126, '438', 'CHF', 'CHF', 2, 'LI', 'LIE', 'EU', 'Liechtenstein', '423', 'LI.png'),
(127, '440', 'EUR', 'Lt', 2, 'LT', 'LTU', 'EU', 'Lithuania', '370', 'LT.png'),
(128, '442', 'EUR', '€', 2, 'LU', 'LUX', 'EU', 'Luxembourg', '352', 'LU.png'),
(129, '446', 'MOP', 'MOP', 2, 'MO', 'MAC', 'AS', 'Macao', '853', 'MO.png'),
(130, '450', 'MGA', 'MGA', 2, 'MG', 'MDG', 'AF', 'Madagascar', '261', 'MG.png'),
(131, '454', 'MWK', 'MK', 2, 'MW', 'MWI', 'AF', 'Malawi', '265', 'MW.png'),
(132, '458', 'MYR', 'RM', 2, 'MY', 'MYS', 'AS', 'Malaysia', '60', 'MY.png'),
(133, '462', 'MVR', 'Rf', 2, 'MV', 'MDV', 'AS', 'Maldives', '960', 'MV.png'),
(134, '466', 'XOF', 'XOF', 0, 'ML', 'MLI', 'AF', 'Mali', '223', 'ML.png'),
(135, '470', 'EUR', 'MTL', 2, 'MT', 'MLT', 'EU', 'Malta', '356', 'MT.png'),
(136, '474', 'EUR', '€', 2, 'MQ', 'MTQ', 'NA', 'Martinique', '596', 'MQ.png'),
(137, '478', 'MRO', 'UM', 2, 'MR', 'MRT', 'AF', 'Mauritania', '222', 'MR.png'),
(138, '480', 'MUR', '₨', 2, 'MU', 'MUS', 'AF', 'Mauritius', '230', 'MU.png'),
(139, '484', 'MXN', '$', 2, 'MX', 'MEX', 'NA', 'Mexico', '52', 'MX.png'),
(140, '492', 'EUR', '€', 2, 'MC', 'MCO', 'EU', 'Monaco', '377', 'MC.png'),
(141, '496', 'MNT', '₮', 2, 'MN', 'MNG', 'AS', 'Mongolia', '976', 'MN.png'),
(142, '498', 'MDL', 'MDL', 2, 'MD', 'MDA', 'EU', 'Moldova, Republic of', '373', 'MD.png'),
(143, '499', 'EUR', '€', 2, 'ME', 'MNE', 'EU', 'Montenegro', '382', 'ME.png'),
(144, '500', 'XCD', '$', 2, 'MS', 'MSR', 'NA', 'Montserrat', '1', 'MS.png'),
(145, '504', 'MAD', 'MAD', 2, 'MA', 'MAR', 'AF', 'Morocco', '212', 'MA.png'),
(146, '508', 'MZN', 'MT', 2, 'MZ', 'MOZ', 'AF', 'Mozambique', '258', 'MZ.png'),
(147, '512', 'OMR', '﷼', 3, 'OM', 'OMN', 'AS', 'Oman', '968', 'OM.png'),
(148, '516', 'NAD', '$', 2, 'NA', 'NAM', 'AF', 'Namibia', '264', 'NA.png'),
(149, '520', 'AUD', '$', 2, 'NR', 'NRU', 'OC', 'Nauru', '674', 'NR.png'),
(150, '524', 'NPR', '₨', 2, 'NP', 'NPL', 'AS', 'Nepal', '977', 'NP.png'),
(151, '528', 'EUR', '€', 2, 'NL', 'NLD', 'EU', 'Netherlands', '31', 'NL.png'),
(152, '531', 'ANG', NULL, NULL, 'CW', 'CUW', 'NA', 'Curaçao', '599', NULL),
(153, '533', 'AWG', 'ƒ', 2, 'AW', 'ABW', 'NA', 'Aruba', '297', 'AW.png'),
(154, '534', 'ANG', NULL, NULL, 'SX', 'SXM', 'NA', 'Sint Maarten (Dutch part)', '721', NULL),
(155, '535', 'USD', NULL, NULL, 'BQ', 'BES', 'NA', 'Bonaire, Sint Eustatius and Saba', '599', NULL),
(156, '540', 'XPF', 'XPF', 0, 'NC', 'NCL', 'OC', 'New Caledonia', '687', 'NC.png'),
(157, '548', 'VUV', 'Vt', 0, 'VU', 'VUT', 'OC', 'Vanuatu', '678', 'VU.png'),
(158, '554', 'NZD', '$', 2, 'NZ', 'NZL', 'OC', 'New Zealand', '64', 'NZ.png'),
(159, '558', 'NIO', 'C$', 2, 'NI', 'NIC', 'NA', 'Nicaragua', '505', 'NI.png'),
(160, '562', 'XOF', 'XOF', 0, 'NE', 'NER', 'AF', 'Niger', '227', 'NE.png'),
(161, '566', 'NGN', '₦', 2, 'NG', 'NGA', 'AF', 'Nigeria', '234', 'NG.png'),
(162, '570', 'NZD', '$', 2, 'NU', 'NIU', 'OC', 'Niue', '683', 'NU.png'),
(163, '574', 'AUD', '$', 2, 'NF', 'NFK', 'OC', 'Norfolk Island', '672', 'NF.png'),
(164, '578', 'NOK', 'kr', 2, 'NO', 'NOR', 'EU', 'Norway', '47', 'NO.png'),
(165, '580', 'USD', '$', 2, 'MP', 'MNP', 'OC', 'Northern Mariana Islands', '1', 'MP.png'),
(166, '581', 'USD', '$', 2, 'UM', 'UMI', 'OC', 'United States Minor Outlying Islands', '1', 'UM.png'),
(167, '583', 'USD', '$', 2, 'FM', 'FSM', 'OC', 'Micronesia, Federated States of', '691', 'FM.png'),
(168, '584', 'USD', '$', 2, 'MH', 'MHL', 'OC', 'Marshall Islands', '692', 'MH.png'),
(169, '585', 'USD', '$', 2, 'PW', 'PLW', 'OC', 'Palau', '680', 'PW.png'),
(170, '586', 'PKR', '₨', 2, 'PK', 'PAK', 'AS', 'Pakistan', '92', 'PK.png'),
(171, '591', 'PAB', 'B/.', 2, 'PA', 'PAN', 'NA', 'Panama', '507', 'PA.png'),
(172, '598', 'PGK', 'PGK', 2, 'PG', 'PNG', 'OC', 'Papua New Guinea', '675', 'PG.png'),
(173, '600', 'PYG', 'Gs', 0, 'PY', 'PRY', 'SA', 'Paraguay', '595', 'PY.png'),
(174, '604', 'PEN', 'S/.', 2, 'PE', 'PER', 'SA', 'Peru', '51', 'PE.png'),
(175, '608', 'PHP', 'Php', 2, 'PH', 'PHL', 'AS', 'Philippines', '63', 'PH.png'),
(176, '612', 'NZD', '$', 2, 'PN', 'PCN', 'OC', 'Pitcairn', '649', 'PN.png'),
(177, '616', 'PLN', 'zł', 2, 'PL', 'POL', 'EU', 'Poland', '48', 'PL.png'),
(178, '620', 'EUR', '€', 2, 'PT', 'PRT', 'EU', 'Portugal', '351', 'PT.png'),
(179, '624', 'XOF', 'XOF', 0, 'GW', 'GNB', 'AF', 'Guinea-Bissau', '245', 'GW.png'),
(180, '626', 'USD', '$', 2, 'TL', 'TLS', 'AS', 'Timor-Leste', '670', 'TL.png'),
(181, '630', 'USD', '$', 2, 'PR', 'PRI', 'NA', 'Puerto Rico', '1', 'PR.png'),
(182, '634', 'QAR', '﷼', 2, 'QA', 'QAT', 'AS', 'Qatar', '974', 'QA.png'),
(183, '638', 'EUR', '€', 2, 'RE', 'REU', 'AF', 'Réunion', '262', 'RE.png'),
(184, '642', 'RON', 'lei', 2, 'RO', 'ROU', 'EU', 'Romania', '40', 'RO.png'),
(185, '643', 'RUB', 'руб', 2, 'RU', 'RUS', 'EU', 'Russian Federation', '7', 'RU.png'),
(186, '646', 'RWF', 'RWF', 0, 'RW', 'RWA', 'AF', 'Rwanda', '250', 'RW.png'),
(187, '652', 'EUR', NULL, NULL, 'BL', 'BLM', 'NA', 'Saint Barthélemy', '590', NULL),
(188, '654', 'SHP', '£', 2, 'SH', 'SHN', 'AF', 'Saint Helena, Ascension and Tristan da Cunha', '290', 'SH.png'),
(189, '659', 'XCD', '$', 2, 'KN', 'KNA', 'NA', 'Saint Kitts and Nevis', '1', 'KN.png'),
(190, '660', 'XCD', '$', 2, 'AI', 'AIA', 'NA', 'Anguilla', '1', 'AI.png'),
(191, '662', 'XCD', '$', 2, 'LC', 'LCA', 'NA', 'Saint Lucia', '1', 'LC.png'),
(192, '663', 'EUR', NULL, NULL, 'MF', 'MAF', 'NA', 'Saint Martin (French part)', '590', NULL),
(193, '666', 'EUR', '€', 2, 'PM', 'SPM', 'NA', 'Saint Pierre and Miquelon', '508', 'PM.png'),
(194, '670', 'XCD', '$', 2, 'VC', 'VCT', 'NA', 'Saint Vincent and the Grenadines', '1', 'VC.png'),
(195, '674', 'EUR ', '€', 2, 'SM', 'SMR', 'EU', 'San Marino', '378', 'SM.png'),
(196, '678', 'STD', 'Db', 2, 'ST', 'STP', 'AF', 'Sao Tome and Principe', '239', 'ST.png'),
(197, '682', 'SAR', '﷼', 2, 'SA', 'SAU', 'AS', 'Saudi Arabia', '966', 'SA.png'),
(198, '686', 'XOF', 'XOF', 0, 'SN', 'SEN', 'AF', 'Senegal', '221', 'SN.png'),
(199, '688', 'RSD', NULL, NULL, 'RS', 'SRB', 'EU', 'Serbia', '381', NULL),
(200, '690', 'SCR', '₨', 2, 'SC', 'SYC', 'AF', 'Seychelles', '248', 'SC.png'),
(201, '694', 'SLL', 'Le', 2, 'SL', 'SLE', 'AF', 'Sierra Leone', '232', 'SL.png'),
(202, '702', 'SGD', '$', 2, 'SG', 'SGP', 'AS', 'Singapore', '65', 'SG.png'),
(203, '703', 'EUR', 'Sk', 2, 'SK', 'SVK', 'EU', 'Slovakia', '421', 'SK.png'),
(204, '704', 'VND', '₫', 2, 'VN', 'VNM', 'AS', 'Viet Nam', '84', 'VN.png'),
(205, '705', 'EUR', '€', 2, 'SI', 'SVN', 'EU', 'Slovenia', '386', 'SI.png'),
(206, '706', 'SOS', 'S', 2, 'SO', 'SOM', 'AF', 'Somalia', '252', 'SO.png'),
(207, '710', 'ZAR', 'R', 2, 'ZA', 'ZAF', 'AF', 'South Africa', '27', 'ZA.png'),
(208, '716', 'ZWL', 'Z$', 2, 'ZW', 'ZWE', 'AF', 'Zimbabwe', '263', 'ZW.png'),
(209, '724', 'EUR', '€', 2, 'ES', 'ESP', 'EU', 'Spain', '34', 'ES.png'),
(210, '728', 'SSP', NULL, NULL, 'SS', 'SSD', 'AF', 'South Sudan', '211', NULL),
(211, '729', 'SDG', NULL, NULL, 'SD', 'SDN', 'AF', 'Sudan', '249', NULL),
(212, '732', 'MAD', 'MAD', 2, 'EH', 'ESH', 'AF', 'Western Sahara', '212', 'EH.png'),
(213, '740', 'SRD', '$', 2, 'SR', 'SUR', 'SA', 'Suriname', '597', 'SR.png'),
(214, '744', 'NOK', 'kr', 2, 'SJ', 'SJM', 'EU', 'Svalbard and Jan Mayen', '47', 'SJ.png'),
(215, '748', 'SZL', 'SZL', 2, 'SZ', 'SWZ', 'AF', 'Swaziland', '268', 'SZ.png'),
(216, '752', 'SEK', 'kr', 2, 'SE', 'SWE', 'EU', 'Sweden', '46', 'SE.png'),
(217, '756', 'CHF', 'CHF', 2, 'CH', 'CHE', 'EU', 'Switzerland', '41', 'CH.png'),
(218, '760', 'SYP', '£', 2, 'SY', 'SYR', 'AS', 'Syrian Arab Republic', '963', 'SY.png'),
(219, '762', 'TJS', 'TJS', 2, 'TJ', 'TJK', 'AS', 'Tajikistan', '992', 'TJ.png'),
(220, '764', 'THB', '฿', 2, 'TH', 'THA', 'AS', 'Thailand', '66', 'TH.png'),
(221, '768', 'XOF', 'XOF', 0, 'TG', 'TGO', 'AF', 'Togo', '228', 'TG.png'),
(222, '772', 'NZD', '$', 2, 'TK', 'TKL', 'OC', 'Tokelau', '690', 'TK.png'),
(223, '776', 'TOP', 'T$', 2, 'TO', 'TON', 'OC', 'Tonga', '676', 'TO.png'),
(224, '780', 'TTD', 'TT$', 2, 'TT', 'TTO', 'NA', 'Trinidad and Tobago', '1', 'TT.png'),
(225, '784', 'AED', 'AED', 2, 'AE', 'ARE', 'AS', 'United Arab Emirates', '971', 'AE.png'),
(226, '788', 'TND', 'TND', 3, 'TN', 'TUN', 'AF', 'Tunisia', '216', 'TN.png'),
(227, '792', 'TRY', '₺', 2, 'TR', 'TUR', 'AS', 'Turkey', '90', 'TR.png'),
(228, '795', 'TMT', 'm', 2, 'TM', 'TKM', 'AS', 'Turkmenistan', '993', 'TM.png'),
(229, '796', 'USD', '$', 2, 'TC', 'TCA', 'NA', 'Turks and Caicos Islands', '1', 'TC.png'),
(230, '798', 'AUD', '$', 2, 'TV', 'TUV', 'OC', 'Tuvalu', '688', 'TV.png'),
(231, '800', 'UGX', 'UGX', 0, 'UG', 'UGA', 'AF', 'Uganda', '256', 'UG.png'),
(232, '804', 'UAH', '₴', 2, 'UA', 'UKR', 'EU', 'Ukraine', '380', 'UA.png'),
(233, '807', 'MKD', 'ден', 2, 'MK', 'MKD', 'EU', 'Macedonia, the former Yugoslav Republic of', '389', 'MK.png'),
(234, '818', 'EGP', '£', 2, 'EG', 'EGY', 'AF', 'Egypt', '20', 'EG.png'),
(235, '826', 'GBP', '£', 2, 'GB', 'GBR', 'EU', 'United Kingdom', '44', 'GB.png'),
(236, '831', 'GGP (GG2)', NULL, NULL, 'GG', 'GGY', 'EU', 'Guernsey', '44', NULL),
(237, '832', 'JEP (JE2)', NULL, NULL, 'JE', 'JEY', 'EU', 'Jersey', '44', NULL),
(238, '833', 'IMP (IM2)', NULL, NULL, 'IM', 'IMN', 'EU', 'Isle of Man', '44', NULL),
(239, '834', 'TZS', 'TZS', 2, 'TZ', 'TZA', 'AF', 'Tanzania, United Republic of', '255', 'TZ.png'),
(240, '840', 'USD', '$', 2, 'US', 'USA', 'NA', 'United States', '1', 'US.png'),
(241, '850', 'USD', '$', 2, 'VI', 'VIR', 'NA', 'Virgin Islands, U.S.', '1', 'VI.png'),
(242, '854', 'XOF', 'XOF', 0, 'BF', 'BFA', 'AF', 'Burkina Faso', '226', 'BF.png'),
(243, '858', 'UYU', '$U', 0, 'UY', 'URY', 'SA', 'Uruguay', '598', 'UY.png'),
(244, '860', 'UZS', 'лв', 2, 'UZ', 'UZB', 'AS', 'Uzbekistan', '998', 'UZ.png'),
(245, '862', 'VEF', 'Bs', 2, 'VE', 'VEN', 'SA', 'Venezuela, Bolivarian Republic of', '58', 'VE.png'),
(246, '876', 'XPF', 'XPF', 0, 'WF', 'WLF', 'OC', 'Wallis and Futuna', '681', 'WF.png'),
(247, '882', 'WST', 'WS$', 2, 'WS', 'WSM', 'OC', 'Samoa', '685', 'WS.png'),
(248, '887', 'YER', '﷼', 2, 'YE', 'YEM', 'AS', 'Yemen', '967', 'YE.png'),
(249, '894', 'ZMW', 'ZK', 2, 'ZM', 'ZMB', 'AF', 'Zambia', '260', 'ZM.png');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `second_category_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `benefits` text COLLATE utf8mb4_unicode_ci,
  `requirements` text COLLATE utf8mb4_unicode_ci,
  `price_plan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL,
  `sale_price` decimal(16,2) DEFAULT NULL,
  `level` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `is_presale` tinyint(4) DEFAULT '0',
  `launch_at` timestamp NULL DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `video_src` text COLLATE utf8mb4_unicode_ci,
  `total_video_time` int(11) DEFAULT NULL,
  `require_enroll` int(11) DEFAULT '1',
  `require_login` int(11) DEFAULT '1',
  `total_lectures` tinyint(4) DEFAULT '0',
  `total_assignments` tinyint(4) DEFAULT '0',
  `total_quiz` tinyint(4) DEFAULT '0',
  `rating_value` decimal(3,2) DEFAULT '0.00',
  `rating_count` tinyint(4) DEFAULT '0',
  `five_star_count` tinyint(4) DEFAULT '0',
  `four_star_count` tinyint(4) DEFAULT '0',
  `three_star_count` tinyint(4) DEFAULT '0',
  `two_star_count` tinyint(4) DEFAULT '0',
  `one_star_count` tinyint(4) DEFAULT '0',
  `is_featured` tinyint(4) DEFAULT NULL,
  `featured_at` timestamp NULL DEFAULT NULL,
  `is_popular` tinyint(4) DEFAULT NULL,
  `popular_added_at` timestamp NULL DEFAULT NULL,
  `last_updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `parent_category_id`, `second_category_id`, `category_id`, `title`, `slug`, `short_description`, `description`, `benefits`, `requirements`, `price_plan`, `price`, `sale_price`, `level`, `status`, `is_presale`, `launch_at`, `thumbnail_id`, `video_src`, `total_video_time`, `require_enroll`, `require_login`, `total_lectures`, `total_assignments`, `total_quiz`, `rating_value`, `rating_count`, `five_star_count`, `four_star_count`, `three_star_count`, `two_star_count`, `one_star_count`, `is_featured`, `featured_at`, `is_popular`, `popular_added_at`, `last_updated_at`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 3, 'دورة PHP', 'dor-php', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.', '<p>لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>', 'و ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر', 'و ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر', 'paid', '1000.00', '700.00', 1, 1, 0, NULL, 1, '{\"source\":\"youtube\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":null,\"source_youtube\":\"https:\\/\\/www.youtube.com\\/watch?v=OK_JCtrrv-c\",\"source_vimeo\":null,\"source_embedded\":null}', 0, 1, 1, 3, 1, 2, '0.00', 0, 0, 0, 0, 0, 0, 1, '2020-09-09 12:52:09', 1, '2020-09-01 14:39:44', '2020-11-01 14:16:31', '2020-08-31 11:39:38', '2020-08-31 11:33:20', '2020-11-02 12:17:20'),
(2, 2, 1, 2, 3, 'test', 'test', 'short description', NULL, NULL, NULL, 'free', NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '2020-08-31 13:40:25', NULL, '2020-08-31 13:40:25', '2020-08-31 13:40:25'),
(3, 2, 1, 2, 3, 'دروة 2', 'dro-2', NULL, NULL, NULL, NULL, 'free', NULL, NULL, 2, 0, 0, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '2020-09-01 18:11:34', NULL, '2020-09-01 18:11:34', '2020-09-01 18:11:34'),
(4, 2, 1, 2, 3, 'c2', 'c2', NULL, NULL, NULL, NULL, 'free', NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '2020-09-09 13:01:15', NULL, '2020-09-09 13:01:15', '2020-09-09 13:01:15'),
(5, 1, 1, 2, 3, 'الاقترانات', 'alaktranat', 'سلسلة كاملة لدراسة الاقترانات التي تمثل علاقة تربط كل عنصر من مجموعة تدعى المنطلق أو مجموعة الانطلاق أو المجال بعنصر واحد وواحد فقط على الأكثر من مجموعة تدعى المستقر أو المجال المقابل أو مجمو', NULL, 'ما هي الاقترانات؟\r\nمجال الاقترانات\r\nمدى الاقترانات\r\nرسم الاقترانات\r\nما هي الاقترانات المثلثية؟\r\nمجال ومدى الاقترانات المثلثية', 'معرفة سابقة بالرياضيات', 'free', NULL, NULL, 1, 1, 0, NULL, 14, '{\"source\":\"youtube\",\"html5_video_id\":null,\"html5_video_poster_id\":null,\"source_external_url\":null,\"source_youtube\":\"https:\\/\\/www.youtube.com\\/watch?v=kvGsIo1TmsM\",\"source_vimeo\":null,\"source_embedded\":null}', 25200, 1, 1, 5, 0, 1, '5.00', 1, 1, 0, 0, 0, 0, 1, '2020-09-10 17:36:38', 1, '2020-09-10 17:36:29', '2020-09-10 17:20:19', '2020-09-10 17:36:22', '2020-09-10 16:55:02', '2020-11-04 16:15:29'),
(6, 1, 1, 2, 3, 'دورة تجريبية', 'dor-tgryby', 'الوصف', NULL, NULL, NULL, 'free', NULL, NULL, 2, 0, 0, NULL, 5, NULL, 0, 1, 1, 1, 0, 1, '0.00', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '2020-11-26 14:43:34', NULL, '2020-11-26 13:48:06', '2020-11-26 14:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `course_user`
--

CREATE TABLE `course_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permissions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_user`
--

INSERT INTO `course_user` (`id`, `course_id`, `user_id`, `permissions`, `added_at`) VALUES
(1, 1, 2, NULL, '2020-08-31 11:33:20'),
(2, 2, 2, NULL, '2020-08-31 13:40:25'),
(3, 3, 2, NULL, '2020-09-01 18:11:34'),
(4, 4, 2, NULL, '2020-09-09 13:01:15'),
(5, 5, 1, NULL, '2020-09-10 16:55:02'),
(6, 6, 1, NULL, '2020-11-26 13:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT '0',
  `content_id` int(11) DEFAULT '0',
  `instructor_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `discussion_id` int(11) DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `replied` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `course_id`, `content_id`, `instructor_id`, `user_id`, `discussion_id`, `title`, `message`, `replied`, `created_at`, `updated_at`) VALUES
(1, 5, 7, 0, 1, 0, 'لدي سؤال لم أفهمه حول مجال الاقتران', 'الآن هل يمكننا حساب الاقتران المثلثي من خلال جيب الزاوية وهل ستكون النتيجة دقيقة في الرسم', 1, '2020-09-10 17:21:56', '2020-09-10 17:22:45'),
(2, 5, 7, 0, 1, 1, NULL, 'نعم يمكنك ذلك من خلال حساب مجموع جيب الزاوية باستخدام مجموع ريمان', 0, '2020-09-10 17:22:45', '2020-09-10 17:22:45'),
(3, 5, 7, 0, 4, 1, NULL, 'سؤال جديد', 0, '2020-11-01 13:32:34', '2020-11-01 13:32:34'),
(4, 5, 7, 0, 4, 0, 'العنوان', 'سؤال جديد', 0, '2020-11-01 13:33:15', '2020-11-01 13:33:15'),
(5, 5, 7, 0, 4, 0, 'test', 'test', 0, '2020-11-02 10:50:48', '2020-11-02 10:50:48'),
(6, 5, 10, 0, 7, 0, 'لدي سؤال مهم', 'سؤال مهم جدا', 0, '2020-11-03 18:00:16', '2020-11-03 18:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `instructor_amount` decimal(16,2) DEFAULT NULL,
  `admin_amount` decimal(16,2) DEFAULT NULL,
  `instructor_share` decimal(16,2) DEFAULT NULL,
  `admin_share` decimal(16,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `instructor_id`, `course_id`, `payment_id`, `payment_status`, `amount`, `instructor_amount`, `admin_amount`, `instructor_share`, `admin_share`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 'success', '0.00', '0.00', '0.00', '80.00', '20.00', '2020-08-31 11:54:11', '2020-08-31 11:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `enrolls`
--

CREATE TABLE `enrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `course_price` decimal(16,2) DEFAULT NULL,
  `payment_id` int(11) DEFAULT '0',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `enrolled_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrolls`
--

INSERT INTO `enrolls` (`id`, `course_id`, `user_id`, `course_price`, `payment_id`, `status`, `enrolled_at`) VALUES
(1, 1, 3, '0.00', 1, 'success', '2020-08-31 11:54:11'),
(2, 5, 1, NULL, 0, 'success', '2020-09-10 17:17:50'),
(3, 5, 4, NULL, 0, 'success', '2020-11-01 13:22:15'),
(4, 1, 4, NULL, 0, 'success', '2020-11-01 14:17:33'),
(5, 5, 3, NULL, 0, 'success', '2020-11-01 16:24:48'),
(6, 1, 5, '1000.00', 2, 'onhold', '2020-11-01 17:45:31'),
(7, 5, 5, NULL, 0, 'success', '2020-11-01 18:37:55'),
(8, 5, 6, NULL, 0, 'success', '2020-11-02 12:00:08'),
(9, 1, 2, '700.00', 4, 'onhold', '2020-11-02 13:24:37'),
(10, 5, 7, NULL, 0, 'success', '2020-11-03 17:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_pages`
--

CREATE TABLE `home_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_btn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature1_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature1_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature1_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature2_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature2_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature3_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature3_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature3_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature4_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature4_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature4_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courses_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courses_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courses_btn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courses_btn_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers1_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers1_value` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers2_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers2_value` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers3_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers3_value` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers4_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numbers4_value` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_text1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_button1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_btn_link1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_text2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_button2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_btn_link2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_about` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_pages`
--

INSERT INTO `home_pages` (`id`, `slider_title`, `slider_sub_title`, `slider_btn_title`, `slider_link`, `feature1_title`, `feature1_text`, `feature1_icon`, `feature2_title`, `feature2_text`, `feature2_icon`, `feature3_title`, `feature3_text`, `feature3_icon`, `feature4_title`, `feature4_text`, `feature4_icon`, `courses_title`, `courses_text`, `courses_btn_title`, `courses_btn_link`, `created_at`, `updated_at`, `slider_image`, `slider_bg`, `numbers1_title`, `numbers1_value`, `numbers2_title`, `numbers2_value`, `numbers3_title`, `numbers3_value`, `numbers4_title`, `numbers4_value`, `bottom_title1`, `bottom_text1`, `bottom_button1`, `bottom_btn_link1`, `bottom_title2`, `bottom_text2`, `bottom_button2`, `bottom_btn_link2`, `footer_about`) VALUES
(1, 'أدرس من أي مكان في أي وقت', 'من خلال منصتنا يمكنك زيادة معارفك المهنية وتحسين مستواك الجامعي بدون بذل الكثير من الجهود والأموال', 'تصفح الدروس', 'httop://google.com', 'لوحة تعليمية تفاعلية', 'تعلم وأدرس موادك بكل سهولة من خلال لوحة تعليمية بسيطة لكل درس', '13', 'اختبارات إلكترونية', 'ستتمكن من اختبار معلوماتك من خلال اختبارات إلكترونية متقدمة يضيفها معلموك', '10', 'ناقش معلمك', 'يمكنك طرح أسئلتك ووجهات نظرك من خلال مساحات نقاش ضمن كل درس', '11', 'وصول مدى الحياة', 'ستتمكن من الوصول لجميع دروسك وموادك التعليمية مدى الحياة ومن أي جهاز', '8', 'العنوان الرئيسي', 'العنوان الفرعي', 'عنوان الزر', 'google.com', '2020-09-10 13:39:34', '2020-10-07 18:25:06', NULL, '5', 'متدرب وطالب', '40K', 'مادة علمية', '1000+', 'اختبار تم حله', '55K', 'مدرس ومحاضر جامعي', '200+', 'درس معنا', 'انشر معرفتك وخبراتك لملايين الطلاب حول العالم من خلال منصة تعليم إلكترونية متطورة', 'انضم كمدرس', 'google.com', 'ضاعف معرفتك', 'اكتسب جميع المهارات والمعارف التي تفقدها في جامعتك وحافظ على مستواك التعليمي', 'ابدأ التعلم', 'google.com', 'نبذة عن الموقع');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_ext` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `user_id`, `name`, `title`, `alt_text`, `slug`, `slug_ext`, `file_size`, `mime_type`, `metadata`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 2, 'php1.jpg', NULL, NULL, 'php1', 'php1.jpg', '31593', 'image/jpeg', NULL, 0, '2020-08-31 11:33:06', '2020-08-31 11:33:06'),
(2, 1, 'blue-BG.jpg', NULL, NULL, 'blue-bg', 'blue-bg.jpg', '199869', 'image/jpeg', NULL, 0, '2020-09-01 14:23:38', '2020-09-01 14:23:38'),
(3, 1, 'php1.jpg', NULL, NULL, 'php1-1', 'php1-1.jpg', '31593', 'image/jpeg', NULL, 0, '2020-09-10 12:58:13', '2020-09-10 12:58:13'),
(4, 1, '12335.png', NULL, NULL, '12335', '12335.png', '195748', 'image/png', NULL, 0, '2020-09-10 15:03:06', '2020-09-10 15:03:06'),
(5, 1, 'taking-notes-and-working-on-laptop.jpg', NULL, NULL, 'taking-notes-and-working-on-laptop', 'taking-notes-and-working-on-laptop.jpg', '1165714', 'image/jpeg', NULL, 0, '2020-09-10 15:05:26', '2020-09-10 15:05:26'),
(6, 1, 'cap.png', NULL, NULL, 'cap', 'cap.png', '2094', 'image/png', NULL, 0, '2020-09-10 15:09:02', '2020-09-10 15:09:02'),
(7, 1, 'cap.png', NULL, NULL, 'cap-1', 'cap-1.png', '2094', 'image/png', NULL, 0, '2020-09-10 15:09:03', '2020-09-10 15:09:03'),
(8, 1, 'clock.png', NULL, NULL, 'clock', 'clock.png', '4268', 'image/png', NULL, 0, '2020-09-10 15:46:32', '2020-09-10 15:46:32'),
(9, 1, 'quiz.png', NULL, NULL, 'quiz', 'quiz.png', '2323', 'image/png', NULL, 0, '2020-09-10 15:49:26', '2020-09-10 15:49:26'),
(10, 1, 'quiz.png', NULL, NULL, 'quiz-1', 'quiz-1.png', '2323', 'image/png', NULL, 0, '2020-09-10 15:49:26', '2020-09-10 15:49:26'),
(11, 1, 'training.png', NULL, NULL, 'training', 'training.png', '2806', 'image/png', NULL, 0, '2020-09-10 15:49:26', '2020-09-10 15:49:26'),
(12, 1, 'training.png', NULL, NULL, 'training-1', 'training-1.png', '2806', 'image/png', NULL, 0, '2020-09-10 15:49:27', '2020-09-10 15:49:27'),
(13, 1, 'online-course.png', NULL, NULL, 'online-course', 'online-course.png', '1537', 'image/png', NULL, 0, '2020-09-10 15:50:12', '2020-09-10 15:50:12'),
(14, 1, '34273_f5de_8.jpg', NULL, NULL, '34273-f5de-8', '34273-f5de-8.jpg', '29357', 'image/jpeg', NULL, 0, '2020-09-10 16:54:16', '2020-09-10 16:54:16'),
(15, 1, 'مستند تجريبي.pdf', NULL, NULL, 'mstnd-tgryby', 'mstnd-tgryby.pdf', '116808', 'application/pdf', NULL, 0, '2020-09-10 16:59:50', '2020-09-10 16:59:50'),
(16, 2, 'profile.png', NULL, NULL, 'profile', 'profile.png', '33281', 'image/png', NULL, 0, '2020-11-01 15:09:42', '2020-11-01 15:09:42'),
(19, 1, 'signature.png', NULL, NULL, 'signature', 'signature.png', '4000', 'image/png', NULL, 0, '2020-11-17 19:17:34', '2020-11-17 19:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2017_11_25_103526_create_media_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_04_13_155306_create_options_table', 1),
(5, '2020_04_14_053128_create_countries_table', 1),
(6, '2020_04_19_150640_create_courses_table', 1),
(7, '2020_04_19_185837_create_sections_table', 1),
(8, '2020_04_20_160323_create_course_user_table', 1),
(9, '2020_04_25_091439_create_enrolls_table', 1),
(10, '2020_04_28_172856_create_attachments_table', 1),
(11, '2020_04_30_173643_create_assignment_submissions_table', 1),
(12, '2020_05_01_175907_create_categories_table', 1),
(13, '2020_05_02_113246_create_contents_table', 1),
(14, '2020_05_02_144441_create_completes_table', 1),
(15, '2020_05_05_204608_create_payments_table', 1),
(16, '2020_05_06_140733_create_earnings_table', 1),
(17, '2020_05_10_175048_create_reviews_table', 1),
(18, '2020_05_14_005447_create_wishlist_table', 1),
(19, '2020_05_15_164207_create_withdraws_table', 1),
(20, '2020_05_17_012150_create_posts_table', 1),
(21, '2020_05_17_143030_create_discussions_table', 1),
(22, '2020_05_18_233630_create_questions_table', 1),
(23, '2020_05_18_234745_create_question_options_table', 1),
(24, '2020_05_19_234606_create_attempts_table', 1),
(25, '2020_05_20_043510_create_answers_table', 1),
(26, '2020_09_05_162524_create_home_page_info', 2),
(27, '2020_09_05_183153_create_home_page', 3),
(44, '2020_09_05_193208_create_home_pages', 4),
(45, '2020_09_09_143806_create_partners', 4),
(46, '2020_09_09_181049_update_home_pages', 4),
(47, '2020_10_07_211757_add_footer_about_home_pages_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_key`, `option_value`) VALUES
(1, 'default_storage', 'public'),
(2, 'date_format', 'd/m/Y'),
(3, 'time_format', 'H:i'),
(4, 'site_name', 'LMS'),
(5, 'site_title', 'LMS'),
(6, 'email_address', 'info@kamel.tech'),
(7, 'default_timezone', 'Asia/Dhaka'),
(8, 'date_format_custom', 'd/m/Y'),
(9, 'time_format_custom', 'H:i'),
(10, 'enable_stripe', '1'),
(11, 'stripe_test_mode', '1'),
(12, 'paypal_receiver_email', 'MerchantKennethNBoyd@teleworm.us'),
(13, 'stripe_test_secret_key', 'sk_test_tJeAdA1KbhiYV8I8bfPmJcOL'),
(14, 'stripe_test_publishable_key', 'pk_test_P3TFmKrvT7l29Zpyy1f4pwk8'),
(15, 'stripe_live_secret_key', NULL),
(16, 'stripe_live_publishable_key', NULL),
(17, 'enable_paypal', '1'),
(18, 'enable_paypal_sandbox', '1'),
(19, 'current_theme', 'edugator'),
(20, 'copyright_text', '[copyright_sign] [year] [site_name], All rights reserved.'),
(21, 'enable_social_login', '1'),
(22, 'enable_facebook_login', '1'),
(23, 'enable_google_login', '1'),
(24, 'fb_app_id', '807346162754117'),
(25, 'fb_app_secret', '6b93030d5c4f2715aa9d02be93256fbd'),
(26, 'google_client_id', '62019812075-0sp3u7h854tp7aknl1m8q7ens0pm4im0.apps.googleusercontent.com'),
(27, 'google_client_secret', 'xK8SHn-ds4GJtVSL95ExTzw3'),
(28, 'currency_position', 'left'),
(29, 'currency_sign', 'USD'),
(30, 'payment_gateway_direct-bank-transfer', '{\"enabled\":\"1\",\"title\":\"Direct Bank Transfer\",\"description\":\"Pay via direct bank transfer to process your order\",\"instructions\":\"Please transfer your fund using following Bank Account\\r\\n\\r\\nBank Name: Bank Asia\\r\\nBranch: Mirpur circle 10\\r\\nA\\/C No: 079878765545354\",\"gateway_save_btn\":null}'),
(31, 'payment_gateway_cod', '{\"enabled\":\"1\",\"title\":\"Cash on delivery\",\"description\":\"Pay upon delivery\",\"instructions\":\"Pay upon delivery to the delivery man\",\"gateway_save_btn\":null}'),
(32, 'allowed_file_types', 'jpeg,png,jpg,pdf,zip,doc,docx,xls,ppt,mp4'),
(33, 'is_preview', '1'),
(34, 'admin_share', '20'),
(35, 'instructor_share', '80'),
(36, 'charge_fees_name', 'رسوم بوابة الدفع الإلكترونية'),
(37, 'charge_fees_amount', '4'),
(38, 'charge_fees_type', 'percent'),
(39, 'enable_charge_fees', '1'),
(40, 'enable_instructors_earning', '0'),
(41, 'bank_gateway', 'json_encode_value_{\"enable_bank_transfer\":\"1\"}'),
(42, 'enable_offline_payment', '1'),
(43, 'site_url', 'http://localhost:8080/lms/public'),
(44, 'withdraw_methods', 'json_encode_value_{\"bank_transfer\":{\"enable\":\"1\",\"min_withdraw_amount\":\"100\",\"notes\":\"Please note that it takes approximately 2 to 7 days to process your withdraw via bank transfer. Sometimes it may take longer. If you do not receive withdrawal after 7 days, please contact our customer support. Updated\"},\"echeck\":{\"enable\":\"1\",\"min_withdraw_amount\":\"50\"},\"paypal\":{\"enable\":\"1\",\"min_withdraw_amount\":\"50\"}}'),
(45, 'lms_settings', 'json_encode_value_{\"enable_discussion\":\"1\"}'),
(46, 'active_plugins', '{\"3\":\"MultiInstructor\",\"4\":\"StudentsProgress\",\"5\":\"Certificate\"}'),
(47, 'site_logo', '7'),
(48, 'terms_of_use_page', NULL),
(49, 'privacy_policy_page', NULL),
(50, 'about_us_page', NULL),
(51, 'cookie_alert', 'json_encode_value_{\"enable\":\"1\",\"message\":\"By using TeachifyLMS you accept our cookies and agree to our privacy policy, including cookie policy. {privacy_policy_url}\"}'),
(52, 'social_login', 'json_encode_value_{\"facebook\":{\"enable\":\"1\",\"app_id\":\"292155035510814\",\"app_secret\":\"de1a21d48afe669dda21626fdf638832\"},\"google\":{\"enable\":\"1\",\"client_id\":\"586033023574-3m025n2jei2eldgdqf7ic2r7rh58oj86.apps.googleusercontent.com\",\"client_secret\":\"Pd6fUp5FFmXUt-M0Prdc2fFy\"},\"twitter\":{\"enable\":\"1\",\"consumer_key\":\"iXy8T2reBWP42aD60rXdtUf8R\",\"consumer_secret\":\"SEYSr2AFVaVfH56xPZerEZxBW7gGgZOE2CT8jdoq32BbuL7Zv3\"},\"linkedin\":{\"enable\":\"1\",\"client_id\":\"86iampeb7c62rw\",\"client_secret\":\"Gyb9naxKvOR6wM8i\"}}'),
(53, 'enable_rtl', '1'),
(54, 'certificate', 'json_encode_value_{\"authorise_name\":\"\\u0627\\u0644\\u062a\\u0645\\u064a\\u0632\",\"company_name\":\"\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u062a\\u0645\\u064a\\u0632\",\"signature_id\":\"19\"}');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `title`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'شريك 1', '3', '2020-09-10 13:47:01', '2020-09-10 13:47:01'),
(2, 'شريك 2', '2', '2020-09-10 13:47:18', '2020-09-10 13:47:18'),
(3, 'شريك 3', '3', '2020-09-10 13:47:36', '2020-09-10 13:47:36'),
(4, 'شريك 4', '2', '2020-09-10 13:47:51', '2020-09-10 13:47:51'),
(5, 'شريك 5', '2', '2020-09-10 13:47:51', '2020-10-07 16:15:38'),
(6, 'شريك 6', '5', '2020-10-07 16:16:11', '2020-10-07 16:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `total_amount` decimal(8,2) DEFAULT NULL,
  `fees_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fees_amount` decimal(8,2) DEFAULT NULL,
  `fees_total` decimal(8,2) DEFAULT NULL,
  `fees_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('initial','pending','onhold','success','failed','declined','dispute','expired') COLLATE utf8mb4_unicode_ci DEFAULT 'initial',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id_or_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_created` int(11) DEFAULT NULL,
  `bank_swift_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `email`, `user_id`, `amount`, `total_amount`, `fees_name`, `fees_amount`, `fees_total`, `fees_type`, `payment_method`, `status`, `currency`, `token_id`, `card_last4`, `card_id`, `card_brand`, `card_country`, `card_exp_month`, `card_exp_year`, `client_ip`, `charge_id_or_token`, `payer_email`, `description`, `local_transaction_id`, `payment_created`, `bank_swift_code`, `account_number`, `branch_name`, `branch_address`, `account_name`, `iban`, `payment_note`, `created_at`, `updated_at`) VALUES
(1, 'Sean J. McAlister', 'student@demo.com', 3, '0.00', NULL, 'Payment gateway charge', '4.00', '0.00', 'percent', 'offline', 'success', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRAN_1598864050EW53XW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'notes about payment', '2020-08-31 11:54:10', '2020-08-31 11:58:28'),
(2, 'hussam 2', 'hussam2@gmail.com', 5, '1040.00', NULL, 'Payment gateway charge', '4.00', '40.00', 'percent', 'offline', 'onhold', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRAN_16042383312KCTJS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'notes', '2020-11-01 17:45:31', '2020-11-01 17:45:31'),
(3, 'hussam 2', 'hussam2@gmail.com', 5, '0.00', NULL, 'Payment gateway charge', '4.00', '0.00', 'percent', 'offline', 'success', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRAN_1604238332JSDMTT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'notes', '2020-11-01 17:45:32', '2020-11-01 18:02:53'),
(4, 'Bessie M. Artz', 'instructor@demo.com', 2, '728.00', NULL, 'رسوم بوابة الدفع الإلكترونية', '4.00', '28.00', 'percent', 'offline', 'onhold', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRAN_1604309077G61V14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', '2020-11-02 13:24:37', '2020-11-02 13:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci,
  `feature_image` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `post_content`, `feature_image`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'post 1', 'post-1', '<p>details</p>', 2, 'post', '1', '2020-09-01 13:32:39', '2020-09-10 11:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` decimal(5,1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `quiz_id`, `title`, `image_id`, `type`, `score`, `sort_order`) VALUES
(1, 2, 4, 'السؤال الأول؟', NULL, 'textarea', '10.0', 1),
(2, 2, 4, 'السؤال الثاني؟', NULL, 'textarea', '10.0', 2),
(3, 1, 9, 'يعتبر ق-1 اقتران إذا كان الإقتران الموجود فيه تناظر', NULL, 'radio', '10.0', 1),
(4, 1, 9, 'ما هي قاعدة الإقتران ق (س) : { ( 1, 3 ) , ( 2, 4 ) , ( 3, 5 ) , ( 4, 6 ) , ( 5, 7 ) ...}', NULL, 'radio', '10.0', 2),
(5, 1, 9, 'جذرا المعادلة س2 = س + 2 هما:', NULL, 'radio', '10.0', 3),
(6, 2, 12, 'سؤال 1', NULL, 'radio', '10.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `d_pref` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `is_correct` tinyint(4) DEFAULT '0',
  `sort_order` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`id`, `question_id`, `title`, `image_id`, `d_pref`, `is_correct`, `sort_order`) VALUES
(1, 3, 'صحيح', NULL, 'text', 1, 1),
(2, 3, 'خطأ', NULL, 'text', 0, 2),
(3, 4, 'ق(س): س + 2', NULL, 'text', 0, 1),
(4, 4, 'ق(س): س + 1', NULL, 'text', 0, 2),
(5, 4, 'ق(س): س 3', NULL, 'text', 1, 3),
(6, 4, 'ق(س): 2س', NULL, 'text', 0, 4),
(7, 5, '( 2, - 1 )', NULL, 'text', 0, 1),
(8, 5, '(2 , 1 )', NULL, 'text', 0, 2),
(9, 5, '( 4, 5 )', NULL, 'text', 0, 3),
(10, 5, '( صفر , 1 )', NULL, 'text', 0, 4),
(11, 6, 'خيار 1', NULL, 'text', 0, 1),
(12, 6, 'خيار 2', NULL, 'text', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `review_id` int(11) DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `rating` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `course_id`, `review_id`, `review`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 5, 0, 'تقييم الدورة', 5, 1, '2020-11-04 16:15:29', '2020-11-04 16:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unlock_date` timestamp NULL DEFAULT NULL,
  `unlock_days` tinyint(4) DEFAULT NULL,
  `sort_order` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `course_id`, `section_name`, `unlock_date`, `unlock_days`, `sort_order`) VALUES
(1, 1, 'مقدمة', NULL, NULL, 0),
(2, 1, 'الفصل الأول', NULL, NULL, 0),
(3, 2, 'section 1', NULL, NULL, 0),
(4, 5, 'مقدمة حول الاقترانات', NULL, NULL, 0),
(5, 5, 'مجال الاقترانات', NULL, NULL, 1),
(6, 6, 'مقدمة في علم', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` text COLLATE utf8mb4_unicode_ci,
  `date_of_birth` date DEFAULT NULL,
  `photo` int(11) DEFAULT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) DEFAULT '0',
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `company_name`, `country_id`, `address`, `address_2`, `city`, `zip_code`, `postcode`, `website`, `phone`, `about_me`, `date_of_birth`, `photo`, `job_title`, `options`, `user_type`, `active_status`, `provider_user_id`, `provider`, `reset_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Margaret B. Davis', 'admin@demo.com', NULL, '$2y$10$KrMTXhy8lFlhidGtnwOE.usMn1p9YwagvAjWAHodVH9IYbkxFdGQO', 'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"enrolled_courses\":[5],\"completed_courses\":{\"5\":{\"percent\":17,\"content_ids\":[9]}}}', 'admin', 1, NULL, NULL, NULL, NULL, NULL, '2020-09-10 17:19:24'),
(2, 'Bessie M. Artz', 'instructor@demo.com', NULL, '$2y$10$STV8Kt9oBI.W0DqZObv40eUyyzhcHidAENquuoAdo.H.XOxzHdfoW', 'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', 'نبذة مختصرة عن المدرب', NULL, 16, 'استاذ رياضيات', '{\"social\":{\"website\":null,\"twitter\":null,\"facebook\":null,\"linkedin\":null,\"youtube\":null,\"instagram\":null},\"enrolled_courses\":[]}', 'instructor', 1, NULL, NULL, NULL, NULL, NULL, '2020-11-02 13:24:37'),
(3, 'Sean J. McAlister', 'student@demo.com', NULL, '$2y$10$rYXzbCKTqUYE6BgWC7y3Tusa0Hdj5wGVbaeXos4Igz1Fi3eD9co.i', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"enrolled_courses\":[1,5],\"completed_courses\":{\"1\":{\"percent\":100,\"content_ids\":[4,5,1,2,3]},\"5\":{\"percent\":17,\"content_ids\":[6]}}}', 'student', 1, NULL, NULL, NULL, NULL, NULL, '2020-11-04 16:10:06'),
(4, 'hussam', 'hussam@gmail.com', NULL, '$2y$10$hgAnUsIYmrN1rYx81HcNcuKG9b8KsonCjZlGbDGOWCHbqVBpcTIoS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"enrolled_courses\":[5,1],\"completed_courses\":{\"5\":{\"percent\":67,\"content_ids\":[6,9,7,8]},\"1\":{\"percent\":50,\"content_ids\":[12,4,1]}}}', 'student', 1, NULL, NULL, NULL, NULL, '2020-11-01 12:20:30', '2020-11-02 11:57:22'),
(5, 'hussam 2', 'hussam2@gmail.com', NULL, '$2y$10$Xuor/RsM8/ngGs769yCNbONyD8JO8AKkg.J3Wzir5oHO9YGIdRTF.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"enrolled_courses\":[5]}', 'student', 1, NULL, NULL, NULL, NULL, '2020-11-01 17:45:01', '2020-11-01 18:37:55'),
(6, 'hussam', 'hussam3@gmail.com', NULL, '$2y$10$K6cCc5Tur8wdeoepswt8ne8oGNO4IQtj24cPxvsV0iZ0JHpzR59lC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"enrolled_courses\":[5],\"completed_courses\":{\"5\":{\"percent\":100,\"content_ids\":[6,9,7,8,10,11]}},\"wishlists\":[1]}', 'student', 1, NULL, NULL, NULL, NULL, '2020-11-02 11:59:43', '2020-11-04 16:15:03'),
(7, 'salem ali', 'salimali@disbox.net', NULL, '$2y$10$y7OkWzDaJMBNGhm0uC/cp.5pvRrzKlJ5o2JvPUCQdeaI/mdbGEt1O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"enrolled_courses\":[5],\"completed_courses\":{\"5\":{\"percent\":100,\"content_ids\":[6,7,8,9,10,11]}}}', 'student', 1, NULL, NULL, NULL, NULL, '2020-11-03 17:58:10', '2020-11-03 18:03:58');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `course_id`, `user_id`) VALUES
(1, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `method_data` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attempts`
--
ALTER TABLE `attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completes`
--
ALTER TABLE `completes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrolls`
--
ALTER TABLE `enrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_pages`
--
ALTER TABLE `home_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attempts`
--
ALTER TABLE `attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `completes`
--
ALTER TABLE `completes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_user`
--
ALTER TABLE `course_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enrolls`
--
ALTER TABLE `enrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_pages`
--
ALTER TABLE `home_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
