import 'package:flutter/material.dart';
import 'package:modul1_pember/widgets/hot_place_card.dart';
import 'package:modul1_pember/widgets/hotel_card.dart';
import '../models/place_model.dart';
import 'detail_page.dart';
import 'tambah_wisata_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF7FF),

      // Floating Action Button (Tombol Tambah)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TambahWisataPage()),
          );
        },
        backgroundColor: const Color(0xFF2211C1), // Biru tua seperti di gambar
        child: const Icon(Icons.add, color: Colors.white),
        shape: const CircleBorder(), // Tetap bulat
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header dengan foto profil
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hi, User',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfilePage(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/gr.jpg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Hot Places
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Hot Places',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // ini bagian yang bisa scrol ke samping 
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      final place = places[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(place: place),
                            ),
                          );
                        },
                        child: HotPlaceCard(place: place),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Best Hotels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Best Hotels',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(place: place),
                          ),
                        );
                      },
                      child: HotelCard(place: place),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
