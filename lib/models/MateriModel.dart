class MateriModel {

  final String? id_materi;
  final String? id_mapel;
  final String? nama_materi;
  final String? no_materi;
  final String? penulis_materi;
  final String? tanggal_rilis_materi;
  final String? created_by;
  final String? created_date;
  final String? modify_by;
  final String? modify_date;

  MateriModel({this.id_materi, this.id_mapel, this.nama_materi, this.no_materi, this.penulis_materi, this.tanggal_rilis_materi, this.created_by, this.created_date, this.modify_by, this.modify_date});

  factory MateriModel.fromJson(Map<String, dynamic> json) {
    return MateriModel(
      id_materi: json['id_materi'],
      id_mapel: json['id_mapel'],
      nama_materi: json['nama_materi'],
      no_materi: json['no_materi'],
      penulis_materi: json['keterangan_mapel'],
      tanggal_rilis_materi: json['tanggal_rilis_materi'],
      created_by: json['created_by'],
      created_date: json['created_date'],
      modify_by: json['modify_by'],
      modify_date: json['modify_date'],
    );
  }
}