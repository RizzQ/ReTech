class History {

  final String? id_siswa;
  final String? nama_mapel;
  final String? img_mapel;
  final String? nama_materi;
  final String? nama_bab;
  final String? created_date;
  final String? nilai;
  final String? tanggal_pengerjaan;
  final String? jumlah_soal;

  History({this.id_siswa, this.nama_mapel, this.img_mapel, this.nama_materi, this.nama_bab, this.created_date, this.nilai, this.tanggal_pengerjaan, this.jumlah_soal});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id_siswa: json['id_siswa'],
      nama_mapel: json['nama_mapel'],
      img_mapel: json['img_mapel'],
      nama_materi: json['nama_materi'],
      nama_bab: json['nama_bab'],
      created_date: json['created_date'],
      nilai: json['nilai'],
      tanggal_pengerjaan: json['tanggal_pengerjaan'],
      jumlah_soal: json['jumlah_soal'],
    );
  }
}