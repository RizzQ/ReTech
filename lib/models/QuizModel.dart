class Question {
  String? id_soal,
      id_bab,
      no_soal,
      pertanyaan,
      jawaban_a,
      jawaban_b,
      jawaban_c,
      jawaban_d,
      jawaban_benar;

  Question({
    this.id_soal,
    this.id_bab,
    this.no_soal,
    this.pertanyaan,
    this.jawaban_a,
    this.jawaban_b,
    this.jawaban_c,
    this.jawaban_d,
    this.jawaban_benar,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id_soal: json['id_soal'],
      id_bab: json['id_bab'],
      no_soal: json['no_soal'],
      pertanyaan: json['pertanyaan'],
      jawaban_a: json['jawaban_a'],
      jawaban_b: json['jawaban_b'],
      jawaban_c: json['jawaban_c'],
      jawaban_d: json['jawaban_d'],
      jawaban_benar: json['jawaban_benar'],
    );
  }
}

const List sample_data = [
  {
    "id": 1,
    "question": "Apakah tujuan dari mengklasifikasi makhluk hidup adalah? ",
    "options": [
      'Mempermudah mengenal makhluk hidup',
      'Mempercepat mengenal makhluk hidup',
      'pengenalan makhluk hidup',
      'Mempermudah pengenalan makhluk hidup'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question":
        "Sebuah sistem yang memudahkan untuk mempelajari dan mengenal makhluk hidup di kenal dengan?",
    "options": [
      'Sistem Klasifikasi',
      'Proses Klasifikasi',
      'Taksonomi',
      'Monotom fitogami'
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Apakah tujuan dari mengklasifikasi makhluk hidup adalah?",
    "options": ['Mempermudah mengenal makhluk hidup', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
];
