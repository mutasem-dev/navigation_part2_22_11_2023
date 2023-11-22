import 'package:flutter/material.dart';
import 'main.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MainPage.invoices[MainPage.index].customerName),
      ),
      body: Text(MainPage.invoices[MainPage.index].toString(),
        style: const TextStyle(fontSize: 25),),
    );
  }
}
