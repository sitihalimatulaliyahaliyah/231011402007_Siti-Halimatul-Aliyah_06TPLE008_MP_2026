# Jawaban UTS Mobile Programming - Aplikasi Workshop Kampus

---

## Soal 1: Desain Halaman Utama Aplikasi Workshop Kampus

### 1. Sketsa Layout & Struktur Widget
Tampilan disusun menggunakan struktur **Tree Widget** Flutter untuk memastikan informasi terorganisir dan tidak menumpuk:
* **Scaffold**: Sebagai frame utama aplikasi yang menyediakan area `AppBar` dan `body`.
* **ListView.builder**: Digunakan untuk menampilkan daftar workshop secara dinamis. Widget ini dipilih karena efisien dalam menangani banyak data sekaligus memberikan fungsi *scrolling*.
* **Card**: Digunakan sebagai kontainer tiap item workshop. Widget ini memberikan efek elevasi (bayangan) dan batas visual yang jelas antar informasi.
* **Column**: Digunakan di dalam Card untuk menyusun elemen secara vertikal (Judul -> Divider -> Detail -> Tombol).
* **Row**: Digunakan untuk menyandingkan ikon detail (Kalender, Pin Lokasi, Person) dengan teks keterangan agar rapi secara horisontal.
* **Container**: Digunakan untuk membuat *Badge* (label) pada bagian sisa kuota dengan warna latar belakang khusus.

### 2. Alasan Pemilihan Widget
* **Card & Padding**: Memberikan pemisahan visual yang kuat dan ruang kosong (*whitespace*) sehingga mata pengguna tidak cepat lelah saat membaca informasi yang banyak.
* **ElevatedButton**: Memberikan kesan "tombol yang bisa ditekan" secara nyata dengan efek bayangan dan warna kontras (Pink), memudahkan pengguna menemukan aksi utama aplikasi.
* **Divider**: Menambahkan garis horizontal tipis untuk memisahkan antara judul kursus dengan detail teknis (waktu/lokasi), mempertegas struktur hierarki informasi.

### 3. Kesalahan UI yang Dihindari
1.  **Informasi Tanpa Hierarki**: Menghindari penggunaan ukuran teks yang sama. Judul workshop menggunakan `fontSize: 20` dan `FontWeight.bold` agar menjadi pusat perhatian utama.
2.  **Kontras Rendah**: Menghindari warna teks yang menyatu dengan latar belakang. Dengan latar belakang `Color(0xFFFFFDE7)` (Kuning sangat muda) dan teks `pink[800]` (Pink Tua), tingkat keterbacaan (*readability*) menjadi sangat tinggi.

### 4. Penjelasan Kenyamanan Baca (UX)
Untuk meningkatkan kenyamanan baca, aplikasi menggunakan:
* **Visual Cues (Ikon)**: Penggunaan ikon dari `Icons.calendar_month`, `Icons.map_rounded`, dan `Icons.person_pin` membantu pengguna mengenali jenis informasi tanpa harus membaca kata pertama setiap baris.
* **Grouping**: Detail workshop dikelompokkan dalam satu kartu tertutup, sehingga pengguna bisa fokus memproses satu informasi workshop sebelum berpindah ke workshop lainnya.

---

## Soal 2: Implementasi Kode Flutter

Implementasi kode menggunakan **Data Driven UI**, di mana informasi 3 kursus berbeda disimpan dalam sebuah List dan ditampilkan menggunakan `ListView.builder`.

### Fitur Utama Kode:
* **3 Kursus Berbeda**: Menampilkan 'Creative Workshop: Flutter', 'Web Development: Html,Css,Jsgit', dan 'Data Science: Python'.
* **Tema Warna**: Dominasi warna **Pink** (AppBar & Button) dan **Amber/Kuning** (Icon & Background).
* **Modern Syntax**: Menggunakan `.withValues(alpha: 0.2)` untuk menangani bayangan, menggantikan metode lama yang sudah *deprecated*.

> **Catatan**: Kode lengkap pada file `lib/main.dart` di proyek ini.