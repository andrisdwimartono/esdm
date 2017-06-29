-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2017 at 03:35 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adipatik_esdm2`
--

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id_api` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id_blog` int(11) NOT NULL,
  `path` varchar(300) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('publish','hidden') NOT NULL DEFAULT 'publish',
  `publish_time` datetime DEFAULT NULL,
  `expired_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id_blog`, `path`, `title`, `content`, `id_user`, `created_at`, `status`, `publish_time`, `expired_time`) VALUES
(3, 'Pemerintah-Provinsi-Jawa-Barat-Terbitkan-18-Izin-Tambang', 'Pemerintah Provinsi Jawa Barat Terbitkan 18 Izin Tambang', '<p style=\"text-align:justify\">Tempo.co, Bandung - Pemerintah Jawa Barat menerbitkan 18 izin tambang sejak kebijakan peralihan perizinan beralih dari pemerintah kabupaten/kota kepada pemerintah provinsi, mulai awal 2017.&ldquo;Semuanya 18 izin, yakni 9 untuk Wilayah Izin Usaha Pertambangan (WIUP) baru, 6 izin OP (Operasi Produksi) perpanjangan, dan 3 izin OP baru,&rdquo; kata Wakil Gubernur Deddy Mizwar, Jumat, 7 April 2017.Izin tambang yang diberikan itu untuk penambangan batu gamping, andesit, pasir, sirtu, dan tanah urug. Tersebar di Sukabumi, Bogor, Garut, Kabupaten Bandung, Subang, Sumedang, Bandung Barat, dan Purwakarta. &ldquo;Yang mengajukan ada individu, ada juga perusahaan,&rdquo; kata Deddy. Deddy yang merangkap sebagai Ketua Badan Koordinasi Penataan Ruang Daerah (BKPRD) Jawa Barat mengatakan, 18 izin itu diputuskan dalam rapat pleno yang digelarnya hari ini. Pemerintah Jawa Barat mensyaratka pemeriksaan kesesuaian tata ruang di BKPRD sebelum memutuskan pemberian izin tambang. Menurut Deddy, sejumlah persyaratan diminta untuk mendapatkan izin tersebut. Diantaranya, rencana reklamasi pasca tambang berikut gambarnya, hingga nomor NPWP dan bukti setor pajak bagi pemohon izin untuk perpanjangan perizinan tambang. &ldquo;Mudah-mudahan dengan persyaratan sangat ketat tadi ada pengendlaian,&rdquo; kata dia.Kepala Dinas Energi dan Sumber Daya Mineral Jawa Barat Eddy Iskandar Muda Nasution mengatakan, izin yang diberikan ini merupakan yang pertama. &ldquo;Tahun ini yang pertama,&rdquo; kata dia di Bandung, Jumat, 7 April 2017. Eddy mengatakan, penambangan batu gamping itu bukan berada di kawasan karst. &ldquo;Bukan di daerah karst, sudah pasti,&rdquo; kata dia. Kendati demikian, Eddy mengatakan, pemerintah provinsi tengah meminta penetapan daerah karst mengikuti perubahan kriteria penetapan kawasan itu berdasarkan Peraturan Menteri ESDM yang baru.&ldquo;Ada lima kriteria, salah satunya ada aliran air bawah tanah. Itu ditelusuri, kalau masih ada itu berarti karst. Kalau tidak memenuhi kelima unsur itu, bukan karst,&rdquo; kata dia. Menurut Eddy, Badan Geologi Kementerian ESDM yang mengeluarkan penetapan itu sudah melakuan pemeriksaan. Di Jawa Barat mengacu kriteria lama daerah karst ada di lima daerah. Yakni di Gunung Putri Bogor, Cipatat Bandung Barat, Sukabumi, Palimanan Cirebon, dan Karawang.</p>\r\n', 1, '2017-06-27 15:04:37', 'publish', '2017-06-10 17:04:02', '2017-06-28 00:00:00'),
(10, 'Tahun-2018,-Tahap-Awal-Mencapai-Kemandirian-Masyarakat-Jawa-Barat', 'Tahun 2018, Tahap Awal Mencapai Kemandirian Masyarakat Jawa Barat', '<p style=\"text-align:justify\">BANDUNG, (PR). - Dalam Rencana Pembangunan Jangka Panjang Daerah (RPJPD) Jawa Barat Tahun 2005-2025, tahun 2013-2018 merupakan tahap memantapkan pembangunan secara menyeluruh, sebelum memasuki tahap mencapai kemandirian masyarakat Jawa Barat di tahun 2018-2023. Dengan demikian, dalam RPJMD Jawa Barat Tahun 2013-2018, tahun 2018 merupakan tahap awal mencapai kemandirian. Terkait hal tersebut, Wakil Gubernur Jawa Barat Deddy Mizwar, pada Pembukaan Virtual Musyawarah Perencanaan Pembangunan (Musrenbang) Jawa Barat Tahun 2017 di Ruang Rapat Soehoed Warnaen Bappeda Provinsi Jawa Barat, Jalan. Ir. H. Juanda Nomor 287 Bandung, Senin 10 April 2017 memaparkan hal yang menjadi isu strategis Jawa Barat tahun 2018 yaitu sebagai berikut: A. Isu Strategis pada aspek Kesejahteraan Masyarakat, meliputi: 1. Ketahanan Pangan; 2. Kemiskinan dan Penyandang Masalah Kesejahteraan Sosial; 3. Pengangguran; dan 4. Ketahanan Keluarga. B. Isu Strategis pada aspek Pelayanan Umum, meliputi: 1. Pemerataan, Perluasan Akses dan Mutu Pendidikan; 2. Peningkatan Kualitas, Akses dan Sistem Pelayanan Kesehatan; dan 3. Infrastruktur Strategis, Infrastruktur Desa dan Perdesaan. C. Isu Strategis pada aspek Daya Saing Daerah, meliputi: 1. Aksesibilitas, Kualitas, Daya Saing, Pengawasan, dan Perlindungan Ketenagakerjaan; 2. Pengembangan KUMKM; 3. Prestasi Pemuda dalam Lingkup Nasional dan Internasional; 4. Pemilihan Kepala Daerah 2018; 5. Akuntabilitas Kinerja Aparatur; 6. Pengembangan Destinasi Wisata, Pusat Seni dan Budaya serta Gelanggang Olahraga; dan 7. Lingkungan Hidup dan Penataan Ruang. &quot;Sementara itu, terdapat 10 Rancangan Prioritas Nasional dan Program Prioritas Tahun 2018 yaitu: Pendidikan; Kesehatan; Perumahan dan Pemukiman; Pengembangan Dunia Usaha dan Pariwisata; Ketahanan Energi; Ketahanan Pangan; Penanggulangan Kemiskinan; Infrastruktur, Konektivitas dan Kemaritiman; Pembangunan Wilayah; serta Politik, Hukum, Pertahanan dan Keamanan,&quot; kata Deddy. berdasarkan hal-hal tersebut, tema pembangunan Jawa Barat tahun 2018 yaitu &quot;Percepatan Pembangunan Manusia Bagi Upaya Peningkatan Daya Saing Menuju Kemandirian Masyarakat.&quot; Deddy menyatakan, terdapat 11 prioritas pembangunan Jawa Barat tahun 2018 yaitu: 1. Akses dan Kualitas Pendidikan serta Keagamaan; 2. Akses dan Kualitas Pelayanan Kesehatan; 3. Penyediaan Infrastruktur Layanan Dasar Permukiman dan Infrastruktur Strategis di Perkotaan dan Perdesaan; 4. Peningkatan Iklim Investasi, Daya Saing Usaha dan Pariwisata; 5. Peningkatan Ketahanan Pangan, Energi, dan Sumber daya Air; Selanjutnya, 6. Peningkatan Kapasitas KUMKM dan Daya Saing Industri; 7. Politik Hukum dan Tata Kelola Pemerintahan; 8. Pengelolaan Sumber Daya Alam, Lingkungan Hidup, dan Penanggulangan Bencana; 9. Penanggulangan Kemiskinan; 10. Peningkatan Penataan Ruang Daerah; dan 11. Peningkatan Kualitas Kependudukan. Virtual Musrenbang yang dilaksanakan kali ini merupakan yang ketiga kalinya dilaksanakan sejak tahun 2015. Sebelumnya, telah dilaksanakan pula kegiatan Pra-Musrenbang Kewilayahan di setiap BKPP di Jawa Barat. &quot;Virtual Musrenbang merupakan bagian penting dan tidak terpisahkan dari seluruh tahapan Musrenbang Provinsi Jawa Barat tahun 2017. Seiring dengan itu, saya berharap dan mengajak kita semua, utamanya para bupati, para wali kota, DPRD, dan seluruh pemangku kepentingan pembangunan di tingkat kabupaten/kota untuk bersama-sama memanfaatkan forum berharga ini dalam rangka penyampaian rencana program/kegiatan prioritas pembangunan kabupaten/kota, merujuk kepada hasil-hasil pembahasan dari tahapan perencanaan yang telah dilaksanakan sebelumnya,&quot; kata Deddy. Adapun daftar usulan kegiatan prioritas kabupaten/kota yang dihasilkan hari ini kemudian akan ditindaklanjuti melalui forum-forum dialog selanjutnya untuk kemudian disinergikan dengan prioritas pembangunan provinsi yang tadi telah diutarakan. Forum-forum dialog yang dimaksud akan diselenggarakan secara marathon yaitu pada Selasa (11 April 2017) dengan agenda sidang Kelompok lingkup provinsi dengan keluaran yang diharapkan berupa daftar usulan kegiatan biro atau perangkat daerah provinsi. Selanjutnya pada Rabu (12 April 2017), agendanya adalah sidang kelompok provinsi dan kabupaten/kota dengan keluaran yang diharapkan berupa daftar usulan kegiatan kabupaten/kota. &quot;Insya Allah hasil dari seluruh tahapan ini akan kita bawa pada puncak Musrenbang Provinsi Jawa Barat Tahun 2017 yang akan diselenggarakan pada tanggal 13 April 2017. Keluaran utama yang diharapkan dari forum puncak Musrenbang yaitu Kesepakatan Rencana Kegiatan Prioritas Pemerintah Provinsi Jawa Barat sebagai bahan penyusunan dokumen RKPD Provinsi Jawa Barat Tahun 2018,&quot; ujar Deddy. &quot;Melalui komitmen yang kuat dan upaya yang penuh kesungguhan dari semua pemangku kepentingan, Inshaa Allah sukses perencanaan akan diikuti juga dengan sukses implementasi yang ditandai dengan hadirnya kebermanfaatan pembangunan yang sebesar-besarnya bagi kemajuan daerah dan peningkata</p>\r\n', 1, '2017-06-27 15:03:03', 'publish', '2017-06-27 21:59:27', NULL),
(11, 'Mengenal-Patriot-Energi-Tanah-Air-PETA', 'Mengenal Patriot Energi Tanah Air (PETA)', '<p style=\"text-align:justify\">JAKARTA &ndash; Kementerian Energi Dan Sumber Daya Mineral (ESDM) membentuk Patriot Energi Tanah Air atau biasa disebut PETA. Anggota PETA dipilih berdasarkan seleksi yang bukan hanya masalah akademik namun juga attitude atau karakter. Cerdas dan memiliki jiwa sosial dan juang yang tinggi merupakan nilai lebih yang wajib dimiliki anggota PETA. Anggota PETA merupakan anak-anak muda yang bukan hanya memiliki nilai akademik baik namun juga memiliki watak dan karakter yang sangat baik. Sabtu (16/7). Tenaga Ahli Menteri Energi Dan Sumber Daya Mineral Bidang Energi Baru Terbarukan, Tri Mumpuni yang juga penanggungjawab program PETA mengatakan, anggota-anggota Patriot Energi sebelum bertugas di lokasi-lokasi yang sudah ditentukan sebelumnya, diberikan pembekalan selama dua bulan. Pembekalan yang diberikan terdiri dari survival hutan dan air. Survival hutan dilakukan dengan menempatkan mereka selama seminggu di Gunung Burangrang, Purwakarta Jawa Barat tanpa bekal apapun, mereka mencari sendiri kebutuhan makan dan minumnya. Tri menambahkan, anggota Patriot Energi juga mendapatkan materi pendidikan mengenai sadar diri, kenal diri, dan mampu mengenal bagaimana memanfaatkan dirinya untuk orang lain. Dan mereka juga tentunya juga mendapatkan materi mengenai energi baru terbarukan. Sehingga meraka paham bener nantinya di desa mereka bisa memberikan solusi terhadap barang-barang yang sudah dipasang oleh Kementerian ESDM. &ldquo;Mereka selama satu minggu mengalami yang namanya life in concept yaitu tinggal bersama satu keluarga di desa yang terpencil yang kita pilih di daerah subang sukamandi berinteraksi mengikuti kegiatan petani setiap hari. Jadi kalau petaninya ke sawa, dia ikut nyangkul, di kebun dia ikut nyawah semua selama 24 jam selama seminggu mereka mengikuti dan mengalami pengalaman itu,&rdquo; lanjut Tri. Selanjutnya pada saat mereka akan berangkat ke lapangan, kembali mereka diberikan tambahan empat kompetensi yakni pertama kompetensi keteknisan, kedua kompetensi kejuangan, ketiga mampu membangun berbasis kemampuan masyarakat dan yang terakhir yang tidak kurang penting juga kompetensi keikhlasan. Pembekalan-pembekalan itu diperlukan mereka para anggota PETA saat ditempatkan dilokasi mereka bekerja karena pada umumnya lokasi merka bekerja di daerah terpencil, terisolir dan sangat terbatas sarana infrastrukturnya. 120 anggota PETA gelombang ke II akan ditempatkan selama satu tahun di 105 desa di 39 Kabupaten yang tersebar di seluruh pelosok Indonesia. Desa-desa tersebut terdiri atas 26 desa di Pulau Sumatera, 24 desa di Kalimantan, 25 desa di Sulawesi, dan 30 desa di wilayah Nusa Tenggara, Maluku, serta Papua.,&rdquo; ujar Sudirman. Tujuan penempatan Patriot Energi di desa-desa tersebut adalah untuk mengidentifikasi masalah, membantu masyarakat, dan melihat, serta memfasilitasi proyek Direktorat Jenderal Energi Baru, Terbarukan, dan Konservasi Energi (EBTKE), agar proyek tersebut benar-benar tepat sasaran. Mereka akan menjadi menjadi supervisor proyek-proyek pembangkit listrik yang berasal dari energi terbarukan di daerah-daerah terpencil. Yang ingin pemerintah capai dari program PETA ini adalah, memberikan kontribusi teknis kepada masyarakat dan yang lebih penting adalah dengan program PETA ini pemerintah ingin mempersiapkan kader-kader energi yang menjadi bagian dari reformasi berkelanjutan dari sektor ESDM dengan mencetak dan membentuk pemuda-pemudi Indonesia menjadi patriot-patriot muda yang mampu bersama-sama masyarakat meningkatkan kesejahteraan masyarakat yang berkesinambungan. Menjadi Patriot Energi pada prinsipnya adalah mengabdikan diri untuk hidup bagi rakyat kebanyakan dan hadir untuk merasakan apa yang rakyat rasakan. Patriot Energi dapat disebut sebagai sarjana rakyat yang menerapkan bahasa cinta dalam hidup keseharian. (SF) Sumber : Kementrian Energi dan Sumber Daya Mineral</p>\r\n', 1, '2017-06-28 03:33:29', 'publish', '2017-06-28 10:33:10', '0000-00-00 00:00:00'),
(12, 'asd', 'asd', 'asd', 3, '2017-06-08 15:26:02', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'asdasdads', 'asdasdads', 'asdasd', 3, '2017-06-09 14:35:39', '', '0000-00-00 00:00:00', '2017-12-12 12:12:12'),
(14, 'aaa', 'aaa', 'aaa', 3, '2017-06-11 20:03:34', 'publish', '2017-06-12 03:03:29', '2017-06-22 00:00:00'),
(15, 'ini-adalah', 'ini adalah', '<p><img alt=\"\" src=\"/esdm/assets/upload/images/target dan rencana umum.jpg\" />\\</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1>aaaa</h1>\r\n', 3, '2017-06-28 05:35:37', 'hidden', '2017-06-28 12:35:20', '0000-00-00 00:00:00'),
(16, 'ini-adalah-2', 'ini adalah 2', '<h1 xss=removed>Judul Di Tengah</h1>\n\n<h2>Pembukaan</h2>\n\n<p>Isi dari pembukaan</p>\n\n<p xss=removed><img alt=\"\" src=\"/esdm/assets/upload/images/target dan rencana umum.jpg\" xss=removed></p>\n\n<p>lalu ini ada lagi</p>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" xss=removed>\n <tbody>\n  <tr>\n   <td>aa</td>\n   <td>aa</td>\n  </tr>\n  <tr>\n   <td> </td>\n   <td> </td>\n  </tr>\n  <tr>\n   <td> </td>\n   <td> </td>\n  </tr>\n </tbody>\n</table>\n\n<p>selesai</p>\n', 1, '2017-06-25 17:40:43', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'ini-adalah-3', 'ini adalah 3', '<h1 xss=removed>judul</h1>\r\n\r\n<p>bukan judul</p>\r\n', 1, '2017-06-25 17:45:22', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'ini-adalah-4', 'ini adalah 4', '<h1 style=\"text-align:center\">judul</h1>\r\n\r\n<p>ini</p>\r\n', 1, '2017-06-25 17:46:24', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'ini-adalah-5', 'ini adalah 5', '<p><img alt=\"\" src=\"/esdm/assets/upload/images/target%20dan%20rencana%20umum.jpg\" style=\"float:right; height:112px; width:200px\" />aasdasdas asdksa</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>sss</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n\r\n			<p>asd</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h1>asdasd</h1>\r\n', 1, '2017-06-25 17:47:43', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'ini-adalah-6', 'ini adalah 6', '<p>test</p>\r\n', 1, '2017-06-26 08:48:31', 'hidden', '2017-06-26 15:48:23', '2017-06-29 15:36:18'),
(21, 'ini-adalah-7', 'ini adalah 7', '<p>isi</p>\r\n', 1, '2017-06-26 09:01:48', 'hidden', '2017-06-22 15:48:01', '2017-06-26 15:49:01'),
(22, 'ini-adalah-7', 'ini adalah 7', '<p>isi</p>\r\n', 1, '2017-06-26 09:07:38', 'hidden', '2017-06-22 15:48:01', '2017-06-26 15:49:01'),
(23, 'ini-adalah-8', 'ini adalah 8', '<p>aaaaa</p>\r\n', 1, '2017-06-26 09:07:54', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'ini-adalah-9', 'ini adalah 9', '<p>asdasdasd</p>\r\n', 1, '2017-06-26 09:08:39', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'ini-adalah-10', 'ini adalah 10', '<p>asdasd</p>\r\n', 1, '2017-06-26 09:10:23', 'hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'ini-adalah-10', 'ini adalah 10', '<p>asdasd</p>\r\n', 1, '2017-06-26 09:12:52', 'hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'ini-adalah-12', 'ini adalah 12', '<p>aaaa</p>\r\n', 1, '2017-06-26 09:15:01', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'ini-adalah-13', 'ini adalah 13', '<p>asdasd</p>\r\n', 1, '2017-06-26 09:18:48', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'ini-adalah-12', 'ini adalah 12', '<p>aaaa</p>\r\n', 1, '2017-06-26 09:19:42', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'ini-adalah-13', 'ini adalah 13', '<p>asdasd</p>\r\n', 1, '2017-06-26 09:20:02', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'ini-adalah-13', 'ini adalah 13', '<p>asdasd</p>\r\n', 1, '2017-06-26 09:20:17', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'ini-adalah-13', 'ini adalah 13', '<p>asdasd</p>\r\n', 1, '2017-06-26 09:21:14', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'ini-adalah-13', 'ini adalah 13', '<p>asdasd</p>\r\n', 1, '2017-06-26 09:21:14', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'judul-ke-1', 'judul ke 1', '<p>asd</p>\r\n', 1, '2017-06-26 09:21:32', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'ini-adalah-14', 'ini adalah 14', '<p>asdasd</p>\r\n', 1, '2017-06-27 13:28:00', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'judul-ke-2', 'judul ke 2', '<p>ini adalah judul</p>\r\n', 1, '2017-06-27 14:03:37', 'publish', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Frequently-Asked-Questions-FAQ-or-Questions-and-Answers-QA', 'Frequently Asked Questions (FAQ) or Questions and Answers (Q&A)', '<p>1. Tata Cara Perizinan di Kementrian ESDM Provinsi Jawa Barat</p>\r\n\r\n<ul style=\"margin-left:40px\">\r\n	<li>Question : Bagaimana cara mendapatkan izin eksplorasi di wilayah Jawa Barat</li>\r\n	<li>Answer :</li>\r\n</ul>\r\n\r\n<p>2. Pertanyaan Lainnya</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, '2017-06-27 15:48:30', 'publish', '2017-06-27 22:33:45', '0000-00-00 00:00:00'),
(38, 'Artikel-baru', 'Artikel baru', '<div>\r\n<video controls=\"controls\" height=\"100\" id=\"video2017528104848\" poster=\"/esdm/assets/upload/images/target%20dan%20rencana%20umum.jpg\" width=\"200\"><source src=\"/esdm/assets/upload/files/barsandtone.flv\" type=\"video/mp4\" />Your browser doesn&#39;t support video.<br />\r\nPlease download the file: <a href=\"/esdm/assets/upload/files/barsandtone.flv\">video/mp4</a></video>\r\n</div>\r\n\r\n<p>ini adalah video</p>\r\n', 3, '2017-06-28 03:49:16', 'publish', '2017-06-28 10:48:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories_blogs`
--

