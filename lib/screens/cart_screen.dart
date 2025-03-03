import 'package:flutter/material.dart';
import '../common/widgets/cart_item.dart';
import '../models/product.dart';
import '../utils/constants/sizes.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/responsive_helper.dart';
import '../data/demo_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Product> _cartItems = demoProducts.take(3).toList();

  double get _totalPrice => _cartItems.fold(
        0,
        (sum, item) => sum + (item.discountPrice ?? item.price),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping Cart',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${_cartItems.length} items',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: _cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(
                      Responsive.getResponsiveValue(
                        context: context,
                        mobile: TSizes.md,
                        tablet: TSizes.lg,
                      ),
                    ),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final product = _cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: TSizes.sm),
                        child: CartItem(
                          productId: product.id,
                          image: product.image,
                          title: product.title,
                          price: product.price,
                          discountPrice: product.discountPrice,
                          quantity: 1,
                          onRemove: () {
                            setState(() {
                              _cartItems.removeAt(index);
                            });
                          },
                          onQuantityChanged: (quantity) {
                            // Update quantity logic
                          },
                        ),
                      );
                    },
                  ),
                ),
                _buildCheckoutSection(),
              ],
            ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: Responsive.getResponsiveValue(
              context: context,
              mobile: 64,
              tablet: 96,
              desktop: 128,
            ),
            color: Colors.grey,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            'Your cart is empty',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.lg,
                vertical: TSizes.sm,
              ),
            ),
            child: const Text('Start Shopping'),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      padding: EdgeInsets.all(
        Responsive.getResponsiveValue(
          context: context,
          mobile: TSizes.md,
          tablet: TSizes.lg,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '\$${_totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: TColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: Responsive.getResponsiveValue(
                      context: context,
                      mobile: TSizes.md,
                      tablet: TSizes.lg,
                    ),
                  ),
                ),
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
