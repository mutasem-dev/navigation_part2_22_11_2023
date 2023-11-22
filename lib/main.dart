import 'package:flutter/material.dart';
import 'logo_page.dart';
import 'details_page.dart';
import 'all_invoices_page.dart';
import 'invoice.dart';
import 'product.dart';

void main() {
  runApp(const MyApp());
}

TextEditingController customerNameController = TextEditingController();
TextEditingController productNameController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController priceController = TextEditingController();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/logo_page',
      routes: {
        '/' : (context) => const MainPage(),
        '/all_invoices_page': (context) => const AllInvoicesPage(),
        '/details_page' : (context) => const DetailsPage(),
        '/logo_page' : (context) => const LogoPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
  const MainPage({super.key});
  static List<Invoice> invoices = [];
  static int index = 0;
}

class _MainPageState extends State<MainPage> {
  static int invNo = 1;
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice# $invNo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: customerNameController,
            decoration: const InputDecoration(
              labelText: 'Customer Name',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Products:', style: TextStyle(fontSize: 24),),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Product info:',style: TextStyle(fontSize: 24),),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: productNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'product Name',
                                  ),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: quantityController,
                                  decoration: const InputDecoration(
                                    labelText: 'Quantity',
                                  ),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: priceController,
                                  decoration: const InputDecoration(
                                    labelText: 'Price',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Product prd = Product(
                                        productNameController.text,
                                        double.parse(priceController.text),
                                        int.parse(quantityController.text)
                                    );
                                    products.add(prd);
                                    productNameController.clear();
                                    priceController.clear();
                                    quantityController.clear();
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text('add'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('cancel'),
                            ),
                          ],
                        ),
                    );
                  },
                  child: const Text('add product'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    tileColor: Colors.blue,
                    leading: Text(products[index].name, style: const TextStyle(fontSize: 30),),
                    title: Text('price: ${products[index].price}'),
                    subtitle: Text('quantity: ${products[index].quantity}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          products.removeAt(index);
                        });

                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Invoice inv = Invoice(
                        invNo,
                        customerNameController.text,
                        products
                    );
                    products = [];
                    invNo++;
                    customerNameController.clear();
                    MainPage.invoices.add(inv);
                  });
                },
                child: const Text('add invoice'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/all_invoices_page');
                },
                child: const Text('show all invoices'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



