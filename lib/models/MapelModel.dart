class Mapel {

  final String? id_mapel;
  final String? nama_mapel;
  final String? img_mapel;
  final String? keterangan_mapel;
  final String? created_by;
  final String? created_date;
  final String? modify_by;
  final String? modify_date;

  Mapel({this.id_mapel, this.nama_mapel, this.img_mapel, this.keterangan_mapel, this.created_by, this.created_date, this.modify_by, this.modify_date});

  factory Mapel.fromJson(Map<String, dynamic> json) {
    return Mapel(
      id_mapel: json['id_mapel'],
      nama_mapel: json['nama_mapel'],
      img_mapel: json['img_mapel'],
      keterangan_mapel: json['keterangan_mapel'],
      created_by: json['created_by'],
      created_date: json['created_date'],
      modify_by: json['modify_by'],
      modify_date: json['modify_date'],
    );
  }
}