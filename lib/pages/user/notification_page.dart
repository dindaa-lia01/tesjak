import 'package:flutter/material.dart';
import '../../widgets/user_navbar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Background abu-abu terang
      // Header khusus Notifikasi (Sesuai desain: Putih, tombol back, teks hitam)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(
              context,
            ); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'INFORSA',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- JUDUL & SUBJUDUL ---
            const Text(
              'Notifikasi',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Kelola pembaruan dan status inventaris\nAnda.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // TODO: Aksi tandai semua dibaca
                  },
                  child: const Text(
                    'Tandai\ndibaca',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0052CC), // Warna biru link
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // --- SECTION: HARI INI ---
            _buildDateDivider('HARI INI'),
            const SizedBox(height: 16),

            // Notifikasi 1: Keterlambatan (Merah)
            _buildNotificationCard(
              iconData: Icons.history, // Icon jam terbalik/history
              iconColor: const Color(0xFFDC2626), // Merah tua
              iconBgColor: const Color(0xFFFEE2E2), // Merah pudar
              title: 'Status\nKeterlambatan',
              time: '2 jam yang lalu',
              description:
                  'Peminjaman Kamera Sony A7III telah melewati batas waktu pengembalian. Segera hubungi admin.',
              isUnread: true,
              unreadDotColor: const Color(0xFFDC2626),
            ),
            const SizedBox(height: 16),

            // Notifikasi 2: Pengingat (Kuning)
            _buildNotificationCard(
              iconData: Icons.update,
              iconColor: const Color(0xFFD97706), // Kuning kecokelatan
              iconBgColor: const Color(0xFFFEF3C7), // Kuning pudar
              title: 'Pengingat\nPengembalian',
              time: '5 jam yang lalu',
              description:
                  'Batas waktu pengembalian DJI Ronin-S adalah besok, pukul 10:00 WIB. Pastikan semua kelengkapan tersedia.',
              isUnread: true,
              unreadDotColor: const Color(0xFFD97706),
            ),
            const SizedBox(height: 32),

            // --- SECTION: KEMARIN ---
            _buildDateDivider('KEMARIN'),
            const SizedBox(height: 16),

            // Notifikasi 3: Persetujuan (Hijau)
            _buildNotificationCard(
              iconData: Icons.check_circle,
              iconColor: const Color(0xFF16A34A), // Hijau tua
              iconBgColor: const Color(0xFFDCFCE7), // Hijau pudar
              title: 'Persetujuan Admin',
              time: '1 hari yang lalu',
              description:
                  'Permintaan peminjaman Lensa 85mm f/1.8 telah disetujui oleh Admin. Anda dapat mengambil barang di loket.',
              isUnread: false,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      // Menyertakan Navbar agar tampilannya persis desain PNG
      bottomNavigationBar: UserNavbar(
        selectedIndex: 0,
        onItemTapped: (index) {
          Navigator.pop(
            context,
          ); // Kembali ke MainUserPage jika tombol navbar lain diklik
        },
      ),
    );
  }

  // Helper Widget: Pemisah Tanggal dengan Garis
  Widget _buildDateDivider(String dateText) {
    return Row(
      children: [
        Text(
          dateText,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Container(height: 1, color: Colors.grey[300])),
      ],
    );
  }

  // Helper Widget: Kartu Notifikasi
  Widget _buildNotificationCard({
    required IconData iconData,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String time,
    required String description,
    required bool isUnread,
    Color? unreadDotColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Sebelah Kiri
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),

          // Konten Sebelah Kanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (isUnread) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: unreadDotColor ?? Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
