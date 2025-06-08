import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedPaymentMethod = 'Card';

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 30),
              SizedBox(width: 8),
              Text("Order Confirmed"),
            ],
          ),
          content: const Text(
            "Thank you for ordering from SwiftDine!\n\nYour order has been sent to the restaurant.\nA receipt has been emailed to you.\n\nYou can live track your order now.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pushReplacementNamed(context, '/orders'); // go to orders screen
              },
              child: const Text("Live Track Order"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.orange;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: themeColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Order Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Image.asset('assets/images/sample_food.jpg', width: 50, height: 50),
                title: const Text("Grilled Chicken"),
                subtitle: const Text("Qty: 2"),
                trailing: const Text("Rs 800.00"),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),
            _buildPriceDetailRow("Subtotal", "Rs 800.00"),
            _buildPriceDetailRow("Tax (5%)", "Rs 40.00"),
            _buildPriceDetailRow("Delivery Fee", "Rs 100.00"),
            const Divider(),
            _buildPriceDetailRow("Total", "Rs 940.00", bold: true),
            const SizedBox(height: 20),
            const Text("Personal Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(children: [
                _buildInputField("Full Name"),
                _buildInputField("Phone Number"),
                _buildInputField("Email Address"),
                _buildInputField("Address"),
                _buildInputField("City"),
                _buildInputField("Postal Code"),
              ]),
            ),
            const SizedBox(height: 20),
            const Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildPaymentOption("Card"),
            if (selectedPaymentMethod == 'Card') ...[
              _buildInputField("Cardholder Name"),
              _buildInputField("Card Number"),
              Row(
                children: [
                  Expanded(child: _buildInputField("MM/YY")),
                  const SizedBox(width: 10),
                  Expanded(child: _buildInputField("CVV")),
                ],
              ),
            ],
            _buildPaymentOption("Cash on Delivery"),
            _buildPaymentOption("Bank Transfer"),
            if (selectedPaymentMethod == 'Bank Transfer') ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("Bank Account No: 123-456-789-00\nSwiftDine Bank", style: TextStyle(fontSize: 14)),
              ),
            ],
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _placeOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Center(child: Text("Place Order Now")),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetailRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
      ),
    );
  }

  Widget _buildPaymentOption(String method) {
    return RadioListTile<String>(
      value: method,
      groupValue: selectedPaymentMethod,
      onChanged: (value) => setState(() => selectedPaymentMethod = value!),
      title: Text(method),
    );
  }
}
