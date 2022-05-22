import 'package:carrossel/slide_tile.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  final List<Map<String, dynamic>> _listSlide = [
    {'id': 0, 'image': 'assets/images/Tristana_41.jpg'},
    {'id': 1, 'image': 'assets/images/hollow-knight-cover-006487.webp'},
    {'id': 2, 'image': 'assets/images/One_Piece.webp'},
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: _listSlide.length,
                itemBuilder: (_, int currentIndex) {
                  bool activePage = currentIndex == _currentPage;
                  return SlideTitle(
                    activePage: activePage,
                    image: _listSlide[currentIndex]['image'].toString(),
                  );
                }),
          ),
          _buildBullets(),
        ]),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return InkWell(
            onTap: () {
              setState(() {
                _pageController.jumpToPage(i['id']);
                _currentPage = i['id'];
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: _currentPage == i['id'] ? Colors.red : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
