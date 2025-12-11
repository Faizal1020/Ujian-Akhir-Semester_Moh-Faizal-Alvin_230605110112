# budaya_app

Aplikasi Flutter yang menampilkan data budaya Indonesia, mulai dari daftar budaya, pencarian, kategori, hingga detail budaya dan penyewaan. Data diambil melalui API berbasis JSON.

# Fitur Utama

- Menampilkan daftar budaya
- Detail budaya lengkap (nama, deskripsi, gambar, kategori, dll.)
- Pencarian budaya
- Filter berdasarkan kategori
- Halaman penyewaan budaya
- UI modern, responsif, dan clean
- Mendukung banyak platform (Android dan Windows)

# API Endpoint yang Digunakan
Aplikasi menggunakan API JSON yang disimpan di Vercel, jadi jika ingin akses API harus membuat akun Vercel terlebih dahulu:

a. Base URL API : https://vercel-upload-wbcoji9ew-faizalvs-projects.vercel.app/budaya.json
b. Endpoint: Get Semua Budaya : /budaya.json
c. Struktur Folder Project
   budaya_app/
    ├── lib/
    │   ├── config/
    │   ├── data/
    │   ├── models/
    │   ├── repository/
    │   ├── pages/
    │   ├── widgets/
    │   ├── utils/
    │   └── main.dart
    ├── assets/
    ├── android/
    ├── ios/
    ├── web/
    ├── linux/
    ├── macos/
    └── windows/

# Instalasi & Menjalankan Project

1. Clone Reppository : git clone https://github.com/Faizal1020/Ujian-Akhir-Semester_Moh-Faizal-Alvin_230605110112.git
                       cd Ujian-Akhir-Semester_Moh-Faizal-Alvin_230605110112
2. Install Dependencies : flutter pub get
3. Jalankan Aplikasi : flutter run