CREATE TABLE `categories_blogs` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_blog` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_blogs`
--

INSERT INTO `categories_blogs` (`id`, `id_category`, `id_blog`) VALUES
(12, 5, 12),
(13, 1, 13),
(14, 7, 14),
(15, 7, 28),
(16, 5, 36),
(17, 6, 36),
(19, 1, 3),
(20, 5, 3),
(24, 1, 10),
(25, 8, 37),
(27, 1, 11),
(28, 5, 11),
(29, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `created_at`) VALUES
(1, 'Berita', '2017-04-16 18:11:42'),
(5, 'Artikel', '2017-04-30 06:22:41'),
(6, 'informasi', '2017-06-08 15:26:23'),
(7, 'pengumuman', '2017-06-10 07:52:11'),
(8, 'FAQ', '2017-06-27 15:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `id_blog` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `comment_name` varchar(100) NOT NULL,
  `comment_email` varchar(100) NOT NULL,
  `comment_body` text NOT NULL,
  `comment_state` enum('accepted','waiting','deleted','') DEFAULT 'waiting',
  `comment_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `id_blog`, `parent_id`, `comment_name`, `comment_email`, `comment_body`, `comment_state`, `comment_created`) VALUES
(1, 11, NULL, 'mt mt', 'as@mns.com', 'aaaa komentar', 'accepted', '2017-06-18 05:23:11'),
(2, 11, NULL, 'asd', 'asd@gas.com', 'asdasdasd', 'accepted', '2017-06-28 05:37:07'),
(3, 3, NULL, 'ini Nama', 'email@yaho.com', 'aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasdaaaaaaa komentar asdnaksdasd aaaaaaa komentar asdnaksdasd', 'accepted', '2017-06-18 08:17:57'),
(4, 11, NULL, 'Mr K', 'www@email.com', 'komentar ini', 'deleted', '2017-06-18 05:23:03'),
(5, 13, NULL, 'asdssssa', 'asdasd', 'asdasdsdaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'deleted', '2017-06-18 08:09:03'),
(6, 13, NULL, 'aa', 'aa', 'aa', 'accepted', '2017-06-18 08:08:01'),
(7, 13, NULL, 'aa', 'aa', 'aaa', 'waiting', '2017-06-18 08:11:15'),
(8, 13, NULL, 'asdssss', 'aa', 'aa', 'waiting', '2017-06-18 08:13:33'),
(9, 3, NULL, 'aa', 'email@google.com', 'imgsrchttplocalhostesdmblogreadpemerintah-provinsi-jawa-barat-terbitkan-18-izin-tambang3top', 'waiting', '2017-06-18 08:19:16'),
(10, 3, NULL, 'aa', 'email@google.com', ':) test  lt   special char', 'waiting', '2017-06-18 08:20:44'),
(11, 3, NULL, 'aa', 'email@google.com', '&lt;img&gt; ', 'waiting', '2017-06-18 08:23:43'),
(12, 3, NULL, 'asdaaaaaaaaaaa', 'email@google.com', '&lt;img src=\"http://localhost/esdm/blog/read/pemerintah-provinsi-jawa-barat-terbitkan-18-izin-tambang/3#top\"&gt;', 'deleted', '2017-06-18 08:29:42'),
(13, 16, NULL, 'asdssssa', 'email@g.com', 'asd', 'accepted', '2017-06-25 17:39:50'),
(14, 3, NULL, 'asdssss', 'email@g.com', 'asdasdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaad aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'accepted', '2017-06-28 15:41:34'),
(15, 3, 14, 'asdssss bbb', 'email@g.com', 'asdasdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaad aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'accepted', '2017-06-28 16:02:12'),
(16, 3, 14, 'asdssssa ccc', 'a@a.c', 'asdasdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaad aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'waiting', '2017-06-28 16:02:34'),
(17, 24, NULL, 'aa', 'email@g.com', 'komentar', 'accepted', '2017-06-28 16:11:34'),
(18, 24, 17, 'aa +', 'asd@s.cc', 'asd', 'deleted', '2017-06-28 16:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'file',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'developer', 'Developer'),
(2, 'members', 'General User'),
(3, 'admin', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `groups_menu`
--

CREATE TABLE `groups_menu` (
  `id_groups` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups_menu`
--

INSERT INTO `groups_menu` (`id_groups`, `id_menu`) VALUES
(1, 6),
(1, 7),
(1, 8),
(1, 10),
(1, 28),
(3, 30),
(1, 1),
(3, 3),
(1, 4),
(1, 34),
(3, 39),
(1, 21),
(1, 41),
(2, 41),
(1, 3),
(2, 3),
(3, 36),
(1, 36),
(2, 36),
(3, 37),
(1, 37),
(1, 39),
(1, 30),
(2, 30),
(1, 5),
(3, 41),
(3, 3),
(3, 6),
(3, 5),
(3, 29),
(1, 29),
(3, 21),
(1, 33),
(1, 46),
(3, 46);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(30) NOT NULL,
  `loginId` varchar(255) NOT NULL,
  `loginType` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `profilePic` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `action` varchar(125) NOT NULL,
  `logs` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `action`, `logs`, `createdAt`) VALUES
