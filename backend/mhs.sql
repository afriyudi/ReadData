CREATE TABLE `mhs` (
  `nim` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kelas` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `kdmatkul` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `mhs` (`nim`, `nama`, `kelas`, `kdmatkul`, `email`) VALUES
('171410064', 'Vidya Octavianti', 'SI7K', '001', 'vidyaoctavianti2@gmail.com'),
('171410119', 'M. Idzha Adhitya Ranius', 'SI7K', '001', 'idzhaadhityaranius@gmail.com'),
('171410179', 'R. M. Rizki Fauzan', 'SI7K', '001', 'fauzanrizky399@gmail.com');


ALTER TABLE `mhs`
  ADD PRIMARY KEY (`nim`);
