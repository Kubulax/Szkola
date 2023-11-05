-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Lis 2023, 01:09
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `jobspot`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_course`
--

CREATE TABLE `assigned_course` (
  `assigned_course_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_duty_job_advertisement`
--

CREATE TABLE `assigned_duty_job_advertisement` (
  `assigned_duty_job_advertisement_id` int(10) UNSIGNED NOT NULL,
  `job_advertisement_id` int(10) UNSIGNED NOT NULL,
  `duty_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_duty_work_experience`
--

CREATE TABLE `assigned_duty_work_experience` (
  `assigned_duty_work_experience_id` int(10) UNSIGNED NOT NULL,
  `work_experience_id` int(11) UNSIGNED NOT NULL,
  `duty_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_education`
--

CREATE TABLE `assigned_education` (
  `assigned_education_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `education_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_job_perks`
--

CREATE TABLE `assigned_job_perks` (
  `assigned_job_perks_id` int(10) UNSIGNED NOT NULL,
  `job_advertisement_id` int(10) UNSIGNED NOT NULL,
  `job_perk_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_job_requirements`
--

CREATE TABLE `assigned_job_requirements` (
  `assigned_job_requirements_id` int(10) UNSIGNED NOT NULL,
  `job_advertisement_id` int(10) UNSIGNED NOT NULL,
  `job_requirement_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_known_language`
--

CREATE TABLE `assigned_known_language` (
  `assigned_known_language_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `known_language_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_link`
--

CREATE TABLE `assigned_link` (
  `assigned_link_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `link_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_skill`
--

CREATE TABLE `assigned_skill` (
  `assigned_skill_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `skill_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned_work_experience`
--

CREATE TABLE `assigned_work_experience` (
  `assigned_work_experience_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `work_experience_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `company`
--

CREATE TABLE `company` (
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `apartment_number` varchar(5) DEFAULT NULL,
  `postal_code` varchar(7) NOT NULL,
  `map_latitude` decimal(15,10) NOT NULL,
  `map_longitude` decimal(15,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `course`
--

CREATE TABLE `course` (
  `course_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `organizer_name` varchar(100) NOT NULL,
  `course_start` date NOT NULL,
  `course_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `duty`
--

CREATE TABLE `duty` (
  `duty_id` int(10) UNSIGNED NOT NULL,
  `duty` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `education`
--

CREATE TABLE `education` (
  `education_id` int(10) UNSIGNED NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_city` varchar(100) NOT NULL,
  `education_type` enum('podstawowe','gimnazjalne','zasadnicze zawodowe','zasadnicze branżowe','średnie branżowe','średnie','wyższe (licencjat)','wyższe (magister)','wyższe (inżynier)','wyższe (doktor)') NOT NULL,
  `major_subject` varchar(65) DEFAULT NULL,
  `education_start` date NOT NULL,
  `education_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_advertisement`
--

CREATE TABLE `job_advertisement` (
  `job_advertisement_id` int(11) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `position_level` varchar(35) NOT NULL,
  `employment_contract_type` enum('okres próbny','czas określony','czas nieokreślony') NOT NULL,
  `pay_period_in_days` int(11) NOT NULL,
  `work_time_per_day_in_hours` int(11) NOT NULL,
  `work_time_per_pay_period_in_hours` int(11) NOT NULL,
  `job_type` enum('zdalna','stacjonarna','hybrydowa') NOT NULL,
  `wage_low` decimal(8,2) NOT NULL,
  `wage_high` decimal(8,2) NOT NULL,
  `work_days` set('poniedziałek','wtorek','środa','czwartek','piątek','sobota','niedziela') NOT NULL,
  `work_hours_start` time NOT NULL,
  `work_hours_end` time NOT NULL,
  `recrutation_end` datetime NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_perk`
--

CREATE TABLE `job_perk` (
  `job_perk_id` int(11) UNSIGNED NOT NULL,
  `perk` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_requirement`
--

CREATE TABLE `job_requirement` (
  `job_requirement_id` int(10) UNSIGNED NOT NULL,
  `requirement` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `known_language`
--

CREATE TABLE `known_language` (
  `known_language_id` int(10) UNSIGNED NOT NULL,
  `language` varchar(50) NOT NULL,
  `level` enum('podstawowy','średnio zaawansowany','zaawansowany','A1','A2','B1','B2','C1','C2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `link`
--

CREATE TABLE `link` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(10) UNSIGNED NOT NULL,
  `skill` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `profile_picture_path` varchar(25) NOT NULL,
  `place_of_residence` varchar(65) NOT NULL,
  `current_job` varchar(100) NOT NULL,
  `short_description_of_current_job` text NOT NULL,
  `work_summary` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `work_experience`
--

CREATE TABLE `work_experience` (
  `work_experience_id` int(10) UNSIGNED NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_city` varchar(100) NOT NULL,
  `company_street` varchar(100) NOT NULL,
  `company_apartment_number` varchar(5) NOT NULL,
  `job_start` date NOT NULL,
  `job_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `assigned_course`
--
ALTER TABLE `assigned_course`
  ADD PRIMARY KEY (`assigned_course_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indeksy dla tabeli `assigned_duty_job_advertisement`
--
ALTER TABLE `assigned_duty_job_advertisement`
  ADD PRIMARY KEY (`assigned_duty_job_advertisement_id`),
  ADD KEY `job_advertisement_id` (`job_advertisement_id`),
  ADD KEY `duty_id` (`duty_id`);

--
-- Indeksy dla tabeli `assigned_duty_work_experience`
--
ALTER TABLE `assigned_duty_work_experience`
  ADD PRIMARY KEY (`assigned_duty_work_experience_id`),
  ADD KEY `work_experience_id` (`work_experience_id`),
  ADD KEY `duty_id` (`duty_id`);

--
-- Indeksy dla tabeli `assigned_education`
--
ALTER TABLE `assigned_education`
  ADD PRIMARY KEY (`assigned_education_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `education_id` (`education_id`);

--
-- Indeksy dla tabeli `assigned_job_perks`
--
ALTER TABLE `assigned_job_perks`
  ADD PRIMARY KEY (`assigned_job_perks_id`),
  ADD KEY `job_advertisement_id` (`job_advertisement_id`),
  ADD KEY `job_perk_id` (`job_perk_id`);

--
-- Indeksy dla tabeli `assigned_job_requirements`
--
ALTER TABLE `assigned_job_requirements`
  ADD PRIMARY KEY (`assigned_job_requirements_id`),
  ADD KEY `job_advertisement_id` (`job_advertisement_id`),
  ADD KEY `job_requirement_id` (`job_requirement_id`);

--
-- Indeksy dla tabeli `assigned_known_language`
--
ALTER TABLE `assigned_known_language`
  ADD PRIMARY KEY (`assigned_known_language_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `known_language_id` (`known_language_id`);

--
-- Indeksy dla tabeli `assigned_link`
--
ALTER TABLE `assigned_link`
  ADD PRIMARY KEY (`assigned_link_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `link_id` (`link_id`);

--
-- Indeksy dla tabeli `assigned_skill`
--
ALTER TABLE `assigned_skill`
  ADD PRIMARY KEY (`assigned_skill_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indeksy dla tabeli `assigned_work_experience`
--
ALTER TABLE `assigned_work_experience`
  ADD PRIMARY KEY (`assigned_work_experience_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `work_experience_id` (`work_experience_id`);

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indeksy dla tabeli `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indeksy dla tabeli `duty`
--
ALTER TABLE `duty`
  ADD PRIMARY KEY (`duty_id`);

--
-- Indeksy dla tabeli `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`education_id`);

--
-- Indeksy dla tabeli `job_advertisement`
--
ALTER TABLE `job_advertisement`
  ADD PRIMARY KEY (`job_advertisement_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indeksy dla tabeli `job_perk`
--
ALTER TABLE `job_perk`
  ADD PRIMARY KEY (`job_perk_id`);

--
-- Indeksy dla tabeli `job_requirement`
--
ALTER TABLE `job_requirement`
  ADD PRIMARY KEY (`job_requirement_id`);

--
-- Indeksy dla tabeli `known_language`
--
ALTER TABLE `known_language`
  ADD PRIMARY KEY (`known_language_id`);

--
-- Indeksy dla tabeli `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`link_id`);

--
-- Indeksy dla tabeli `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeksy dla tabeli `work_experience`
--
ALTER TABLE `work_experience`
  ADD PRIMARY KEY (`work_experience_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `assigned_course`
--
ALTER TABLE `assigned_course`
  MODIFY `assigned_course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_duty_job_advertisement`
--
ALTER TABLE `assigned_duty_job_advertisement`
  MODIFY `assigned_duty_job_advertisement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_duty_work_experience`
--
ALTER TABLE `assigned_duty_work_experience`
  MODIFY `assigned_duty_work_experience_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_education`
--
ALTER TABLE `assigned_education`
  MODIFY `assigned_education_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_job_perks`
--
ALTER TABLE `assigned_job_perks`
  MODIFY `assigned_job_perks_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_job_requirements`
--
ALTER TABLE `assigned_job_requirements`
  MODIFY `assigned_job_requirements_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_known_language`
--
ALTER TABLE `assigned_known_language`
  MODIFY `assigned_known_language_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_link`
--
ALTER TABLE `assigned_link`
  MODIFY `assigned_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_skill`
--
ALTER TABLE `assigned_skill`
  MODIFY `assigned_skill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `assigned_work_experience`
--
ALTER TABLE `assigned_work_experience`
  MODIFY `assigned_work_experience_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `duty`
--
ALTER TABLE `duty`
  MODIFY `duty_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `education`
--
ALTER TABLE `education`
  MODIFY `education_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `job_advertisement`
--
ALTER TABLE `job_advertisement`
  MODIFY `job_advertisement_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `job_perk`
--
ALTER TABLE `job_perk`
  MODIFY `job_perk_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `job_requirement`
--
ALTER TABLE `job_requirement`
  MODIFY `job_requirement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `known_language`
--
ALTER TABLE `known_language`
  MODIFY `known_language_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `link`
--
ALTER TABLE `link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `work_experience`
--
ALTER TABLE `work_experience`
  MODIFY `work_experience_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `assigned_course`
--
ALTER TABLE `assigned_course`
  ADD CONSTRAINT `assigned_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_duty_job_advertisement`
--
ALTER TABLE `assigned_duty_job_advertisement`
  ADD CONSTRAINT `assigned_duty_job_advertisement_ibfk_1` FOREIGN KEY (`job_advertisement_id`) REFERENCES `job_advertisement` (`job_advertisement_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_duty_job_advertisement_ibfk_2` FOREIGN KEY (`duty_id`) REFERENCES `duty` (`duty_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_duty_work_experience`
--
ALTER TABLE `assigned_duty_work_experience`
  ADD CONSTRAINT `assigned_duty_work_experience_ibfk_1` FOREIGN KEY (`work_experience_id`) REFERENCES `work_experience` (`work_experience_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_duty_work_experience_ibfk_2` FOREIGN KEY (`duty_id`) REFERENCES `duty` (`duty_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_education`
--
ALTER TABLE `assigned_education`
  ADD CONSTRAINT `assigned_education_ibfk_1` FOREIGN KEY (`education_id`) REFERENCES `education` (`education_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_education_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_job_perks`
--
ALTER TABLE `assigned_job_perks`
  ADD CONSTRAINT `assigned_job_perks_ibfk_1` FOREIGN KEY (`job_advertisement_id`) REFERENCES `job_advertisement` (`job_advertisement_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_job_perks_ibfk_2` FOREIGN KEY (`job_perk_id`) REFERENCES `job_perk` (`job_perk_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_job_requirements`
--
ALTER TABLE `assigned_job_requirements`
  ADD CONSTRAINT `assigned_job_requirements_ibfk_1` FOREIGN KEY (`job_advertisement_id`) REFERENCES `job_advertisement` (`job_advertisement_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_job_requirements_ibfk_2` FOREIGN KEY (`job_requirement_id`) REFERENCES `job_requirement` (`job_requirement_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_known_language`
--
ALTER TABLE `assigned_known_language`
  ADD CONSTRAINT `assigned_known_language_ibfk_1` FOREIGN KEY (`known_language_id`) REFERENCES `known_language` (`known_language_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_known_language_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_link`
--
ALTER TABLE `assigned_link`
  ADD CONSTRAINT `assigned_link_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `link` (`link_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_link_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_skill`
--
ALTER TABLE `assigned_skill`
  ADD CONSTRAINT `assigned_skill_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_skill_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `assigned_work_experience`
--
ALTER TABLE `assigned_work_experience`
  ADD CONSTRAINT `assigned_work_experience_ibfk_1` FOREIGN KEY (`work_experience_id`) REFERENCES `work_experience` (`work_experience_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_work_experience_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `job_advertisement`
--
ALTER TABLE `job_advertisement`
  ADD CONSTRAINT `job_advertisement_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `job_advertisement_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