(1, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-05 05:00:10'),
(2, 'update_user', '{\"status\":true,\"via\":\"admin\",\"identity\":\"member@member.com\",\"ip\":\"127.0.0.1\"}', '2017-04-05 05:04:29'),
(3, 'update_user', '{\"status\":true,\"via\":\"admin\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-05 05:05:05'),
(4, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-05 05:05:17'),
(5, 'login', '{\"status\":true,\"identity\":\"member@member.com\",\"ip\":\"127.0.0.1\"}', '2017-04-05 05:05:26'),
(6, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-05 16:13:28'),
(7, 'login', '{\"status\":false,\"message\":\"Incorrect Login\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:10:44'),
(8, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:10:55'),
(9, 'insert_group', '{\"status\":true,\"id\":3,\"name\":\"developer\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:16:13'),
(10, 'register', '{\"status\":true,\"via\":\"admin\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:18:16'),
(11, 'update_user', '{\"status\":true,\"via\":\"admin\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:18:37'),
(12, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:21:31'),
(13, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:21:53'),
(14, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:24:41'),
(15, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:25:03'),
(16, 'update_group', '{\"status\":true,\"id\":\"1\",\"name\":\"developer\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:30:16'),
(17, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:42:02'),
(18, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:42:20'),
(19, 'update_user', '{\"status\":true,\"via\":\"admin\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:44:00'),
(20, 'update_user', '{\"status\":true,\"via\":\"admin\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:44:05'),
(21, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:51:49'),
(22, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 18:52:07'),
(23, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:00:44'),
(24, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:00:58'),
(25, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:02:10'),
(26, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:02:22'),
(27, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:17:29'),
(28, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:17:39'),
(29, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:19:51'),
(30, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:20:03'),
(31, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:23:10'),
(32, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:23:25'),
(33, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:24:17'),
(34, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:24:30'),
(35, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:24:54'),
(36, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:25:04'),
(37, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:25:44'),
(38, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:25:57'),
(39, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-16 19:26:15'),
(40, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-19 10:18:19'),
(41, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-19 12:18:43'),
(42, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-19 12:19:18'),
(43, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-19 20:30:01'),
(44, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-19 20:40:21'),
(45, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-19 20:45:10'),
(46, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-21 07:47:27'),
(47, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-23 13:39:47'),
(48, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"127.0.0.1\"}', '2017-04-23 13:53:08'),
(49, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"127.0.0.1\"}', '2017-04-23 13:53:28'),
(50, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.62.11\"}', '2017-04-23 17:48:03'),
(51, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.79.166.162\"}', '2017-04-24 16:49:26'),
(52, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"114.121.232.141\"}', '2017-04-25 14:31:27'),
(53, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"114.121.232.141\"}', '2017-04-25 14:36:33'),
(54, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"103.23.244.254\"}', '2017-04-26 04:30:10'),
(55, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"36.80.27.168\"}', '2017-04-29 06:43:20'),
(56, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"36.80.27.168\"}', '2017-04-29 09:48:07'),
(57, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.80.27.168\"}', '2017-04-29 09:48:43'),
(58, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"103.23.244.254\"}', '2017-04-29 14:35:51'),
(59, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"103.23.244.254\"}', '2017-04-29 14:39:41'),
(60, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"103.23.244.254\"}', '2017-04-29 14:40:22'),
(61, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"103.213.130.121\"}', '2017-04-30 00:52:12'),
(62, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"114.121.247.249\"}', '2017-04-30 04:32:38'),
(63, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"114.121.247.249\"}', '2017-04-30 04:33:50'),
(64, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"114.121.247.249\"}', '2017-04-30 04:34:16'),
(65, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"114.121.247.249\"}', '2017-04-30 06:32:48'),
(66, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"114.121.247.249\"}', '2017-04-30 06:33:11'),
(67, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"114.121.247.249\"}', '2017-04-30 06:33:52'),
(68, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.80.27.168\"}', '2017-04-30 16:43:45'),
(69, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"36.80.27.168\"}', '2017-04-30 17:42:06'),
(70, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-04-30 18:37:50'),
(71, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-04-30 18:41:15'),
(72, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-01 15:03:29'),
(73, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-01 16:15:41'),
(74, 'logout', '{\"status\":true,\"id\":\"1\",\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-01 16:32:39'),
(75, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"36.72.167.37\"}', '2017-05-01 16:33:36'),
(76, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"36.72.167.37\"}', '2017-05-01 16:34:12'),
(77, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-01 16:34:27'),
(78, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-01 17:20:17'),
(79, 'login', '{\"status\":false,\"message\":\"Incorrect Login\",\"identity\":\"admin@admin.com\",\"ip\":\"36.72.167.37\"}', '2017-05-02 07:03:12'),
(80, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"36.72.167.37\"}', '2017-05-02 07:03:32'),
(81, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"36.72.167.37\"}', '2017-05-02 07:04:39'),
(82, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-02 07:04:57'),
(83, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-03 08:18:06'),
(84, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-03 09:11:32'),
(85, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-03 09:25:03'),
(86, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-03 09:41:29'),
(87, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-03 17:30:26'),
(88, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-04 09:41:13'),
(89, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-05 04:44:06'),
(90, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-05 17:20:21'),
(91, 'login', '{\"status\":false,\"message\":\"Incorrect Login\",\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-06 14:42:53'),
(92, 'login', '{\"status\":false,\"message\":\"Incorrect Login\",\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-06 14:43:15'),
(93, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-06 14:43:38'),
(94, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"36.72.167.37\"}', '2017-05-07 06:10:18'),
(95, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"180.253.144.127\"}', '2017-05-08 06:52:05'),
(96, 'login', '{\"status\":true,\"identity\":\"allrested@gmail.com\",\"ip\":\"103.247.197.70\"}', '2017-05-12 05:19:35'),
(97, 'login', '{\"status\":false,\"message\":\"Incorrect Login\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-08 14:48:31'),
(98, 'register', '{\"status\":true,\"via\":\"front\",\"identity\":\"zulfar@sisi.id\",\"ip\":\"::1\"}', '2017-06-08 14:49:59'),
(99, 'login', '{\"status\":true,\"identity\":\"zulfar@sisi.id\",\"ip\":\"::1\"}', '2017-06-08 14:50:00'),
(100, 'logout', '{\"status\":true,\"id\":\"4\",\"identity\":\"zulfar@sisi.id\",\"ip\":\"::1\"}', '2017-06-08 14:50:41'),
(101, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-08 14:50:48'),
(102, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-09 14:33:48'),
(103, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 01:51:37'),
(104, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 02:35:12'),
(105, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 03:02:43'),
(106, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 03:31:40'),
(107, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 03:31:46'),
(108, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 03:31:52'),
(109, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 07:11:31'),
(110, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 07:20:01'),
(111, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 07:41:02'),
(112, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 07:49:28'),
(113, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 12:43:41'),
(114, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-10 12:55:37'),
(115, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-11 13:42:30'),
(116, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-11 16:09:08'),
(117, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-11 16:24:06'),
(118, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-11 17:03:55'),
(119, 'register', '{\"status\":true,\"via\":\"front\",\"identity\":\"test@gmail.com\",\"ip\":\"::1\"}', '2017-06-11 17:10:01'),
(120, 'login', '{\"status\":true,\"identity\":\"test@gmail.com\",\"ip\":\"::1\"}', '2017-06-11 17:10:02'),
(121, 'login', '{\"status\":false,\"message\":\"Incorrect Login\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-11 20:03:03'),
(122, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-11 20:03:10'),
(123, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-15 17:52:40'),
(124, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-15 18:05:21'),
(125, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-18 04:12:36'),
(126, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-18 05:09:31'),
(127, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-18 05:17:29'),
(128, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-18 05:26:38'),
(129, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-18 07:55:20'),
(130, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-20 22:55:59'),
(131, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-24 11:10:27'),
(132, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-24 15:21:06'),
(133, 'login', '{\"status\":false,\"message\":\"Incorrect Login\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-25 15:37:39'),
(134, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-25 15:37:46'),
(135, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-26 06:43:34'),
(136, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-27 13:27:38'),
(137, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-27 15:31:58'),
(138, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-27 15:33:27'),
(139, 'logout', '{\"status\":true,\"id\":\"3\",\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-27 15:53:52'),
(140, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-28 03:32:25'),
(141, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-28 14:54:42'),
(142, 'login', '{\"status\":true,\"identity\":\"admin@admin.com\",\"ip\":\"::1\"}', '2017-06-29 13:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` text NOT NULL,
  `ext` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `file`, `ext`, `id_user`, `uploaded_at`) VALUES
(11, '1', 'assets/uploads/image/1.jpg', '.jpg', 1, '2017-04-30 04:36:35'),
(12, '2', 'assets/uploads/image/2.jpg', '.jpg', 1, '2017-04-30 04:36:40'),
(13, '3', 'assets/uploads/image/3.jpg', '.jpg', 1, '2017-04-30 04:37:02'),
(14, '4', 'assets/uploads/image/4.jpg', '.jpg', 1, '2017-04-30 04:37:24'),
(15, '5', 'assets/uploads/image/5.jpg', '.jpg', 1, '2017-04-30 04:37:59'),
(16, '6', 'assets/uploads/image/6.jpg', '.jpg', 1, '2017-04-30 04:38:29'),
(17, '7', 'assets/uploads/image/7.jpg', '.jpg', 1, '2017-04-30 04:38:37'),
(18, 'tes', 'assets/uploads/image/tes.jpg', '.jpg', 1, '2017-04-30 04:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  `level` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(125) NOT NULL,
  `label` varchar(25) NOT NULL,
  `link` varchar(125) NOT NULL,
  `id` varchar(25) NOT NULL DEFAULT '#',
  `id_menu_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `sort`, `level`, `parent_id`, `icon`, `label`, `link`, `id`, `id_menu_type`) VALUES
(1, 10, 1, 0, '', 'DEVELOPER NAVIGATION', '', '#', 1),
(3, 1, 2, 41, 'dashboard', 'Dashboard', 'admin/dashboard', '#', 1),
(4, 12, 2, 1, 'table', 'CRUD Builder', 'admin/crud_builder', '', 1),
(5, 5, 2, 41, 'user', 'Users', '#', '', 1),
(6, 6, 3, 5, 'circle-o', 'Users', 'admin/users', '#', 1),
(7, 7, 3, 5, 'circle-o', 'Groups', 'admin/groups', '#', 1),
(8, 11, 2, 1, 'bars', 'Menu', 'admin/menu/side-menu', 'navMenu', 1),
(10, 16, 2, 1, 'cloud', 'API', 'api/user', '#', 1),
(19, 0, 1, 0, '', 'Beranda', '', '', 2),
(20, 1, 1, 0, '', 'Tentang ESDM', 'page/about', '', 2),
(21, 8, 2, 41, 'file-o', 'Page Builder', 'admin/page_builder', '', 1),
(28, 14, 2, 1, 'th', 'Module Extensions', 'admin/modules', 'module', 1),
(29, 7, 1, 0, '', 'Dashboard', 'admin/dashboard', '', 2),
(30, 9, 2, 41, 'book', 'Documentation', 'documentation/welcome', '', 1),
(31, 2, 1, 0, '', 'Fokus', 'example', '', 2),
(33, 6, 1, 0, '', 'Perizinan', 'izin', '', 2),
(34, 13, 2, 1, 'database', 'Database manager', 'admin/database', '', 1),
(35, 15, 2, 1, 'amazon', 'AWS S3', 'aws3/demo', '', 1),
(36, 2, 2, 41, 'file-text-o', 'Blog', '#', '', 1),
(37, 3, 2, 41, 'tag', 'Category', 'blog/category', '', 1),
(38, 8, 1, 0, '', 'Kontak', 'page/contact', '', 2),
(39, 4, 2, 41, 'image', 'Media', 'media/index', '', 1),
(41, 0, 1, 0, '', 'MAIN NAVIGATION', '', '#', 1),
(42, 3, 2, 31, '', 'Berita', 'blog/index/berita', '', 2),
(43, 4, 2, 31, '', 'Artikel', 'blog/index/artikel', '#', 2),
(44, 5, 2, 31, '', 'Informasi', 'blog/index/informasi', '#', 2),
(45, 8, 1, 0, '', 'Gallery', 'page/gallery', '', 2),
(46, 10, 2, 41, 'file-o', 'Running Text', 'media/RunningText', '', 1),
(47, 8, 1, 0, '', 'Lokasi', 'page/maps', '', 2),
(48, 2, 3, 36, 'list', 'Daftar Blog', 'blog/manage', '', 1),
(49, 3, 3, 36, 'plus', 'Buat Blog', 'manageBlog/newBlog', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `id_menu_type` int(11) NOT NULL,
  `type` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id_menu_type`, `type`) VALUES
(1, 'Side menu'),
(2, 'Top menu');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `module` varchar(20) NOT NULL,
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`module`, `version`) VALUES
('CI_core', 4),
('aws3', 1),
('blog', 1),
('media', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id_page` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `template` varchar(125) NOT NULL,
  `breadcrumb` text NOT NULL,
  `content` text NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `view` varchar(150) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id_page`, `title`, `featured_image`, `slug`, `template`, `breadcrumb`, `content`, `keyword`, `description`, `view`) VALUES
(1, 'About', '', 'about', 'frontend', '[{\"label\":\"About\",\"link\":\"\"}]', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">		<img class=\"background-image\" alt=\"Struktur Organisasi\" src=\"/esdm/assets/img/content/SO-2016.png\">	</div>	<div class=\"video-wrapper\">		<video autoplay=\"\" muted=\"\" loop=\"\">			<img src=\"/esdm/assets/img/content/SO-2016.png\" title=\"Struktur Organisasi\">		</video>	</div>		<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Struktur Organisasi</h1>				<p class=\"lead text-white\">					ESDM				</p>				<a href=\"/esdm/page/sejarah\" class=\"btn btn-white btn-primary\">Sejarah</a>				<a href=\"/esdm/page/visi\" class=\"btn btn-white btn-primary\">Visi & Misi</a>				<a href=\"/esdm/page/undang-undang\" class=\"btn btn-white btn-primary\">Undang-Undang</a>				<a href=\"/esdm/page/rencana-kerja\" class=\"btn btn-white btn-primary\">Rencana Kerja</a>				<a href=\"/esdm/page/uptd\" class=\"btn btn-white btn-primary\">UPTD</a>				</div>		</div>	</div></section>', '', '', 'home'),
(2, 'Home', '', 'home', 'frontend', '[{\"label\":\"Home\",\"link\":\"\"}]', '', 'ESDM', 'Dinas Energi dan Sumber Daya Mineral Provinsi Jawa Barat', 'home'),
(3, 'Kontak', '', 'contact', 'frontend', '[{\"label\":\"kontak\",\"link\":\"\"}]', '<section class=\"map-overlay\">\n	\n	\n	<div class=\"container\">\n	\n		<div class=\"row\">\n			<div class=\"col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 text-center\">\n				<div class=\"details-holder\">\n					<div class=\"align-vertical\">\n						<img alt=\"Logo\" src=\"/esdm/assets/img/logo/logo-dark.png\">\n						<p class=\"lead\">\n							admin.esdm@jabarprov.go.id<br>\n							+62 22 756 2049<br>\n							+62 22 750 696 (fax)\n						</p>\n						<p>\n							Jl. Soekarno-Hatta No. 576 Bandung \n							<br>Jawa Barat 40286 Indonesia\n						</p>\n					</div>\n				</div>\n			</div>\n		</div>\n	\n		<div class=\"row\">\n			<div class=\"col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center\">\n				<h1 class=\"text-white\">Kami senang menerima pesan anda :)\n				</h1>\n			</div>\n		</div>\n		\n		\n		\n	</div>\n</section>', '', '', 'blank'),
(4, 'Sejarah', '', 'sejarah', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Sejarah</h1>				<p class=\"lead text-white\">					ESDM				</p>				<p class=\"text-white\">Dinas Energi Dan Sumber Daya Mineral Provinsi Jawa Barat yang saat ini berlokasi di Jalan Soekarno Hatta No. 576 Bandung, pertama kali dibentuk pada Tahun 1978 yang ditetapkan dengan Peraturan Daerah Provinsi Jawa Barat Nomor 4/DP/040/DP1978 dan kelembagaannya diatur dengan Peraturan Daerah Provinsi Jawa Barat Nomor 5/DP/040/DP1978. Awalnya Dinas ini berdiri dengan nama “ Dinas Pertambangan Daerah Propinsi Jawa Barat”. Peraturan Daerah ini baru dapat dilakukan pada Tahun 1986 setelah ditetapkannya Peraturan Pemerintah No. 37 Tahun 1986 Tentang Penyerahan Sebagian Urusan Pemerintahan Di Bidang Pertambangan kepada Pemerintah Daerah Tingkat I.</p><p class=\"text-white\"> </p><p class=\"text-white\">Salah satu faktor yang mendorong terbitnya Peraturan Pemerintah No. 37 Tahun 1986 tersebut adalah kenyataan semakin meluasnya penambangan di daerah terutama untuk jenis bahan galian golongan C yang telah menyebabkan peningkatan intensitas kerusakan serta gangguan terhadap kemampuan dan fungsi lingkungan, sehingga peran Pemerintah Daerah perlu lebih dipertegas dalam pengaturan dan pengendaliannya, melalui penyerahan urusan.</p><p class=\"text-white\"> </p><p class=\"text-white\">Karena Peraturan Daerah yang ditetapkan pada Tahun 1978 tersebut dinilai sudah tidak sesuai lagi pada saat pengesahan PP Tersebut, maka pada Tahun 1988 dilakukan pencabutan Peraturan Daerah Provinsi Jawa Barat Nomor 5/DP/040/DP1978 yang diganti dengan Peraturan Daerah Provinsi Jawa Barat Nomor 12 Tahun 1988 Tentang Perubahan Struktur Organisasi Tata Kerja, dengan susunan organisasi terdiri dari : 1 (Satu) Bagian Tata Usaha; 4 (Empat) Sub Dinas Yaitu Sub Dinas Konservasi, Sub Dinas Pengusahaan Pertambangan, Sub Dinas Bina Program, Sub Dinas Teknik Pertambangan serta ditambah dengan pembentukan 7 (Tujuh) cabang dinas yang meliputi : cabang Dinas I/ Serang, cabang Dinas II/ Bogor, cabang Dinas III/ Sukabumi, cabang Dinas IV/Cirebon, cabang Dinas V/ Purwakarta, cabang Dinas VI/ Bandung, cabang Dinas VII/Tasikmalaya.</p><p class=\"text-white\"> </p><p class=\"text-white\">Pada Tahun 2000 Seiring Dengan Bergulirnya Otonomi Daerah dilakukan perubahan Struktur Organisasi Tata Kerja (SOTK) Dinas Pertambangan, dengan nama dinasnya berubah menjadi “Dinas Pertambangan dan Energi Provinsi Jawa Barat” dengan Peraturan Daerah Nomor 15 Tahun 2000 Tentang Struktur Organisasi Tata Kerja Dinas-Dinas Daerah Provinsi Jawa Barat, yang meliputi : 1 (Satu) Bagian Tata Usaha; 5 (Lima) Sub Dinas yaitu Sub Dinas Bina Program, Sub Dinas Eksplorasi dan Pemetaan, Sub Dinas Bina Usaha, Sub Dinas Bina dan Sub Dinas Konservasi dan Pengendalian.</p><p class=\"text-white\"> </p><p class=\"text-white\">Selain perangkat tersebut diatas, Dinas Pertambangan dan Energi Provinsi Jawa Barat mempunyai perangkat Unit Pelaksana Teknis Dinas (UPTD) yang ditetapkan dengan Peraturan Daerah Provinsi Jawa Barat Nomor 5 Tahun 2002 yang terdiri dari 5 (Lima) Balai Yaitu : Balai Konservasi dan Pemanfaatan Sumberdaya Pertambangan dan Energi Wilayah I Cianjur, Balai Konservasi dan Pemanfaatan Sumberdaya Pertambangan dan Energi Wilayah II Purwakarta, Balai Konservasi dan Pemanfaatan Sumberdaya Pertambangan dan Energi Wilayah III Tasikmalaya, Balai Konservasi dan Pemanfaatan Sumberdaya Pertambangan dan Energi Wilayah IV Cirebon serta Balai Penelitian Pertambangan dan Energi. Selain itu keberadaan Dinas Pertambangan dan Energi Provinsi Jawa Barat merupakan konsekuensi dari diberlakukannya Undang-Undang Nomor 22 Tahun 1999 Jo. Undang-Undang Nomor 34 Tahun 2002 Tentang Pemerintah Daerah dan Peraturan Pemerintah No 25 Tahun 2000 Tentang Kewenangan Pemerintah dan Kewenangan Provinsi sebagai daerah otonom. Seiring dengan bergulirnya Otonomi Daerah dan meluasnya bidang pekerjaan serta mengikuti Struktur Organisasi Tata Kerja (SOTK) pusat yaitu Departemen Energi dan Sumber Daya Mineral maka pada Tahun 2009 dilakukan kembali perubahan Struktur Organisasi Tata Kerja Dinas Pertambangan dan Energi Provinsi Jawa Barat, dengan nama dinasnya berubah menjadi “Dinas Energi dan Sumber Daya Mineral Provinsi Jawa Barat” Peraturan Gubernur Provinsi Jawa Barat Nomor 42 Tahun 2009 tentang Tugas Pokok, Fungsi, Rincian Tugas Unit Dan Tata Kerja Dinas Energi Dan Sumber Daya Mineral Provinsi Jawa Barat, yang meliputi :</p><p class=\"text-white\"><br />A. Kepala Dinas;<br />B. Sekretaris yang terdiri dari 3 (Tiga) Sub Bagian yaitu :</p><p class=\"text-white\">1. Sub Bagian Perencanaan dan Program;<br />2. Sub Bagian Keuangan;<br />3. Sub Bagian Kepegawaian dan Umum;</p><p class=\"text-white\">C. 4 (Empat) Bidang yang terdiri dari :</p><p class=\"text-white\">1. Bidang Listrik dan Pemanfaatan Energi terdiri dari 3 (Tiga) seksi Yaitu :</p><p class=\"text-white\">i. Seksi Sumber Daya Energi dan Pemanfaatan EBT;<br />ii. Seksi Pengembangan Infrastruktur;<br />iii. Seksi Konservasi dan Pengendalian Energi.</p><p class=\"text-white\">2. Bidang Mineral, Geologi dan Air Tanah terdiri dari 3 (Tiga) seksi Yaitu :</p><p class=\"text-white\">i. Seksi Kegeologian;<br />ii. Seksi Eksplorasi dan Eksploitasi;<br />iii. Seksi Konservasi dan Pengendalian.</p><p class=\"text-white\">3. Bidang Panas Bumi dan Migas terdiri dari 3 (Tiga) seksi yaitu :</p><p class=\"text-white\">i. Seksi Pengelolaan Hulu;<br />ii. Seksi Teknik dan Lingkungan;<br />iii. Seksi Pengelolaan Hilir.</p><p class=\"text-white\">4. Bidang Bina Usaha dan Kerjasama terdiri dari 3 (Tiga) seksi yaitu :</p><p class=\"text-white\">i. Seksi Bina Usaha dan Produksi;<br />ii. Seksi Data dan Informasi;<br />iii. Seksi Kerjasama dan Promosi.</p><p class=\"text-white\"><br />Dengan dilakukannya kembali perubahan Struktur Organisasi Tata Kerja Dinas Energi dan Sumber Daya Mineral Provinsi Jawa Barat” maka perangkat Unit Pelaksana Teknis Dinas (UPTD) berubah menjadi Unit Pelaksana Teknis (UPT), yang terdiri dari : UPT I Cianjur, UPT II Purwakarta, UPT III Bandung, UPT IV Tasikmalaya, UPT V Cirebon dan UPT Pengujian Dinas Energi dan Sumber Daya Mineral Provinsi Jawa Barat.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(5, 'Visi & Misi', '', 'visi', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Visi dan Misi</h1>				<p class=\"lead text-white\">					ESDM				</p>				<p class=\"text-white\"><strong>VISI</strong></p><p class=\"text-white\">“ENERGI DAN SUMBER DAYA MINERAL UNTUK KEMAJUAN DAN KESEJAHTERAAN MASYARAKAT”</p><p class=\"text-white\"> </p><p class=\"text-white\"><strong>MISI</strong></p><p class=\"text-white\">1. Mewujudkan ketahanan energi</p><p class=\"text-white\">2. Meningkatkan pendayagunaan dan konservasi sumber daya mineral</p><p class=\"text-white\">3. Mengoptimalkan dukungan investasi dan pendapatan bidang energi dan sumber daya mineral</p><p class=\"text-white\">4. Meningkatkan kapasitas kelembagaan dan kerjasama bidang energi dan sumber daya mineral</p>			</div>		</div>	</div></section>', '', '', 'home'),
(6, 'Undang-Undang', '', 'undang-undang', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">		<img class=\"background-image\" alt=\"Undang-Undang\" src=\"/esdm/assets/img/content/SO-2016.png\">	</div>	<div class=\"video-wrapper\">		<video autoplay=\"\" muted=\"\" loop=\"\">			<img src=\"/esdm/assets/img/content/SO-2016.png\" title=\"Undang-Undang\">		</video>	</div>		<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Undang-Undang</h1>				<p class=\"lead text-white\">					ESDM				</p>				<a href=\"/esdm/page/uu-mineral\" class=\"btn btn-white btn-primary\">Mineral dan Batubara</a>				<a href=\"/esdm/page/uu-air\" class=\"btn btn-white btn-primary\">Air Tanah</a>				<a href=\"/esdm/page/uu-energi\" class=\"btn btn-white btn-primary\">Energi</a>				<a href=\"/esdm/page/uu-listrik\" class=\"btn btn-white btn-primary\">Tenaga Listrik</a>				<a href=\"/esdm/page/uu-geologi\" class=\"btn btn-white btn-primary\">Geologi</a>			</div>		</div>	</div></section>', '', '', 'home'),
(7, 'Mineral dan Batubara', '', 'uu-mineral', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Mineral dan Batubara</h1>				<p class=\"lead text-white\">					Undang-Undang				</p>				<p class=\"text-white\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc odio massa, eleifend vel turpis ac, venenatis pellentesque dolor. Nulla et porta tellus, ut euismod lacus. Aliquam lobortis sapien nec sapien auctor rutrum. Cras interdum, nunc non hendrerit varius, risus felis tempus est, eget ornare mauris libero ut augue. Cras id lectus vel leo dapibus hendrerit et ut nulla. Fusce commodo congue ex at molestie. Aliquam porta et dui sed porta. Nullam consectetur placerat dolor, ac convallis dolor egestas pellentesque. Phasellus tempor at massa non commodo. Nulla egestas placerat est, vitae imperdiet lorem gravida id. Curabitur ornare risus in justo feugiat, tristique rhoncus est venenatis. Duis at urna nisl.</p><p class=\"text-white\"> </p><p class=\"text-white\">Mauris quis diam libero. Maecenas vel erat risus. Praesent convallis augue feugiat, pretium sapien vel, malesuada augue. Duis ultrices ullamcorper dignissim. Maecenas felis magna, pretium vitae pulvinar mollis, luctus ac nunc. Maecenas sed ipsum tortor.</p><p class=\"text-white\"> </p><p class=\"text-white\">Phasellus iaculis interdum dui eget faucibus. Nullam ut mauris at felis lobortis convallis eget a lectus. Proin interdum gravida elementum. Donec accumsan interdum justo pulvinar bibendum. Vivamus a arcu non lectus luctus lobortis egestas eu nibh. Vestibulum ac finibus augue.</p><p class=\"text-white\"> </p><p class=\"text-white\">Proin consectetur neque at est pretium, non sollicitudin dolor congue. Nulla lobortis augue quis sapien ullamcorper, nec pretium felis accumsan. Duis libero lacus, efficitur nec semper sed, mollis ac leo.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(8, 'Air Tanah', '', 'uu-air', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Air Tanah</h1>				<p class=\"lead text-white\">					Undang-Undang				</p>				<p class=\"text-white\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc odio massa, eleifend vel turpis ac, venenatis pellentesque dolor. Nulla et porta tellus, ut euismod lacus. Aliquam lobortis sapien nec sapien auctor rutrum. Cras interdum, nunc non hendrerit varius, risus felis tempus est, eget ornare mauris libero ut augue. Cras id lectus vel leo dapibus hendrerit et ut nulla. Fusce commodo congue ex at molestie. Aliquam porta et dui sed porta. Nullam consectetur placerat dolor, ac convallis dolor egestas pellentesque. Phasellus tempor at massa non commodo. Nulla egestas placerat est, vitae imperdiet lorem gravida id. Curabitur ornare risus in justo feugiat, tristique rhoncus est venenatis. Duis at urna nisl.</p><p class=\"text-white\"> </p><p class=\"text-white\">Mauris quis diam libero. Maecenas vel erat risus. Praesent convallis augue feugiat, pretium sapien vel, malesuada augue. Duis ultrices ullamcorper dignissim. Maecenas felis magna, pretium vitae pulvinar mollis, luctus ac nunc. Maecenas sed ipsum tortor.</p><p class=\"text-white\"> </p><p class=\"text-white\">Phasellus iaculis interdum dui eget faucibus. Nullam ut mauris at felis lobortis convallis eget a lectus. Proin interdum gravida elementum. Donec accumsan interdum justo pulvinar bibendum. Vivamus a arcu non lectus luctus lobortis egestas eu nibh. Vestibulum ac finibus augue.</p><p class=\"text-white\"> </p><p class=\"text-white\">Proin consectetur neque at est pretium, non sollicitudin dolor congue. Nulla lobortis augue quis sapien ullamcorper, nec pretium felis accumsan. Duis libero lacus, efficitur nec semper sed, mollis ac leo.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(9, 'Energi', '', 'uu-energi', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Energi</h1>				<p class=\"lead text-white\">					Undang-Undang				</p>				<p class=\"text-white\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc odio massa, eleifend vel turpis ac, venenatis pellentesque dolor. Nulla et porta tellus, ut euismod lacus. Aliquam lobortis sapien nec sapien auctor rutrum. Cras interdum, nunc non hendrerit varius, risus felis tempus est, eget ornare mauris libero ut augue. Cras id lectus vel leo dapibus hendrerit et ut nulla. Fusce commodo congue ex at molestie. Aliquam porta et dui sed porta. Nullam consectetur placerat dolor, ac convallis dolor egestas pellentesque. Phasellus tempor at massa non commodo. Nulla egestas placerat est, vitae imperdiet lorem gravida id. Curabitur ornare risus in justo feugiat, tristique rhoncus est venenatis. Duis at urna nisl.</p><p class=\"text-white\"> </p><p class=\"text-white\">Mauris quis diam libero. Maecenas vel erat risus. Praesent convallis augue feugiat, pretium sapien vel, malesuada augue. Duis ultrices ullamcorper dignissim. Maecenas felis magna, pretium vitae pulvinar mollis, luctus ac nunc. Maecenas sed ipsum tortor.</p><p class=\"text-white\"> </p><p class=\"text-white\">Phasellus iaculis interdum dui eget faucibus. Nullam ut mauris at felis lobortis convallis eget a lectus. Proin interdum gravida elementum. Donec accumsan interdum justo pulvinar bibendum. Vivamus a arcu non lectus luctus lobortis egestas eu nibh. Vestibulum ac finibus augue.</p><p class=\"text-white\"> </p><p class=\"text-white\">Proin consectetur neque at est pretium, non sollicitudin dolor congue. Nulla lobortis augue quis sapien ullamcorper, nec pretium felis accumsan. Duis libero lacus, efficitur nec semper sed, mollis ac leo.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(10, 'Tenaga Listrik', '', 'uu-listrik', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Undang-Undang				</p>				<p class=\"text-white\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc odio massa, eleifend vel turpis ac, venenatis pellentesque dolor. Nulla et porta tellus, ut euismod lacus. Aliquam lobortis sapien nec sapien auctor rutrum. Cras interdum, nunc non hendrerit varius, risus felis tempus est, eget ornare mauris libero ut augue. Cras id lectus vel leo dapibus hendrerit et ut nulla. Fusce commodo congue ex at molestie. Aliquam porta et dui sed porta. Nullam consectetur placerat dolor, ac convallis dolor egestas pellentesque. Phasellus tempor at massa non commodo. Nulla egestas placerat est, vitae imperdiet lorem gravida id. Curabitur ornare risus in justo feugiat, tristique rhoncus est venenatis. Duis at urna nisl.</p><p class=\"text-white\"> </p><p class=\"text-white\">Mauris quis diam libero. Maecenas vel erat risus. Praesent convallis augue feugiat, pretium sapien vel, malesuada augue. Duis ultrices ullamcorper dignissim. Maecenas felis magna, pretium vitae pulvinar mollis, luctus ac nunc. Maecenas sed ipsum tortor.</p><p class=\"text-white\"> </p><p class=\"text-white\">Phasellus iaculis interdum dui eget faucibus. Nullam ut mauris at felis lobortis convallis eget a lectus. Proin interdum gravida elementum. Donec accumsan interdum justo pulvinar bibendum. Vivamus a arcu non lectus luctus lobortis egestas eu nibh. Vestibulum ac finibus augue.</p><p class=\"text-white\"> </p><p class=\"text-white\">Proin consectetur neque at est pretium, non sollicitudin dolor congue. Nulla lobortis augue quis sapien ullamcorper, nec pretium felis accumsan. Duis libero lacus, efficitur nec semper sed, mollis ac leo.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(11, 'Geologi', '', 'uu-geologi', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Geologi</h1>				<p class=\"lead text-white\">					Undang-Undang				</p>				<p class=\"text-white\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc odio massa, eleifend vel turpis ac, venenatis pellentesque dolor. Nulla et porta tellus, ut euismod lacus. Aliquam lobortis sapien nec sapien auctor rutrum. Cras interdum, nunc non hendrerit varius, risus felis tempus est, eget ornare mauris libero ut augue. Cras id lectus vel leo dapibus hendrerit et ut nulla. Fusce commodo congue ex at molestie. Aliquam porta et dui sed porta. Nullam consectetur placerat dolor, ac convallis dolor egestas pellentesque. Phasellus tempor at massa non commodo. Nulla egestas placerat est, vitae imperdiet lorem gravida id. Curabitur ornare risus in justo feugiat, tristique rhoncus est venenatis. Duis at urna nisl.</p><p class=\"text-white\"> </p><p class=\"text-white\">Mauris quis diam libero. Maecenas vel erat risus. Praesent convallis augue feugiat, pretium sapien vel, malesuada augue. Duis ultrices ullamcorper dignissim. Maecenas felis magna, pretium vitae pulvinar mollis, luctus ac nunc. Maecenas sed ipsum tortor.</p><p class=\"text-white\"> </p><p class=\"text-white\">Phasellus iaculis interdum dui eget faucibus. Nullam ut mauris at felis lobortis convallis eget a lectus. Proin interdum gravida elementum. Donec accumsan interdum justo pulvinar bibendum. Vivamus a arcu non lectus luctus lobortis egestas eu nibh. Vestibulum ac finibus augue.</p><p class=\"text-white\"> </p><p class=\"text-white\">Proin consectetur neque at est pretium, non sollicitudin dolor congue. Nulla lobortis augue quis sapien ullamcorper, nec pretium felis accumsan. Duis libero lacus, efficitur nec semper sed, mollis ac leo.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(13, 'Rencana Kerja', '', 'rencana-kerja', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Rencana Kerja</h1>				<p class=\"lead text-white\">					Tahun 2017				</p>				<p class=\"text-white\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc odio massa, eleifend vel turpis ac, venenatis pellentesque dolor. Nulla et porta tellus, ut euismod lacus. Aliquam lobortis sapien nec sapien auctor rutrum. Cras interdum, nunc non hendrerit varius, risus felis tempus est, eget ornare mauris libero ut augue. Cras id lectus vel leo dapibus hendrerit et ut nulla. Fusce commodo congue ex at molestie. Aliquam porta et dui sed porta. Nullam consectetur placerat dolor, ac convallis dolor egestas pellentesque. Phasellus tempor at massa non commodo. Nulla egestas placerat est, vitae imperdiet lorem gravida id. Curabitur ornare risus in justo feugiat, tristique rhoncus est venenatis. Duis at urna nisl.</p><p class=\"text-white\"> </p><p class=\"text-white\">Mauris quis diam libero. Maecenas vel erat risus. Praesent convallis augue feugiat, pretium sapien vel, malesuada augue. Duis ultrices ullamcorper dignissim. Maecenas felis magna, pretium vitae pulvinar mollis, luctus ac nunc. Maecenas sed ipsum tortor.</p><p class=\"text-white\"> </p><p class=\"text-white\">Phasellus iaculis interdum dui eget faucibus. Nullam ut mauris at felis lobortis convallis eget a lectus. Proin interdum gravida elementum. Donec accumsan interdum justo pulvinar bibendum. Vivamus a arcu non lectus luctus lobortis egestas eu nibh. Vestibulum ac finibus augue.</p><p class=\"text-white\"> </p><p class=\"text-white\">Proin consectetur neque at est pretium, non sollicitudin dolor congue. Nulla lobortis augue quis sapien ullamcorper, nec pretium felis accumsan. Duis libero lacus, efficitur nec semper sed, mollis ac leo.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(14, 'UPTD', '', 'uptd', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">		<img class=\"background-image\" alt=\"UPTD\" src=\"/esdm/assets/img/content/SO-2016.png\">	</div>	<div class=\"video-wrapper\">		<video autoplay=\"\" muted=\"\" loop=\"\">			<img src=\"/esdm/assets/img/content/SO-2016.png\" title=\"UPTD\">		</video>	</div>		<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">UPTD</h1>				<p class=\"lead text-white\">					ESDM				</p>				<a href=\"/esdm/page/uptd-i\" class=\"btn btn-white btn-primary\">UPTD I</a>				<a href=\"/esdm/page/uptd-ii\" class=\"btn btn-white btn-primary\">UPTD II</a>				<a href=\"/esdm/page/uptd-iii\" class=\"btn btn-white btn-primary\">uptd III</a>				<a href=\"/esdm/page/uptd-iv\" class=\"btn btn-white btn-primary\">UPTD IV</a>				<a href=\"/esdm/page/uptd-v\" class=\"btn btn-white btn-primary\">UPTD V</a>			</div>		</div>	</div></section>', '', '', 'home'),
(15, 'UPTD I', '', 'uptd-i', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">UPTD I</h1>				<p class=\"lead text-white\">					UPTD ESDM				</p>				<p class=\"text-white\">UPTD ESDM WILAYAH I CIANJUR</p><p class=\"text-white\"> </p><p class=\"text-white\">Jl. Perintis Kemerdekaan No.21 Cianjur</p><p class=\"text-white\"> </p><p class=\"text-white\">Telepon/Fax. 0263 281205</p><p class=\"text-white\"> </p><p class=\"text-white\">Email : uptdesdmcjr@yahoo.co.id</p><p class=\"text-white\"> </p><p class=\"text-white\">Pengembangan paradigma baru dalam penyelenggaraan pemerintahan sekarang, melalui desentralisasi, bertumpu pada nilai-nilai demokratisasi, pemberdayaan dan pelayanan, sehingga terwujud suatu Pemerintah Daerah yang memiliki keleluasaan dalam pengambilan keputusan yang terbaik dan mampu mengembangkan potensi yang dimiliki, sehingga dapat memberikan kualitas pelayanan publik yang optimal kepada masyarakatnya. Salah satu ujung tombak Dinas Energi dan Sumber Daya Mineral Provinsi Jawa Barat dalam optimalisasi pelayanan masyarakatnya itu adalah UPTD ESDM Wilayah I Cianjur.</p> </p><p class=\"text-white\"> </p><p class=\"text-white\">Dasar Hukum Pembentukan UPTD ESDM Wilayah I Cianjur adalah; Peraturan Gubernur Nomor 75 Tahun 2009 Tentang Pedoman Pembentukan Unit Pelaksana Teknis Dinas (UPTD) dan Unit Pelaksana Teknis Badan (UPTB) (Berita Dearah Tahun 2009 Nomor 148 Seri E). Perannya sebagai ujung tombak Dinas Energi dan Sumber Daya Mineral Provinsi Jawa Barat ini terkait dengan tugas pokoknya melaksanakan sebagian fungsi Dinas di bidang pelayanan, konservasi dan pelestarian sebagian urusan bidang energi dan sumber daya mineral yang meliputi, Air Bawah Tanah, Pertambangan, Kegeologian, Ketanaga Listrikan, Energi baru terbarukan, Migas, dan Panas Bumi.</p><p class=\"text-white\"> </p><p class=\"text-white\">UPTD ESDM yang berkedudukan di Jalan Perintis Kemerdekaan No.21 Cianjur ini memiliki wilayah pelayanan kerja yang mencakup Kabupaten Cianjur, Kabupaten Sukabumi, Kota Sukabumi, Kabupaten Bogor, Kota Bogor, dan Kota Depok. Untuk pelayanan di wilayah kerja tersebut, UPTD Cianjur dipimpin oleh Ir. Kurnia Permana sebagai Kepala UPT, dibantu oleh Ano Kusmana B. Sc. sebagai Kasubag Tata Usaha, Sudarjo, SE, M.Si sebagai Kepala Seksi Sumber Daya Mineral dan Denny Rachmat, G, Sip. sebagai Kepala Seksi Energi.</p><p class=\"text-white\"> </p><p class=\"text-white\">Kegiatan yang sudah, sedang dan akan dilaksanakan di bidang Sumber Daya Mineral yaitu penyiapan kelengkapan berkas permohonan rekomendasi teknis dalam rangka penerbitan SIPA (Surat Ijin Pengambilan Air Bawah Tanah) oleh Kabupaten/Kota, inventarisasi data potensi sumberdaya mineral dan pengusahaan pertambangan umum, Pembinaan, Pengawasan, dan Penertiban pengusaha pertambangan umum, Air Bawah Tanah, dan Pemanfaatan Batu Bara, Inventarisasi data potensi kegeologian (rawan bencana tanah longsor), Pemeriksaan daerah rawan bencana longsor, serta bantuan Sarana Air Bersih untuk daerah yang kekurangan Air Bersih melalui Kegiatan Pengeboran tahun anggarran 2011 di Kecamatan Cikidang Kabupaten Sukabumi.</p><p class=\"text-white\"> </p><p class=\"text-white\">Adapun Kegiatan di Bidang Energi yaitu Pembangunan Listrik Pedesaan (Bantuan secara gratis bagi masyarakat KS dan Pra KS, baik jaringan maupun SR/IR) dilaksanakan sejak tahun 2002, Pembangunan PLTMH, PLTS dan BIOGAS, bagi masyarakat yang terpencil (jauh dari jaringan PLN), Inventarisasi Aset bantuan Provinsi dibidang Energi, maupun SDM, Inventarisasi masyarakat yang belum teraliri listrik maupun Desa/Kampung yang belum terdapat jaringan, serta Pembinaan, Pengawasan dan Pengendalian Bahan Bakar Kendaraan Bermotor (pergub tentang ini sedang di proses).</p><p class=\"text-white\"> </p><p class=\"text-white\">Faktor-faktor kunci yang menentukan keberhasilan pembangunan pertambangan dan energi, yakni kemampuan SDM, kehandalan lembaga, regulasi yang jelas dan komprehensif serta ketersediaan pembiayaan. Faktor-faktor tersebut akan menjadi paramater penting dari aspek penyelenggaraan pemerintahan, selain faktor eksternal (lingkungan strategis) yang juga harus mendapat perhatian.</p><p class=\"text-white\"> </p><p class=\"text-white\">Kunci penting lainnya adalah sinergitas dan kerjasama, baik antar pemerintahan maupun antara pemerintah dan masyarakat. Terdapat banyak aspek dari Sektor Energi dan Sumber Daya Mineral yang harus mendapat perhatian dan dikelola secara sinergis, untuk mencapai optimasi pencapaian tujuan pembangunan pertambangan dan energi.</p><p class=\"text-white\"> </p><p class=\"text-white\">Peran Departemen Energi dan Sumberdaya Mineral melalui UPTD Cianjur merupakan langkah akselerasi pencapaian tujuan pembangunan energi dan sumberdaya mineral di Indonesia umumnya, serta mendukung pembangunan daerah di Jawa Barat khususnya.</p><p class=\"text-white\"> </p><p class=\"text-white\">Sumber : Subag Tata Usaha UPTD ESDM Wilayah I Cianjur</p>			</div>		</div>	</div></section>', '', '', 'home'),
(16, 'UPTD II', '', 'uptd-ii', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">UPTD II</h1>				<p class=\"lead text-white\">					UPTD ESDM				</p>				<p class=\"text-white\">UPTD ESDM Wilayah II Purwakarta</p><p class=\"text-white\"> </p><p class=\"text-white\">Jl. Purnawarman Timur No.13 Purwakarta</p><p class=\"text-white\"> </p><p class=\"text-white\">Dibentuk berdasarkan Peraturan Gubernur Jawa Barat Nomor 113 Tahun 2009 tentang Organisasi dan Tata Kerja Unit Pelaksana Teknis Dinas dan Badan di Lingkungan Pemerintah Provinsi Jawa Barat. UPTD memiliki tugas pokok melaksanakan sebagian fungsi Dinas di bidang pelayanan, konservasi dan pelestarian, sebagian urusan bidang energi dan sumber daya mineral, meliputi listrik, pemanfaatan energi, mineral, geologi, air tanah panas bumi dan migas di lima wilayah kerja yaitu Kabupaten Purwakarta, Kabupaten Subang, Kabupaten Karawang, Kabupaten Bekasi dan Kota Bekasi.</p> </p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk melayani wilayah kerja tersebut, UPTD Purwakarta dikomandani oleh Drs. Acep Turisno, M.Si. yang dibantu oleh Ahmad Sopanudin, S.Sos. sebagai Kasubag Tata usaha, Ibnu Takdir, ST, M.Si. sebagai Kepala Seksi Energi, dan Arif Sahendro, ST. sebagai Kepala Seksi Sumberdaya Mineral.</p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk menjalankan tupoksinya, UPTD Purwakarta menggunakan strategi-strategi di masing-masing sektor. Untuk sektor energi, Sama seperti UPTD lain di bawah Dinas ESDM Propinsi Jawa Barat, UPTD wilayah II Purwakarta juga ikut serta mensukseskan target Jabar Caang 2010 lalu, yaitu :</p><p class=\"text-white\"> </p><p class=\"text-white\">- Pemenuhan kebutuhan listrik masyarakat disekitar Pembangkit Listrik</p><p class=\"text-white\"> </p><p class=\"text-white\">- Mempunyai potensi ekonomi kerakyatan</p><p class=\"text-white\"> </p><p class=\"text-white\">- Keterkaitan Pogram Kerja Wilayah</p><p class=\"text-white\"> </p><p class=\"text-white\">- Pemerataan rasio elektrifikasi setiap kabupaten</p><p class=\"text-white\"><p class=\"text-white\"> </p><p class=\"text-white\">- Sharing pembangunan ketenagalistrikan dengan kabupaten<p class=\"text-white\"><p class=\"text-white\"> </p><p class=\"text-white\"><p class=\"text-white\">- Sinergitas dengan Perencanaan Pusat<p class=\"text-white\"> </p><p class=\"text-white\">-Terintegrasi dengan sumber-sumber lainnya<p class=\"text-white\"> </p><p class=\"text-white\">Potensi energi listrik di wilayah UPTD Purwakarta antara lain adalah PLTA Cirata, PLTA Jatiluhur, PLTU Muara Tawar, Power Plant di beberapa perusahaan, Power Plant di beberapa kawasan industri dan Pembangkit Mikrohidro. Pengembangan-pengembangan energi listrik ini bukanlah tanpa kendala, dalam pelaksanaanya, jajaran UPTD mengalami kendala-kendala atau hambatan. Kendala-kendala yang dihadapi antara lain :</p><p class=\"text-white\"> </p><p class=\"text-white\">- Kelebihan kapasitas data yang digunakan perusahaan</p><p class=\"text-white\"> </p><p class=\"text-white\">- Pertumbuhan keluarga ks baru yang kurang cepat</p><p class=\"text-white\"> </p><p class=\"text-white\">- Posisi rumah yang tidak berkelompok</p><p class=\"text-white\"> </p><p class=\"text-white\">- Kurangnya data teknis dari Kabupaten</p><p class=\"text-white\"> </p><p class=\"text-white\">Selain pengembangan sektor energi, UPTD juga mengembangkan sektor sumber daya mineral. Salah satu bidang sektor ini adalah air tanah. Cekungan Air Tanah (CAT) yang ada adalah CAT Bekasi Karawang dengan zona aman sampai dengan rusak, CAT Ciater dengan zona masih aman, dan beberapa wilayah di luar CAT. Peran UPTD yang telah dilaksanakan :</p><p class=\"text-white\"> </p><p class=\"text-white\">- Melaksanakan koordinasi terus menerus dengan kab/kota, dan perusahaan pengguna air tanah dalam mensosialisasikan kondisi CAT yang ada.</p><p class=\"text-white\"> </p><p class=\"text-white\">- Melaksanakan pengujian kualitas air tanah sebagai salah satu parameter kondisi zona air tanah</p><p class=\"text-white\"> </p><p class=\"text-white\">- Mensosialisasikan pembuatan sumur resapan dalam sebagai upaya pemulihan</p><p class=\"text-white\"> </p><p class=\"text-white\">- Melaksanakan pengawasan yang lebih ketat terhadap perusahaan yang pengambilan airnya melebihi debit yang diijinkan.</p><p class=\"text-white\"> </p><p class=\"text-white\">- Langkah-langkah yang dilaksanakan jajaran UPTD, dalam menanggulangi permasalahan-permasalahan yang muncul di bidang air tanah :</p><p class=\"text-white\"> </p><p class=\"text-white\">- Mendeliniasi peta zonasi air tanah ke dalam skala 1 : 10.000, sehingga zonasi air tanah bisa lebih detail.</p><p class=\"text-white\"> </p><p class=\"text-white\">- Koordinasi dengan instansi lain di kab/kota untuk pengembangan infrastruktur jaringan air permukaan, sehingga pemanfaatan air tanah bisa di kurangi.</p><p class=\"text-white\"> </p><p class=\"text-white\">- Koordinasi dengan Kementrian ESDM dan DKI untuk wilayah Kota Bekasi karena merupakan cekungan lintas provinsi.</p><p class=\"text-white\"> </p><p class=\"text-white\">Wilayah kerja UPT II Purwakarta secara geologi berada dalam beberapa formasi, sehingga mempunyai struktur geologi yang bervariasi, sehingga sangat berpengaruh terhadap potensi bahan galian yang ada, air tanah, gerakan tanah, kegempaan maupun konstruksi bangunan yang ada di permukaan. Permasalahan yang ada adalah kurangnya sosialisasi kondisi geologi di kabupaten/kota, sehingga perencanaan tata ruang kota/kabupaten belum mengacu ke kondisi geologi yang ada, selain itu juga karena kurangnya ahli geologi di kabupaten/kota. Dalam melaksanakan sebagian fungsi Dinas, UPTD Purwakarta melakukan upaya-upaya untuk menanggulangi permasalahan ini yaitu antara lain :</p><p class=\"text-white\"> </p><p class=\"text-white\">- Mensosialisasikan kondisi geologi masing-masing kabupaten/kota</p><p class=\"text-white\"> </p><p class=\"text-white\">- Mengusulkan ke kab/kota dalam memberikan ijin mendirikan bangunan pabrik maupun gedung bertingkat ada rekomendasi geologi teknik, baik terhadap struktur tanahnya maupun kondisi air tanahnya</p><p class=\"text-white\"> </p><p class=\"text-white\">- Meng up date peta gerakan tanah di masing-masing kab/kota</p><p class=\"text-white\"> </p><p class=\"text-white\">- Menginventarisir jalur-jalur vulkanis yang ada di wilayah kab, khususnya untuk Kabupaten Subang dan Purwakarta berkaitan dengan potensi panas bumi.</p><p class=\"text-white\"> </p><p class=\"text-white\">Permasalahan dalam bidang pertambangan karena merupakan bahan galian konstruksi, cadangan yang ada berdekatan dengan pemukiman penduduk, yang timbul permasalahan lingkungan sosial berupa debu, kebisingan dan kerusakan infrastruktur jalan, permasalahan yang lain, berupa penanganan paska tambang dimana reklamasi nya tidak dilaksanakan secara optimal, khususnya untuk tambang pasir, sehingga lahan bekas tambang kurang dapat dimanfaatkan kembali. Sebagai bagian dari tugas pokoknya maka jajaran UPTD melaksanakan fungsi pembinaan, pengawasan dan pengendalian (binwasdal) untuk melindungi dan menjaga kelestarian lingkungan yang ada.</p><p class=\"text-white\"> </p><p class=\"text-white\">Potensi migas di wilayah kerja UPTD berada di Kabupaten Purwakarta (sedang di Explorasi), Kab Subang (WKP Tangkuban Perahu), Kab Karawang dan Kab Bekasi (Explorasi dan Exploitasi), dengan cadangan berupa gas alam. Permasalahan yang ada yaitu kurangnya data-data yang rinci dari pemerintah pusat ke Provinsi dan Kabupaten. </p>			</div>		</div>	</div></section>', '', '', 'home'),
(17, 'UPTD III', '', 'uptd-iii', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">UPTD III</h1>				<p class=\"lead text-white\">					UPTD ESDM				</p>				<p class=\"text-white\">UPTD ESDM WILAYAH III BANDUNG</p><p class=\"text-white\"> </p><p class=\"text-white\">Jl. Pasir Luyu no. 5 Bandung</p><p class=\"text-white\"> </p><p class=\"text-white\">Telepon/Fax. 022 5201006</p><p class=\"text-white\"> </p><p class=\"text-white\">Email : upt3.desdm.jabar@gmail.com</p><p class=\"text-white\"> </p><p class=\"text-white\">Wilayah III Bandung ini memiliki Tugas Pokok dan Fungsi Dinas di bidang pelayanan, konservasi dan pelestarian sebagian urusan bidang energi dan sumber daya mineral, meliputi listrik, pemanfaatan energi, mineral, goelogi, air tanah panas bumi dan migas di Kota Bandung, Kabupaten Bandung, Kabupaten Bandung Barat, Kabupaten Sumedang dan Kota Cimahi.</p> </p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk melayani wilayah kerja tersebut, UPTD Bandung dikomandani oleh Drs. Dahyar, MM yang dibantu oleh Setianingsih Sayekti, SSTP sebagai Kasubag Tata usaha, Ir. Lusy Nursianty sebagai Kepala Seksi Energi, dan H. Wawa Wahyuddin, S.Ip, MM. sebagai Kepala Seksi Sumber daya Mineral.</p><p class=\"text-white\"> </p><p class=\"text-white\">UPTD Wilayah III Bandung melayani jenis pekerjaan Barang Publik, Barang Publik dan Administrasi, dan sebagai produk/output layanannya antara lain yaitu kajian teknis untuk proses penerbitan saran teknis air bawah tanah, teknis pertambangan, penerbitan IUP, dan lain sebagainya, selain kajian teknis juga terdapat kajian sosial ekonomi seperti program bantuan air bersih, pemberian listrik pedesaan, bantuan energi baru terbarukan dan lain sebagainya.</p><p class=\"text-white\"> </p><p class=\"text-white\">Sasaran dari pada kegiatan ini yaitu untuk masyarakat pra KS yang diberi bantuan jaringan listrik, masyarakat yang diberi bantuan dari energi baru terbarukan, masyarakat yang diberi bantuan pengadaan air bersih melalui eksplorasi dan eksploitasi airtanah, masyarakat yang memanfaatkan airtanah dan bagi perusahaan tambang.Sebagai ujung tombak Dinas ESDM UPTD Bandung sering melakukan kerjasama/konsolidasi dengan instansi lain seperti Kementrian Dalam Negri, Kementrian ESDM, BUMN (Pertamina dan PLN), HISWANA Migas dan instansi lain yang terkait.</p><p class=\"text-white\"> </p><p class=\"text-white\">UPTD Wilayah III Bandung mempunyai kegiatan/layanan unggulan yang dilaksanakan sehingga menjadikan rujukan oleh masyarakat, seperti program Lisdes, PLTMH, PLTS dan kegiatan eksplorasi dan eksploitasi air tanah demi kemajuan masyarakat Jawa Barat, walaupun masih banyak sandungan atau permasalahan yang sering dihadapi oleh UPTD Wilayah III Bandung, seperti kurang memadainya atau masih kurangnya sarana dan prasarana pendukung kegiatan.</p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk memperkuat tugas serta fungsi UPTD, pimpinan beserta staf UPTD mengusulkan program-program yang meliputi Binwasdal instalasi keselamatan pemanfaatan energy dan ketenagalistrikan dengan anggaran Rp. 50.000.000,- , binwasdal pengambilan dan pemanfaatan air tanah, usaha pertambangan umum dan batubara dengan anggaran Rp. 75.000.000.- dan Rp. 375.000.000,- dianggarkan untuk pemanfaatan air tanah untuk penyediaan air bersih domestic serta RP. 1.345.800.000,- dianggarkan juga untuk pengembangan jaringan listrik pedesaan (PLN) Rasio Elektrifikasi rumah tangga di Wilayah Kerja UPT DESDM Wil III Bandung.</p><p class=\"text-white\"> </p><p class=\"text-white\">Harapan dari UPTD Wilayah III Bandung adalah tersedianya saran dan prasarana yang memadai dan anggaran kegiatan yang sesuai untuk peningkatan kapasitas peranan dan tupoksi untuk meningkatkan layanan publik serta capaian visi dan misi Pemerintah Provinsi Jawa Barat.</p>			</div>		</div>	</div></section>', '', '', 'home');
INSERT INTO `page` (`id_page`, `title`, `featured_image`, `slug`, `template`, `breadcrumb`, `content`, `keyword`, `description`, `view`) VALUES
(18, 'UPTD IV', '', 'uptd-iv', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">UPTD IV</h1>				<p class=\"lead text-white\">					UPTD ESDM				</p>				<p class=\"text-white\">UPTD ESDM WILAYAH IV TASIKMALAYA</p><p class=\"text-white\"> </p><p class=\"text-white\">UPTD Wilayah IV Tasikmalaya dibentuk berdasarkan Peraturan Gubernur Jawa Barat Nomor 113 Tahun 2009 tentang Organisasi dan Tata Kerja Unit Pelaksana Teknis Dinas dan Badan di Lingkungan Pemerintah Provinsi Jawa Barat. UPTD ini memiliki tugas  pokok melaksanakan sebagian fungsi Dinas di bidang pelayanan, konservasi dan pelestarian sebagian urusan bidang energi dan sumber daya mineral, meliputi listrik, pemanfaatan energi, mineral, goelogi, air tanah panas bumi dan migas di Kota Tasikmalaya, Kabupaten Tasikmalaya, Kabupaten Garut, Kota Banjar, dan Kabupaten Ciamis. Untuk melayani wilayah kerja tersebut, UPTD Tasikmalaya dipimpin oleh Akhmad Sudrajat, SH., MM. yang dibantu oleh Drs. Amirrudin sebagai Kasubag Tata usaha, Zainal Arifin ST., MT. sebagai Kepala Seksi Energi, dan Ir. R. Gurnita Karnasaputra sebagai Kepala Seksi Sumber daya Mineral.</p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk menjalankan tupoksinya, UPTD Tasikmalaya menggunakan strategi-strategi di masing-masing sector. Untuk sector energy, UPTD ini mengemban target Jabar Caang 2010, yaitu : Semua Desa di Jawa Barat telah terjangkau oleh jaringan PLN, Rasio Elektrifikasi telah mencapai 70%, dan Fasilitas Umum setiap Desa telah memiliki akses terhadap listrik. Strategi yang dilakukan oleh jajaran UPTD ini meliputi : Pemenuhan kebutuhan listrik Masyarakat disekitar Pembangkit Listrik, Mempunyai Potensi Ekonomi kerakyatan, Keterkaitan Program Kerja Wilayah (PKW/PKN), Pemerataan Rasio elektrifikasi  setiap Kabupaten, Sharing pembangunan ketenagalistrikan dengan Kabupaten, Sinergitas dengan Perencanaan pusat, Terintegrasi dengan sumber-sumber lainnya. Dalam kurun waktu 2002-2009 UPT ini telah melakukan pengembangan jaringan listrik dengan memasang lebih dari 140 kM sambungan SUTM dan lebih dari 400 kM sambungan SUTR yang dapat memenuhi lebih dari 22 ribu rumah yang tersebar di empat Kabupaten/kota. Untuk lokasi-lokasi yang tidak terjangkau oleh jaringan listrik, UPTD mencanangkan pembangkitan listrik oleh tenaga surya (PLTS) dan oleh sungai (PLTMH). Sampai saat ini, kedua jenis pembangkit ersebut telah berhasil menerangi 459KK. Pada tahun 2011 sendiri, UPTD Tasiklmaya berencana mengembangkan listrik pedesaan dengan melakukan instalasi 2.295 kMs SUTM,6 Gardu, 12.807 SUTR, untuk 1300 KK dengan perkiraan biaya yang dibutuhkan hamper 4,5 Milyar.</p><p class=\"text-white\"> </p><p class=\"text-white\">Dalam mengembankan sektor energi, memang bukan pekerjaan gampang. Dalam pelaksanaanya, jajaran UPTD mengalami kendala-kendala atau hambatan. Misalnya instalasi jaringan yang melewati tanah hak milik orang lain, kurangnya peranan perangkat desa dalam pengawasan dan pengamanan jaringan, keterlambatan dalam penyalaan, serta kondisi bentang alam yang cukup sulit. Kendala lain yang perlu diantisipasi secara serius misalnya : masih rendahnya sinergi antar sector dalam pengembangan energi, regulasi terkait dengan pengembangan energy, dan pengembangan energy alternative yang tidak begitu progresif.</p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk menyikapi kendala-kendala tersebut maka UPTD mengambil langkah-langkah seperti : Intensifikasi sumber energi melalui program inventarisasi dan identifikasi potensi energi panas bumi, mikrohidro, bioenergi dan migas; mengembangkan sosialisasi untuk diversifikasi energi, dan fasilitasi pengembangan teknologi energi alternative; Melakukan upaya-upaya konservasi dan Sosialisasi penghematan energi di sektor-sektor pengguna; Meningkatkan cakupan pelayanan dan akses energi dan listrik masyarakat, khususnya masyarakat di perdesaan; dan Meningkatan kualitas pembinaan, pengawasan, pengendalian kegiatan usaha listrik, pemanfaatan energi dan migas.</p> </p><p class=\"text-white\"> </p><p class=\"text-white\">Selain pengembangan energy, UPTD juga melakukan program konservasi energy dengan melakukan audit energy di lingkungan kantor SKPD, dan hasil audit menunjukan bahwa gedung yang diaudit termasuk gedung yang hemat energy. Hal ini sejalan dengan program konservasi energi yang diintruksikan dalam Instruksi Gubernur Jawa Barat No. 2/2005.</p><p class=\"text-white\"> </p><p class=\"text-white\"><strong>LISTRIK DAPAT MENINGKATKAN TARAF HIPUD DAN PENDAPATAN WARGA</strong><p class=\"text-white\"> </p><p class=\"text-white\">Selain pengembangan sector enery, UPTD juga mengembangkan sector sumber daya mineral. Topografi wilayah Jawa Barat Bagian Selatan terdiri dari dataran rendah, dataran tinggi, sampai pegunungan berbukit dengan potensi sumber daya alam (Air, mineral logam dan non logam serta migas) yang melimpah untuk dikembangkan menjadi sektor unggulan dalam menarik calon investor di bidang ini. Kondisi eksisting pengusahaan pertambangan mineral logam dan non logam pada umumnya masih dilakukan dengan teknologi manual dan sederhana, dalam skala kecil dan modal investasi yang kecil.</p><p class=\"text-white\"> </p><p class=\"text-white\">Dalam bidang pertambangan umum, UPTD telah melakukan kegiatan berupa : Koordinasi dan Inventarisasi serta sosialisasi UU No. 4/2009 Tentang  Pertambangan Mineral  dan batu bara, kepada Kabupaten penghasil; Fasilitasi tata cara perhitungan iuran produksi dan iuran tetap pengusahaan Pertambangan; dan Binwasdal terhadap kegiatan pengusahaan pertambangan logam dan non logam. Di wilayah kerja UPTD saat ini terdapat 58 IUP logam dengan IUP aktif sebanyak 31 buah. Adapun IUP non logam sebanya 122 buah dengan IUP aktif sebanyak 99 buah. Eksplorasi sendiri tengah dilakukan di 3 kabupaten untuk mineral bijih besi, mangan, pasir besi, dan batubara. Dalam pengelolaan air tanah, UPTD telah melakukan kegiatan yang meliputi : Koordinasi kepada Dinas Pengelola ESDM Kab/Kota tentang Perubahan UU No. 34/2001 menjadi 28/2009 tentang Pajak Daerah; Bersama-sama dengan UPPD Dispenda mengadakan sosialisasi perhitungan NPA dan pajak air tanah kepada wajib pajak (yang telah berijin) di seluruh Kab/Kota di Jawa Barat; Meningkatkan koordinasi dengan aparat kab/kota terkait dalam pengawasan dan pengendalian (penertiban pengambilan air tanah non izin); Fasilitasi dan pendampingan dengan Aparatur Dinas Kab/Kota dalam pencatatan volume air tanah dan perhitungan NPA setiap bulan; Turut Aktif dalam penyusunan Raperda Pengelolaan Air Tanah dan Pajak Air Tanah; dan pelayanan penerbitan Persyaratan Teknis sebagai persyaratan penerbitan SIPA dari Kab/Kota.</p> </p><p class=\"text-white\"> </p><p class=\"text-white\">Terkait dengan masalah air tanah, wilayah Kota Tasikmalaya mulai ditemukannya daerah yang kondisi air tanahnya rawan. Untuk Kota Tasikmalaya, zona aman sampai kedalaman 40 m, diperuntukkan untuk keperluan air minum rumah tangga dengan debit maksimal 3,5 m3/hari/sumur, adapun untuk keperluan lain, dilakukan pada akuifer pada kedalaman 40-120 m dengan debit maksimal 150 m3/hari/sumur dan lama pemompaan maksimal 18 jam/hari.</p> </p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk mengantisipasi kendala-kendala yang ada, jajaran UPTD Tasik telah melakukan kegiatan seperti : Sosialisasi tentang perhitungan Royalti ke pihak Pengusaha galian B di daerah Kec. Karangnunggal ; Sosialisasi tentang pemakaian safety (APD) ketika melakukan peninjauan ke lokasi tambang; Melakukan kegiatan penertiban terhadap kegiatan penambangan berupa memberikan saran teknis tentang penambangan yang baik dan benar serta mewajibkan pengusaha untuk memproses perijinan atau perpanjangan IUP; Melakukan pengecekan ke 2 (dua) SPBE di Wilayah Kota Tasikmalaya tentang jumlah tabung gas 3 kg yang rusak, tata cara pengisian gas ke dalam tabung dan pendistribusian ke agen; Mewajibkan pengusaha SPBE dan agen untuk tidak menggunakan tabung gas yang sudah rusak (tabung diharuskan untuk dipisahkan dan diamankan).</p> </p><p class=\"text-white\"> </p><p class=\"text-white\"><strong>HARAPAN</strong></p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk perkembangan ke depan yang lebih baik, jajaran pegawai UPTD Tasikmalaya mempunyai harapan-harapan diantaranya : Terjadinya jejaring kerja dan sinergitas antar sektor dan institusi secara lebih baik dalam rangka pengelolaan dan pengembangan energy; Terjadinya peningkatan investasi, baik untuk program intensifikasi, diversifikasi, konservasi maupun untuk peningkatan infrastruktur listrik, energi, migas serta peningkatan akses energi masyarakat; Diterbitkannya Peraturan Pemerintah dari UU No. 30 Tahun 2007 sebagai landasan operasionalisasi pengelolaan dan pengembangan energi di Indonesia; Percepatan pengembangan teknologi dalam rangka diversifikasi penggunaan energy; dan Peningkatan upaya sosialisasi dan diseminasi publik dalam rangka peningkatan kesadaran dan pemahaman terhadap perkembangan dan kebijakan sektor energy.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(19, 'UPTD V', '', 'uptd-v', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">UPTD V</h1>				<p class=\"lead text-white\">					UPTD ESDM				</p>				<p class=\"text-white\">UPTD ESDM WILAYAH V CIREBON</p><p class=\"text-white\"> </p><p class=\"text-white\">Jl. Sunan Kalijaga Nomor 6, Komplek Perkantoran Sumber - Kabupaten Cirebon</p><p class=\"text-white\"> </p><p class=\"text-white\">Telepon/Fax. (0231) 8330617/(0231) 320970</p><p class=\"text-white\"> </p><p class=\"text-white\">Daerah kerja wilayah CIAYUMAJAKUNING  yaitu Kabupaten Cirebon, Kota Cirebon, Kabupaten Indramayu, Kabupaten Majalengka, dan Kabupaten Kuningan.</p><p class=\"text-white\"> </p><p class=\"text-white\">Untuk melayani wilayah kerja tersebut, UPTD Cirebon dikomandani oleh Muji Hartono, S.Sos., MM. yang dibantu oleh Entis Sutisna, Se. sebagai Kasubag Tata Usaha, Bau Muhajir, ST., M.Si sebagai Kepala Seksi Energi, dan Edwin Christ, ST., MT. sebagai Kepala Seksi Sumber daya Mineral.</p> </p><p class=\"text-white\"> </p><p class=\"text-white\">UPTD ESDM Wilayah V Cirebon, sesuai dengan tupoksinya, melakukan beberapa pelayanan diantaranya bantuan listrik pedesaan, bantuan pembangkit listrik tenaga surya, bantuan demplot biogas, bantuan demplot batubara, bantuan demplot biokerosin, bantuan kincir tenaga angin, bantuan sarana air bersih dan bantuan peralatan pertambangan skala kecil.</p><p class=\"text-white\"> </p><p class=\"text-white\">Bantuan listrik pedesaan telah diberikan pada wilayah Ciayumajakuning yang hingga tahun 2010 jumlah lokasi penerima (desa) berjumlah 317 desa, dengan rincian pengerjaan SUTM (kms) sebanyak 30,34; SUTR (kms) sebanyak 44,99; Gardu Cantol dengan kapasitas 25 KVA sebanyak 9; Gardu Cantol dengan kapasitas 50 KVA sebanyak 25; Gardu Cantol dengan kapasitas 100 KVA sebanyak 4; dan total konsumen SR/IR sebanyak 19.776.</p><p class=\"text-white\"> </p><p class=\"text-white\">Pada tahun 2010 ini, warga yang memperoleh bantuan pemasangan listrik PLN di Indramayu sebanyak 700 KK berada di 8 kecamatan dan 8 desa, Kab. Cirebon 300 KK yang tersebar di 6 kecamatandan 6 desa, Kab. Kuningan 635 KK tersebar di 12 kecamatan dan 14 desa, sehingga dalam kurun waktu tahun 2002 - 2010, sudah ada 18.813 keluarga miskin di wilayah Ciayumajakuning yang telah memperoleh bantuan listrik gratis dari Pemprov Jabar.</p><p class=\"text-white\"> </p><p class=\"text-white\">Pada tahun 2010 ini, warga yang memperoleh bantuan pemasangan listrik PLN di Indramayu sebanyak 700 KK berada di 8 kecamatan dan 8 desa, Kab. Cirebon 300 KK yang tersebar di 6 kecamatandan 6 desa, Kab. Kuningan 635 KK tersebar di 12 kecamatan dan 14 desa, sehingga dalam kurun waktu tahun 2002 - 2010, sudah ada 18.813 keluarga miskin di wilayah Ciayumajakuning yang telah memperoleh bantuan listrik gratis dari Pemprov Jabar.</p><p class=\"text-white\"> </p><p class=\"text-white\">Selanjutnya, di Kab. Majalengka , juga terdapat bantuan pemasangan jaringan listrik berupa sambungan udara tegangan menengah (SUTM) sepanjang 0,9 Kms, sambungan udara tegangan rendah (SUTR) 1 Kms dan gardu cantol 50 KVA sebanyak 1 unit di Desa Haurseah Kec.Argapura. Kuningan dan Cirebon yang hingga tahun 2007 berjumlah 3 unit. Bantuan kincir tenaga angin, diberikan pada tiga Kabupaten/Kota yaitu Cirebon, Indramayu, dan Kuningan yang hingga tahun 2006 berjumlah 13 unit.</p><p class=\"text-white\"> </p><p class=\"text-white\">Selain bantuan yang diberikan menyangkut energi, ada juga bantuan yang diberikan menyangkut kebutuhan masyarakat akan air bersih yaitu bantuan sarana air bersih. Hingga tahun 2007, bantuan ini telah diberikan pada empat Kabupaten/ Kota yaitu Cirebon, Majalengka, Kuningan, dan Indramayu. Anggaran yang dipakai dalam pelaksanaan bantuan ini umumnya berasal dari anggaran APBD.</p><p class=\"text-white\"> </p><p class=\"text-white\">Berkaitan dengan dukungan terhadap kegiatan pertambangan rakyat, UPTD ESDM Wilayah V Cirebon juga telah memberikan bantuan peralatan penambangan skala kecil yang hingga tahun 2006 telah diberikan pada daerah pertambangan di Palimanan dan Sindangwangi. Jenis bantuan yang diberikan yaitu : Aplikasi Model Kemitraan Usaha Penambang Sekala Kecil(PSK), Pembinaan Teknis Pengelolaan Penambang Sekala Kecil(PSK), 1 Unit Stone Crusher, 1 Unit Penggerak Motor Diesel 22 HP, 1 Pondasi Rangka, dan Alat Pemotong Batu (Batu Dasit).</p>			</div>		</div>	</div></section>', '', '', 'home'),
(24, 'Layanan Perizinan', '', 'perizinan', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">		<img class=\"background-image\" alt=\"Pelayanan Perizinan\" src=\"/esdm/assets/img/bg/bg-2.jpg\">	</div>	<div class=\"video-wrapper\">		<video autoplay=\"\" muted=\"\" loop=\"\">			<img src=\"/esdm/assets/img/bg/bg-2.jpg\" title=\"Pelayanan Perizinan\">		</video>	</div>		<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Pelayanan Perizinan</h1>				<p class=\"lead text-white\">					ESDM				</p>				<a href=\"/esdm/page/perizinan-tenagalistrik\" class=\"btn btn-white btn-primary\">Tenaga Listrik</a>				<a href=\"/esdm/page/perizinan-mineral\" class=\"btn btn-white btn-primary\">Mineral Non Logam dan Batuan</a>				</div>		</div>	</div></section>', '', '', 'home'),
(25, 'Tenaga Listrik', '', 'perizinan-tenagalistrik', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Pelayanan Perizinan</h1>				<p class=\"lead text-white\">					Tenaga Listrik				</p>				<iframe src=\"/esdm/assets/pdf/perizinan-tenaga_listrik.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/perizinan-tenaga_listrik.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(26, 'Mineral Non Logam dan Batuan', '', 'perizinan-mineral', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Pelayanan Perizinan</h1>				<p class=\"lead text-white\">					Mineral Non Logam dan Batuan				</p>				<iframe src=\"/esdm/assets/pdf/perizinan_tambang_mineral.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/perizinan_tambang_mineral.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(27, 'Data dan Informasi', '', 'data-informasi', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">		<img class=\"background-image\" alt=\"Pelayanan Perizinan\" src=\"/esdm/assets/img/bg/bg-2.jpg\">	</div>	<div class=\"video-wrapper\">		<video autoplay=\"\" muted=\"\" loop=\"\">			<img src=\"/esdm/assets/img/bg/bg-2.jpg\" title=\"Data dan Informasi\">		</video>	</div>		<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Data dan Informasi</h1>				<p class=\"lead text-white\">					ESDM				</p>				<a href=\"/esdm/page/data-mineral\" class=\"btn btn-white btn-primary\">Mineral</a>				<a href=\"/esdm/page/data-air-tanah\" class=\"btn btn-white btn-primary\">Air Tanah</a>				<a href=\"/esdm/page/data-tenaga-listrik\" class=\"btn btn-white btn-primary\">Tenaga Listrik</a>				<a href=\"/esdm/page/data-minyak\" class=\"btn btn-white btn-primary\">Minyak dan Gas Bumi</a>				<a href=\"/esdm/page/data-panas-bumi\" class=\"btn btn-white btn-primary\">Panas Bumi</a>				<a href=\"/esdm/page/data-energi\" class=\"btn btn-white btn-primary\">Energi Terbarukan</a>				<a href=\"/esdm/page/data-pendapatan\" class=\"btn btn-white btn-primary\">Pendapatan</a>				</div>		</div>	</div></section>', '', '', 'home'),
(28, 'Mineral', '', 'data-mineral', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Data dan Informasi</h1>				<p class=\"lead text-white\">					Mineral				</p>				<p class=\"text-white\">Potensi bahan tambang di Jawa Barat, terutama sumberdaya mineral industri dan mineral konstruksi bervariasi tidak kurang dari 40 jenis bahan tambang tersebar hampir merata diseluruh kabupaten/kota di Jawa Barat. Terdapat pula potensi mineral logam primer, di antaranya mineral logam mulia (Au, Ag), logam dasar (Cu, Pb, Zn) dan logam mangan (Mn) yang sebaran potensinya berada di bagian selatan Jawa Barat. Saat ini, di Jawa Barat terdapat lebih dari 779 IUP (Ijin Usaha Pertambangan) di 20 Kabupaten/kota yang secara rinci terbagi menjadi 93 IUP mineral non logam, 166 IUP mineral logam, dan 520 IUP batuan.  Rekapitulasi Ijin Usaha Pertambangan per Kabupaten/kota di Jawa Barat ditunjukkan pada Grafik di samping.</p><p class=\"text-white\"> </p><img src=\"/esdm/assets/img/content/grafik-mineral.jpg\" alt=\"Mineral\" style=\"width:700px;height:400px;\"><p class=\"text-white\"></p><p class=\"text-white\">Namun demikian, dari jumlah tersebut hanya 368 IUP (52%) yang telah dinyatakan clear and clean (CNC) oleh Direktorat Jenderal Minerba Kementerian ESDM, sedangkan sisanya belum memenuhi persyaratan yang ditetepkan, diantaranya  masalah administrasi, pembayaran pajak, jaminan reklamasi dan pasca tambang, serta belum memperhatikan kaidah tata cara penambangan yang baik (good mining practices). Hal tersebut diantaranya dapat dilihat pada grafik di samping, bahwa luasan kawasan pertambangan mineral logam jauh lebih besar dari mineral non logam/batuan, walaupun jumlah IUP logam total sebesar 93 buah. Sebagian IUP tersebut selain belum memenuhi kewajiban pembayaran landrent, juga bersifat non aktif dan menjadi lahan bagi penambangan ilegal, terutama pada komoditas pasir besi di Jabar Selatan.</p><p class=\"text-white\"> </p><p class=\"text-white\"> </p><p class=\"text-white\">Dengan beralihnya kewenangan perijinan dari kabupaten/kota ke provinsi berdasarkan UU 23/2014 tentang Pemerintah Daerah, perlu dilakukan pembenahan terhadap berbagai permasalahan yang terkait dengan pengusahaan sumber daya mineral ini.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(29, 'Air Tanah', '', 'data-air-tanah', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Data dan Informasi</h1>				<p class=\"lead text-white\">					Air Tanah				</p>				<p class=\"text-white\">Kebutuhan terhadap air tanah sebagai sumber air bersih bagi masyarakat semakin meningkat, baik untuk keperluan rumah tangga yang bersifat tidak komersial maupun untuk keperluan komersial (industri, perdagangan dan jasa). Hal ini menyebabkan kondisi air tanah di Jawa Barat semakin lama semakin memprihatinkan, yang mengakibatkan turunnya muka air tanah secara drastis, menurunnya kualitas air dan amblesan tanah (land subsidence), sehingga saat ini terdapat 3 (tiga) Cekungan Air Tanah yang berada dalam kondisi kritis, yaitu CAT Bandung–Soreang, CAT Bogor dan CAT Bekasi–Karawang.</p><p class=\"text-white\"> </p><img src=\"/esdm/assets/img/content/air_tanah.jpg\" alt=\"Air Tanah\" style=\"width:700px;height:400px;\"><p class=\"text-white\"></p><p class=\"text-white\">Wilayah Jawa Barat terdiri atas 15 Cekungan Lintas Kabupaten/Kota, 9 Cekungan Non Lintas (Lokal) dan 4 Cekungan Lintas Provinsi (Berdasarkan Keppres Tentang Batas Horisontal Cekungan Air Tanah). Kebijakan pengelolaan air tanah saat ini lebih difokuskan pada upaya konservasi dan pemulihan kondisi air tanah. Sejak tahun 2009, telah dibangun sebanyak 26 sumur resapan dalam sebagai artificial groundwater recharge, baik yang bersumber dari dana pemerintah, maupun menggunakan dana swasta. Selain itu, terdapat 72 sumur pantau di seluruh Jawa Barat, yang dikelola oleh pemerintah maupun swasta.</p><p class=\"text-white\"> </p><p class=\"text-white\"> </p><p class=\"text-white\">Grafik di atas menunjukkan perkembangan pengambilan air tanah dari tahun 2003-2014. Pada tahun 2014 sekitar 190 juta meter kubik dieksploitasi dari 7.394 titik sumur bor. Namun demikian, data tersebut perlu dilakukan evaluasi mengingat menjelang akhir tahun 2014 terbit UU No 23/2014 tentang Pemerintah Daerah, dimana kewenangan pemberian izin air tanah dikembalikan ke provinsi, sehingga beberapa kabupaten/kota tidak melakukan pemutakhiran terhadap data perusahaan pengambil air tanah. Ketaatan pengambil air tanah terhadap kewajibannya seperti pembayaran pajak, perlu pula dievaluasi mengingat penurunan volume pengambilan air tanah sebagaimana ditunjukkan oleh grafik, dapat berasal dari pengambilan air tanah yang tidak dilaporkan atau tidak dibayarkan pajaknya.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(30, 'Tenaga Listrik', '', 'data-tenaga-listrik', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">		<img class=\"background-image\" alt=\"Pelayanan Perizinan\" src=\"/esdm/assets/img/bg/bg-2.jpg\">	</div>	<div class=\"video-wrapper\">		<video autoplay=\"\" muted=\"\" loop=\"\">			<img src=\"/esdm/assets/img/bg/bg-2.jpg\" title=\"Tenaga Listrik\">		</video>	</div>		<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Data dan Informasi				</p>				<a href=\"/esdm/page/data-pembangkit-listrik\" class=\"btn btn-white btn-primary\">Sebaran Pembangkit Listrik Jawa Barat</a>				<a href=\"/esdm/page/data-pengembangan-listrik\" class=\"btn btn-white btn-primary\">Pengembangan Listrik Pedesaan</a>				<a href=\"/esdm/page/data-data-rasio\" class=\"btn btn-white btn-primary\">Data Rasio Elektrifikasi</a>				<a href=\"/esdm/page/data-bantuan-listrik\" class=\"btn btn-white btn-primary\">Bantuan Listrik Pedesaan</a>				<a href=\"/esdm/page/data-direktori\" class=\"btn btn-white btn-primary\">Direktori Pembangkit Listrik</a>				</div>		</div>	</div><div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-2 text-center\">				<h1 class=\"text-white\"> </h1>				<h2 class=\"text-white\">Data dan Informasi</h2>				<p class=\"lead text-white\">					Tenaga Listrik				</p>				<p class=\"text-white\">Jawa Barat merupakan produsen listrik yang besar dan menggunakan berbagai sumber energi. Daya total listrik yang dibangkitkan di Jawa Barat pada tahun 2014 adalah sebesar 9336 Megawatt, yaitu pembangkit tenaga air (PLTA) sebesar 1995,9 MW dari dari pembangkit Cirata, Saguling , Jatiluhur serta beberapa PLTA skala kecil, dari  tenaga panasbumi (PLTP) sebesar 1130 MW,  dan pembangkit listrik yang menggunakan batubara, gas alam dan diesel secara keseluruhan sebesar 6250 MW (lihat gambar di samping). Daya yang terbangkitkan tersebut disambungkan kepada Sistem Jaringan Transmisi Nasional (JTN) Jawa-Bali. Di sisi lain, masyarakat Jawa Barat juga merupakan pengkonsumsi energi listrik yang besar dengan laju permintaan yang tinggi mencapai 8,3% per tahun.</p><p class=\"text-white\"> </p><img src=\"/esdm/assets/img/content/pembangkit.jpg\" alt=\"Tenaga Listrik\" style=\"width:700px;height:400px;\"><p class=\"text-white\"></p><p class=\"text-white\">Rasio Elektrifikasi Jawa Barat pada akhir 2014 adalah sebesar 83,41%. Adapun total anggaran untuk kegiatan akselerasi peningkatan rasio elektrifikasi Jawa Barat pada tahun anggaran 2014 adalah sebesar 74,625 milyar rupiah, untuk memberikan jangkauan listrik kepada sebanyak 52.668 rumah yang terdapat di 18 kabupaten, 4 kota, 308 kecamatan, dan 818 desa. Sebanyak 6 kabupaten/kota di Jawa Barat telah mengeluarkan ijin pembangkitan listrik baik untuk pemenuhan kebutuhan sendiri maupun umum, yaitu sebanyak 390 IUKU/IUKS tersebut menggunakan bahan bakar batubara, gas, maupun diesel.</p><p class=\"text-white\"> </p><p class=\"text-white\"> </p><img src=\"/esdm/assets/img/content/re.jpg\" alt=\"RE Tenaga Listrik\" style=\"width:700px;height:400px;\">				</div>		</div>	</div></section><div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Sebaran Pembangkit Listrik Jawa Barat				</p>				<iframe src=\"/esdm/assets/pdf/pembangkit_listrik.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/pembangkit_listrik.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(31, 'Minyak dan Gas Bumi', '', 'data-minyak', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Data dan Informasi</h1>				<p class=\"lead text-white\">					Minyak dan Gas Bumi				</p>				<p class=\"text-white\">Sebaran potensi minyak dan gas di Jawa Barat utamanya tersebar di lepas pantai (offshore) Utara Jawa Barat, sebagian kecil terdapat di daratan (onshore), terutama tersebar di Kabupaten Indramayu, Majalengka Subang, Karawang dan Bekasi. Jumlah sumur yang ada di Jawa Barat terdiri dari Onshore sebanyak 194 titik sumur dan Offshore sebanyak 670 titik sumur Produksi, 170 Plat Forms dan 40 Fasilitas Processing and Service. Produksi minyak bumi dari seluruh lapangan yang ada di Jawa Barat pada tahun 2014 adalah 8,68 juta barrel, sedangkan produksi gas adalah 123,06 Milyar kaki kubik (MMBTU). Produksi ini menurun cukup tajam dibandingkan tahun sebelumnya (lihat grafik), yang dipengaruhi oleh harga minyak dunia yang sedang melemah, usia sumur yang sudah tua, dan belum ada penemuan baru.</p><p class=\"text-white\"> </p><img src=\"/esdm/assets/img/content/prod_minyak.jpg\" alt=\"Minyak dan Gas Bumi\" style=\"width:700px;height:400px;\"><p class=\"text-white\"></p><p class=\"text-white\">Di sisi migas hilir, Jawa Barat mengkonsumsi Bahan Bakar Minyak (BBM) sekitar 5,236 juta kiloliter premium dan 1,815 juta kiloliter solar pada tahun 2014. Dengan semakin terbatasnya cadangan migas serta tingginya harga minyak dunia, konsumsi BBM yang besar ini perlu ditekan agar tidak terjadi pengeluaran negara yang berlebih untuk subsidi BBM. Konsumsi BBM per kabupaten/kota di Jawa Barat pada tahun 2014 (sumber : BPH Migas, 2014), ditunjukkan pada grafik di samping ini. Konsumsi elpiji untuk kebutuhan rumah tangga maupun industri di Jawa Barat juga semakin meningkat dengan pertumbuhan sekitar 8% per tahun. Dengan kuota elpiji 3 kg dari Pemerintah yang hanya meningkat 5% per tahun, sering terjadi kelangkaan elpiji di beberapa daerah.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(32, 'Panas Bumi', '', 'data-panas-bumi', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Data dan Informasi</h1>				<p class=\"lead text-white\">					Panas Bumi				</p>				<p class=\"text-white\">Potensi panas bumi di Jawa Barat sangat besar prospeknya untuk dikembangkan terutama bagi pembangkitan energi listrik, selain itu sifatnya sebagai energi terbarukan diharapkan mampu berperan dalam upaya antisipasi perubahan iklim. Jawa Barat memiliki 43 lokasi manifestasi panas bumi di 11 Kabupaten, dengan total potensi mencapai 6.101 MWe. Total potensi Jawa Barat yang sudah terbangkitkan menjadi energi listrik pada tahun 2014 adalah sebesar 1130 MW melalui PLTP Kamojang (200 MW), PLTP Awibengkok Gunung Salak (377 MW), PLTP Drajat (271 MW) dan PLTP Wayang Windu (227 MW), serta PLTP Patuha (55 MW) yang baru mulai beroperasi pada tahun 2014 ini. Disamping itu, terdapat pembangkit panas bumi skala kecil di WKP Cibuni, Kabupaten Bandung, sebesar 100 kW, yang mulai beroperasi pada tahun ini.</p><p class=\"text-white\"> </p><img src=\"/esdm/assets/img/content/pabum.jpg\" alt=\"Panas Bumi\" style=\"width:700px;height:400px;\"><p class=\"text-white\"></p><p class=\"text-white\">Beberapa WKP yang ada di Jawa Barat, walaupun memiliki prospek yang cukup baik namun belum mulai berproduksi karena berbagai kendala, yaitu Karaha Bodas, Tampomas, Cisolok-Cisukarame, Gunung Tangkubanperahu, dan Gunung Ciremai. Perbandingan produksi listrik dari WKP-WKP yang ada di Jawa Barat dengan sumber daya yang dimiliki (berdasarkan kajian Evaluasi Prospek Dinas ESDM Jabar, 2013) dapat dilihat pada Grafik di atas. Pada tahun 2025 diharapkan Jawa Barat mampu menyumbang energi listrik dari panas bumi sebesar 3.267 MW atau sebesar 27% dari target nasional (9.500 MW).</p><p class=\"text-white\">Pada tahun 2014, diterbitkan Undang-Undang Nomor 21 Tahun 2014 Tentang Panas Bumi, yang merupakan revisi dari UU 27/2003, dimana kewenangan perijinan dari pengusahaan panas bumi ditarik ke Pemerintah Pusat (Kementerian ESDM), sehingga provinsi dan kabupaten/kota hanya dapat menangani perijinan pemanfaatan panas bumi secara langsung (direct use) yang berlokasi sesuai dengan kewenangannya. Namun demikian, kendala pengusahaan panas bumi di hutan konservasi yang selama ini banyak dijumpai, diharapkan dapat diatasi dengan terbitnya UU baru ini.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(34, 'Energi Terbarukan', '', 'data-energi', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Data dan Informasi</h1>				<p class=\"lead text-white\">					Energi Terbarukan				</p>				<p class=\"text-white\">Jawa Barat memiliki berbagai jenis potensi energi terbarukan, diantaranya :</p><p class=\"text-white\">- Mikro hidro : Jawa Barat: ± 5,600 MW</p><p class=\"text-white\">- Potensi surya Jawa Barat:   4,8 kwh/m2/hari</p><p class=\"text-white\">- Potensi angin (pantai selatan jawa Barat) : 4 m/detik.</p><p class=\"text-white\">- Potensi limbah ternak sapi : setara ± 300.000 m3/hari gas methane 70 %, dari ternak sapi sejumlah ± 3.0000 ekor sapi.</p><p class=\"text-white\">- Potensi limbah organik/sampah cukup tinggi: 20.000 m3/hari (cekungan bandung).</p><img src=\"/esdm/assets/img/content/ebt.jpg\" alt=\"Energi Terbarukan\" style=\"width:700px;height:400px;\"><p class=\"text-white\"></p><p class=\"text-white\">Fokus pengembangan energi baru terbarukan adalah terutama untuk mendukung percepatan aksesibilitas infrastruktur listrik, misalnya pembangunan mikro/piko/minihidro (total s.d 2013 sebesar 3.762 kW) dan pemasangan sel surya (total 6.298 KK). Sementara itu, untuk pemenuhan energi rumah tangga, fokus yang dikembangkan adalah biogas dari limbah ternak (total 2.292 KK). Grafik menunjukkan bahwa sampai dengan tahun 2014, pengembangan berbagai jenis EBT terus meningkat, dengan sumber pendanaan dari pemerintah pusat, Provinsi, kabupaten/kota, LSM, maupun perusahaan swasta baik murni bisnis maupun sebagai bagian dari CSR (corporate social responsibility). Dengan semakin membaiknya harga jual listrik dari pembangkit skala kecil, pihak swasta mulai melakukan investasi pengembangan PLMTH di beberapa wilayah sehingga jumlah daya listrik terbangkitnya pada tahun 2014 melebihi pembangkitan dari pembangkit listrik tenaga surya (selengkapnya lihat Tabel). Pengembangan EBT lainnya yang semakin meningkat adalah biogas dari limbah ternak, dimana pengembangannya melibatkan berbagai instansi seperti Dinas Opeternakan, Dinas Perkebunan, Dinas Pertanian, dan berbagai biro. Rencana pengembangan EBT lainnya di Jawa Barat adalah biofuel dari kemirisunan, namun pada saat ini masih dalam taraf penanaman (termasuk tanaman keras) sehingga diharapkan 3 tahun ke depan mulai berbuah dan dapat mulai diproduksi.</p>			</div>		</div>	</div></section>', '', '', 'home'),
(35, 'Pendapatan', '', 'data-pendapatan', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Data dan Informasi</h1>				<p class=\"lead text-white\">					Pendapatan				</p>				<p class=\"text-white\">Pendapatan daerah di sektor ESDM terdiri dari Pendapatan Asli Daerah (PAD), yaitu retribusi jasa laboratorium dan Pajak Bahan Bakar Kendaraan Bermotor (PBBKB) dan dana perimbangan yaitu dana bagi hasil minyak dan gas bumi, pertambangan umum (terdiri dari royalty dan landrent), dan panas bumi. Adapun pemberlakukan PBBKB sebagai pajak provinsi dan bersifat self-assessment tertuang dalam UU Nomor 28/2009 Tentang Pajak Daerah dan Retribusi Daerah. Dalam Peraturan Gubernur Nomor 28/2012 tentang Petunjuk Pelaksanaan Perda 13/2011 tentang Pajak Daerah untuk Jenis Pungutan PBBKB, disebutkan bahwa Dinas ESDM merupakan dinas teknis yang membantu Dispenda dalam pengujian perhitungan besaran PBBKB. Total pendapatan daerah dari bidang Energi dan Sumber Daya Mineral pada tahun 2014 adalah sebesar Rp. 2.180.611.281,522, dengan proporsi sebagaimana ditunjukkan oleh diagram di samping.</p><img src=\"/esdm/assets/img/content/bagi_hasil.jpg\" alt=\"Bagi Hasil\" style=\"width:700px;height:400px;\"><p class=\"text-white\"></p><p class=\"text-white\">Semakin menurunnya cadangan minyak dan gasbumi di Jawa Barat membuat bagi hasil dari sektor migas semakin menurun dilihat dari segi volume, serta dipengaruhi pula oleh turunnya harga minyak mentah dunia (sekitar 60 USD per barrel). Perkembangan penerimaan sektor migas 2003-2014 ditunjukkan oleh grafik di samping. Berbeda dengan sektor migas, penerimaan daerah dari sektor panas bumi semakin meningkat karena produksi semakin besar dan beberapa lapangan yang ada di Jawa Barat telah mencapai Net Operating Income (NOI). Pada Tahun 2014 pendapatan bagian provinsi dari panas bumi sebesar Rp. 61.570.265.914,00. Pendapatan lainnya adalah dari retribusi laboratorium, yang pada tahun 2014 menyumbang sebesar Rp. Rp. 360.918,980,00 terhadap pendapatan daerah Bidang ESDM.</p><img src=\"/esdm/assets/img/content/pendapatan.jpg\" alt=\"Pendapatan\" style=\"width:700px;height:400px;\">			</div>		</div>	</div></section>', '', '', 'home'),
(36, 'Sebaran Pembangkit Listrik Jawa Barat', '', 'data-pembangkit-listrik', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Sebaran Pembangkit Listrik Jawa Barat				</p>				<iframe src=\"/esdm/assets/pdf/pembangkit_listrik.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/pembangkit_listrik.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(37, 'Pengembangan Listrik Pedesaan', '', 'data-pengembangan-listrik', '', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Pengembangan Listrik Pedesaan				</p>				<iframe src=\"/esdm/assets/pdf/lisdes_2015.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/lisdes_2015.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(38, 'Data Rasio Elektrifikasi', '', 'data-data-rasio', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Data Rasio Elektrifikasi				</p>				<iframe src=\"/esdm/assets/pdf/data_rasio.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/data_rasio.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(39, 'Bantuan Listrik Pedesaan', '', 'data-bantuan-listrik', '', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Bantuan Listrik Pedesaan				</p>				<iframe src=\"/esdm/assets/pdf/dist_lisdes_2015.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/dist_lisdes_2015.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(40, 'Direktori Pembangkit Listrik', '', 'data-direktori', '', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">			</div>	<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Tenaga Listrik</h1>				<p class=\"lead text-white\">					Direktori Pembangkit Listrik (Captive Power)				</p>				<iframe src=\"/esdm/assets/pdf/captive_power.pdf\" type=\"application/pdf\" width=\"750px\" height=\"600px\"></iframe>			<a href=\"/esdm/assets/pdf/captive_power.pdf\" class=\"btn btn-white btn-primary\">Download File</a>				</div>		</div>	</div></section>', '', '', 'home'),
(41, 'Galeri', '', 'gallery', 'frontend', 'null', '<section class=\"hero-divider\">	<div class=\"background-image-holder overlay\">		<img class=\"background-image\" alt=\"Galeri\" src=\"/esdm/assets/img/galeri/11.jpg\">	</div>	<div class=\"video-wrapper\">		<video autoplay=\"\" muted=\"\" loop=\"\">			<img src=\"/esdm/assets/img/galeri/11.jpg\" title=\"Galeri\">		</video>	</div>		<div class=\"container\">		<div class=\"row\">				<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				<h1 class=\"text-white\">Galeri</h1>				<p class=\"lead text-white\">					ESDM				</p>				<a href=\"/esdm/page/gallery-photo\" class=\"btn btn-white btn-primary\">Foto</a>			<a href=\"/esdm/page/gallery-video\" class=\"btn btn-white btn-primary\">Video</a>				</div>		</div>	</div></section>', '', '', 'home'),
(45, 'Foto', '', 'gallery-photo', 'frontend', 'null', '<section class=\"hero-divider\"> 	<div class=\"background-image-holder overlay\">			 	</div>	 	<div class=\"container\">	 	<div class=\"row\">				 	<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\">				 	<h1 class=\"text-white\">Galeri ESDM</h1>				 	<p class=\"lead text-white\">					Foto				</p> 	<div id=\"frame-image\"> 	<div class=\"gallery\">     <div class=\"img\">     <a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/banner_2017.jpg\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/banner_2017.jpg\" alt=\"\"/></a>     <a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/Profil.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto Esdm\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/Profil.png\" alt=\"\" /></a>     <a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/sinergi_new_team.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/sinergi_new_team.png\" alt=\"\" /></a> 	<a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/sinergi_new_team.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/sinergi_new_team.png\" alt=\"\" /></a> 	<a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/sinergi_new_team.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/sinergi_new_team.png\" alt=\"\" /></a> 	<a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/sinergi_new_team.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/sinergi_new_team.png\" alt=\"\" /></a> 	<a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/sinergi_new_team.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/sinergi_new_team.png\" alt=\"\" /></a> 	<a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/sinergi_new_team.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/sinergi_new_team.png\" alt=\"\" /></a> 	<a class=\"gallery-image-link\" href=\"/esdm/assets/img/galeri/sinergi_new_team.png\" data-lightbox=\"gallery-set\" data-title=\"Galeri foto ESDM - New Team Sinergi Buletin\"><img style=\"border:2px solid white; width:200px; height:140px; margin:5px 5px;\" class=\"img-rounded\" src=\"/esdm/assets/img/galeri/sinergi_new_team.png\" alt=\"\" /></a> 	</div>		</div>	</div> </section>', '', '', 'home'),
(46, 'Video', '', 'gallery-video', 'frontend', 'null', '	<html> <head> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> <style> video {     width: 100%;     height: auto; } </style> </head> <body>  <section class=\"hero-divider\"> 	<div class=\"background-image-holder overlay\"> 	</div>	 <div class=\"container\">		 	<div class=\"row\">				 	<div class=\"col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 text-center\"> 	<h1 class=\"text-white\">Galeri ESDM</h1>				 	<p class=\"lead text-white\">					video				</p> 	<h6 class=\"text-white\" style=\"margin: 20px 0px\"><strong>Galeri video ESDM - Headline</strong></h6> 	<video width=\"480\" controls>   <source src=\"/esdm/assets/video/video.mp4\" type=\"video/mp4\">   <source src=\"/esdm/assets/video/video.ogg\" type=\"video/ogg\">    </video>  <p class=\"text-white\" style=\"background:#E74C3C; padding: 15px; margin: 10px 0px; text-align: justify; line-height: 23px;\">Caption.....</p>  <h6 class=\"text-white\" style=\"margin: 20px 0px\"><strong>Galeri video ESDM - Headline</strong></h6> <video width=\"480\" controls>   <source src=\"/esdm/assets/video/video.webm\" type=\"video/webm\">   <source src=\"/esdm/assets/video/video.ogg\" type=\"video/ogg\">    </video> <p class=\"text-white\" style=\"background:#E74C3C; padding: 15px; margin: 10px 0px; text-align: justify; line-height: 23px;\">Caption.....</p> </div>		</div>	</div></section>  </body> </html>', '', '', 'home'),
(47, 'Lokasi', '', 'maps', 'frontend', 'null', '<section class=\"map-overlay\">\n	<div class=\"container\">\n	\n			\n		\n		<iframe src=\"https://www.google.com/maps/embed/v1/search?key=AIzaSyAiS3E80BWNpmGb2mny9xpMoq2YAoYJAB4&q=Dinas+Energi+%26+Sumber+Daya+Mineral+Provinsi+Jawa+Barat\" frameborder=\"0\" style=\"overflow:hidden;height:300px;width:100%\" height=\"300px\" width=\"100%\"></iframe>\n		\n	</div>\n</section>', '', '', 'home'),
(48, 'FAQ', '', 'faq', 'frontend', 'null', '', '', '', 'home');

-- --------------------------------------------------------

--
-- Table structure for table `running_text`
--

CREATE TABLE `running_text` (
  `id` int(11) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `waktu_publish` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `waktu_berakhir` datetime DEFAULT NULL,
  `gambar` varchar(100) NOT NULL,
  `status` enum('publish','hidden') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `running_text`
--

INSERT INTO `running_text` (`id`, `content`, `waktu_publish`, `waktu_berakhir`, `gambar`, `status`, `id_user`) VALUES
(1, 'test', '2017-06-11 16:07:27', NULL, '', 'publish', 3),
(2, 'running text 2', '2017-06-26 17:00:00', NULL, '', 'publish', 3);

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

CREATE TABLE `table` (
  `id_table` int(11) NOT NULL,
  `table_name` varchar(150) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `required` text NOT NULL,
  `columns` text NOT NULL,
  `field` text NOT NULL,
  `uploads` text NOT NULL,
  `relation_1` text NOT NULL,
  `action` text NOT NULL,
  `breadcrumb` text NOT NULL,
  `table_config` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(225) NOT NULL,
  `salt` varchar(225) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) NOT NULL,
  `forgotten_password_code` varchar(40) NOT NULL,
  `forgotten_password_time` int(11) NOT NULL,
  `remember_code` varchar(40) NOT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `active` int(1) NOT NULL,
  `full_name` varchar(225) NOT NULL,
  `photo` varchar(225) NOT NULL,
  `additional` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `full_name`, `photo`, `additional`) VALUES
(1, '127.0.0.1', 'tatsuya', '$2y$08$bwAOnXFPuQyXn19i5OWzAu.8tvLztzP10gcQSA2F.gfsVove9bEmi', '', 'allrested@gmail.com', '', '', 0, 'ObxLzi2nSy4b/P8msG0Nau', 1492366695, 1494566375, 1, 'Tatsuya', '19886-44709.jpg', ''),
(2, '127.0.0.1', 'member', '$2y$08$0wId8k6W86c1vfsiTuQlaOWhlMCeWdUEsPEa4VFNYGy9bNxTIn0qW', '', 'member@member.com', '', '', 0, '', 1441451078, 1491368726, 1, 'Member', '', ''),
(3, '127.0.0.1', 'admin', '$2y$08$vfzy7.d3u6fAyfkTgmmx8eUOi4ZQMQPJqIwYFyMV50c.8YOrq6gWa', '', 'admin@admin.com', '', '', 0, '5juBcNrY4DujF/ctCtbkc.', 1268889823, 1498742842, 1, 'Administrator', 'c77da-b9d76-avatar04.png', ''),
(4, '::1', 'zulfar-3', '$2y$08$qcLOMkKA2IuotmHtcZBw8e0DGW7DhHjgfPkmb2or8GiFQcdwOusZS', '', 'zulfar@sisi.id', '', '', 0, '', 1496933399, 1496933400, 1, 'Zulfar', '', ''),
(5, '::1', 'test-4', '$2y$08$vfzy7.d3u6fAyfkTgmmx8eUOi4ZQMQPJqIwYFyMV50c.8YOrq6gWa', '', 'test@gmail.com', '', '', 0, '', 1497201001, 1497201002, 1, 'test', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(4, 2, 2),
(8, 1, 1),
(11, 3, 3),
(12, 4, 2),
(13, 5, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_comment_count`
-- (See below for the actual view)
--
CREATE TABLE `v_comment_count` (
`id_blog` int(11)
,`comment_id` int(11)
,`total_comment` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `v_comment_count`
--
DROP TABLE IF EXISTS `v_comment_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_comment_count`  AS  select `b`.`id_blog` AS `id_blog`,`c`.`comment_id` AS `comment_id`,count(`c`.`comment_id`) AS `total_comment` from (`blog` `b` left join `comment` `c` on((`c`.`id_blog` = `b`.`id_blog`))) where ((`c`.`id_blog` is not null) and (`c`.`comment_id` is not null)) group by `b`.`id_blog` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id_api`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id_blog`);

--
-- Indexes for table `categories_blogs`
--
ALTER TABLE `categories_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id_menu_type`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id_page`);

--
-- Indexes for table `running_text`
--
ALTER TABLE `running_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id_table`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id_api` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id_blog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `categories_blogs`
--
ALTER TABLE `categories_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id_menu_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id_page` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `running_text`
--
ALTER TABLE `running_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `table`
--
ALTER TABLE `table`
  MODIFY `id_table` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
