import 'package:flutter/material.dart';

class ImageHelper {
  static const String _baseImagePath = 'assets/images';
  static const String _placeholderImage = '$_baseImagePath/placeholder.png';

  // Basic network image with placeholder and error handling
  static Widget networkImage({
    required String url,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            color: Colors.grey[200],
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: Colors.grey[200],
            child: const Icon(Icons.error_outline),
          );
        },
      ),
    );
  }

  // Individual product images
  static const Map<String, String> productImages = {
    'backpack_brown':
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
    'headphones_black':
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
    'watch_classic':
        'https://images.unsplash.com/photo-1524592094714-0f0654e20314',
    'nike_air_max': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
  };

  // High-quality furniture images with categories
  static const Map<String, Map<String, String>> categoryImages = {
    'furniture': {
      'nashville_armchair':
          'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c',
      'wingback_chair':
          'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
      'corner_sofa':
          'https://images.unsplash.com/photo-1506439753458-6e0eb8cfb237',
      'dining_chair':
          'https://images.unsplash.com/photo-1592078615290-033ee584e267',
      'office_chair':
          'https://images.unsplash.com/photo-1580480055273-228ff5388ef8',
      'lounge_chair':
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7',
    },
    'sofas': {
      'modern_sofa':
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc',
      'sectional_sofa':
          'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e',
      'leather_sofa':
          'https://images.unsplash.com/photo-1550254478-ead40cc54513',
      'corner_sofa':
          'https://images.unsplash.com/photo-1506439753458-6e0eb8cfb237',
    },
    'tables': {
      'coffee_table':
          'https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc',
      'dining_table':
          'https://images.unsplash.com/photo-1615066390971-03e4e1c36ddf',
      'side_table':
          'https://images.unsplash.com/photo-1499933374294-4584851497cc',
    },
  };

  // Get optimized image URL with advanced parameters
  static String getOptimizedImageUrl(
    String url, {
    int quality = 80,
    int width = 800,
    bool optimizeForMobile = true,
  }) {
    if (url.contains('unsplash')) {
      String optimizedUrl = '$url?q=$quality&w=$width&auto=format';
      if (optimizeForMobile) {
        optimizedUrl += '&fit=crop&crop=edges';
      }
      return optimizedUrl;
    }
    return url;
  }

  // Get placeholder for category
  static String getPlaceholderForCategory(String category) {
    return '$_baseImagePath/placeholder_$category.png';
  }
}
