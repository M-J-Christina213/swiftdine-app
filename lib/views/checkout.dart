import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/app_theme.dart';
import '../views/orders_screen.dart';
import '../views/providers/cart_provider.dart';
import '../controllers/checkout_controller.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final controller = CheckoutController();
  String paymentMethod = 'Card';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;
    final subtotal = cartProvider.totalPrice;
    final tax = subtotal * 0.05;
    final deliveryFee = 200.0;
    final total = subtotal + tax + deliveryFee;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(
              title: 'Order Summary',
              child: Column(
                children: [
                  ...cartItems.map((item) => Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(item.imagePath, width: 70, height: 70, fit: BoxFit.cover),
                          ),
                          title: Text(item.name),
                          subtitle: Text('Quantity: ${item.quantity}'),
                          trailing: Text('Rs ${(item.price * item.quantity).toStringAsFixed(2)}'),
                        ),
                      )),
                  const Divider(height: 30),
                  _buildAmountRow('Subtotal', subtotal),
                  _buildAmountRow('Tax (5%)', tax),
                  _buildAmountRow('Delivery Fee', deliveryFee),
                  _buildAmountRow('Grand Total', total, isBold: true, color: AppTheme.primaryColor),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildSection(
              title: 'Personal Information',
              child: Form(
                key: _formKey,
                child: Column(children: [
                  _buildTextField(controller.nameController, 'Full Name'),
                  _buildTextField(controller.phoneController, 'Phone Number'),
                  _buildTextField(controller.emailController, 'Email Address'),
                  _buildTextField(controller.addressController, 'Address'),
                  Row(
                    children: [
                      Expanded(child: _buildTextField(controller.cityController, 'City')),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(controller.postalController, 'Postal Code')),
                    ],
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 30),
            _buildSection(
              title: 'Payment Method',
              child: Column(
                children: [
                  _buildPaymentOption('Card', Icons.credit_card),
                  _buildPaymentOption('Bank Transfer', Icons.account_balance),
                  _buildPaymentOption('Cash on Delivery', Icons.local_shipping),
                  const SizedBox(height: 10),
                  if (paymentMethod == 'Card') ...[
                    _buildTextField(controller.cardNameController, 'Cardholder Name'),
                    _buildTextField(controller.cardNumberController, 'Card Number'),
                    Row(
                      children: [
                        Expanded(child: _buildTextField(controller.expiryController, 'MM/YY')),
                        const SizedBox(width: 10),
                        Expanded(child: _buildTextField(controller.cvvController, 'CVV')),
                      ],
                    ),
                  ],
                  if (paymentMethod == 'Bank Transfer') ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Account No: 1234567890\nBank: SwiftBank Lanka\nUse your name as reference.'),
                    )
                  ],
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _showConfirmationDialog(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Place Order Now', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountRow(String label, double amount, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text('Rs ${amount.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        child,
      ]),
    );
  }

  Widget _buildPaymentOption(String method, IconData icon) {
    return RadioListTile<String>(
      value: method,
      groupValue: paymentMethod,
      onChanged: (value) => setState(() => paymentMethod = value!),
      activeColor: AppTheme.primaryColor,
      title: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor),
          const SizedBox(width: 10),
          Text(method),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 10),
            Text('Order Placed!'),
          ],
        ),
        content: const Text('Thank you for ordering! Your order has been sent to the restaurant. '
            'A receipt has been emailed to you. You can now track your order live.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const OrderScreen()),
              );
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
