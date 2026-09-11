double hitungHargaSetelahDiskon(
  double harga, {
  double persenDiskon = 0,
}) {
  double potongan = harga * persenDiskon / 100;
  return harga - potongan;
}

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;

  for (Product produk in keranjang) {
    total += produk.price;
  }

  return total;
}

String formatRupiah(double harga) => 'Rp${harga.toStringAsFixed(0)}';

void main() {

  // Contoh var
  var namaProduk = 'Laptop';
  print('Nama produk: $namaProduk');

  namaProduk = 'Smartphone';
  print('Nama produk setelah diubah: $namaProduk');

  // Contoh final
  final hargaProduk = 7500000;
  print('Harga produk: Rp$hargaProduk');

  // Contoh constanta
  const namaToko = 'TokoKita';
  print('Nama toko: $namaToko');

  // Tipe data dasar
  int stok = 10;
  double harga = 7500000.0;
  String nama = 'Laptop ASUS';
  bool tersedia = true;

  print('Stok: $stok');
  print('Harga: Rp$harga');
  print('Nama: $nama');
  print('Tersedia: $tersedia');

  // List kategori produk
  List<String> kategoriProduk = [
    'Elektronik',
    'Fashion',
    'Makanan',
  ];

  print('Kategori produk: $kategoriProduk');

  // Map sebagai data mentah sebuah produk
  Map<String, dynamic> produk = {
    'id': 1,
    'name': 'Laptop ASUS',
    'price': 7500000.0,
    'stock': 10,
    'available': true,
  };

  print('Data produk: $produk');


  // Langkah 2 - Operator Aritmatika

  int hargaItem = 50000;
  int jumlah = 3;
  int stokAwal = 10;

  // Perkalian
  int totalHarga = hargaItem * jumlah;
  print('Total harga: Rp$totalHarga');

  // Pengurangan
  int stokSetelahPembelian = stokAwal - jumlah;
  print('Stok setelah pembelian: $stokSetelahPembelian');

  // Pembagian
  double hargaPerItem = totalHarga / jumlah;
  print('Harga per item: Rp$hargaPerItem');

  // Modulus (sisa pembagian)
  int sisaStok = stokAwal % jumlah;
  print('Sisa stok: $sisaStok');

  // Penjumlahan
  int hargaDenganBiaya = totalHarga + 5000;
  print('Total harga + biaya: Rp$hargaDenganBiaya');

  int hargaLaptop = 7500000;
  int hargaHandphone = 5000000;

  print('Harga laptop == handphone: ${hargaLaptop == hargaHandphone}');
  print('Harga laptop != handphone: ${hargaLaptop != hargaHandphone}');
  print('Harga laptop > handphone: ${hargaLaptop > hargaHandphone}');
  print('Harga laptop < handphone: ${hargaLaptop < hargaHandphone}');
  print('Harga laptop >= handphone: ${hargaLaptop >= hargaHandphone}');
  print('Harga laptop <= handphone: ${hargaLaptop <= hargaHandphone}');

  //Operator Logika
  int stokProduk = 10;
  double hargaProdukLogika = 7500000;
  bool aktif = true;

  //Produk layak ditampilkan jika stok > 0 dan harga > 0
  bool layakDitampilkan = stokProduk > 0 && hargaProdukLogika > 0;

  print('Produk layak ditampilkan: $layakDitampilkan');

  //Produk ditampilkan jika stok teredia atau produk masih aktif
  bool dapatDitampilkan = stokProduk > 0 || aktif;

  print('Produk dapat ditampilkan: $dapatDitampilkan');

  //mengecek kebalikan dari kondisi aktif
  print('Produk tidak aktif: ${!aktif}');

//Langkah 3 -Control Flow

// if-else untuk menentukan status stok
int stokStatus = 5;

if (stokStatus == 0){
  print('Status produk: Stok Habis');
} else if (stokStatus <= 5) {
  print('Status produk: Stok Terbatas');
} else{
  print('Status produk: Tersedia');
}

//For untuk menghitung total harga beberapa produk
List<double> daftarHarga = [
  50000, 75000, 100000,
];

double totalBelanja = 0;

for(double hargaProduk in daftarHarga) {
  totalBelanja += hargaProduk;
}

print('Total belanja: Rp$totalBelanja');

//While untuk mengurangi stok satu per satu
int stokSimulasi = 5;

while(stokSimulasi > 0){
  print('Stok saat ini: $stokSimulasi');
  stokSimulasi--;
}

print('Stok sudah habis');

//Switch-case untuk menentukan disskon berdasarkan kategori
String kategori = 'Elektronik';
int diskon;

switch(kategori){
  case 'Elektronik':
    diskon = 10;
    break;
  case 'Fashion':
    diskon = 15;
    break;
  case 'Makanan':
    diskon = 5;
    break;
  default:
    diskon = 0;
}

print('Kategori: $kategori');
print('Diskon: $diskon%');

double hargaAwal = 100000;
double hargaSetelahDiskon = hitungHargaSetelahDiskon(
  hargaAwal,
  persenDiskon: 10,
);

print('Harga awal: ${formatRupiah(hargaAwal)}');
  print(
    'Harga setelah diskon: ${formatRupiah(hargaSetelahDiskon)}',
  );

  double hargaTanpaDiskon = hitungHargaSetelahDiskon(100000);
  print(
    'Harga tanpa diskon: ${formatRupiah(hargaTanpaDiskon)}',
  );

// Langkah 5 - OOP dan Null Safety

// Membuat objek Product
Product produkLaptop = Product(
  id: 1,
  name: 'Laptop ASUS',
  price: 7500000,
  imageUrl: 'assets/laptop.jpg',
  category: 'Elektronik',
  stock: 10,
  description: 'Laptop untuk kebutuhan kuliah',
);

print(produkLaptop.getInfo());

// Membuat objek DiscountedProduct
DiscountedProduct produkDiskon = DiscountedProduct(
  id: 2,
  name: 'Smartphone Samsung',
  price: 5000000,
  imageUrl: 'assets/phone.jpg',
  category: 'Elektronik',
  stock: 5,
  description: 'Smartphone dengan harga terjangkau',
  discountPercent: 10,
);

print(produkDiskon.getInfo());
print(
  'Harga setelah diskon: Rp${produkDiskon.getHargaFinal().toStringAsFixed(0)}',
);

// Menguji nullable description
Product produkTanpaDeskripsi = Product(
  id: 3,
  name: 'Mouse Wireless',
  price: 150000,
  imageUrl: 'assets/mouse.jpg',
  category: 'Elektronik',
  stock: 20,
);

print(produkTanpaDeskripsi.getInfo());
print('Deskripsi: ${produkTanpaDeskripsi.description}');
print(produkLaptop.getInfo());
print('Status stok: ${produkLaptop.getStatusStok()}');

//Tugas mandiri 2
List<Product> daftarProduk = [
  Product(
    id: 1,
    name: 'Laptop ASUS',
    price: 7500000,
    imageUrl: 'assets/laptop.jpg',
    category: 'Elektronik',
    stock: 10,
    description: 'Laptop untuk kebutuhan kuliah',
  ),
  Product(
    id: 2,
    name: 'Smartphone Samsung',
    price: 5000000,
    imageUrl: 'assets/phone.jpg',
    category: 'Elektronik',
    stock: 5,
    description: 'Smartphone dengan harga terjangkau',
  ),
  Product(
    id: 3,
    name: 'Mouse Wireless',
    price: 150000,
    imageUrl: 'assets/mouse.jpg',
    category: 'Elektronik',
    stock: 20,
    description: 'Mouse wireless untuk laptop',
  ),
  Product(
    id: 4,
    name: 'Keyboard Mechanical',
    price: 450000,
    imageUrl: 'assets/keyboard.jpg',
    category: 'Elektronik',
    stock: 8,
    description: 'Keyboard mechanical untuk mengetik',
  ),
  Product(
    id: 5,
    name: 'Kaos Oversize',
    price: 120000,
    imageUrl: 'assets/kaos.jpg',
    category: 'Fashion',
    stock: 15,
    description: 'Kaos oversize berbahan nyaman',
  ),
  Product(
    id: 6,
    name: 'Hoodie Hitam',
    price: 250000,
    imageUrl: 'assets/hoodie.jpg',
    category: 'Fashion',
    stock: 4,
    description: 'Hoodie warna hitam',
  ),
  Product(
    id: 7,
    name: 'Keripik Kentang',
    price: 25000,
    imageUrl: 'assets/keripik.jpg',
    category: 'Makanan',
    stock: 30,
    description: 'Keripik kentang rasa original',
  ),
  Product(
    id: 8,
    name: 'Cokelat',
    price: 30000,
    imageUrl: 'assets/cokelat.jpg',
    category: 'Makanan',
    stock: 0,
    description: 'Cokelat susu',
  ),
];

print('\nDaftar 8 Produk:');

for (Product produk in daftarProduk) {
  print(
    '${produk.id}. ${produk.name} - '
    '${formatRupiah(produk.price)} - '
    'Stok: ${produk.stock} - '
    'Status: ${produk.getStatusStok()}',
  );
}

// Tugas Mandiri 3 - Menghitung total belanja

List<Product> keranjang = [
  daftarProduk[0],
  daftarProduk[2],
  daftarProduk[4],
];

double totalKeranjang = hitungTotalBelanja(keranjang);

print('\nTugas 3 Total Belanja:');
print('Total belanja: ${formatRupiah(totalKeranjang)}');
}

class Product {
  int id;
  String name;
  double price;
  String imageUrl;
  String category;
  int stock;
  String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  String getInfo() {
    return '$name - Rp${price.toStringAsFixed(0)} - Stok: $stock';
  }

  // Tugas Mandiri - Method untuk mengecek status stok
  String getStatusStok() {
    if (stock == 0) {
      return 'Habis';
    } else if (stock <= 5) {
      return 'Stok Terbatas';
    } else {
      return 'Tersedia';
    }
  }
}

class DiscountedProduct extends Product {
  double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double getHargaFinal() {
    double potongan = price * discountPercent / 100;
    return price - potongan;
  }
}