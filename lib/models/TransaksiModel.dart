class Transaksi {

  final String? id_paket_siswa;
  final String? id_siswa;
  final String? tanggal_pembayaran;
  final String? status;
  final String? amount;
  final String? expired_date;
  final String? id_paket_header;
  final String? created_by;
  final String? created_date;
  final String? modify_by;
  final String? modify_date;
  final String? virtual_account;
  final String? nama_bank;
  final String? nama_paket;

  Transaksi({this.id_paket_siswa, this.id_siswa, this.tanggal_pembayaran, this.status, this.amount, this.expired_date, this.id_paket_header, this.created_by, this.created_date, this.modify_by, this.modify_date, this.virtual_account, this.nama_bank, this.nama_paket});

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      id_paket_siswa: json['id_paket_siswa'],
      id_siswa: json['id_siswa'],
      tanggal_pembayaran: json['tanggal_pembayaran'],
      status: json['status'],
      amount: json['amount'],
      expired_date: json['expired_date'],
      id_paket_header: json['tanggal_rilis_artikel'],
      created_by: json['created_by'],
      created_date: json['created_date'],
      modify_by: json['modify_by'],
      modify_date: json['modify_date'],
      virtual_account: json['virtual_account'],
      nama_bank: json['nama_bank'],
      nama_paket: json['nama_paket'],
    );
  }
}