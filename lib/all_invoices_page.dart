import 'package:flutter/material.dart';
import 'main.dart';
class AllInvoicesPage extends StatelessWidget {
  const AllInvoicesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Customers'),
      ),
      body: ListView.builder(
        itemCount: MainPage.invoices.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              MainPage.index = index;
              Navigator.pushNamed(context,'/details_page');
            },
            child: Container(
                color: Colors.lightBlueAccent,
                child: Text(MainPage.invoices[index].customerName,
                style: const TextStyle(fontSize: 25),),
              ),
          ),
        ),
      ),
    );
  }
}
