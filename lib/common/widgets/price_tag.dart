import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class PriceTag extends StatelessWidget {
  final double price;
  final double? discountPrice;
  final bool showDiscountPrice;
  final bool showCurrency;
  final TextStyle? priceTextStyle;
  final TextStyle? discountTextStyle;

  const PriceTag({
    super.key,
    required this.price,
    this.discountPrice,
    this.showDiscountPrice = true,
    this.showCurrency = true,
    this.priceTextStyle,
    this.discountTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasDiscount = discountPrice != null && showDiscountPrice;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        if (hasDiscount) ...[
          Text(
            showCurrency
                ? '\$${price.toStringAsFixed(2)}'
                : price.toStringAsFixed(2),
            style: discountTextStyle ??
                theme.textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: TColors.error,
                ),
          ),
          const SizedBox(width: TSizes.sm),
        ],
        Text(
          showCurrency
              ? '\$${(discountPrice ?? price).toStringAsFixed(2)}'
              : (discountPrice ?? price).toStringAsFixed(2),
          style: priceTextStyle ??
              theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: hasDiscount ? TColors.success : TColors.textPrimary,
              ),
        ),
      ],
    );
  }
}
