import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stock1/fun/scanPage.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  Future<void> scanBarcode(BuildContext context) async {
    final String? barcodeScanRes = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerPage(),
      ),
    );
    if (barcodeScanRes != null) {
      setState(() {
        _barcodeController.text = barcodeScanRes;
      });
      addNewProduct(barcodeScanRes, context);
    }
  }

  void addNewProduct(String barcode, BuildContext context) {
    // Barkodla birlikte yeni ürün ekleme işlemini buradan yapılabilir
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Yeni Ürün"),
        content: Text("Barkod: $barcode\nÜrün eklenecek mi?"),
        actions: [
          TextButton(
            child: const Text("Ekle"),
            onPressed: () {
              // ürün ekleme işlemi yapılır
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: const Text("İptal"),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Barkod okunan değeri gösteren TextField
              TextField(
                controller: _barcodeController,
                decoration: const InputDecoration(
                  labelText: 'Barkod',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () => scanBarcode(context),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Barkod Tara'),
              ),
              const SizedBox(height: 20),
              // Ürün adı bilgisi
              TextField(
                controller: _productNameController,
                decoration: const InputDecoration(
                  labelText: 'Ürün Adı',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Ürün fiyatı bilgisi
              TextField(
                controller: _productPriceController,
                decoration: const InputDecoration(
                  labelText: 'Ürün Fiyatı',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              // Ürün adedi bilgisi
              TextField(
                controller: _productPriceController,
                decoration: const InputDecoration(
                  labelText: 'Ürün Adedi',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              // Ürün ekle butonu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Ürün Ekle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
