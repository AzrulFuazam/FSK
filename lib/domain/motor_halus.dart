import 'package:flutter/material.dart';
import 'package:fsk/domain/adl/adl1.dart';

class motorHalus extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Motor Halus'),
        centerTitle: true,
        backgroundColor: Color(0XFF40E0D0),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Text(
            "Penilaian Motor Halus dan Kemahiran Pra-Menulis ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Text(
            "Penilaian ini merangkumi item perkembangan motor halus dan kemahiran pra-menulis kanak-kanak berumur 0 hingga 6 tahun. Item yang disenaraikan di bawah merupakan antara kemahiran yang secara umumnya sudah boleh dijalankan atau sudah mula muncul dalam skala kemahiran kanak-kanak pada tahap usia yang dinyatakan. ",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 16),
          Text(
            "Arahan :",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Text(
            "Ibu bapa/penjaga diminta untuk menilai kemahiran/keupayaan anak dan meletakkan indikasi pada ruangan “Tanda” berdasarkan indikasi yang disenaraikan dibawah.",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 16),
          Text(
            "Indikasi :",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: {1: FlexColumnWidth(3)},
            children: [
              TableRow(children: [
                Text(' /'),
                Text(' Capai'),
              ]),
              TableRow(children: [
                Text(' X'),
                Text(' Belum Tercapai'),
              ]),
              TableRow(children: [
                Text(' -'),
                Text(' Tidak Pasti/Tidak Dapat  Dinilai'),
              ]),
              TableRow(children: [
                Text(' TB'),
                Text(' Tidak Berkenaan'),
              ]),
            ],
          ),
          const SizedBox(height: 30),
          // ElevatedButton(
          //  style: TextButton.styleFrom(backgroundColor: Color(0XFF40E0D0)),
          //onPressed: () {
          //Navigator.push(
          //    context, MaterialPageRoute(builder: (context) => null));
          //  },
          // child: Text("Teruskan"),
          // )
        ],
      ));
}
