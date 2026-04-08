import 'package:flutter/material.dart';
import '../../widgets/inforsa_header.dart'; // Memanggil header yang sudah kita buat

class InventoryUserPage extends StatelessWidget {
  const InventoryUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F9FA,
      ), // Warna background abu-abu sangat muda
      appBar: const InforsaHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SECTION: JUDUL & SUBJUDUL ---
              const Text(
                'Katalog Aset',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Temukan dan pinjam perlengkapan yang\nAnda butuhkan untuk produktivitas kerja.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),

              // --- SECTION: SEARCH BAR ---
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBECEF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey, size: 20),
                    hintText: 'Cari nama aset, brand, atau SKU...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --- SECTION: TOMBOL FILTER ---
              SizedBox(
                width: double.infinity, // Full width sesuai desain
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Aksi buka modal/bottom sheet filter
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Filter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- SECTION: CATEGORY CHIPS (Bisa di-scroll ke samping) ---
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip(label: 'Semua Aset', isSelected: true),
                    const SizedBox(width: 12),
                    _buildCategoryChip(
                      label: 'Perlengkapan',
                      isSelected: false,
                    ),
                    const SizedBox(width: 12),
                    _buildCategoryChip(
                      label: 'Peralatan',
                      isSelected: false,
                    ), // Asumsi teks terpotong di gambar
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- SECTION: LIST ASET ---

              // 1. MacBook (Available)
              _buildAssetCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&q=80&w=800', // Pake link online biar aman dari bug Web
                categorySku: 'ELECTRONICS • LAP-001',
                title: 'MacBook Pro M2 Max 16" 32GB',
                status: 'AVAILABLE',
                location: 'Lantai 4 • Blok B',
              ),
              const SizedBox(height: 20),

              // 2. Kamera Sony (Borrowed/Unavailable)
              _buildAssetCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&q=80&w=800',
                categorySku: 'PHOTOGRAPHY • CAM-012',
                title: 'Sony Alpha A7 IV Mirrorless Camera',
                status: 'BORROWED',
                borrowerName: 'Dimas Budi S.',
                borrowerAvatar:
                    'https://ui-avatars.com/api/?name=Dimas&background=random',
              ),
              const SizedBox(height: 20),

              // 3. Kursi Herman Miller (Available)
              _buildAssetCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1505843490538-5133c6c7d0e1?auto=format&fit=crop&q=80&w=800',
                categorySku: 'FURNITURE • FRN-102',
                title: 'Herman Miller Aeron Ergonomic Chair',
                status: 'AVAILABLE',
                location: 'Lantai 2 • Studio',
              ),
              const SizedBox(height: 20),

              // 4. Monitor LG (Available)
              _buildAssetCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?auto=format&fit=crop&q=80&w=800',
                categorySku: 'ELECTRONICS • MON-088',
                title: 'LG UltraWide 34" WQHD Curved',
                status: 'AVAILABLE',
                location: 'Gudang Utama',
              ),
              const SizedBox(height: 20),

              // 5. Headphone Sony (Borrowed/Unavailable)
              _buildAssetCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&q=80&w=800',
                categorySku: 'ELECTRONICS • AUD-010',
                title: 'Sony WH-1000XM5 Noise Canceling',
                status: 'BORROWED',
                borrowerName: 'Clara Salsabila',
                borrowerAvatar:
                    'https://ui-avatars.com/api/?name=Clara&background=random',
              ),
              const SizedBox(
                height: 80,
              ), // Padding bawah agar tidak mentok navbar
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget: Category Chip
  Widget _buildCategoryChip({required String label, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : const Color(0xFFF0F1F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
        ),
      ),
    );
  }

  // Helper Widget: Asset Card Utama
  Widget _buildAssetCard({
    required String imageUrl,
    required String categorySku,
    required String title,
    required String status,
    String? location,
    String? borrowerName,
    String? borrowerAvatar,
  }) {
    bool isAvailable = status == 'AVAILABLE';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Atas: Gambar + Badge Status
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Badge Status (Pojok Kiri Atas Gambar)
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isAvailable
                        ? const Color(0xFF1B4D3E).withOpacity(
                            0.85,
                          ) // Hijau gelap
                        : const Color(
                            0xFF4A3424,
                          ).withOpacity(0.85), // Cokelat gelap
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isAvailable ? 'AVAILABLE' : 'BORROWED', // Sesuaikan label
                    style: TextStyle(
                      color: isAvailable
                          ? const Color(0xFF4ADE80)
                          : const Color(0xFFFBBF24),
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bagian Bawah: Detail Teks & Tombol
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categorySku,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[500],
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),

                // Baris Terakhir: Lokasi/Peminjam & Tombol Aksi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Kiri: Lokasi atau Profil Peminjam
                    Expanded(
                      child: isAvailable
                          ? Text(
                              location ?? '',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: NetworkImage(
                                    borrowerAvatar ?? '',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    borrowerName ?? '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                    ),

                    // Kanan: Tombol Pinjam / Label Unavailable
                    isAvailable
                        ? InkWell(
                            onTap: () {
                              // TODO: Navigasi ke Form Peminjaman
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Pinjam Aset',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEBECEF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Unavailable',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
