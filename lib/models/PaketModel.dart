class Paket {

  final String? id_paket_header;
  final String? nama_paket;
  final String? kelas_paket;
  final String? gambar_paket;
  final String? harga_paket;
  final String? keterangan_paket;
  final String? created_by;
  final String? created_date;
  final String? modify_by;
  final String? modify_date;

  Paket({this.id_paket_header, this.nama_paket, this.kelas_paket, this.gambar_paket, this.harga_paket, this.keterangan_paket, this.created_by, this.created_date, this.modify_by, this.modify_date});

  factory Paket.fromJson(Map<String, dynamic> json) {
    return Paket(
      id_paket_header: json['id_paket_header'],
      nama_paket: json['nama_paket'],
      kelas_paket: json['kelas_paket'],
      gambar_paket: json['gambar_paket'],
      harga_paket: json['harga_paket'],
      keterangan_paket: json['keterangan_paket'],
      created_by: json['created_by'],
      created_date: json['created_date'],
      modify_by: json['modify_by'],
      modify_date: json['modify_date'],
    );
  }
}