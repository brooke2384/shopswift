import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/helpers/image_helper.dart';

final List<Product> demoProducts = [
  // Footwear Category
  Product(
    id: '1',
    title: 'Nike Air Max 270',
    description: '''
Premium comfort meets iconic style in the Nike Air Max 270. Featuring:
• Largest heel Air unit yet for enhanced cushioning
• Breathable mesh upper with strategic support
• Dual-density foam sole for superior comfort
• Durable rubber outsole with unique traction pattern
• Available in multiple colorways
    ''',
    price: 150.0,
    discountPrice: 129.99,
    image: ImageHelper.getOptimizedImageUrl(
      ImageHelper.categoryImages['footwear']?['nike_air_max'] ?? 'default_image_url_here', // Fallback image
      optimizeForMobile: true,
    ),
    rating: 4.5,
    reviews: 128,
    isWishlisted: true,
    category: 'footwear',
    tags: ['running', 'sports', 'casual'],
    colors: ['blue', 'black', 'white'],
    sizes: ['US 7', 'US 8', 'US 9', 'US 10', 'US 11'],
  ),
  Product(
    id: '2',
    title: 'Classic Leather Watch',
    description: '''
Elegant timepiece crafted with precision:
• Genuine leather strap
• Premium stainless steel case
• Water-resistant up to 30m
• Japanese quartz movement
• Scratch-resistant sapphire crystal
    ''',
    price: 299.99,
    image: ImageHelper.getOptimizedImageUrl(
      ImageHelper.categoryImages['watches']?['classic_leather'] ?? 'default_image_url_here', // Fallback image
    ),
    rating: 4.8,
    reviews: 256,
    category: 'watches',
    tags: ['luxury', 'casual', 'formal'],
    colors: ['brown', 'black'],
  ),
  Product(
    id: '3',
    title: 'Premium Backpack',
    description:
        'Durable and stylish backpack with multiple compartments. Perfect for daily use or travel.',
    price: 89.99,
    discountPrice: 69.99,
    image: ImageHelper.getOptimizedImageUrl(
        ImageHelper.productImages['backpack_brown'] ?? 'default_image_url_here', // Fallback image
    ),
    rating: 4.3,
    reviews: 89,
    isWishlisted: true,
  ),
  Product(
    id: '4',
    title: 'Wireless Headphones',
    description:
        'High-quality wireless headphones with active noise cancellation and premium sound.',
    price: 199.99,
    image: ImageHelper.getOptimizedImageUrl(
        ImageHelper.productImages['headphones_black'] ?? 'default_image_url_here', // Fallback image
    ),
    rating: 4.7,
    reviews: 167,
  ),
  Product(
    id: '5',
    title: 'Nashville Armchair',
    description: '''
A contemporary twist on classic mid-century modern design, the Nashville armchair is upholstered in royal blue velvet and brings an air of sophistication to your living space. Available in a choice of rich velvet colors, the chair features:
• Premium velvet upholstery
• Solid wood legs with black finish
• Ergonomic curved back design
• High-density foam cushioning
• Easy assembly required
    ''',
    price: 1895.0,
    image: ImageHelper.getOptimizedImageUrl(
      ImageHelper.categoryImages['furniture']?['nashville_armchair'] ?? 'default_image_url_here', // Fallback image
      optimizeForMobile: true,
    ),
    rating: 4.8,
    reviews: 156,
    isWishlisted: true,
    category: 'chairs',
    tags: ['modern', 'armchair', 'living room'],
    colors: ['royal_blue', 'grey', 'blush_pink', 'sage_green'],
    variants: [
      'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c',
      'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
      'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237',
    ],
  ),
  Product(
    id: '6',
    title: 'Elisa Wingback Chair',
    description: '''
The Elisa Wingback Chair combines comfort with elegance:
• Soft-touch fabric upholstery
• Wingback design for extra comfort
• Decorative piping details
• Sturdy wooden frame
• Perfect for reading corners
    ''',
    price: 1512.0,
    image: ImageHelper.getOptimizedImageUrl(
      ImageHelper.categoryImages['furniture']?['wingback_chair'] ?? 'default_image_url_here', // Fallback image
    ),
    rating: 4.7,
    reviews: 98,
    category: 'chairs',
    tags: ['classic', 'wingback', 'accent'],
    colors: ['blush_pink', 'cream', 'charcoal'],
  ),
];

// Category metadata with proper icon imports
final Map<String, Map<String, dynamic>> categoryMetadata = {
  'footwear': {
    'name': 'Footwear',
    'icon': Icons.directions_walk,
    'description': 'Premium footwear for every occasion',
    'featuredImage': ImageHelper.categoryImages['footwear']?['nike_air_max'] ?? 'default_image_url_here', // Fallback image
    'backgroundColor': const Color(0xFFE3F2FD),
  },
  'watches': {
    'name': 'Watches',
    'icon': Icons.watch,
    'description': 'Timeless pieces for your wrist',
    'featuredImage': ImageHelper.categoryImages['watches']?['classic_leather'] ?? 'default_image_url_here', // Fallback image
    'backgroundColor': const Color(0xFFFCE4EC),
  },
  'bags': {
    'name': 'Bags',
    'icon': Icons.shopping_bag,
    'description': 'Stylish and functional bags',
    'featuredImage': ImageHelper.categoryImages['bags']?['leather_backpack'] ?? 'default_image_url_here', // Fallback image
    'backgroundColor': const Color(0xFFF3E5F5),
  },
  'electronics': {
    'name': 'Electronics',
    'icon': Icons.headphones,
    'description': 'Premium audio and smart devices',
    'featuredImage': ImageHelper.categoryImages['electronics']?['headphones'] ?? 'default_image_url_here', // Fallback image
    'backgroundColor': const Color(0xFFE8F5E9),
  },
  'chairs': {
    'name': 'Chairs',
    'icon': Icons.chair,
    'description': 'Luxurious seating for every space',
    'featuredImage': ImageHelper.categoryImages['furniture']?['nashville_armchair'] ?? 'default_image_url_here', // Fallback image
    'backgroundColor': const Color(0xFFF3F4F6),
  },
  'sofas': {
    'name': 'Sofas',
    'icon': Icons.weekend,
    'description': 'Premium comfort for your living room',
    'featuredImage': ImageHelper.categoryImages['furniture']?['corner_sofa'] ?? 'default_image_url_here', // Fallback image
    'backgroundColor': const Color(0xFFE5E7EB),
  },
};
