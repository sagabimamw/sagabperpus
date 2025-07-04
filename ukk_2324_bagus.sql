-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Mar 2024 pada 06.42
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_2324_bagus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `bukuID` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`bukuID`, `judul`, `penulis`, `penerbit`, `tahun_terbit`) VALUES
(5, 'SUNGAI padang', 'andrea bagus', 'nuva', 2000),
(7, 'teori anunnaki', 'Bagus suryo', 'Harper Collins', 2025),
(9, 'relaktivitas daya atom', 'maherzain', 'Harper Collins', 2019),
(10, 'matematika minat', 'ahmad sayuti', 'Inter Media', 2026),
(23, ' BUKU SAKTI SNBT', 'ahmad sayuti', 'Pustaka ilmu', 2016),
(30, 'KISAH SOEKARNO', 'Buya hamka', 'Harper Collins', 1991),
(41, 'testUkom', 'bagus', 'smk terput', 2024),
(43, 'who am i', 'benjamin', 'oiver sayks', 2018),
(45, 'ukom', 'benjamin', 'smk terput', 2019),
(46, 'uji', 'bagus', 'smk terput', 2019),
(48, 'tes hosting apk', 'james', 'nuva', 2021),
(50, 'tes aja', 'N.H. dini', 'Inter Media', 2023);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `kategoriID` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`kategoriID`, `nama_kategori`,) VALUES
(2, 'Fiksi'),
(3, 'Novel'),
(4, 'Majalah'),
(5, 'Komik'),
(6, 'Manga'),
(7, 'Biografi'),
(8, 'Naskah'),
(9, 'Ensiklopedia'),
(10, 'Non Fiksi'),
(11, 'KARANGAN'),
(13, 'Cerita Rakyat'),
(16, 'cerita ramah'),
(19, 'ILMIAH'),
(20, 'test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `kategoribukuID` int(11) NOT NULL,
  `bukuID` int(11) NOT NULL,
  `kategoriID`
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategoribuku_relasi`
--

INSERT INTO `kategoribuku_relasi` (`kategoribukuID`, `bukuID`, `kategoriID`) VALUES
(5, 5, 3),
(20, 30, 7),
(51, 9, 19),
(61, 23, 13),
(62, 23, 19),
(64, 41, 20),
(67, 43, 20),
(69, 48, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `koleksiID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `bukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `koleksipribadi`
--

INSERT INTO `koleksipribadi` (`koleksiID`, `userID`, `bukuID`) VALUES
(46, 13, 9),
(47, 31, 10),
(49, 12, 5),
(56, 12, 23),
(57, 12, 7),
(59, 12, 10),
(60, 13, 10),
(61, 31, 41),
(62, 37, 5),
(63, 37, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `peminjamanID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `bukuID` int(11) NOT NULL,
  `tanggal_peminjam` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `status_peminjaman` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`peminjamanID`, `userID`, `bukuID`, `tanggal_peminjam`, `tanggal_pengembalian`, `status_peminjaman`) VALUES
(25, 6, 5, '2024-02-15', '2024-02-17', 'lunas'),
(41, 12, 9, '2024-02-16', '2024-02-22', 'lunas'),
(61, 31, 10, '2024-02-08', '2024-02-10', '2 hari'),
(63, 13, 9, '2024-03-04', '2024-03-06', '2 hari'),
(64, 31, 9, '2024-03-04', '2024-03-06', '2 hari'),
(67, 12, 43, '2024-03-05', '2024-03-07', '2 hari');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `ulasanID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `bukuID` int(11) NOT NULL,
  `ulasan` text NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ulasanbuku`
--

