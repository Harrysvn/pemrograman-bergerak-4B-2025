import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

class TambahWisataPage extends StatefulWidget {
  const TambahWisataPage({super.key});

  @override
  State<TambahWisataPage> createState() => _TambahWisataPageState();
}

class _TambahWisataPageState extends State<TambahWisataPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  String? jenisWisata;
  final List<String> jenisWisataList = ['Alam', 'Budaya', 'Kuliner', 'Sejarah'];

  void resetForm() {
    setState(() {
      namaController.clear();
      lokasiController.clear();
      hargaController.clear();
      deskripsiController.clear();
      jenisWisata = null;
    });
  }

  bool isFormValid() {
    return namaController.text.isNotEmpty &&
        lokasiController.text.isNotEmpty &&
        hargaController.text.isNotEmpty &&
        deskripsiController.text.isNotEmpty &&
        jenisWisata != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Wisata'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Placeholder upload image
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // warna background netral
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_photo_alternate,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Aksi upload image
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // sudut sedikit melengkung
                  ),
                ),
                child: const Text("Upload Image"),
              ),
              const SizedBox(height: 16),

              buildTextField("Nama Wisata", namaController),
              const SizedBox(height: 12),
              buildTextField("Lokasi Wisata", lokasiController),
              const SizedBox(height: 12),

              // Dropdown jenis wisata
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jenis Wisata :",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: jenisWisata,
                items: jenisWisataList
                    .map((jenis) => DropdownMenuItem(
                          value: jenis,
                          child: Text(jenis),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    jenisWisata = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Pilih Jenis Wisata',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),

              const SizedBox(height: 12),
              buildTextField(
                "Harga Tiket",
                hargaController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 12),
              buildTextField("Deskripsi", deskripsiController, maxLines: 5),
              const SizedBox(height: 20),

              // Tombol Simpan
              ElevatedButton(
                onPressed: () {
                  if (isFormValid()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Data berhasil disimpan!")),
                    );
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Silakan isi semua data terlebih dahulu!")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // sudut sedikit melengkung
                  ),
                ),
                child: const Text("Simpan"),
              ),

              const SizedBox(height: 8),

              // Tombol Reset
              TextButton(
                onPressed: resetForm,
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label :", style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Masukkan $label di sini',
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }
}


