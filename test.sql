
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `detail_surat` (
  `id_detail_surat` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengajuan_surat` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `agama` varchar(20) NOT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `keperluan` text NOT NULL,
  `status_pernikahan` enum('Belum Menikah','Menikah','Duda','Janda') DEFAULT NULL,
  `jenis_usaha` varchar(255) DEFAULT NULL,
  `status_tanah` varchar(255) DEFAULT NULL,
  `luas_tanah` decimal(10,2) DEFAULT NULL,
  `letak_tanah` text,
  `status_kepemilikan` enum('Pribadi','Warisan','Hak Guna','Sewa') DEFAULT NULL,
  `bukti_kepemilikan` varchar(255) DEFAULT NULL,
  `batas_utara` varchar(255) DEFAULT NULL,
  `batas_selatan` varchar(255) DEFAULT NULL,
  `batas_timur` varchar(255) DEFAULT NULL,
  `batas_barat` varchar(255) DEFAULT NULL,
  `file_pendukung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_detail_surat`),
  FOREIGN KEY (`id_pengajuan_surat`) REFERENCES `pengajuan_surat`(`id_pengajuan_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `jenis_surat` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(100) NOT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `pengajuan_surat` (
  `id_pengajuan_surat` int(11) NOT NULL AUTO_INCREMENT,
  `id_warga` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `status` enum('Menunggu Verifikasi','Diproses','Siap Diambil','Ditolak') DEFAULT 'Menunggu Verifikasi',
  `alasan_penolakan` text,
  `tanggal_pengajuan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_selesai` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengajuan_surat`),
  FOREIGN KEY (`id_warga`) REFERENCES `warga`(`id_warga`),
  FOREIGN KEY (`id_jenis`) REFERENCES `jenis_surat`(`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `warga` (
  `id_warga` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_dusun` int(11) DEFAULT NULL,
  `desa` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kabupaten` varchar(100) NOT NULL,
  PRIMARY KEY (`id_warga`),
  FOREIGN KEY (`id_dusun`) REFERENCES `dusun`(`id_dusun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dusun` (
  `id_dusun` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dusun` varchar(100) NOT NULL,
  PRIMARY KEY (`id_dusun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `banner` (
  `id_banner` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `keterangan` text,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_banner`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` date NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_berita`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `galery` (
  `id_galery` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(255) NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_galery`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kegiatan` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_kegiatan`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `kontak` (
  `id_kontak` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subjeck` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('baru','dibaca') DEFAULT 'baru',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kontak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `misi` (
  `id_misi` int(11) NOT NULL AUTO_INCREMENT,
  `isi` text NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_misi`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `visi` (
  `id_visi` int(11) NOT NULL AUTO_INCREMENT,
  `isi` text NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_visi`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_pengumuman`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `potensi_desa` (
  `id_potensi_desa` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(255) NOT NULL,
  `keterangan` text,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_potensi_desa`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sejarah` (
  `id_sejarah` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_sejarah`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `struktur` (
  `id_struktur` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_struktur`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `umkm_desa` (
  `id_umkm` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id_umkm`),
  FOREIGN KEY (`id_admin`) REFERENCES `admin`(`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

