import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // tarayıcı ekranındaki renk
        'İptal', // iptal butonu yazısı
        true, // flash kullanılabilir mi
        ScanMode.BARCODE,
      );

      if (barcodeScanRes != '-1') {
        // Barkod başarıyla okundu
        setState(() {
          _barcodeController.text = barcodeScanRes;
        });
        addNewProduct(barcodeScanRes, context);
      }
    } catch (e) {
      debugPrint('Hata: $e');
    }
  }

  void addNewProduct(String barcode, BuildContext context) {
    // Burada barkodla birlikte yeni ürün ekleme işlemini yapabilirsin
    // Örneğin: başka bir sayfaya yönlendirme veya ürün listesine ekleme
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Yeni Ürün"),
        content: Text("Barkod: $barcode\nÜrün eklenecek mi?"),
        actions: [
          TextButton(
            child: Text("Ekle"),
            onPressed: () {
              // ürün ekleme işlemi yapılır
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: Text("İptal"),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  // Örneğin barkod okutma işlemini simüle eden fonksiyon

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
              // Barkod okuma kısmı
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
