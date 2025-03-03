import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'price_tag.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String image;
  final String title;
  final double price;
  final double? discountPrice;
  final int quantity;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;

  const CartItem({
    super.key,
    required this.productId,
    required this.image,
    required this.title,
    required this.price,
    this.discountPrice,
    required this.quantity,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key(productId),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: TSizes.md),
        color: TColors.error,
        child: const Icon(
          Icons.delete_outline,
          color: TColors.white,
          size: TSizes.iconLg,
        ),
      ),
      onDismissed: (_) => onRemove(),
      child: Container(
        padding: const EdgeInsets.all(TSizes.sm),
        decoration: BoxDecoration(
          color: TColors.surface,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
          boxShadow: [
            BoxShadow(
              color: TColors.darkGrey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image
            Hero(
              tag: 'cart_$productId',
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: TSizes.sm),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: TSizes.xs),
                  PriceTag(
                    price: price,
                    discountPrice: discountPrice,
                  ),
                ],
              ),
            ),

            // Quantity Controls
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => onQuantityChanged(quantity + 1),
                  color: TColors.primary,
                ),
                Text(
                  quantity.toString(),
                  style: theme.textTheme.titleMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: quantity > 1
                      ? () => onQuantityChanged(quantity - 1)
                      : null,
                  color: quantity > 1 ? TColors.primary : TColors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
