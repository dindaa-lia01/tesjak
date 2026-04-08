import 'package:flutter/material.dart';
import '../../widgets/inforsa_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold warna putih menyesuaikan background aplikasi
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const InforsaHeader(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            // --- SECTION: AVATAR & HEADER PROFIL ---
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.grey,
                      // TODO: Ganti dengan NetworkImage atau AssetImage jika sudah ada foto aslinya
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=Aditya+Pratama&size=200&background=random',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Aditya Pratama',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'NIM: 2109106032',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // --- SECTION: INFORMASI PRIBADI ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(
                  0xFFF7F8FA,
                ), // Warna abu-abu terang sesuai desain
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Pribadi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildInfoRow(
                    'NAMA LENGKAP',
                    'Aditya Pratama',
                    showArrow: true,
                  ),
                  const SizedBox(height: 20),
                  _buildInfoRow('NIM', '2109106032', showArrow: false),
                  const SizedBox(height: 20),
                  _buildInfoRow(
                    'DEPARTEMEN',
                    'Bureau Enterpreneurship',
                    showArrow: false,
                  ),
                  const SizedBox(height: 20),
                  _buildInfoRow(
                    'WHATSAPP',
                    '+62 812-3456-7890',
                    showArrow: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- SECTION: KEAMANAN ---
            _buildActionCard(
              title: 'Keamanan',
              icon: Icons
                  .restore, // Menyesuaikan icon panah melingkar (refresh/history style) dengan gembok
              subtitle: 'Ubah Password',
            ),
            const SizedBox(height: 20),

            // --- SECTION: PUSAT BANTUAN ---
            _buildActionCard(
              title: 'Pusat Bantuan',
              icon: Icons.support_agent, // Icon CS/Admin
              subtitle: 'Kontak Admin',
            ),
            const SizedBox(height: 32),

            // --- SECTION: TOMBOL KELUAR (LOGOUT) ---
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Tambahkan fungsi logout (Provider/Supabase)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFEBEB), // Warna merah pudar
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Color(0xFFD92D20), // Warna ikon merah tua
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Keluar',
                      style: TextStyle(
                        color: Color(0xFFD92D20), // Warna teks merah tua
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Spasi bawah sebelum mentok navbar
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk list di "Informasi Pribadi"
  Widget _buildInfoRow(String label, String value, {required bool showArrow}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (showArrow)
          Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
      ],
    );
  }

  // Helper Widget untuk card "Keamanan" dan "Pusat Bantuan"
  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFE5E7EB,
                  ), // Kotak abu-abu di belakang ikon
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: Colors.black87),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
