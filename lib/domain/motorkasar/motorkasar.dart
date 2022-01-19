import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fsk/domain/motorkasar/motorkasarquestion.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fsk/domain/motorkasar/introslider_motorkasar.dart';

List list = List.empty(growable: true);
List<Question> Quest = List.generate(
    79,
    (index) => Question(
        ImageList[index], time[index], WENTI[index], Respondstanda[index]));

List<String> ImageList = [
  "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];

List<String> WENTI = [
  'Memberi respon apabila pipi atau tepi mulutnya disentuh atau diusap (contoh: berpaling ke arah sentuhan',
  'Membuka tangan daripada posisi mengenggam',
  'Terkejut apabila disergah atau mendengar bunyi yang kuat. ',
  'Membawa tangan ke mulut dan menghisap jari. ',
  'Mengangkat dan menahan kepala ke atas apabila diletakkan dalam posisi meniarap ',
  'Menolak/menahan badan/dada dengan kedua-dua lengan ketika diposisikan secara meniarap', //
  'Berpusing dan bergolek dari posisi baring secara meniarap ke posisi terlentang.',
  'Menjangkau dan mencapai objek/alat permainan dengan menggunakan tangan kanan atau kiri. ',
  'Memindahkan objek/alat permainan dari satu tangan ke tangan yang lain.',
  'Duduk dengan sokongan (contoh: duduk di kerusi, dengan bantal diletakkan sebagai sokongan) sekurang-kurangnya 1 minit bersama kawalan kepala yang bagus.',
  'Mencapai kaki dengan kedua-dua belah tangan ketika baring dalam posisi terlentang. ',
  'Menggunakan tangan untuk menyokong diri semasa duduk.',
  'Bergerak kehadapan dengan merangkak, merayap atau dengan kaedah lain.', //
  'Duduk dengan sendiri tanpa bantuan atau sokongan. ',
  'Berdiri dengan memaut pada objek (contoh: berpaut pada kerusi untuk bangun berdiri). 		',
  'Meniarap, menelentang dan cuba untuk merangkak.',
  'Berdiri tanpa bantuan atau sokongan sekurang-kurangnya 1 minit. ',
  'Bergerak dari posisi duduk kepada posisi merangkak.',
  'Berjalan dua atau tiga langkah tanpa bantuan. ',
  'Membongkok atau mencangkung untuk mengambil objek/alat permainan di lantai .', //
  'Mula untuk berjalan dengan keseimbangan badan yang baik, mungkin kelihatan sedikit janggal, namun kurang terjatuh/hilang keseimbangan ketika berjalan.',
  'Menendang bola ketika dalam posisi berdiri.',
  'Berjalan menaiki tangga dengan bantuan (contoh: dengan memegang pada rel tangga).',
  'Berjalan jauh lebih dari jarak 50 kaki tanpa berasa letih dan tanpa bantuan. ',
  'Berjalan menuruni tangga dengan bantuan (Contoh: dengan memegang pada rel tangga).',
  'Melompat ke hadapan dengan kedua-dua kaki sekurang-kurangnya 3 kali tanpa terjatuh. ',
  'Berjalan sambil menarik objek/alat permainan di belakangnya.',
  'Berdiri satu kaki dengan bantuan (contoh: dengan memegang kepada perabut). ',
  'Boleh berjalan di atas permukaan yang tidak rata atau permukaan yang licin dengan berhati-hati.', //
  'Berjalan menuju ke arah objek/alat permainan yang dikehendaki.',
  'Melompat setempat. ',
  'Menangkap bola dari jarak 2 atau 3 kaki.',
  'Berlari dengan keseimbangan badan yang baik dan boleh menukar arah dan kelajuan tanpa terjatuh.',
  'Berjalan menaiki tangga dengan langkahan kaki bersilih ganti. ',
  'Berjalan menuruni tangga dengan langkahan kaki bersilih ganti. ',
  'Memanjat ke atas objek yang tinggi (contoh: tangga, kerusi, meja) dengan bantuan.',
  'Melompat dari tempat tinggi dengan selamat dan tanpa terjatuh sekurang-kurangnya pada ketinggian 2 kaki.   ',
  'Berjalan dengan bantuan di atas palang imbangan (contoh: dengan tangannya dipegang untuk sokongan).',
  'Mencangkung ketika bermain/mengambil objek dilantai dan boleh kembali berdiri tegak tanpa kehilangan keseimbangan badan.', //
  'Mengayuh basikal tiga roda atau kenderaan tiga roda yang lain sekurang-kurangya berketinggian 6 kaki. Nota: Sekiranya tidak pernah diberikan pengalaman untuk mengayuh basikal atau kenderaan tiga roda, letakkan “TB” di ruang “Tanda”.',
  'Melompat dengan sebelah kaki sekurang-kurangnya sekali tanpa jatuh. Nota: sebelah tangan boleh memegang pada sesuatu/perabut untuk sokongan keseimbangan badan.',
  'Membongkok ke hadapan dengan mudah tanpa jatuh. ',
  'Membaling bola yang dipegang pada posisi melepasi paras kepala.',
  'Berjalan menaiki dan menuruni tangga dengan langkahan kaki bersilih ganti tanpa bantuan.',
  'Berdiri dengan satu kaki tanpa bantuan sekurang-kurangnya bagi tempoh 10 saat.',
  'Berjalan di atas palang imbangan sejauh 2-3 kaki tanpa bantuan. Mungkin kehilangan keseimbangan, namun dapat kembali menyeimbangkan badan dengan cepat.',
  'Berjalan berjengket apabila diminta.',
  'Memanjat dengan selamat ke atas objek yang tinggi tanpa bantuan (Contoh: memanjat tangga, kerusi, meja). ', //
  'Melompat dari tempat tinggi dengan selamat dan tanpa terjatuh sekurang-kurangnya pada ketinggian 3 kaki.',
  'Menangkap bola yang melantun sambil berdiri.',
  'Melompat dengan dua kaki serentak/bersama sebanyak 5 kali berturut-turut.',
  'Melompat dengan sebelah sebanyak kaki 2-5 kali. ',
  'Meniru pergerakan yang melibatkan kedua-dua anggota (contoh: mengangkat kedua-dua tangan ke atas dan tepuk).',
  'Berjalan di atas palang imbangan secara mengiring tanpa jatuh',
  'Melompat dan berdiri dengan sebelah kaki bagi tempoh 5 saat.',
  'Menangkap bola dari jarak 6 atau 7 kaki.',
  'Berjalan di atas garisan lurus sepanjang 4 atau 5 kaki',
  'Bergayut pada palang atau pokok. ', //
  'Berjalan di atas palang imbangan bermula dari titik permulaan ke titik kedua dan kembali ke titik permulaan semula dalam jarak 5 kaki, mungkin terjatuh/hilang imbangan namun dapat kembali menyeimbangkan badan semula dengan cepat.',
  'Melompat ke hadapan sebanyak 10 kali berturut-turut dan mampu mengekalkan jarak pada setiap lompatan',
  'Melompat dari tempat tinggi dan mendarat dengan kedua-dua kaki bersama. ',
  'Menendang bola yang sedang bergolek. ',
  'Menangkap bola besar dan kecil dari jarak 2 atau 3 kaki menggunakan satu atau kedua-dua tangan. ',
  'Mengayuh basikal tiga roda atau kenderaan tiga roda yang sekurang-kurangya berketinggian 10 kaki.',
  'Berguling ke hadapan dengan selamat.',
  'Membaling bola kecil dengan cara menghayun tangan ke atas (contoh: melontar bola tenis).',
  'Berlari seperti kuda (Galloping).',
  'Menari apabila dipasang lagu rancak dengan menggoyangkan kaki dan tangan secara bebas. ', //
  'Menangkap bola besar dan kecil dari jarak 10 kaki menggunakan satu atau kedua-dua tangan.',
  'Melompat dan berdiri dengan sebelah kaki dalam tempoh 10 saat',
  'Menunggang basikal biasa (tanpa roda latihan) tanpa jatuh.  ',
  'Mendaki cenuram atau batas kecil. ',
  'Lompat tali (skipping).',
  'Bermain buaian dan boleh mengayunnya sendiri',
  'Bergantung dari palang atau bar sekurang-kurangnya selama 5 saat',
  'Membaling bola dengan melangkah sebelah kaki ke hadapan. ',
  'Berjalan secara mengundur. ',
  'Berjalan berjengket secara mengundur. ',
];
List<String> time = [
  ' 0 - 3 bulan',
  ' 0 - 3 bulan',
  ' 0 - 3 bulan',
  ' 0 - 3 bulan',
  ' 0 - 3 bulan',
  ' 0 - 3 bulan',
  ' 3 - 6 bulan',
  ' 3 - 6 bulan',
  ' 3 - 6 bulan',
  ' 3 - 6 bulan',
  ' 3 - 6 bulan',
  ' 3 - 6 bulan',
  ' 3 - 6 bulan',
  ' 6 bulan -1 tahun',
  ' 6 bulan -1 tahun',
  ' 6 bulan -1 tahun',
  ' 6 bulan -1 tahun',
  ' 6 bulan -1 tahun',
  ' 6 bulan -1 tahun',
  ' 6 bulan -1 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1 -1.5 tahun',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
];
List<String> Respondstanda = List.filled(79, 'DEF');

List<Question> Quest2 = List.generate(
    21,
    (ind) => Question(
        ImageList2[ind], time2[ind], WENTI2[ind], Respondstanda2[ind]));
List<String> ImageList2 = [
  "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];
List<String> time2 = [
  ' 0 - 6 bulan',
  ' 6 bulan - 1 tahun',
  ' 6 bulan -1 tahun',
  ' 1 - 1.5 tahun',
  ' 1 - 1.5 tahun',
  '1.5 - 2 tahun ',
  '1.5 - 2 tahun ',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '5 - 6 tahun',
];
List<String> WENTI2 = [
  'Memerlukan bantuan penjaga sepenuhnya.Nota: Sila letak "-" sebagai jawapan.',
  'Menarik topi dari kepala.',
  'Aktif bekerjasama dalam aktiviti pemakaian dan pembukaan pakaian (contoh: mengangkat tangan semasa baju dibukakan dan mengangkat kaki keluar dari seluar ketika seluar dibukakan). ',
  'Membuka stoking tanpa bantuan.',
  'Membuka kasut tanpa bantuan.',
  'Membuka kemeja sendiri tanpa tahu cara untuk membuka butang dan/atau zip (contoh: membuka kemeja yang telah dibukakan butangnya).',
  'Memasukkan tangan dan kaki ke dalam pakaian.',
  'Memakai kasut tanpa tali.',
  'Dapat mencari lubang lengan pakaian sendiri semasa sedang memakai pakaian.',
  'Membuka baju T (T-shirt).',
  'Membuka butang ketip. ',
  'Membuka seluar dan seluar dalam yang mempunyai getah pinggang elastik.',
  'Membuka butang yang bersaiz besar pada baju/seluar. ',
  'Memakai pakaian seperti stoking, kemeja dan t-shirt dengan bantuan minimum. ',
  'Boleh membutang butang yang bersaiz besar.',
  'Menarik untuk memasang zip dan membuka zip dengan cantuman zip yang telah dipasangkan.Nota: Letakkan “TB” diruang “Tanda” sekiranya anak tidak pernah diberikan pakaian yang mempunyai zip.',
  'Dapat membuka dan memasang kancing dan cangkuk sendiri. Nota: Letakkan “TB” diruang “Tanda” sekiranya anak tidak pernah diberikan pakaian yang mempunyai kancing dan cangkuk.',
  'Memakai pakaian sendiri di bawah pemantauan penjaga. ',
  'Mencantum dan menarik untuk memasang zip pada pakaian.Nota: Letakkan “TB” diruang “Tanda” sekiranya anak tidak pernah diberikan pakaian yang mempunyai kancing dan cangkuk.',
  'Membezakan antara bahagian depan dan belakang pakaian semasa memakai pakaian.',
  'Memakai stoking dan kasut pada kaki yang betul (kiri dan kanan). ',
  'Memakai pakaian sendiri tanpa perlu pemantauan penjaga.',
];
List<String> Respondstanda2 = List.filled(21, 'DEF');
List<Question> Quest3 = List.generate(
    8,
    (ind) => Question(
        ImageList3[ind], time3[ind], WENTI3[ind], Respondstanda3[ind]));
List<String> ImageList3 = [
  "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];
List<String> time3 = [
  ' 0 - 2 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '3 - 4 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '5 - 6 tahun',
];
List<String> WENTI3 = [
  'Memerlukan bantuan penjaga sepenuhnya.Nota: Sila letak "-" sebagai jawapan.',
  'Mula bekerjasama untuk membersihkan badan ketika mandi (contoh: meratakan sabun di anggota badan yang mudah dicapai).',
  'Pam sabun mandi daripada botol sabun mandi atau boleh memegang ketulan sabun mandi untuk diratakan di badannya.',
  'Membuka pancuran air dan melaraskan kelajuan air dengan bantuan. ',
  'Mandi dengan membersihkan badan secara menyeluruh.',
  'Mencuci dan membilas rambut secara menyeluruh. ',
  'Membezakan sabun mandi dan syampu rambut.',
  'Mandi tanpa pemantauan penjaga. ',
];
List<String> Respondstanda3 = List.filled(8, 'DEF');
List<Question> Quest4 = List.generate(
    19,
    (indexs) => Question(ImageList4[indexs], time4[indexs], WENTI4[indexs],
        Respondstanda4[indexs]));
List<String> ImageList4 = [
  "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];
List<String> time4 = [
  ' 0 - 1 tahun',
  '1 - 1.5 tahun',
  '1.5 - 2 tahun',
  '1.5 - 2 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '2 - 3 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '3 - 4 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '5 - 6 tahun',
  '5 - 6 tahun',
];
List<String> WENTI4 = [
  'Memerlukan bantuan penjaga sepenuhnya.Nota: Sila letak "-" sebagai jawapan.',
  'Memberitahu orang lain sekiranya lampin kotor (contoh: dengan menunjukkan isyarat jari atau menarik lampin atau bersuara/bunyi).',
  'Mula menunjukkan minat untuk pergi ke tandas. ',
  'Dapat duduk atas mangkuk tandas atau “Potty Chair” tetapi mungkin tidak melebihi 5 minit.',
  'Mula memberitahu keperluan untuk pergi ke tandas.',
  'Lampin bersih melebihi 2 jam.Nota: Letakkan “TB” diruang “Tanda” sekiranya anak tidak lagi dipakaikan lampin.',
  'Membuka seluar sendiri sebelum membuang air kecil/besar.',
  'Mencuci atau mengelap bahagian kemaluan dengan tisu selepas membuang air kecil/besar, mungkin tidak begitu sempurna dan memerlukan arahan dari penjaga. ',
  'Mengepam tandas selepas membuang air kecil/besar.',
  'Memerlukan bantuan untuk memakai dan membuka pakaian selepas membuang air kecil/besar.',
  'Membuang air kecil dalam mangkuk tandas atau “Potty Chair”. ',
  'Membuang air besar dalam mangkuk tandas atau “Potty Chair”. ',
  'Mencuci dengan air paip atau mengelap bahagian kemaluan dengan tisu selepas membuang air besar tetapi mungkin tidak bersih dengan sempurna.',
  'Tiada kejadian membuang air besar dalam seluar tanpa disedari.',
  '	Tidak perlu memakai lampin pada waktu siang.  ',
  'Tidak perlu memakai lampin pada waktu malam. ',
  'Pergi ke tandas semasa ingin membuang air kecil dan air besar tanpa perlu diarahkan.',
  'Pergi ke tandas tanpa bantuan dari segi pemakaian dan pembukaan pakaian, lap bahagian kemaluan dan mencuci tangan setelah selesai urusan.',
  'Tidak kencing malam ketika sedang tidur. ',
];
List<String> Respondstanda4 = List.filled(19, 'DEF');
List<String> Respondstanda5 = List.filled(10, 'DEF');
List<Question> Quest5 = List.generate(
    10,
    (ind) => Question(
        ImageList5[ind], time5[ind], WENTI5[ind], Respondstanda5[ind]));
List<String> ImageList5 = [
  "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];
List<String> time5 = [
  ' 0 - 1.5 tahun',
  '1.5 - 2 tahun',
  '1.5 - 2 tahun',
  '1.5 - 2 tahun',
  '2 - 3 tahun',
  '3 - 4 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '5 - 6 tahun',
];
List<String> WENTI5 = [
  'Memerlukan bantuan penjaga sepenuhnya.Nota: Sila letak "-" sebagai jawapan.',
  'Membuka mulut untuk gigi digosok. ',
  'Memberus gigi dengan bantuan penjaga.',
  'Dapat memegang berus gigi sendiri.',
  'Memberus gigi sendiri tetapi bukan secara menyeluruh.',
  'Membuka dan menutup pili air.',
  'Memberus gigi dengan lebih sempurna.',
  'Berkumur sehingga mulut bersih.',
  'Menyediakan berus gigi dengan meletakkan ubat gigi sendiri.',
  'Memberus gigi sehingga bersih tanpa pemantauan penjaga.',
];
List<String> Respondstanda6 = List.filled(9, 'DEF');
List<Question> Quest6 = List.generate(
    9,
    (ind) => Question(
        ImageList6[ind], time6[ind], WENTI6[ind], Respondstanda6[ind]));
List<String> ImageList6 = [
  "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
  "https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBob3RvfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
];
List<String> time6 = [
  ' 0 - 1.5 tahun',
  '1.5 - 2 tahun',
  '1.5 - 2 tahun',
  '1.5 - 2 tahun',
  '2 - 3 tahun',
  '3 - 4 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '4 - 5 tahun',
  '5 - 6 tahun',
];
List<String> WENTI6 = [
  'Memerlukan bantuan penjaga sepenuhnya.Nota: Sila letak "-" sebagai jawapan.',
  'Menghulurkan tangan semasa tangan dicucikan. ',
  'Mula belajar cara mencuci tangan sendiri..',
  'Menggosok tangan dengan air bersih.',
  'Mengepam sabun daripada botol sabun atau meratakan sabun buku ditangan. ',
  'Membuka dan menutup pili air.',
  'Mencuci tangan dengan sempurna dan bersih.',
  'Mengeringkan tangan selepas dicuci.',
  'Mencuci tangan dengan sempurna menggunakan sabun tanpa pemantauan penjaga.',
];
Future main() async {
  runApp(IntroSliderMotorKasar());
}

class soalanmotorkasar extends StatefulWidget {
  _soalanmotorkasarState createState() => _soalanmotorkasarState();
}

@override
class _soalanmotorkasarState extends State<soalanmotorkasar>
    with TickerProviderStateMixin {
  final fstcontroller = TextEditingController();
  final tanda = ['/', 'X', '-', 'TB', 'DEF'];
  bool _isvisible = false;
  List<String> tandainitial = List.filled(27, 'DEF');
  List<bool> containing = List.empty(growable: true);
  List<String> tandainitial2 = List.filled(21, 'DEF');
  List<String> tandainitial3 = List.filled(8, 'DEF');
  List<String> tandainitial4 = List.filled(19, 'DEF');
  List<String> tandainitial5 = List.filled(10, 'DEF');
  List<String> tandainitial6 = List.filled(9, 'DEF');
  CarouselController buttoncontroller = CarouselController();
  CarouselController buttoncontroller2 = CarouselController();
  CarouselController buttoncontroller3 = CarouselController();
  CarouselController buttoncontroller4 = CarouselController();
  CarouselController buttoncontroller5 = CarouselController();
  CarouselController buttoncontroller6 = CarouselController();
  Map<int, Question> map = Quest.asMap();
  List<Slide> slides = new List.filled(1, Slide());

  //final controllercatatan = TextEditingController();
  final List<TextEditingController> controllercatatan =
      List.generate(74, (i) => TextEditingController());
  final controllercatatan2 = List.generate(74, (i) => TextEditingController());
  final controllercatatan3 = List.generate(74, (i) => TextEditingController());
  final controllercatatan4 = List.generate(74, (i) => TextEditingController());
  final controllercatatan5 = List.generate(74, (i) => TextEditingController());
  final controllercatatan6 = List.generate(74, (i) => TextEditingController());

//JUST DEL OTHER CONTROLLERS
  late TabController tabController;
  void initState() {
    super.initState();
    fstcontroller.addListener(() => setState(() {}));

    tabController = TabController(vsync: this, length: 6)
      ..addListener(() {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    //print(tandaintial);

    return Scaffold(
        backgroundColor: Color(0XFF40E0D0),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
                backgroundColor: Colors.transparent,
                floating: true,
                snap: true,
                title: Text(
                  'Perkembangan Motor Kasar',
                  overflow: TextOverflow.ellipsis,
                ),
                centerTitle: true,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text("Makan"),
                    ),
                    Tab(
                        child: Text(
                      "Memakai dan Memuka Pakaian",
                    )),
                    Tab(
                        child: Text(
                      "Mandi",
                    )),
                    Tab(
                        child: Text(
                      "Pergi ke Tandas",
                    )),
                    Tab(
                        child: Text(
                      "Memberus Gigi",
                    )),
                    Tab(
                        child: Text(
                      "Mencuci Tangan",
                    )),
                  ],
                  indicatorColor: Colors.white,
                  controller: tabController,
                ),
                actions: [
                  Theme(
                      data: Theme.of(context).copyWith(
                        iconTheme: IconThemeData(color: Colors.white),
                      ),
                      child: PopupMenuButton<int>(
                          color: Color(0XFF00A89A),
                          onSelected: (item) => OnSelected(context, item),
                          itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Text('Settings'),
                                ),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Text('Share'),
                                ),
                                PopupMenuDivider(),
                                PopupMenuItem<int>(
                                    value: 2,
                                    child: Row(children: [
                                      Icon(Icons.logout, color: Colors.white),
                                      const SizedBox(width: 8),
                                      Text('Sign Out'),
                                    ]))
                              ])),
                ]),
          ],
          body: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        buildQuoteCard(),
                        buildadltable(),
                      ],
                    ),
                  )),
              SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        buildQuoteCard(),
                        buildadltable2(),
                      ],
                    ),
                  )),
              SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        buildQuoteCard(),
                        buildadltable3(),
                      ],
                    ),
                  )),
              SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        buildQuoteCard(),
                        buildadltable4(),
                      ],
                    ),
                  )),
              SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        buildQuoteCard(),
                        buildadltable5(),
                      ],
                    ),
                  )),
              SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        buildQuoteCard(),
                        buildadltable6(),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  int pageIndexs = 1;
  /*void OnSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Settingan()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Shares()),
        );
        break;

      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyApp()),
          (route) => false,
        );
        break;
    }
  }*/

  final List<Widget> imageSliders = ImageList.map((item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  //Text('${Quest.toString()}'),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text('${ImageList.indexOf(item)}'),
                    ),
                  ),
                ],
              )),
        ),
      )).toList();
  final List<Widget> ii = Quest.map((e) =>
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0XFF00A89A),
          ),
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('${e.isImage}'),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${e.Age}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${Quest.indexOf(e) + 1}.\t${e.isQuestion}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      })).toList();
  final List<Widget> iii = Quest2.map((e) =>
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0XFF00A89A),
          ),
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('${e.isImage}'),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${e.Age}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${Quest2.indexOf(e) + 1}.\t${e.isQuestion}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      })).toList();
  final List<Widget> iv = Quest3.map((e) =>
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0XFF00A89A),
          ),
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('${e.isImage}'),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${e.Age}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${Quest3.indexOf(e) + 1}.\t${e.isQuestion}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      })).toList();
  final List<Widget> v = Quest4.map((e) =>
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0XFF00A89A),
          ),
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('${e.isImage}'),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${e.Age}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${Quest4.indexOf(e) + 1}.\t${e.isQuestion}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      })).toList();
  final List<Widget> vi = Quest5.map((e) =>
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0XFF00A89A),
          ),
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('${e.isImage}'),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${e.Age}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${Quest5.indexOf(e) + 1}.\t${e.isQuestion}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  /*Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text('KILL'),
                    ),
                  ),*/
                ],
              )),
        );
      })).toList();
  final List<Widget> vii = Quest6.map((e) =>
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0XFF00A89A),
          ),
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('${e.isImage}'),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${e.Age}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${Quest6.indexOf(e) + 1}.\t${e.isQuestion}\n',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  /*Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text('KILL'),
                    ),
                  ),*/
                ],
              )),
        );
      })).toList();
  //void showToast() => Fluttertoast.showToast(msg: "Please Contact 'Joe'");
  Widget buildQuoteCard() => Card(
      color: Color(0XFF00A89A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(12)),
          Text(
            'Penilaian Aktiviti Kehidupan Harian Kanak-Kanak ' + '\n',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            'Penilaian ini merangkumi item di bawah domain aktiviti \nkehidupan harian kanak-kanak berumur 0 hingga 6 tahun. \nItem yang disenaraikan di bawah merupakan antara kemahiran yang secara umumnya sudah boleh dijalankan \natau sudah mula muncul dalam skala kemahiran kanak-kanak pada tahap usia yang dinyatakan. \nArahan: Ibu bapa/penjaga diminta untuk menilai kemahiran/keupayaan anak dan meletakkan indikasi pada ruangan “Tanda” berdasarkan indikasi yang disenaraikan dibawah.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),

          SizedBox(height: 30),
          Text(
            'Indikasi',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          //Spacer(),

          Table(
            defaultColumnWidth: FixedColumnWidth(120.0),
            border: TableBorder.all(
                color: Colors.white, style: BorderStyle.solid, width: 2),
            children: [
              TableRow(children: [
                Column(children: [
                  Text('Indikasi', style: TextStyle(fontSize: 20.0))
                ]),
                Column(children: [
                  Text('Butiran', style: TextStyle(fontSize: 20.0))
                ]),
                // Column(children: [
                //   Text('Review', style: TextStyle(fontSize: 20.0))
                // ]),
              ]),
              TableRow(children: [
                Column(children: [Text('/')]),
                Column(children: [Text('Capai')]),
                //Column(children: [Text('5*')]),
              ]),
              TableRow(children: [
                Column(children: [Text('X')]),
                Column(children: [Text('Belum tercapai')]),
                //Column(children: [Text('5*')]),
              ]),
              TableRow(children: [
                Column(children: [Text('-')]),
                Column(children: [Text('Tidak Pasti/Tidak Dapat Dinilai')]),
                //Column(children: [Text('5*')]),
              ]),
              TableRow(children: [
                Column(children: [Text('TB')]),
                Column(children: [Text('Tidak Berkenaan')]),
                //Column(children: [Text('5*')]),
              ]),
              TableRow(children: [
                Column(children: [Text('DEF')]),
                Column(children: [Text('default')]),
                //Column(children: [Text('5*')]),
              ]),
            ],
          ),
          SizedBox(height: 100),
        ],
      ));

  Widget buildadltable() => SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          Text(
            'Makan',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.white,
            ),
          ),
          CarouselSlider(
            items: ii.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A89A),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        i,

                        buildtanda(ii.indexOf(i)),
                        //Text('${tandainitial[ii.indexOf(i)]}'),
                        TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          obscureText: false,
                          controller: controllercatatan[ii.indexOf(i)],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Catatan',
                          ),
                        ),
                        Text('$tandainitial'),
                        Text('${ii.indexOf(i)}'),
                        Text('${controllercatatan[ii.indexOf(i)].text}')
                      ],
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.height,
              enableInfiniteScroll: false,
            ),
            carouselController: buttoncontroller,
          ),
          SizedBox(height: 20),
          Container(
            child: buildtandadef(),
          ),
          SizedBox(height: 20),
          Container(
            color: Color(0XFF40E0D0),
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...Iterable<int>.generate(ii.length).map(
                  (int pageIndex) => ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                    onPressed: () => buttoncontroller.animateToPage(pageIndex),
                    child: Text(
                      '${pageIndex + 1}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller.jumpToPage(0),
                  child: Text(
                    '←←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller.previousPage(),
                  child: Text(
                    '←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller.nextPage(),
                  child: Text(
                    '→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller.jumpToPage(ii.length),
                  child: Text(
                    '→→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ));
  Widget horicon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: ElevatedButton(
            onPressed: () => buttoncontroller.jumpToPage(0),
            child: Text(
              '←←',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Flexible(
          child: ElevatedButton(
            onPressed: () => buttoncontroller.previousPage(),
            child: Text(
              '←',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...Iterable<int>.generate(ii.length).map(
          (int pageIndex) => SingleChildScrollView(
            child: ElevatedButton(
              onPressed: () => buttoncontroller.animateToPage(pageIndex),
              child: Text('${pageIndex + 1}'),
            ),
          ),
        ),
        Flexible(
          child: ElevatedButton(
            onPressed: () => buttoncontroller.nextPage(),
            child: Text(
              '→',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Flexible(
          child: ElevatedButton(
            onPressed: () => buttoncontroller.jumpToPage(ii.length),
            child: Text(
              '→→',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildadltable2() => SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          Text(
            'Memakai dan Memuka Pakaian',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          CarouselSlider(
            //options: CarouselOptions(height: 400.0),
            items: iii.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A89A),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        i,
                        //Image.network(ImageList[0]),
                        buildtanda2(iii.indexOf(i)),
                        //Text('${tandainitial[ii.indexOf(i)]}'),
                        TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          obscureText: false,
                          controller: controllercatatan2[iii.indexOf(i)],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Catatan',
                          ),
                        ),
                        Text('$tandainitial2'),
                        Text('${iii.indexOf(i)}'),
                        Text('${controllercatatan2[iii.indexOf(i)].text}')
                      ],
                    ),
                  );
                },
              );
            }).toList(),

            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.height,
              enableInfiniteScroll: false,
            ),
            carouselController: buttoncontroller2,
          ),
          SizedBox(height: 20),
          Container(
            child: buildtandadef2(),
          ),
          SizedBox(height: 20),
          Container(
            color: Color(0XFF40E0D0),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...Iterable<int>.generate(iii.length).map(
                  (int pageIndex) => ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                    onPressed: () => buttoncontroller2.animateToPage(pageIndex),
                    child: Text(
                      '${pageIndex + 1}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller2.jumpToPage(0),
                  child: Text(
                    '←←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller2.previousPage(),
                  child: Text(
                    '←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller2.nextPage(),
                  child: Text(
                    '→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller2.jumpToPage(ii.length),
                  child: Text(
                    '→→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ));
  Widget buildadltable3() => SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          Text(
            'Mandi',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          CarouselSlider(
            //options: CarouselOptions(height: 400.0),
            items: iv.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A89A),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        i,
                        //Image.network(ImageList[0]),
                        buildtanda3(iv.indexOf(i)),
                        //Text('${tandainitial[ii.indexOf(i)]}'),
                        TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          obscureText: false,
                          controller: controllercatatan3[iv.indexOf(i)],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Catatan',
                          ),
                        ),
                        Text('$tandainitial3'),
                        Text('${iv.indexOf(i)}'),
                        Text('${controllercatatan3[iv.indexOf(i)].text}')
                      ],
                    ),
                  );
                },
              );
            }).toList(),

            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.width,
              enableInfiniteScroll: false,
            ),
            carouselController: buttoncontroller3,
          ),
          SizedBox(height: 20),
          Container(
            child: buildtandadef3(),
          ),
          SizedBox(height: 20),
          Container(
            color: Color(0XFF40E0D0),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...Iterable<int>.generate(iv.length).map(
                  (int pageIndex) => ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                    onPressed: () => buttoncontroller3.animateToPage(pageIndex),
                    child: Text(
                      '${pageIndex + 1}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller3.jumpToPage(0),
                  child: Text(
                    '←←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller3.previousPage(),
                  child: Text(
                    '←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller3.nextPage(),
                  child: Text(
                    '→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller3.jumpToPage(ii.length),
                  child: Text(
                    '→→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ));

  Widget buildadltable4() => SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          Text(
            'Pergi Ke Tandas',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          CarouselSlider(
            //options: CarouselOptions(height: 400.0),
            items: v.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A89A),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        i,
                        //Image.network(ImageList[0]),
                        buildtanda4(v.indexOf(i)),
                        //Text('${tandainitial[ii.indexOf(i)]}'),
                        TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          obscureText: false,
                          controller: controllercatatan4[v.indexOf(i)],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Catatan',
                          ),
                        ),
                        Text('$tandainitial4'),
                        Text('${v.indexOf(i)}'),
                        Text('${controllercatatan4[v.indexOf(i)].text}')
                      ],
                    ),
                  );
                },
              );
            }).toList(),

            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.width,
              enableInfiniteScroll: false,
            ),
            carouselController: buttoncontroller4,
          ),
          SizedBox(height: 20),
          Container(
            child: buildtandadef4(),
          ),
          SizedBox(height: 20),
          Container(
            color: Color(0XFF40E0D0),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...Iterable<int>.generate(v.length).map(
                  (int pageIndex) => ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                    onPressed: () => buttoncontroller4.animateToPage(pageIndex),
                    child: Text(
                      '${pageIndex + 1}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller4.jumpToPage(0),
                  child: Text(
                    '←←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller4.previousPage(),
                  child: Text(
                    '←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller4.nextPage(),
                  child: Text(
                    '→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller4.jumpToPage(v.length),
                  child: Text(
                    '→→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ));

  Widget buildadltable5() => SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          Text(
            'Memberus Gigi',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          CarouselSlider(
            //options: CarouselOptions(height: 400.0),
            items: vi.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A89A),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        i,
                        //Image.network(ImageList[0]),
                        buildtanda5(vi.indexOf(i)),
                        //Text('${tandainitial[ii.indexOf(i)]}'),
                        TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          obscureText: false,
                          controller: controllercatatan5[vi.indexOf(i)],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Catatan',
                          ),
                        ),
                        Text('$tandainitial5'),
                        Text('${vi.indexOf(i)}'),
                        Text('${controllercatatan5[vi.indexOf(i)].text}')
                      ],
                    ),
                  );
                },
              );
            }).toList(),

            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.width,
              enableInfiniteScroll: false,
            ),
            carouselController: buttoncontroller5,
          ),
          SizedBox(height: 20),
          Container(
            child: buildtandadef5(),
          ),
          SizedBox(height: 20),
          Container(
            color: Color(0XFF40E0D0),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...Iterable<int>.generate(ii.length).map(
                  (int pageIndex) => ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                    onPressed: () => buttoncontroller5.animateToPage(pageIndex),
                    child: Text(
                      '${pageIndex + 1}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller5.jumpToPage(0),
                  child: Text(
                    '←←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller5.previousPage(),
                  child: Text(
                    '←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller5.nextPage(),
                  child: Text(
                    '→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller5.jumpToPage(ii.length),
                  child: Text(
                    '→→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ));

  Widget buildadltable6() => SingleChildScrollView(
      reverse: false,
      child: Column(
        children: [
          Text(
            'Mencuci Tangan ',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          CarouselSlider(
            //options: CarouselOptions(height: 400.0),
            items: vii.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0XFF00A89A),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        i,
                        //Image.network(ImageList[0]),
                        buildtanda6(vii.indexOf(i)),
                        //Text('${tandainitial[ii.indexOf(i)]}'),
                        TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          obscureText: false,
                          controller: controllercatatan6[vii.indexOf(i)],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Catatan',
                          ),
                        ),
                        Text('$tandainitial6'),
                        Text('${vii.indexOf(i)}'),
                        Text('${controllercatatan6[vii.indexOf(i)].text}')
                      ],
                    ),
                  );
                },
              );
            }).toList(),

            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.width,
              enableInfiniteScroll: false,
            ),
            carouselController: buttoncontroller6,
          ),
          SizedBox(height: 20),
          Container(
            child: buildtandadef6(),
          ),
          SizedBox(height: 20),
          Container(
            color: Color(0XFF40E0D0),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...Iterable<int>.generate(vii.length).map(
                  (int pageIndex) => ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                    onPressed: () => buttoncontroller6.animateToPage(pageIndex),
                    child: Text(
                      '${pageIndex + 1}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller6.jumpToPage(0),
                  child: Text(
                    '←←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller6.previousPage(),
                  child: Text(
                    '←',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller6.nextPage(),
                  child: Text(
                    '→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0XFF00A89A)),
                  onPressed: () => buttoncontroller6.jumpToPage(ii.length),
                  child: Text(
                    '→→',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Visibility(visible: true, child: end()),
        ],
      ));

  Widget buildtanda(int tandaintial) {
    for (tandaintial; tandaintial < tandainitial.length; tandaintial++) {
      return Container(
          child: Column(
        children: [
          //Text('${tandaintial}'),
          DropdownButton<String>(
            dropdownColor: Color(0XFF00A89A),
            elevation: 2,
            style: TextStyle(
              color: Colors.white,
            ),
            alignment: Alignment.center,
            value: tandainitial[tandaintial],
            items: tanda.map(buildMenuItem).toList(),
            onChanged: (tanda) =>
                setState(() => this.tandainitial[tandaintial] = tanda!),
          ),
        ],
      ));
    }
    return Text(' ');
  }

  Widget buildtandadef() {
    final chill = <Widget>[];

    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for(int i in )
          //Text('${k++}'),
          // Text('$m'),
          // if ('${m}' == '0') Text('More meat!!!!!!'),

          Visibility(
            visible: false,
            child: Row(
              children: [
                for (var c in tandainitial)
                  if (('${c.contains('DEF')}') == 'true') Text('${++m}\t'),
                for (var c in tandainitial)
                  if (('${c.contains('TB')}') == 'true') Text('${++n}\t'),
                for (var c in tandainitial)
                  if (('${c.contains('-')}') == 'true') Text('${++o}\t'),
                for (var c in tandainitial)
                  if (('${c.contains('X')}') == 'true') Text('${++p}\t'),
                for (var c in tandainitial)
                  if (('${c.contains('/')}') == 'true') Text('${++q}\t'),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('DEF = ${m}/\t\t${tandainitial.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('-  = ${o}/\t\t${tandainitial.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('/ = ${q}/\t\t${tandainitial.length}\t'),
            ),
          ),

          //Text('${tandainitial}'),

          //if (Text('${tandainitial.contains('DEF')}') == 'true') Text('$m'),
          //Text('${c.contains('DEF')} ${(tandainitial.length) + 1}'),
          // if ('${c.contains('DEF')}' == true) //{Text('${(c.length) + 1}'),}
          //Text('${(c.length) + 1}'),

          //Text('${(k)}'),
          //Text('${tandainitial.contains('DEF')}'),

          // Text('${c.contains('DEF')}'),
          // if ('${tandainitial.contains('DEF')}' == true) Text('${k++}')
        ],
      ),
    );
  }

  Widget buildtandadef2() {
    final chill = <Widget>[];

    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for(int i in )
          //Text('${k++}'),
          // Text('$m'),
          // if ('${m}' == '0') Text('More meat!!!!!!'),

          Visibility(
            visible: false,
            child: Row(
              children: [
                for (var c in tandainitial2)
                  if (('${c.contains('DEF')}') == 'true') Text('${++m}\t'),
                for (var c in tandainitial2)
                  if (('${c.contains('TB')}') == 'true') Text('${++n}\t'),
                for (var c in tandainitial2)
                  if (('${c.contains('-')}') == 'true') Text('${++o}\t'),
                for (var c in tandainitial2)
                  if (('${c.contains('X')}') == 'true') Text('${++p}\t'),
                for (var c in tandainitial2)
                  if (('${c.contains('/')}') == 'true') Text('${++q}\t'),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('DEF = ${m}/\t\t${tandainitial2.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial2.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('-  = ${o}/\t\t${tandainitial2.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial2.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('/ = ${q}/\t\t${tandainitial2.length}\t'),
            ),
          ),

          //Text('${tandainitial}'),

          //if (Text('${tandainitial.contains('DEF')}') == 'true') Text('$m'),
          //Text('${c.contains('DEF')} ${(tandainitial.length) + 1}'),
          // if ('${c.contains('DEF')}' == true) //{Text('${(c.length) + 1}'),}
          //Text('${(c.length) + 1}'),

          //Text('${(k)}'),
          //Text('${tandainitial.contains('DEF')}'),

          // Text('${c.contains('DEF')}'),
          // if ('${tandainitial.contains('DEF')}' == true) Text('${k++}')
        ],
      ),
    );
  }

  Widget buildtandadef3() {
    final chill = <Widget>[];

    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for(int i in )
          //Text('${k++}'),
          // Text('$m'),
          // if ('${m}' == '0') Text('More meat!!!!!!'),

          Visibility(
            visible: false,
            child: Row(
              children: [
                for (var c in tandainitial3)
                  if (('${c.contains('DEF')}') == 'true') Text('${++m}\t'),
                for (var c in tandainitial3)
                  if (('${c.contains('TB')}') == 'true') Text('${++n}\t'),
                for (var c in tandainitial3)
                  if (('${c.contains('-')}') == 'true') Text('${++o}\t'),
                for (var c in tandainitial3)
                  if (('${c.contains('X')}') == 'true') Text('${++p}\t'),
                for (var c in tandainitial3)
                  if (('${c.contains('/')}') == 'true') Text('${++q}\t'),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('DEF = ${m}/${tandainitial3.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/${tandainitial3.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('-  = ${o}/${tandainitial3.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/${tandainitial3.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('/ = ${q}/${tandainitial3.length}\t'),
            ),
          ),

          //Text('${tandainitial}'),

          //if (Text('${tandainitial.contains('DEF')}') == 'true') Text('$m'),
          //Text('${c.contains('DEF')} ${(tandainitial.length) + 1}'),
          // if ('${c.contains('DEF')}' == true) //{Text('${(c.length) + 1}'),}
          //Text('${(c.length) + 1}'),

          //Text('${(k)}'),
          //Text('${tandainitial.contains('DEF')}'),

          // Text('${c.contains('DEF')}'),
          // if ('${tandainitial.contains('DEF')}' == true) Text('${k++}')
        ],
      ),
    );
  }

  Widget buildtandadef4() {
    final chill = <Widget>[];

    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for(int i in )
          //Text('${k++}'),
          // Text('$m'),
          // if ('${m}' == '0') Text('More meat!!!!!!'),

          Visibility(
            visible: false,
            child: Row(
              children: [
                for (var c in tandainitial4)
                  if (('${c.contains('DEF')}') == 'true') Text('${++m}\t'),
                for (var c in tandainitial4)
                  if (('${c.contains('TB')}') == 'true') Text('${++n}\t'),
                for (var c in tandainitial4)
                  if (('${c.contains('-')}') == 'true') Text('${++o}\t'),
                for (var c in tandainitial4)
                  if (('${c.contains('X')}') == 'true') Text('${++p}\t'),
                for (var c in tandainitial4)
                  if (('${c.contains('/')}') == 'true') Text('${++q}\t'),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('DEF = ${m}/\t\t${tandainitial4.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial4.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('-  = ${o}/\t\t${tandainitial4.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial4.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('/ = ${q}/\t\t${tandainitial4.length}\t'),
            ),
          ),

          //Text('${tandainitial}'),

          //if (Text('${tandainitial.contains('DEF')}') == 'true') Text('$m'),
          //Text('${c.contains('DEF')} ${(tandainitial.length) + 1}'),
          // if ('${c.contains('DEF')}' == true) //{Text('${(c.length) + 1}'),}
          //Text('${(c.length) + 1}'),

          //Text('${(k)}'),
          //Text('${tandainitial.contains('DEF')}'),

          // Text('${c.contains('DEF')}'),
          // if ('${tandainitial.contains('DEF')}' == true) Text('${k++}')
        ],
      ),
    );
  }

  Widget buildtandadef5() {
    final chill = <Widget>[];

    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for(int i in )
          //Text('${k++}'),
          // Text('$m'),
          // if ('${m}' == '0') Text('More meat!!!!!!'),

          Visibility(
            visible: false,
            child: Row(
              children: [
                for (var c in tandainitial5)
                  if (('${c.contains('DEF')}') == 'true') Text('${++m}\t'),
                for (var c in tandainitial5)
                  if (('${c.contains('TB')}') == 'true') Text('${++n}\t'),
                for (var c in tandainitial5)
                  if (('${c.contains('-')}') == 'true') Text('${++o}\t'),
                for (var c in tandainitial5)
                  if (('${c.contains('X')}') == 'true') Text('${++p}\t'),
                for (var c in tandainitial5)
                  if (('${c.contains('/')}') == 'true') Text('${++q}\t'),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('DEF = ${m}/\t\t${tandainitial5.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial5.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('-  = ${o}/\t\t${tandainitial5.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/\t\t${tandainitial5.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('/ = ${q}/\t\t${tandainitial5.length}\t'),
            ),
          ),

          //Text('${tandainitial}'),

          //if (Text('${tandainitial.contains('DEF')}') == 'true') Text('$m'),
          //Text('${c.contains('DEF')} ${(tandainitial.length) + 1}'),
          // if ('${c.contains('DEF')}' == true) //{Text('${(c.length) + 1}'),}
          //Text('${(c.length) + 1}'),

          //Text('${(k)}'),
          //Text('${tandainitial.contains('DEF')}'),

          // Text('${c.contains('DEF')}'),
          // if ('${tandainitial.contains('DEF')}' == true) Text('${k++}')
        ],
      ),
    );
  }

  Widget buildtandadef6() {
    final chill = <Widget>[];

    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //for(int i in )
          //Text('${k++}'),
          // Text('$m'),
          // if ('${m}' == '0') Text('More meat!!!!!!'),

          Visibility(
            visible: false,
            child: Row(
              children: [
                for (var c in tandainitial6)
                  if (('${c.contains('DEF')}') == 'true') Text('${++m}\t'),
                for (var c in tandainitial6)
                  if (('${c.contains('TB')}') == 'true') Text('${++n}\t'),
                for (var c in tandainitial6)
                  if (('${c.contains('-')}') == 'true') Text('${++o}\t'),
                for (var c in tandainitial6)
                  if (('${c.contains('X')}') == 'true') Text('${++p}\t'),
                for (var c in tandainitial6)
                  if (('${c.contains('/')}') == 'true') Text('${++q}\t'),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(100),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('DEF = ${m}/${tandainitial6.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/${tandainitial6.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('-  = ${o}/${tandainitial6.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('TB = ${n}/${tandainitial6.length}\t'),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF00A89A),
                  //fixedSize: Size.fromWidth(4),
                  padding: EdgeInsets.all(20) //content padding inside button
                  ),
              child: Text('/ = ${q}/${tandainitial6.length}\t'),
            ),
          ),

          //Text('${tandainitial}'),

          //if (Text('${tandainitial.contains('DEF')}') == 'true') Text('$m'),
          //Text('${c.contains('DEF')} ${(tandainitial.length) + 1}'),
          // if ('${c.contains('DEF')}' == true) //{Text('${(c.length) + 1}'),}
          //Text('${(c.length) + 1}'),

          //Text('${(k)}'),
          //Text('${tandainitial.contains('DEF')}'),

          // Text('${c.contains('DEF')}'),
          // if ('${tandainitial.contains('DEF')}' == true) Text('${k++}')
        ],
      ),
    );
  }

  Widget end() {
    bool _isvis = _isvisible;
    //var c = tandainitial;
    var d = tandainitial2;
    var e = tandainitial3;
    var f = tandainitial4;
    var g = tandainitial5;
    var h = tandainitial6;
    var count = 0;
    //tandainitial.where((k) => k.contains('DEF') == 'true').toList().length;
    return Container(
      //bool _isvis = _isvisible;
      child: Column(
        children: <Widget>[
          //Text('$_isvis'),
          for (var c in tandainitial)
            //for (var d in tandainitial2)

            //     for (var e in tandainitial3)
            //       for (var f in tandainitial3)
            //         for (var g in tandainitial4)
            //           for (var h in tandainitial5)
            //             for (var i in tandainitial6)

            //               //for (var c in tandainitial)
            if (((('${c.contains('DEF')}') == 'false') &&
                (('${d.contains('DEF')}') == 'false') &&
                (('${e.contains('DEF')}') == 'false') &&
                (('${f.contains('DEF')}') == 'false') &&
                (('${g.contains('DEF')}') == 'false') &&
                (('${h.contains('DEF')}') == 'false')))
              //                   (('${e.contains('DEF')}') == 'false') &&
              //                   (('${f.contains('DEF')}') == 'false') &&
              //                   (('${g.contains('DEF')}') == 'false') &&
              //                   (('${h.contains('DEF')}') == 'false') &&
              //                   (('${i.contains('DEF')}') == 'false')
              //=='true')
              //if (('${_isvis}') == 'false')
              Offstage(
                offstage: true,
                child: Text(
                    ('${c.contains('DEF')}, ${++count} , ${c}, ${d}, ${e} , ${f}, ${g} , ${h}, ${_isvis = true} ')),
                //child: Text('${c.contains('DEF')}, ${c.length} , ${++count} '),
              ),
          Visibility(
            visible: true,
            child: Text(''),
            //Text('${c.contains('DEF')}, ${c.length}, ${c} '),
            //Text('${_isvis = true}')
          ),

          //Text('$_isvis'),
          if (_isvis == true)
            TextButton(
                onPressed: addref,
                child: Text(
                  'Tekan ',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle()),
          if (_isvis == false)
            TextButton(
                onPressed: () {},
                child: Text(
                  'SSLEEP',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle())
          // else
          //   TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         'just quit',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       style: ButtonStyle())
        ],
      ),
    );
  }

  Widget buildtanda2(int fsttanda) {
    return Container(
        child: Column(
      children: [
        //Text('$fsttanda'),
        //Text(tandainitial[15]),
        //Text('tanda'),
        DropdownButton<String>(
          alignment: Alignment.center,
          value: tandainitial2[fsttanda],
          items: tanda.map(buildMenuItem).toList(),
          onChanged: (tanda) =>
              setState(() => this.tandainitial2[fsttanda] = tanda!),
        )
      ],
    ));
  }

  Widget buildtanda3(int scdtanda) {
    return Container(
        child: Column(
      children: [
        Text('$scdtanda'),
        //Text(tandainitial[15]),
        //Text('tanda'),
        DropdownButton<String>(
          alignment: Alignment.center,
          value: tandainitial3[scdtanda],
          items: tanda.map(buildMenuItem).toList(),
          onChanged: (tanda) =>
              setState(() => this.tandainitial3[scdtanda] = tanda!),
        )
      ],
    ));
  }

  Widget buildtanda4(int thrtanda) {
    return Container(
        child: Column(
      children: [
        //Text('$thrtanda'),
        //Text(tandainitial[15]),
        //Text('tanda'),
        DropdownButton<String>(
          alignment: Alignment.center,
          value: tandainitial4[thrtanda],
          items: tanda.map(buildMenuItem).toList(),
          onChanged: (tanda) =>
              setState(() => this.tandainitial4[thrtanda] = tanda!),
        )
      ],
    ));
  }

  Widget buildtanda5(int tanda4) {
    return Container(
        child: Column(
      children: [
        Text('$tanda4'),
        //Text(tandainitial[15]),
        //Text('tanda'),
        DropdownButton<String>(
          alignment: Alignment.center,
          value: tandainitial5[tanda4],
          items: tanda.map(buildMenuItem).toList(),
          onChanged: (tanda) =>
              setState(() => this.tandainitial5[tanda4] = tanda!),
        )
      ],
    ));
  }

  Widget buildtanda6(int tanda5) {
    return Container(
        child: Column(
      children: [
        Text('$tanda5'),
        //Text(tandainitial[15]),
        //Text('tanda'),
        DropdownButton<String>(
          alignment: Alignment.center,
          value: tandainitial6[tanda5],
          items: tanda.map(buildMenuItem).toList(),
          onChanged: (tanda) =>
              setState(() => this.tandainitial6[tanda5] = tanda!),
        )
      ],
    ));
  }

  void addref() {
    //CollectionReference tanda = FirebaseFirestore.instance.collection("adl");
    tandaref();
    // tandaref2();
    // tandaref3();
    // tandaref4();
    // tandaref5();
    // tandaref6();
  }

  void tandaref() {
    CollectionReference Ctanda = FirebaseFirestore.instance.collection("adl");
    CollectionReference Ctanda2 =
        FirebaseFirestore.instance.collection("makan");
    Ctanda.add({
      //'email ': user!.email!,
      'tandamakan 1': tandainitial[0],
      'tandamakan 2': tandainitial[1],
      'tandamakan 3': tandainitial[2],
      'tandamakan 4': tandainitial[3],
      'tandamakan 5': tandainitial[4],
      'tandamakan 6': tandainitial[5],
      'tandamakan 7': tandainitial[6],
      'tandamakan 8': tandainitial[7],
      'tandamakan 9': tandainitial[8],
      'tandamakan 10': tandainitial[9],
      'tandamakan 11': tandainitial[10],
      'tandamakan 12': tandainitial[11],
      'tandamakan 13': tandainitial[12],
      'tandamakan 14': tandainitial[13],
      'tandamakan 15': tandainitial[14],
      'tandamakan 16': tandainitial[15],
      'tandamakan 17': tandainitial[16],
      'tandamakan 18': tandainitial[17],
      'tandamakan 19': tandainitial[18],
      'tandamakan 20': tandainitial[19],
      'tandamakan 21': tandainitial[20],
      'tandamakan 22': tandainitial[21],
      'tandamakan 23': tandainitial[22],
      'tandamakan 24': tandainitial[23],
      'tandamakan 25': tandainitial[24],
      'tandamakan 26': tandainitial[25],
      'tandamakan 27': tandainitial[26],
      'tandapakaian 1': tandainitial2[0],
      'tandapakaian 2': tandainitial2[1],
      'tandapakaian 3': tandainitial2[2],
      'tandapakaian 4': tandainitial2[3],
      'tandapakaian 5': tandainitial2[4],
      'tandapakaian 6': tandainitial2[5],
      'tandapakaian 7': tandainitial2[6],
      'tandapakaian 8': tandainitial2[7],
      'tandapakaian 9': tandainitial2[8],
      'tandapakaian 10': tandainitial2[9],
      'tandapakaian 11': tandainitial2[10],
      'tandapakaian 12': tandainitial2[11],
      'tandapakaian 13': tandainitial2[12],
      'tandapakaian 14': tandainitial2[13],
      'tandapakaian 15': tandainitial2[14],
      'tandapakaian 16': tandainitial2[15],
      'tandapakaian 17': tandainitial2[16],
      'tandapakaian 18': tandainitial2[17],
      'tandapakaian 19': tandainitial2[18],
      'tandapakaian 20': tandainitial2[19],
      'tandapakaian 21': tandainitial2[20],
      'tandamandi 1': tandainitial3[0],
      'tandamandi 2': tandainitial3[1],
      'tandamandi 3': tandainitial3[2],
      'tandamandi 4': tandainitial3[3],
      'tandamandi 5': tandainitial3[4],
      'tandamandi 6': tandainitial3[5],
      'tandamandi 7': tandainitial3[6],
      'tandamandi 8': tandainitial3[7],
      'tandatandas 1': tandainitial4[0],
      'tandatandas 2': tandainitial4[1],
      'tandatandas 3': tandainitial4[2],
      'tandatandas 4': tandainitial4[3],
      'tandatandas 5': tandainitial4[4],
      'tandatandas 6': tandainitial4[5],
      'tandatandas 7': tandainitial4[6],
      'tandatandas 8': tandainitial4[7],
      'tandatandas 9': tandainitial4[8],
      'tandatandas 10': tandainitial4[9],
      'tandatandas 11': tandainitial4[10],
      'tandatandas 12': tandainitial4[11],
      'tandatandas 13': tandainitial4[12],
      'tandatandas 14': tandainitial4[13],
      'tandatandas 15': tandainitial4[14],
      'tandatandas 16': tandainitial4[15],
      'tandatandas 17': tandainitial4[16],
      'tandatandas 18': tandainitial4[17],
      'tandagigi 1': tandainitial5[0],
      'tandagigi 2': tandainitial5[1],
      'tandagigi 3': tandainitial5[2],
      'tandagigi 4': tandainitial5[3],
      'tandagigi 5': tandainitial5[4],
      'tandagigi 6': tandainitial5[5],
      'tandagigi 7': tandainitial5[6],
      'tandagigi 8': tandainitial5[7],
      'tandagigi 9': tandainitial5[8],
      'tandacuci 1': tandainitial6[0],
      'tandacuci 2': tandainitial6[1],
      'tandacuci 3': tandainitial6[2],
      'tandacuci 4': tandainitial6[3],
      'tandacuci 5': tandainitial6[4],
      'tandacuci 6': tandainitial6[5],
      'tandacuci 7': tandainitial6[6],
      'tandacuci 8': tandainitial6[7],
      'tandacuci 9': tandainitial6[8],
      'catatan1': controllercatatan[0].text,
      'catatan2': controllercatatan[1].text,
      'catatan3': controllercatatan[2].text,
      'catatan4': controllercatatan[3].text,
      'catatan5': controllercatatan[4].text,
      'catatan6': controllercatatan[5].text,
      'catatan7': controllercatatan[6].text,
      'catatan8': controllercatatan[7].text,
      'catatan9': controllercatatan[8].text,
      'catatan10': controllercatatan[9].text,
      'catatan11': controllercatatan[10].text,
      'catatan12': controllercatatan[11].text,
      'catatan13': controllercatatan[12].text,
      'catatan14': controllercatatan[13].text,
      'catatan15': controllercatatan[14].text,
      'catatan16': controllercatatan[15].text,
      'catatan17': controllercatatan[16].text,
      'catatan18': controllercatatan[17].text,
      'catatan19': controllercatatan[18].text,
      'catatan20': controllercatatan[19].text,
      'catatan21': controllercatatan[20].text,
      'catatan22': controllercatatan[21].text,
      'catatan23': controllercatatan[22].text,
      'catatan24': controllercatatan[23].text,
      'catatan25': controllercatatan[24].text,
      'catatan26': controllercatatan[25].text,
      'catatan27': controllercatatan[26].text,
      'catatanm1': controllercatatan2[0].text,
      'catatanm2': controllercatatan2[1].text,
      'catatanm3': controllercatatan2[2].text,
      'catatanm4': controllercatatan2[3].text,
      'catatanm5': controllercatatan2[4].text,
      'catatanm6': controllercatatan2[5].text,
      'catatanm7': controllercatatan2[6].text,
      'catatanm8': controllercatatan2[7].text,
      'catatanm9': controllercatatan2[8].text,
      'catatanm10': controllercatatan2[9].text,
      'catatanm11': controllercatatan2[10].text,
      'catatanm12': controllercatatan2[11].text,
      'catatanm13': controllercatatan2[12].text,
      'catatanm14': controllercatatan2[13].text,
      'catatanm15': controllercatatan2[14].text,
      'catatanm16': controllercatatan2[15].text,
      'catatanm17': controllercatatan2[16].text,
      'catatanm18': controllercatatan2[17].text,
      'catatanm19': controllercatatan2[18].text,
      'catatanm20': controllercatatan2[19].text,
      'catatanm21': controllercatatan2[20].text,
      'catatanmandi1': controllercatatan3[0].text,
      'catatanmandi2': controllercatatan3[1].text,
      'catatanmandi3': controllercatatan3[2].text,
      'catatanmandi4': controllercatatan3[3].text,
      'catatanmandi5': controllercatatan3[4].text,
      'catatanmandi6': controllercatatan3[5].text,
      'catatanmandi7': controllercatatan3[6].text,
      'catatanmandi8': controllercatatan3[7].text,
      'catatantandas1': controllercatatan4[0].text,
      'catatantandas2': controllercatatan4[1].text,
      'catatantandas3': controllercatatan4[2].text,
      'catatantandas4': controllercatatan4[3].text,
      'catatantandas5': controllercatatan4[4].text,
      'catatantandas6': controllercatatan4[5].text,
      'catatantandas7': controllercatatan4[6].text,
      'catatantandas8': controllercatatan4[7].text,
      'catatantandas9': controllercatatan4[8].text,
      'catatantandas10': controllercatatan4[9].text,
      'catatantandas11': controllercatatan4[10].text,
      'catatantandas12': controllercatatan4[11].text,
      'catatantandas13': controllercatatan4[12].text,
      'catatantandas14': controllercatatan4[13].text,
      'catatantandas15': controllercatatan4[14].text,
      'catatantandas16': controllercatatan4[15].text,
      'catatantandas17': controllercatatan4[16].text,
      'catatantandas18': controllercatatan4[17].text,
      'catatantandas19': controllercatatan4[18].text,
      'catatantandas20': controllercatatan4[19].text,
      'catatangigi1': controllercatatan5[0].text,
      'catatangigi2': controllercatatan5[1].text,
      'catatangigi3': controllercatatan5[2].text,
      'catatangigi4': controllercatatan5[3].text,
      'catatangigi5': controllercatatan5[4].text,
      'catatangigi6': controllercatatan5[5].text,
      'catatangigi7': controllercatatan5[6].text,
      'catatangigi8': controllercatatan5[7].text,
      'catatangigi9': controllercatatan5[8].text,
      'catatangigi10': controllercatatan5[9].text,
      'catatancuci1': controllercatatan6[0].text,
      'catatancuci2': controllercatatan6[1].text,
      'catatancuci3': controllercatatan6[2].text,
      'catatancuci4': controllercatatan6[3].text,
      'catatancuci5': controllercatatan6[4].text,
      'catatancuci6': controllercatatan6[5].text,
      'catatancuci7': controllercatatan6[6].text,
      'catatancuci8': controllercatatan6[7].text,
      'catatancuci9': controllercatatan6[8].text,
    })
        .then((value) => print('Respond Added'))
        .catchError((error) => print('Failed to add respond: $error'));
  }

  void tandaref2() {
    CollectionReference tanda = FirebaseFirestore.instance.collection("adl");
    tanda
        .add({
          'tandapakaian 1': tandainitial2[0],
          'tandapakaian 2': tandainitial2[1],
          'tandapakaian 3': tandainitial2[2],
          'tandapakaian 4': tandainitial2[3],
          'tandapakaian 5': tandainitial2[4],
          'tandapakaian 6': tandainitial2[5],
          'tandapakaian 7': tandainitial2[6],
          'tandapakaian 8': tandainitial2[7],
          'tandapakaian 9': tandainitial2[8],
          'tandapakaian 10': tandainitial2[9],
          'tandapakaian 11': tandainitial2[10],
          'tandapakaian 12': tandainitial2[11],
          'tandapakaian 13': tandainitial2[12],
          'tandapakaian 14': tandainitial2[13],
          'tandapakaian 15': tandainitial2[14],
          'tandapakaian 16': tandainitial2[15],
          'tandapakaian 17': tandainitial2[16],
          'tandapakaian 18': tandainitial2[17],
          'tandapakaian 19': tandainitial2[18],
          'tandapakaian 20': tandainitial2[19],
          'tandapakaian 21': tandainitial2[20],
        })
        .then((value) => print('Respond Pakaian Added'))
        .catchError((error) => print('Failed to add respond: $error'));
  }

  void tandaref3() {
    CollectionReference tanda = FirebaseFirestore.instance.collection("adl");
    tanda
        .add({
          'tandamandi 1': tandainitial3[0],
          'tandamandi 2': tandainitial3[1],
          'tandamandi 3': tandainitial3[2],
          'tandamandi 4': tandainitial3[3],
          'tandamandi 5': tandainitial3[4],
          'tandamandi 6': tandainitial3[5],
          'tandamandi 7': tandainitial3[6],
          'tandamandi 8': tandainitial3[7],
          'tandamandi 9': tandainitial3[8],
          'tandamandi 10': tandainitial3[9],
          'tandamandi 11': tandainitial3[10],
          'tandamandi 12': tandainitial3[11],
          'tandamandi 13': tandainitial3[12],
          'tandamandi 14': tandainitial3[13],
          'tandamandi 15': tandainitial3[14],
          'tandamandi 16': tandainitial3[15],
          'tandamandi 17': tandainitial3[16],
          'tandamandi 18': tandainitial3[17],
          'tandamandi 19': tandainitial3[18],
          'tandamandi 20': tandainitial3[19],
          'tandamandi 21': tandainitial3[20],
        })
        .then((value) => print('Respond Mandi Added'))
        .catchError((error) => print('Failed to add respond: $error'));
  }

  void tandaref4() {
    CollectionReference tanda = FirebaseFirestore.instance.collection("adl");
    tanda
        .add({
          'tandatandas 1': tandainitial4[0],
          'tandatandas 2': tandainitial4[1],
          'tandatandas 3': tandainitial4[2],
          'tandatandas 4': tandainitial4[3],
          'tandatandas 5': tandainitial4[4],
          'tandatandas 6': tandainitial4[5],
          'tandatandas 7': tandainitial4[6],
          'tandatandas 8': tandainitial4[7],
          'tandatandas 9': tandainitial4[8],
          'tandatandas 10': tandainitial4[9],
          'tandatandas 11': tandainitial4[10],
          'tandatandas 12': tandainitial4[11],
          'tandatandas 13': tandainitial4[12],
          'tandatandas 14': tandainitial4[13],
          'tandatandas 15': tandainitial4[14],
          'tandatandas 16': tandainitial4[15],
          'tandatandas 17': tandainitial4[16],
          'tandatandas 18': tandainitial4[17],
        })
        .then((value) => print('Respond Tandas Added'))
        .catchError((error) => print('Failed to add respond: $error'));
  }

  void tandaref5() {
    CollectionReference tanda = FirebaseFirestore.instance.collection("adl");
    tanda
        .add({
          'tandagigi 1': tandainitial5[0],
          'tandagigi 2': tandainitial5[1],
          'tandagigi 3': tandainitial5[2],
          'tandagigi 4': tandainitial5[3],
          'tandagigi 5': tandainitial5[4],
          'tandagigi 6': tandainitial5[5],
          'tandagigi 7': tandainitial5[6],
          'tandagigi 8': tandainitial5[7],
          'tandagigi 9': tandainitial5[8],
        })
        .then((value) => print('Respond Gigi Added'))
        .catchError((error) => print('Failed to add respond: $error'));
  }

  void tandaref6() {
    CollectionReference tanda = FirebaseFirestore.instance.collection("adl");
    tanda
        .add({
          'tandacuci 1': tandainitial6[0],
          'tandacuci 2': tandainitial6[1],
          'tandacuci 3': tandainitial6[2],
          'tandacuci 4': tandainitial6[3],
          'tandacuci 5': tandainitial6[4],
          'tandacuci 6': tandainitial6[5],
          'tandacuci 7': tandainitial6[6],
          'tandacuci 8': tandainitial6[7],
        })
        .then((value) => print('Respond Cuci Tangan Added'))
        .catchError((error) => print('Failed to add respond: $error'));
  }

  DropdownMenuItem<String> buildMenuItem(String tandainitial) =>
      DropdownMenuItem(
        value: tandainitial,
        child: Text(tandainitial),
      );

  DropdownMenuItem<String> MenuItem(String Bangsa) => DropdownMenuItem(
        value: Bangsa,
        child: Text(Bangsa),
      );

  DropdownMenuItem<String> MenuItemed(String Religion) => DropdownMenuItem(
        value: Religion,
        child: Text(Religion),
      );

  TableRow spacetable() {
    return TableRow(children: [
      Column(children: [Text('')]),
      Column(children: [Text('')]),
      Column(children: [Text('')]),
      Column(children: [Text('')]),
      Column(children: [Text('')]),
    ]);
  }
}

class OnSelected {
  OnSelected(BuildContext context, int item);
}
