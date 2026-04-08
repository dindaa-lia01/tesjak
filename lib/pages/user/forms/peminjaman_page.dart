import 'package:flutter/material.dart';
import '../../../widgets/user_navbar.dart';

class PeminjamanPage extends StatefulWidget {
  const PeminjamanPage({super.key});

  @override
  State<PeminjamanPage> createState() => _PeminjamanPageState();
}

class _PeminjamanPageState extends State<PeminjamanPage> {
  String? _selectedDepartment;
  DateTime? _borrowDate;
  DateTime? _returnDate;

  final List<String> _departments = [
    'IT & Infrastruktur',
    'Creative & Design',
    'Marketing',
    'Operasional',
  ];

  Future<void> _selectDate(BuildContext context, bool isBorrowDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isBorrowDate) {
          _borrowDate = picked;
        } else {
          _returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'INFORSA',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=150',
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Formulir Peminjaman',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pastikan data benar untuk mempercepat persetujuan.',
                    style: TextStyle(color: Colors.grey[400], fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            _buildLabel('NAMA PEMINJAM'),
            _buildReadOnlyField('Budi Setiawan', Icons.person_outline),

            const SizedBox(height: 24),
            _buildLabel('DEPARTEMEN'),
            _buildDropdownField(),

            const SizedBox(height: 24),
            _buildLabel('NAMA ASET'),
            _buildTextField('Cari nama atau kode aset...', Icons.search),

            const SizedBox(height: 24),
            _buildLabel('TANGGAL PINJAM'),
            GestureDetector(
              onTap: () => _selectDate(context, true),
              child: _buildDateField(_borrowDate),
            ),

            const SizedBox(height: 24),
            _buildLabel('RENCANA KEMBALI'),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: _buildDateField(_returnDate),
            ),

            const SizedBox(height: 24),
            _buildLabel('ALASAN MEMINJAM'),
            _buildTextField('Jelaskan tujuan peminjaman...', null, maxLines: 4),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Ajukan Peminjaman',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    ),
  );

  Widget _buildReadOnlyField(String text, IconData icon) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F2F4),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    ),
  );

  Widget _buildDropdownField() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFEBECEF),
      borderRadius: BorderRadius.circular(12),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: _selectedDepartment,
        hint: const Text('Pilih Departemen'),
        items: _departments
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (v) => setState(() => _selectedDepartment = v),
      ),
    ),
  );

  Widget _buildTextField(String hint, IconData? icon, {int maxLines = 1}) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEBECEF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      );

  Widget _buildDateField(DateTime? date) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFEBECEF),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(Icons.calendar_today_outlined, size: 20),
        const SizedBox(width: 12),
        Text(
          date != null
              ? "${date.day}/${date.month}/${date.year}"
              : 'mm/dd/yyyy',
        ),
      ],
    ),
  );
}
