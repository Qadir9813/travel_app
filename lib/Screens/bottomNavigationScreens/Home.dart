import 'package:flutter/material.dart';
import '../../Style/Colors.dart';
import '../../Style/fonts.dart';
import '../tabs/MostViewed.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  colors color = colors();
  int _selectedIndex = 0;
  final double _tabWidthFactor = 0.3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FontStyleConfig style = FontStyleConfig();
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final safeHeight = size.height - padding.top - padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;

            return Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(maxWidth * 0.05),
                child: Column(
                  children: [
                    // Greeting Row
                    _buildGreetingRow(style, maxWidth, maxHeight),
                    SizedBox(height: maxHeight * 0.02),

                    // Search Box
                    _buildSearchBox(style, maxWidth, maxHeight),
                    SizedBox(height: maxHeight * 0.03),

                    // Popular Places Row
                    _buildPopularPlacesRow(style),
                    SizedBox(height: maxHeight * 0.02),

                    // Tab Bar
                    _buildTabBar(maxWidth, maxHeight),

                    // Expanded TabBarView
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: const [
                          MostViewed(),
                          Center(child: Text("Near")),
                          Center(child: Text("Latest")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGreetingRow(FontStyleConfig style, double maxWidth, double maxHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, David 👋', style: style.nameTitle()),
            SizedBox(height: maxHeight * 0.01),
            Text('Explore the world', style: style.nameDescription()),
          ],
        ),
        Image.asset('assets/images/profile.png', width: maxWidth * 0.1),
      ],
    );
  }

  Widget _buildSearchBox(FontStyleConfig style, double maxWidth, double maxHeight) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          decoration: InputDecoration(
            hintStyle: style.nameDescription(),
            hintText: "Search places",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.02,
              horizontal: maxWidth * 0.04,
            ),
          ),
        ),
        Positioned(
          right: maxWidth * 0.04,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: maxHeight * 0.04,
                width: 2,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(horizontal: maxWidth * 0.02),
              ),
              Image.asset('assets/images/filter.png', width: maxWidth * 0.06),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPopularPlacesRow(FontStyleConfig style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Popular places', style: style.popularTilte()),
        Text('View all', style: style.viewAllText()),
      ],
    );
  }

  Widget _buildTabBar(double maxWidth, double maxHeight) {
    return Container(
      height: maxHeight * 0.07,
      alignment: Alignment.centerLeft,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        controller: _tabController,
        isScrollable: true,
        dividerHeight: 0,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          _buildTab("Most Viewed", 0, maxWidth),
          _buildTab("Near by", 1, maxWidth),
          _buildTab("Latest", 2, maxWidth),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index, double maxWidth) {
    return Padding(
      padding: EdgeInsets.only(right: maxWidth * 0.04),
      child: Container(
        width: maxWidth * _tabWidthFactor,
        child: Tab(
          child: Container(
            decoration: BoxDecoration(
              color: _selectedIndex == index ? colors.headingColor : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}