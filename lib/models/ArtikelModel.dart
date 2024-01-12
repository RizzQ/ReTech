class Artikel {

  final String? id_artikel;
  final String? nama_artikel;
  final String? img_artikel;
  final String? file_artikel;
  final String? keterangan_artikel;
  final String? penulis_artikel;
  final String? tanggal_rilis_artikel;
  final String? created_by;
  final String? created_date;
  final String? modify_by;
  final String? modify_date;

  Artikel({this.id_artikel, this.nama_artikel, this.img_artikel, this.file_artikel, this.keterangan_artikel, this.penulis_artikel, this.tanggal_rilis_artikel, this.created_by, this.created_date, this.modify_by, this.modify_date});

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
      id_artikel: json['id_artikel'],
      nama_artikel: json['nama_artikel'],
      img_artikel: json['img_artikel'],
      file_artikel: json['file_artikel'],
      keterangan_artikel: json['keterangan_artikel'],
      penulis_artikel: json['penulis_artikel'],
      tanggal_rilis_artikel: json['tanggal_rilis_artikel'],
      created_by: json['created_by'],
      created_date: json['created_date'],
      modify_by: json['modify_by'],
      modify_date: json['modify_date'],
    );
  }
}