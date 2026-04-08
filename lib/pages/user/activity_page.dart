import 'package:flutter/material.dart';
import '../../widgets/inforsa_header.dart';
import 'forms/perpanjangan_page.dart';
import 'forms/pengembalian_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['Peminjaman', 'Pengembalian', 'Perpanjangan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const InforsaHeader(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // --- HORIZONTAL FILTER (PILIHAN KATEGORI) ---
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                bool isActive = _selectedFilterIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilterIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.black : const Color(0xFFF1F2F4),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _filters[index],
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.grey[700],
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // --- KONTEN BERDASARKAN FILTER ---
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedFilterIndex == 0) {
      return _buildPeminjamanView();
    } else if (_selectedFilterIndex == 1) {
      return _buildPengembalianView();
    } else {
      return _buildPerpanjanganView();
    }
  }

  Widget _buildPeminjamanView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Pinjaman Aktif (08)', actionText: 'Lihat Semua'),
          const SizedBox(height: 16),
          _buildActiveCard(
            context: context,
            imageUrl:
                'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&q=80&w=200',
            badgeText: 'AKTIF',
            badgeColor: const Color(0xFFE8EEF2),
            badgeTextColor: const Color(0xFF5A729B),
            sku: '#SKU-88210',
            title: 'Sony WH-1000XM5',
            subtitle: 'Kembali: 24 Okt 2023',
          ),
          const SizedBox(height: 32),
          const Text(
            'Terlambat Kembalikan (01)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB91C1C),
            ),
          ),
          const SizedBox(height: 16),
          _buildLateCard(
            context: context,
            imageUrl:
                'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&q=80&w=200',
            badgeText: 'TERLAMBAT',
            sku: '#SKU-99021',
            title: 'MacBook Pro',
            subtitle: 'Lewat 2 hari',
          ),
        ],
      ),
    );
  }

  Widget _buildPengembalianView() => _buildEmptyState(
    Icons.inventory_2_outlined,
    'Belum ada riwayat pengembalian',
  );
  Widget _buildPerpanjanganView() =>
      _buildEmptyState(Icons.history, 'Belum ada riwayat perpanjangan');

  Widget _buildEmptyState(IconData icon, String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {String? actionText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (actionText != null)
          Text(
            actionText,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildActiveCard({
    required BuildContext context,
    required String imageUrl,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required String sku,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PerpanjanganPage()),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    badgeText,
                    style: TextStyle(
                      color: badgeTextColor,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildLateCard({
    required BuildContext context,
    required String imageUrl,
    required String badgeText,
    required String sku,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFECACA)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB91C1C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PengembalianPage()),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB91C1C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Kembalikan',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
