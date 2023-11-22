import 'product.dart';

class Invoice {
  int invoiceNO;
  String customerName;
  List<Product> products;

  Invoice(this.invoiceNO, this.customerName, this.products);

  @override
  String toString() {
    String str = 'Invoice# $invoiceNO\n\nProducts:\n';
    int i = 1;
    int totalQuantity = 0;
    double totalPrice = 0;
    for (var element in products) {
      totalQuantity += element.quantity;
      totalPrice += element.quantity*element.price;
      str += '$i- $element\n';
      i++;
    }
    str += '\n\nTotal Quantity: $totalQuantity\n'
        'Total Price: $totalPrice\n';

    return str;
  }
}