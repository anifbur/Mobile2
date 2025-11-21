import 'package:flutter/material.dart';

enum StatusMahasiswa { aktif, cuti, lulus }

class UserProfile {
  final String nama;
  final String nim;
  final String jurusan;
  final String email;
  final String telepon;

  final List<String> hobi;
  final List<String> skills;

  final StatusMahasiswa status;
  final String foto;

  const UserProfile({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.email,
    required this.telepon,
    required this.hobi,
    required this.skills,
    required this.status,
    required this.foto,
  });

  String getStatusString() {
    switch (status) {
      case StatusMahasiswa.aktif:
        return "Aktif";
      case StatusMahasiswa.cuti:
        return "Cuti";
      case StatusMahasiswa.lulus:
        return "Lulus";
    }
  }
}
