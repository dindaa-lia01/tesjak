// File: lib/pages/user/forms/pengembalian_page.dart

import 'package:flutter/material.dart';
import '../../../widgets/user_navbar.dart';

class PengembalianPage extends StatelessWidget {
  const PengembalianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Pengembalian Aset',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    'INFORSA',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // --- CARD ASET ---
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 64,
                            height: 64,
                            color: Colors.black87,
                            child: Icon(Icons.image, color: Colors.white54, size: 28),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('NAMA ASSET', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.0)),
                              const SizedBox(height: 4),
                              const Text('MacBook Pro M2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                              const SizedBox(height: 4),
                              Text('ASSET-2023-MBP-001', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('TANGGAL PINJAM', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.0)),
                            SizedBox(height: 4),
                            Text('12 Okt 2023', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('JATUH TEMPO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54, letterSpacing: 1.0)),
                            SizedBox(height: 4),
                            Text('20 Okt 2023', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFDC2626))),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // --- FOTO KONDISI ---
              const Text('Kondisi Asset Setelah Pemakaian', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildPhotoUploadBox('Foto Depan')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildPhotoUploadBox('Foto Belakang')),
                ],
              ),
              const SizedBox(height: 24),

              // --- CATATAN TAMBAHAN ---
              const Text('Catatan Tambahan', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBECEF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Tuliskan jika ada kerusakan atau kendala teknis...',
                    hintStyle: TextStyle(color: Colors.black45, fontSize: 13),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // --- TOMBOL KONFIRMASI ---
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Aksi submit pengembalian
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Konfirmasi Pengembalian', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --- DISCLAIMER ---
              Center(
                child: Text(
                  'Dengan menekan tombol di atas, Anda menyatakan\nbahwa data kondisi asset yang diberikan adalah\nbenar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: Colors.grey[600], height: 1.5),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: UserNavbar(selectedIndex: 0, onItemTapped: (index) => Navigator.pop(context)),
    );
  }

  Widget _buildPhotoUploadBox(String label) {
    return InkWell(
      onTap: () {
        // TODO: Aksi buka kamera/galeri
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: const Color(0xFFEBECEF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(Icons.camera_alt_outlined, color: Colors.black54, size: 28),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
