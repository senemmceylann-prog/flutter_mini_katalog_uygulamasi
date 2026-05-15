import 'package:flutter/material.dart';

// ==========================================
// 1. MODEL KATMANI (Ürün Özellikleri ve Veriler)
// ==========================================
class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String subTitle;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.subTitle,
  });
}

// Hocanın ekran görüntüsündeki ürünlerin aynısını içeren liste:
List<Product> sampleProducts = [
  Product(
    name: "iPhone 15 Pro",
    subTitle: "Titanium. So strong. So light. So Pro.",
    description: "The iPhone 15 Pro features a strong and light aerospace-grade titanium design. Ultimate performance with the A17 Pro chip.",
    price: 999,
    imageUrl: "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500",
  ),
  Product(
    name: "MacBook Pro 14\"",
    subTitle: "Pro to the max.",
    description: "Mind-blowing M3, M3 Pro, or M3 Max chips. Up to 22 hours of battery life. The best pro laptop is now even better.",
    price: 1599,
    imageUrl: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500",
  ),
  Product(
    name: "iPad Air",
    subTitle: "Light. Bright. Full of might.",
    description: "With a liquid retina display, M2 chip, and superfast wireless, iPad Air lets you work, study, and create smoothly.",
    price: 599,
    imageUrl: "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500",
  ),
  Product(
    name: "HomePod",
    subTitle: "Profound sound.",
    description: "HomePod is a powerhouse of a speaker. Apple‑engineered audio technology and advanced software deliver high‑fidelity sound.",
    price: 299,
    imageUrl: "https://images.unsplash.com/photo-1545454675-3531b543be5d?w=500",
  ),
  Product(
    name: "HomePod Mini",
    subTitle: "Color pop.",
    description: "The HomePod mini is jam-packed with innovation, delivering unexpectedly big sound for a speaker of its size. At just 3.3 inches tall, it takes up almost no space but fills the entire room with rich 360-degree audio.",
    price: 99,
    imageUrl: "https://images.unsplash.com/photo-1608248597481-496100c80836?w=500",
  ),
  Product(
    name: "AirPods Pro (2nd Gen)",
    subTitle: "Adaptive Audio.",
    description: "Reengineered around state-of-the-art sound. Up to 2x more Active Noise Cancellation than the previous generation.",
    price: 249,
    imageUrl: "https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=500",
  ),
  Product(
    name: "AirPods Max",
    subTitle: "Sound focused.",
    description: "A perfect balance of exhilarating high-fidelity audio and the effortless magic of AirPods. The ultimate listening experience.",
    price: 549,
    imageUrl: "https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=500",
  ),
];

// Basit sepet simülasyonu listemiz
List<Product> myCart = [];

// ==========================================
// 2. MAIN KATMANI (Uygulama Girişi)
// ==========================================
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Katalog Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DiscoverScreen(),
    );
  }
}

// ==========================================
// 3. EKRAN KATMANI - ANA EKRAN (Discover)
// ==========================================
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Discover",
          style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 28),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Find your perfect device.", style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 16),
            // Arama Kutusu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search products",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Gift Store Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const Icon(Icons.card_giftcard, color: Colors.blue, size: 40),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("GIFT STORE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueAccent)),
                      Text("Find gifts for your loved ones", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // GridView (2'li Ürün Listesi)
            Expanded(
              child: GridView.builder(
                itemCount: sampleProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final product = sampleProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen(product: product)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.network(product.imageUrl, width: double.infinity, fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1),
                                Text(product.subTitle, style: const TextStyle(color: Colors.grey, fontSize: 11), maxLines: 1),
                                const SizedBox(height: 4),
                                Text("\$${product.price.toInt()}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. EKRAN KATMANI - DETAY EKRANI (Product Detail)
// ==========================================
class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Product Detail", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(widget.product.imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 20),
                  Text(widget.product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(widget.product.subTitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 16),
                  const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.product.description, style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4)),
                  const SizedBox(height: 20),
                  const Text("Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSpecTile("SIZE", "3.3 inches"),
                      _buildSpecTile("AUDIO", "360-degree"),
                      _buildSpecTile("COLORS", "5 colors"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  setState(() {
                    myCart.add(widget.product);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${widget.product.name} added to cart!")),
                  );
                },
                child: const Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecTile(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ==========================================
// 5. EKRAN KATMANI - SEPET EKRANI (Cart)
// ==========================================
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Cart", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Expanded(
            child: myCart.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text("Your cart is empty", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Add items to start shopping", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: myCart.length,
                    itemBuilder: (context, index) {
                      final product = myCart[index];
                      return ListTile(
                        leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("\$${product.price.toInt()}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              myCart.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline, size: 16, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing.",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      if (myCart.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Checkout successful!")),
                        );
                      }
                    },
                    child: const Text("Checkout", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
