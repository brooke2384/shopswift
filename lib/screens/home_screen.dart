import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';

import '../common/widgets/product_card.dart';
import '../models/product.dart';
import '../utils/constants/sizes.dart';
import '../utils/constants/colors.dart';
import '../utils/helpers/responsive_helper.dart';
import '../data/demo_data.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _bannerController;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Timer? _bannerTimer;
  
  int _currentBannerIndex = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: categoryMetadata.length,
      vsync: this,
    );
    _bannerController = PageController(viewportFraction: 0.9);
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    Future.microtask(() {
      if (mounted) _slideController.forward();
    });

    _startBannerTimer();
  }

  void _startBannerTimer() {
    _bannerTimer?.cancel(); // Ensure no duplicate timers
    _bannerTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _currentBannerIndex = (_currentBannerIndex + 1) % demoProducts.length;
          _bannerController.animateToPage(
            _currentBannerIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _tabController.dispose();
    _bannerController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          _buildBanner(),
          _buildCategoryTabs(),
          _buildProductGrid(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: FlexibleSpaceBar(
            title: Row(
              children: [
                const Text(
                  'ShopSwift',
                  style: TextStyle(color: Colors.black87),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black87),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.black87),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.black87),
                  onPressed: () {},
                ),
              ],
            ),
            background: Container(color: Colors.white.withOpacity(0.8)),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          controller: _bannerController,
          itemCount: demoProducts.length,
          onPageChanged: (index) {
            setState(() => _currentBannerIndex = index);
          },
          itemBuilder: (context, index) {
            final product = demoProducts[index];
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 50,
        maxHeight: 50,
        child: Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: TColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: TColors.primary,
            tabs: categoryMetadata.values
                .map((category) => Tab(text: category['name'] as String))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.getResponsiveIntValue(
            context: context,
            mobile: 2,
            tablet: 3,
            desktop: 4,
          ),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = demoProducts[index % demoProducts.length];
            return _buildAnimatedProductCard(product, index);
          },
          childCount: demoProducts.length,
        ),
      ),
    );
  }

  Widget _buildAnimatedProductCard(Product product, int index) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _slideController,
        curve: Interval(
          (index * 0.1).clamp(0, 1),
          ((index + 1) * 0.1).clamp(0, 1),
          curve: Curves.easeOut,
        ),
      )),
      child: FadeTransition(
        opacity: _fadeController,
        child: ProductCard(
          product: product,
          onTap: () => _navigateToProductDetail(product),
        ),
      ),
    );
  }

  void _navigateToProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget child;

  _SliverAppBarDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;
  @override
  Widget build(context, shrinkOffset, overlapsContent) => child;
  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) => false;
}
