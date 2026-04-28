## Anggota Kelompok

| Nama                     |        NIM |
| :----------------------- | ---------: |
| Dinda Aulia Rizky        | 2409116076 |
| Nadila Putri             | 2409116052 |
| Syawe Manisha P. Siregar | 2409116058 |
| Azhaar Athahiroh         | 2409116057 |

---

# ***Perancangan Website Taman Salma Shofa***

Website Taman Salma Shofa Samarinda merupakan website dinamis yang berfungsi sebagai sistem informasi sekaligus pengelolaan data wisata, dengan dua jenis pengguna yaitu pengunjung dan admin. Taman Salma Shofa sendiri adalah salah satu taman rekreasi populer di Kota Samarinda yang menawarkan berbagai wahana dan fasilitas untuk semua kalangan, terutama keluarga. Tempat ini memiliki suasana alam yang asri, dilengkapi dengan kolam renang, gazebo, area bermain, hingga spot foto yang menarik sehingga menjadi destinasi favorit untuk berlibur dan bersantai.

Bagi pengunjung, website ini menyediakan informasi lengkap seperti beranda, deskripsi wisata, fasilitas, harga tiket dan paket, serta fitur pengecekan ketersediaan gazebo secara real-time. Selain itu, tersedia juga halaman FAQ dan fitur kontak untuk berkomunikasi dengan admin. Bagi admin, website ini digunakan untuk mengelola data secara penuh (CRUD), seperti mengatur harga tiket, fasilitas, dan status gazebo, serta memantau melalui dashboard agar pengelolaan lebih terstruktur dan efisien.

Dalam pengembangannya, website ini menerapkan arsitektur Model-View-Controller (MVC) yang memisahkan antara pengelolaan data (Model), tampilan antarmuka (View), dan logika sistem (Controller), sehingga aplikasi lebih terorganisir, mudah dikembangkan, dan scalable. Selain itu, website ini juga telah di-hosting, sehingga dapat diakses secara online kapan saja dan di mana saja oleh pengguna tanpa harus dijalankan secara lokal.

Secara keseluruhan, website ini mengintegrasikan kebutuhan informasi pengunjung dan operasional pengelola dalam satu sistem terpusat untuk meningkatkan kualitas layanan serta efektivitas pengelolaan wisata.

---

# ***Fitur Website Taman Salma Shofa Samarinda***

Website Taman Salma Shofa Samarinda memiliki berbagai fitur yang dirancang untuk memenuhi kebutuhan pengunjung dan admin. Fitur-fitur ini dibagi menjadi dua bagian utama, yaitu fitur untuk pengunjung (guest user) dan fitur untuk admin.

1. Fitur untuk Pengunjung (Guest User)

   Fitur yang tersedia untuk pengunjung berfungsi sebagai media informasi utama mengenai tempat wisata.

   - Beranda
   
    Halaman ini merupakan tampilan awal yang berisi informasi singkat mengenai Taman Salma Shofa, seperti jam operasional, harga tiket, peta lokasi, serta ulasan pengunjung. Selain itu, terdapat tombol navigasi cepat untuk mengakses fitur penting.
   
   - Informasi Umum
     
      Menyajikan deskripsi lengkap mengenai tempat wisata, termasuk latar belakang dan daya tarik utama. Halaman ini juga dilengkapi dengan galeri foto.

   - Fasilitas dan Layanan
   
     Menampilkan berbagai fasilitas yang tersedia, seperti area parkir, mushola, dan area bermain. Selain itu, terdapat layanan tambahan seperti penyewaan pakaian tradisional.

    - Gazebo
   
      Halaman ini merupakan fitur utama yang menampilkan ketersediaan gazebo secara real-time. Pengunjung dapat mengetahui status gazebo (tersedia, disewa, atau booking) tanpa harus menghubungi admin. Tersedia juga tombol untuk menghubungi admin secara langsung.

    - Penawaran
    
      Menampilkan daftar harga tiket masuk dan paket dalam bentuk tabel agar mudah dipahami oleh pengunjung.

   - FAQ (Frequently Asked Questions)

     Berisi kumpulan pertanyaan umum beserta jawabannya untuk membantu pengunjung mendapatkan informasi dengan cepat tanpa harus bertanya langsung kepada admin.

   - Kontak

     Digunakan untuk menghubungkan pengunjung dengan pihak pengelola jika membutuhkan informasi lebih lanjut.
     
2. Fitur untuk Admin
    
   Fitur admin digunakan untuk mengelola data dan informasi yang ditampilkan pada website.
    
    - Login Admin
   
      Digunakan sebagai sistem autentikasi untuk membatasi akses ke halaman admin.
    
    - Dashboard
    
      Menampilkan ringkasan data seperti jumlah gazebo, status ketersediaan, dan data penyewaan. Halaman ini membantu admin dalam memantau kondisi secara keseluruhan.

   - Status Gazebo
   
     Digunakan untuk mengelola ketersediaan gazebo. Admin dapat mengatur status, melakukan filter berdasarkan kategori dan tanggal, serta menginput data penyewa.

   - Kelola Harga

     Memungkinkan admin untuk menambah, mengubah, dan menghapus data harga tiket dan paket secara dinamis.

   - Kelola Fasilitas

     Digunakan untuk mengelola data fasilitas, termasuk menambahkan, mengedit, dan menghapus data, serta mengunggah gambar fasilitas.

3. Fitur Pendukung Sistem
    
    Selain fitur utama, terdapat beberapa fitur pendukung dalam sistem, yaitu:
    
    - Penerapan Arsitektur MVC (Model-View-Controller)
    
      Sistem dikembangkan dengan konsep MVC untuk memisahkan antara data, tampilan, dan logika program. Hal ini membuat sistem lebih terstruktur dan mudah dikembangkan.

    - Sistem Real-Time pada Ketersediaan Gazebo

      Data gazebo terhubung langsung dengan database sehingga informasi yang ditampilkan selalu terbaru.
    Sistem Hosting (Online)
  
  - Website telah di-hosting sehingga dapat diakses kapan saja dan di mana saja melalui internet.
