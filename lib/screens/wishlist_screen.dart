import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../common/widgets/product_card.dart';
import '../common/widgets/shimmer_loading.dart';

class WishlistScreen extends StatelessWidget {
  final List<Product> wishlistedProducts;
  final Function(Product) onRemoveFromWishlist;
  final Function(Product) onAddToCart;

  const WishlistScreen({
    super.key,
    required this.wishlistedProducts,
    required this.onRemoveFromWishlist,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        backgroundColor: TColors.surface,
        foregroundColor: TColors.textPrimary,
        elevation: 0,
      ),
      body: wishlistedProducts.isEmpty
          ? _buildEmptyState(context)
          : _buildWishlistGrid(context),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 64,
            color: TColors.grey,
          ),
          const SizedBox(height: TSizes.md),
          Text(
            'Your wishlist is empty',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: TColors.textSecondary,
                ),
          ),
          const SizedBox(height: TSizes.sm),
          Text(
            'Save items you love to your wishlist',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: TColors.textSecondary,
                ),
          ),
          const SizedBox(height: TSizes.lg),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.lg,
                vertical: TSizes.sm,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
              ),
            ),
            child: const Text('Start Shopping'),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(TSizes.md),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: TSizes.md,
        crossAxisSpacing: TSizes.md,
      ),
      itemCount: wishlistedProducts.length,
      itemBuilder: (context, index) {
        final product = wishlistedProducts[index];
        return _buildWishlistItem(context, product);
      },
    );
  }

  Widget _buildWishlistItem(BuildContext context, Product product) {
    return Stack(
      children: [
        ProductCard(
          product: product,
          onTap: () {
            // Navigate to product detail
          },
        ),
        Positioned(
          top: TSizes.xs,
          right: TSizes.xs,
          child: _buildRemoveButton(product),
        ),
        Positioned(
          bottom: TSizes.xs,
          right: TSizes.xs,
          left: TSizes.xs,
          child: _buildAddToCartButton(product),
        ),
      ],
    );
  }

  Widget _buildRemoveButton(Product product) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: TColors.surface,
      ),
      child: IconButton(
        icon: const Icon(Icons.close),
        color: TColors.error,
        onPressed: () => onRemoveFromWishlist(product),
      ),
    );
  }

  Widget _buildAddToCartButton(Product product) {
    return ElevatedButton.icon(
      onPressed: () => onAddToCart(product),
      style: ElevatedButton.styleFrom(
        backgroundColor: TColors.primary,
        foregroundColor: TColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
        ),
      ),
      icon: const Icon(Icons.shopping_cart_outlined, size: TSizes.iconSm),
      label: const Text('Add to Cart'),
    );
  }
}
