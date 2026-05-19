import 'package:flutter/material.dart';
import 'package:layout_builder/custom_widget/custom/custom_container.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PageViewState();
  }
}

class _PageViewState extends State<PageViewDemo> {
  final _pageController = PageController(initialPage: 2, viewportFraction: 0.2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page View Demo"),),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return CustomContainer(onClick: (){}, color: Colors.white, child: Center(
            child: Text("page $index"),
          ));
        },
      ),
    );
  }
}
