import 'package:flutter/material.dart';
import 'package:flutter_scroll_animation/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.35);
    _pageController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(scrollListener);
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Transform.scale(
            scale: 1.3,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox.shrink();
                }

                final itemResult = _currentPage - index + 1;
                final value = -0.4 * itemResult + 1;

                return Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(
                        0.0,
                        MediaQuery.of(context).size.height /
                            3 *
                            (1 - value).abs())
                    ..scale(value),
                  child: Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: Container(
                      color: Colors.red,
                      child: Text('SADA'),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void scrollListener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }
}
