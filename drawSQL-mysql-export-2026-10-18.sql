CREATE TABLE `course_teacher`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `course_id` BIGINT UNSIGNED NOT NULL,
    `teacher_id` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `teachers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `fiscal_code` CHAR(16) NOT NULL
);
ALTER TABLE
    `teachers` ADD UNIQUE `teachers_email_unique`(`email`);
ALTER TABLE
    `teachers` ADD UNIQUE `teachers_fiscal_code_unique`(`fiscal_code`);
CREATE TABLE `courses`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `degree_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `cfu` TINYINT UNSIGNED NOT NULL,
    `year_of_study` TINYINT UNSIGNED NOT NULL
);
CREATE TABLE `degrees`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `department_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `level` VARCHAR(50) NOT NULL,
    `code` VARCHAR(20) NOT NULL
);
ALTER TABLE
    `degrees` ADD UNIQUE `degrees_code_unique`(`code`);
CREATE TABLE `departments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(150) NOT NULL,
    `code` VARCHAR(10) NOT NULL,
    `address` VARCHAR(255) NULL
);
ALTER TABLE
    `departments` ADD UNIQUE `departments_name_unique`(`name`);
ALTER TABLE
    `departments` ADD UNIQUE `departments_code_unique`(`code`);
CREATE TABLE `exam_sessions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `course_id` BIGINT UNSIGNED NOT NULL,
    `exam_date` DATETIME NOT NULL,
    `classroom` VARCHAR(50) NOT NULL
);
CREATE TABLE `students`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `degree_id` BIGINT UNSIGNED NOT NULL,
    `badge_number` VARCHAR(20) NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `fiscal_code` CHAR(16) NOT NULL
);
ALTER TABLE
    `students` ADD UNIQUE `students_badge_number_unique`(`badge_number`);
ALTER TABLE
    `students` ADD UNIQUE `students_email_unique`(`email`);
ALTER TABLE
    `students` ADD UNIQUE `students_fiscal_code_unique`(`fiscal_code`);
CREATE TABLE `exam_enrollments`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_id` BIGINT UNSIGNED NOT NULL,
    `exam_session_id` BIGINT UNSIGNED NOT NULL,
    `grade` TINYINT UNSIGNED NOT NULL,
    `honors` BOOLEAN NOT NULL DEFAULT 0,
    `status` VARCHAR(20) NOT NULL DEFAULT 'complete'
);
ALTER TABLE
    `students` ADD CONSTRAINT `students_degree_id_foreign` FOREIGN KEY(`degree_id`) REFERENCES `degrees`(`id`);
ALTER TABLE
    `exam_enrollments` ADD CONSTRAINT `exam_enrollments_student_id_foreign` FOREIGN KEY(`student_id`) REFERENCES `students`(`id`);
ALTER TABLE
    `exam_enrollments` ADD CONSTRAINT `exam_enrollments_exam_session_id_foreign` FOREIGN KEY(`exam_session_id`) REFERENCES `exam_sessions`(`id`);
ALTER TABLE
    `exam_sessions` ADD CONSTRAINT `exam_sessions_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `courses`(`id`);
ALTER TABLE
    `course_teacher` ADD CONSTRAINT `course_teacher_teacher_id_foreign` FOREIGN KEY(`teacher_id`) REFERENCES `teachers`(`id`);
ALTER TABLE
    `courses` ADD CONSTRAINT `courses_degree_id_foreign` FOREIGN KEY(`degree_id`) REFERENCES `degrees`(`id`);
ALTER TABLE
    `degrees` ADD CONSTRAINT `degrees_department_id_foreign` FOREIGN KEY(`department_id`) REFERENCES `departments`(`id`);
ALTER TABLE
    `course_teacher` ADD CONSTRAINT `course_teacher_course_id_foreign` FOREIGN KEY(`course_id`) REFERENCES `courses`(`id`);