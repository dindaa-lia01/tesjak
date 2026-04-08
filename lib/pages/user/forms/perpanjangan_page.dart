import 'package:flutter/material.dart';
import 'package:inforsa_inventory/widgets/user_navbar.dart';

class PerpanjanganPage extends StatefulWidget {
  const PerpanjanganPage({super.key});

  @override
  State<PerpanjanganPage> createState() => _PerpanjanganPageState();
}

class _PerpanjanganPageState extends State<PerpanjanganPage> {
  DateTime? _newDueDate;

  // Fungsi pemilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(), // Tidak bisa pilih hari yang sudah lewat
      lastDate: DateTime.now().add(
        const Duration(days: 30),
      ), // Maksimal 30 hari sesuai deskripsi
    );

    if (picked != null) {
      setState(() {
        _newDueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      // Header putih polos sesuai desain
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading:
            false, // Kita matikan back default karena pakai custom
        title: Row(
          children: [
            Icon(Icons.inventory_2_outlined, color: Colors.black, size: 24),
            const SizedBox(width: 8),
            const Text(
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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black, size: 26),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TOMBOL KEMBALI KUSTOM ---
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: 18, color: Colors.black54),
                  const SizedBox(width: 8),
                  Text(
                    'Kembali ke Borrowing',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- JUDUL ---
            const Text(
              'Permintaan\nPerpanjangan',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                height: 1.2,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sesuaikan masa pinjam asset inventaris Anda.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),

            // --- CARD: INFO ASET ---
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar & Badge
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&q=80&w=600',
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 119, 6, 0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'DIPINJAM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Detail Aset
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MacBook Pro M2',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Serial: Apple-MBP-2023-0882',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Box Tanggal Pinjam
                        _buildCurrentDateBox('TANGGAL PINJAM', '12 Okt 2023'),
                        const SizedBox(height: 12),

                        // Box Jatuh Tempo
                        _buildCurrentDateBox(
                          'JATUH TEMPO SAAT INI',
                          '12 Nov 2023',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- CARD: FORM PERPANJANGAN ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail Perpanjangan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input Tanggal Baru
                  const Text(
                    'TANGGAL JATUH TEMPO BARU',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBECEF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _newDueDate != null
                                ? "${_newDueDate!.day}/${_newDueDate!.month}/${_newDueDate!.year}"
                                : 'dd/mm/yyyy',
                            style: TextStyle(
                              color: _newDueDate != null
                                  ? Colors.black87
                                  : Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.black54,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Maksimal perpanjangan adalah 30 hari dari tanggal jatuh tempo saat ini.',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 20),

                  // Input Alasan
                  const Text(
                    'ALASAN PERPANJANGAN',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBECEF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText:
                            'Jelaskan kebutuhan Anda untuk memperpanjang penggunaan asset ini...',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Tombol Ajukan
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Submit perpanjangan
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
                        children: const [
                          Text(
                            'Ajukan Perpanjangan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tombol Batalkan
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Batalkan',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- INFO BOX BIRU ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E7FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Color(0xFF3730A3), size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Permintaan perpanjangan akan ditinjau oleh Admin Inventaris. Anda akan menerima notifikasi status persetujuan dalam 1x24 jam.',
                      style: TextStyle(
                        color: const Color.fromRGBO(55, 48, 163, 0.8),
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: UserNavbar(
        selectedIndex: 0,
        onItemTapped: (index) => Navigator.pop(context),
      ),
    );
  }

  // Helper: Membuat Box Tanggal (Pinjam & Jatuh Tempo)
  Widget _buildCurrentDateBox(String label, String date) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F2F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_month_outlined, size: 20, color: Colors.black87),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
