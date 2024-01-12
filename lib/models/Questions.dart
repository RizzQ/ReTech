class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Apakah tujuan dari mengklasifikasi makhluk hidup adalah? ",
    "options": ['Mempermudah mengenal makhluk hidup', 'Mempercepat mengenal makhluk hidup', 'pengenalan makhluk hidup', 'Mempermudah pengenalan makhluk hidup'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Sebuah sistem yang memudahkan untuk mempelajari dan mengenal makhluk hidup di kenal dengan?",
    "options": ['Sistem Klasifikasi', 'Proses Klasifikasi', 'Taksonomi', 'Monotom fitogami'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Apakah tujuan dari mengklasifikasi makhluk hidup adalah?",
    "options": ['Mempermudah mengenal makhluk hidup', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
];