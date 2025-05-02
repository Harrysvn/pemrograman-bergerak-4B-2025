class Place {
  final String name;
  final String location;
  final String imageUrl;
  final String description;
  final String category; // Tambahan kategori
  final String price;    // Tambahan harga

  Place({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.price,
  });
}

// Dummy data
List<Place> places = [
  Place(
    name: 'National Park Yosemite',
    location: 'California',
    imageUrl: 'pemandangan.jpg',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.',
    category: 'Wisata Alam',
    price: '30.000,00',
  ),
  Place(
    name: 'PULLMAN',
    location: 'Bandung',
    imageUrl: 'hotel_bandung.jpg',
    description:
        'Pullman Bandung offers a luxurious stay in the heart of the city, combining modern design with authentic local charm. Ideal for both business and leisure travelers, the hotel features upscale rooms, fine dining, and easy access to shopping and entertainment.',
    category: 'Hotel',
    price: '1.200.000,00',
  ),
  Place(
    name: 'Manger',
    location: 'America',
    imageUrl: 'hotel_america.jpg',
    description:
        'Manger Hotel in America blends historical elegance with contemporary comfort. Known for its rich heritage and warm hospitality, the hotel provides cozy accommodations, top-notch service, and a strategic location near iconic attractions.',
    category: 'Hotel',
    price: '950.000,00',
  ),
  Place(
    name: 'National Park Yosemite',
    location: 'California',
    imageUrl: 'pemandangan.jpg',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.',
    category: 'Wisata Alam',
    price: '30.000,00',
  ),
];


