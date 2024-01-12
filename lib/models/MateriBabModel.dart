class MateriBabModel {

  final String? id_bab;
  final String? id_materi;
  final String? nama_bab;
  final String? no_bab;
  final String? file_bab;
  final String? created_by;
  final String? created_date;
  final String? modify_by;
  final String? modify_date;

  MateriBabModel({this.id_bab, this.id_materi, this.nama_bab, this.no_bab, this.file_bab, this.created_by, this.created_date, this.modify_by, this.modify_date});

  factory MateriBabModel.fromJson(Map<String, dynamic> json) {
    return MateriBabModel(
      id_bab: json['id_bab'],
      id_materi: json['id_materi'],
      nama_bab: json['nama_bab'],
      no_bab: json['no_bab'],
      file_bab: json['file_bab'],
      created_by: json['created_by'],
      created_date: json['created_date'],
      modify_by: json['modify_by'],
      modify_date: json['modify_date'],
    );
  }
}