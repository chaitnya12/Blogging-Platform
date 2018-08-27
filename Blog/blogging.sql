-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2018 at 03:01 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogging`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `author_name` varchar(20) DEFAULT NULL,
  `topic` varchar(20) NOT NULL,
  `blog` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `author_name`, `topic`, `blog`, `date`) VALUES
(2, 'chaitnyajoshi', 'System Programming', 'There is compiler then there is assembler then there is <b>linker </b>and <i>Loader</i>', '2018-03-18'),
(4, 'Kunal Rajput', 'Machine Learning', 'For me, growing up in the 80s and 90s, the phrase ?Save the Rainforest? was a directive that barely progressed over the years. The appeal was clear, but the threat was abstract and distant. And the solution (if there was one) seemed difficult to grasp. Since then, other worries?even harder to grasp in their immediacy and scope?have come to dominate our conversations: climate change, as an example.\n\nSo many of us believe that technology has a crucial role to play in fighting climate change, but few are as aware that ?Saving the Rainforest? and fighting climate change are nearly one and the same. By the numbers, destruction of forests accounts for nearly one-fifth of all greenhouse gas emissions every year. And in the tropical rainforest deforestation accelerated on the heels of rampant logging?up to 90 percent of which is done illegally and under the radar.\n\nStopping illegal logging and protecting the world?s rainforests may be the fastest, cheapest way for humanity to slow climate change. And who?s best suited to protect the rainforest? The locals and the indigenous tribes that have lived there for generations.\n\nRainforest Connection is a group of engineers and developers focused on building technology to help locals?like the Tembé tribe from central Amazon?protect their land, and in the process, protect the rest of us from the effects of climate change. Chief Naldo Tembé reached out to me a couple years ago seeking to collaborate on ways technology could help stop illegal loggers from destroying their land. Together, we embarked on an ambitious plan to address this issue using recycled cell phones and machine learning.\n\nOur team has built the world?s first scalable, real-time detection and alert system for logging and environmental conservation in the rainforest. Building hardware that will survive in the rainforest is challenging, but we?re using what?s already there: the trees. We?ve hidden modified smartphones powered with solar panels?called ?Guardian? devices?in trees in threatened areas, and continuously monitor the sounds of the forest, sending all audio up to our cloud-based servers over the standard, local cell-­phone network.', '2018-03-22'),
(5, 'Kunal Rajput', 'Machine Learning', 'If you are interested in getting started with or brushing up on the topic of linear algebra, then there is one textbook that is most likely going to be recommended to you.\r\n\r\nThat textbook is ?Introduction to Linear Algebra? by Gilbert Strang and it provides a reference for his linear algebra course taught at MIT to undergraduate students.\r\n\r\nIn this post, you will discover the book ?Introduction to Linear Algebra? by Gilbert Strang and how you can make the best use of it as a machine learning practitioner.\r\n\r\nAfter reading this post, you will know:\r\n\r\nAbout the goals and benefits of the book to a beginner or practitioner.\r\nThe contents of the book and general topics presented in each chapter.\r\nA selected reading list targeted for machine learning practitioners looking to get up to speed fast.\r\nLet?s get started', '2018-03-22'),
(6, 'Kunal Rajput', 'ML', 'If you are interested in getting started with or brushing up on the topic of linear algebra, then there is one textbook that is most likely going to be recommended to you.\r\n\r\nThat textbook is ?Introduction to Linear Algebra? by Gilbert Strang and it provides a reference for his linear algebra course taught at MIT to undergraduate students.\r\n\r\nIn this post, you will discover the book ?Introduction to Linear Algebra? by Gilbert Strang and how you can make the best use of it as a machine learning practitioner.\r\n\r\nAfter reading this post, you will know:\r\n\r\nAbout the goals and benefits of the book to a beginner or practitioner.\r\nThe contents of the book and general topics presented in each chapter.\r\nA selected reading list targeted for machine learning practitioners looking to get up to speed fast.\r\nLet?s get started', '2018-03-22'),
(11, 'chaitnya joshi', 'Fruits', '<img src=http://www.frankieballard.com/sites/g/files/g2000005856/f/styles/res_custom_user_desktop_1x/public/hr10_sample_image_02_0.jpg?itok=Laod0E5Z alt="Internet Not Connected" height=100 width=100 >', '2018-03-31'),
(12, 'chaitnya joshi', 'Image Upload Demo', 'This Is an example of<b><i><u>Image Uploading</b></i></u>', '2018-04-02'),
(14, 'chaitnya joshi', 'sdhsdf', 'dhdhshsfg<br><img src=images//circles-white.png  alt=''Image Not Visible'' height=100 width=100 >', '2018-04-02'),
(15, 'chaitnya joshi', 'Image Upload Demo', 'this is an image<br><img src=http://localhost:8080//welcome-images-24.png  alt=''Image Not Visible'' height=200 width=200 >', '2018-04-03'),
(16, 'chaitnya joshi', 'hii', 'heiio<br><img src=http://localhost:8080//welcome-images-24.png  alt=''Image Not Visible'' height=200 width=200 >', '2018-04-03');

-- --------------------------------------------------------

--
-- Table structure for table `userdb`
--

CREATE TABLE `userdb` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `contactno` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdb`
--

INSERT INTO `userdb` (`id`, `username`, `password`, `firstname`, `lastname`, `contactno`, `email`) VALUES
(1, 'admin', '1234', 'chaitnya', 'joshi', '9890031990', 'chaitnyajoshi30@gmail.com'),
(4, 'shruti', 'Shruti@29', 'shruti', 'joshi', '9665006585', 'joshi.shruti.24@gmail.com'),
(6, 'kunal', 'kunal@12', 'Kunal', 'Rajput', '9960440871', 'kunal@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdb`
--
ALTER TABLE `userdb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `userdb`
--
ALTER TABLE `userdb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