INSERT INTO `ulasanbuku` (`ulasanID`, `userID`, `bukuID`, `ulasan`, `rating`) VALUES
(20, 12, 30, 'biasa saja', 7),
(22, 6, 7, 'bagus', 8),
(26, 31, 10, 'bagus', 8),
(27, 13, 9, 'sangat bagus', 10),
(29, 12, 23, 'bagus', 8),
(31, 12, 10, 'sulit di mengerti', 5),
(32, 31, 7, 'bagus', 8),
(33, 31, 43, 'bagus', 8),
(35, 12, 43, 'bagus', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `email`, `nama_lengkap`, `alamat`, `status`) VALUES
(2, 'bagus', '202cb962ac59075b964b07152d234b70', 'ww@gmail.com', 'ww', 'zamrud', 'ADMIN'),
(6, 'arya adhari', '202cb962ac59075b964b07152d234b70', 'adhari@gmail.com', 'adhari', 'kelapa gading', 'PEMINJAM'),
(12, 'radinramadan', '202cb962ac59075b964b07152d234b70', 'radin@gmail.com', 'radinramadan', 'amerika', 'PEMINJAM'),
(13, 'farid putra santoso', '202cb962ac59075b964b07152d234b70', 'faridputra@gmail.com', 'farid putra santoso', 'grand resident', 'PEMINJAM'),
(21, 'petugas', '202cb962ac59075b964b07152d234b70', 'hamas@gmail.com', 'babeh', 'terput 04', 'PETUGAS'),
(30, 'rafa fadillah lubis', '202cb962ac59075b964b07152d234b70', 'RAFA@gmail.com', 'RAFA FADILLAH LUBIS', 'puyuh 03', 'PEMINJAM'),
(31, 'adit putra juari', '202cb962ac59075b964b07152d234b70', 'ahdit@gmail.com', 'Adit putra juari', 'Dukuh zamrud blok I', 'PEMINJAM'),
(35, 'akmalrais', '202cb962ac59075b964b07152d234b70', 'akmal@gmail.com', 'akmalrais', 'denmark', 'PEMINJAM'),
(36, 'tes', '202cb962ac59075b964b07152d234b70', 'tesukom@gmail.com', 'tes', 'Kanjuruhan', 'PETUGAS'),
(37, 'wawat rusmawati', '202cb962ac59075b964b07152d234b70', 'wawat@gmail.com', 'wawat rusmawati', 'dukuh zamrud', 'PEMINJAM'),
(38, 'aksa', '202cb962ac59075b964b07152d234b70', 'aksa@gmail.com', 'aksa wijaya', 'bkkbn no 1', 'PEMINJAM'),
(39, 'admin01', 'bcbe3365e6ac95ea2c0343a2395834dd', 'admin@gmail.com', 'admin01', 'ss', 'ADMIN'),
(40, 'set7', '202cb962ac59075b964b07152d234b70', 'testi@gmail.com', 'set7', 'ss', 'ADMIN');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`bukuID`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Indeks untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`kategoribukuID`),
  ADD KEY `bukuID` (`bukuID`) USING BTREE,
  ADD KEY `kategoriID` (`kategoriID`) USING BTREE;

--
-- Indeks untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`koleksiID`),
  ADD KEY `userID` (`userID`) USING BTREE,
  ADD KEY `bukuID` (`bukuID`) USING BTREE;

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`peminjamanID`),
  ADD KEY `userID` (`userID`,`bukuID`),
  ADD KEY `bukuID` (`bukuID`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`ulasanID`),
  ADD KEY `userID` (`userID`) USING BTREE,
  ADD KEY `bukuID` (`bukuID`) USING BTREE;

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `bukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `kategoribukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `koleksiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `peminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `ulasanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_1` FOREIGN KEY (`bukuID`) REFERENCES `buku` (`bukuID`),
  ADD CONSTRAINT `kategoribuku_relasi_ibfk_2` FOREIGN KEY (`kategoriID`) REFERENCES `kategoribuku` (`kategoriID`);

--
-- Ketidakleluasaan untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `koleksipribadi_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `buku` (`bukuID`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `buku` (`bukuID`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `buku` (`bukuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
