tabel guru

CREATE TABLE guru 
(
  nip INTEGER NOT NULL AUTO_INCREMENT,
  nama_guru VARCHAR(30) NOT NULL,
  alamat_guru VARCHAR(100) NOT NULL,
  no_telp VARCHAR(15),
  email_guru VARCHAR(35),
  username_guru VARCHAR(15),
  password_guru VARCHAR(100),
  
  CONSTRAINT pk_nip PRIMARY KEY (nip)
)ENGINE=INNODB;

==============================
tabel siswa

CREATE TABLE siswa 
(
  nis INTEGER NOT NULL AUTO_INCREMENT,
  nama_siswa VARCHAR(30) NOT NULL,
  alamat_siswa VARCHAR(100) NOT NULL,
  no_telp VARCHAR(15),
  email_siswa VARCHAR(35),
  username_siswa VARCHAR(15),
  password_siswa VARCHAR(100),
  
  CONSTRAINT pk_nis PRIMARY KEY (nis)
)ENGINE=INNODB

====================================
tabel pengumuman

CREATE TABLE pengumuman 
(
  kode_pengumuman INTEGER NOT NULL AUTO_INCREMENT,
  nama_pengumuman VARCHAR(30) NOT NULL,
  tgl_pengumuman DATETIME NOT NULL,
  nip INTEGER,
  
  CONSTRAINT pk_kodepengumuman PRIMARY KEY (kode_pengumuman),
  CONSTRAINT fk_nippengumuman FOREIGN KEY (nip) REFERENCES guru(nip)
)ENGINE=INNODB

=======================================
tabel kelas

CREATE TABLE kelas_online 
(
  kode_kelas_online INTEGER NOT NULL AUTO_INCREMENT,
  nama_kelas VARCHAR(30) NOT NULL,
  nip INTEGER,
  
  CONSTRAINT pk_kodekelas PRIMARY KEY (kode_kelas_online),
  CONSTRAINT fk_nipkelas FOREIGN KEY (nip) REFERENCES guru(nip)
)ENGINE=INNODB

============================================
tabel pengumuman kelas

CREATE TABLE pengumuman_kelas 
(
  kode_pengumuman INTEGER NOT NULL AUTO_INCREMENT,
  nama_pengumuman VARCHAR(30) NOT NULL,
  tgl_pengumuman DATETIME NOT NULL,
  kode_kelas_online INTEGER,
  
  CONSTRAINT pk_kodepengumumankelas PRIMARY KEY (kode_pengumuman),
  CONSTRAINT fk_kelaspengumuman FOREIGN KEY (kode_kelas_online) REFERENCES kelas_online(kode_kelas_online)
)ENGINE=INNODB


===================================
tabel materi

CREATE TABLE materi 
(
  kode_materi INTEGER NOT NULL AUTO_INCREMENT,
  nama_materi VARCHAR(30) NOT NULL,
  tgl_unggah DATETIME NOT NULL,
  kode_kelas_online INTEGER,
  
  CONSTRAINT pk_kodemateri PRIMARY KEY (kode_materi),
  CONSTRAINT fk_kelasmateri FOREIGN KEY (kode_kelas_online) REFERENCES kelas_online(kode_kelas_online)
)ENGINE=INNODB

======================================
tabel siswa kelas ONLINE

CREATE TABLE siswa_kelas 
(
  kode_peserta INTEGER NOT NULL AUTO_INCREMENT,
  nis INTEGER NOT NULL,
  kode_kelas_online INTEGER,
  
  CONSTRAINT pk_kodepeserta PRIMARY KEY (kode_peserta),
  CONSTRAINT fk_niskelas FOREIGN KEY (nis) REFERENCES siswa(nis),
  CONSTRAINT fk_kelassiswa FOREIGN KEY (kode_kelas_online) REFERENCES kelas_online(kode_kelas_online)
)ENGINE=INNODB



