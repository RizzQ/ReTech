class Promo {

  final String? id_promo;
  final String? nama_promo;
  final String? kelas_promo;
  final String? img_promo;
  final String? keterangan_promo;
  final String? created_by;
  final String? created_date;
  final String? modify_by;
  final String? modify_date;

  Promo({this.id_promo, this.nama_promo, this.kelas_promo, this.img_promo, this.keterangan_promo, this.created_by, this.created_date, this.modify_by, this.modify_date});

  factory Promo.fromJson(Map<String, dynamic> json) {
    return Promo(
      id_promo: json['id_promo'],
      nama_promo: json['nama_promo'],
      kelas_promo: json['kelas_promo'],
      img_promo: json['gambar_promo'],
      keterangan_promo: json['keterangan_promo'],
      created_by: json['created_by'],
      created_date: json['created_date'],
      modify_by: json['modify_by'],
      modify_date: json['modify_date'],
    );
  }
}