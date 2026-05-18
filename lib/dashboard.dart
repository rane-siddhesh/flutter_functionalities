import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:layout_builder/camera_demo.dart';
import 'package:layout_builder/encryption_demo.dart';
import 'package:layout_builder/isolate_demo.dart';
import 'package:layout_builder/layout_builder_demo.dart';
import 'package:layout_builder/no_screenshot.dart';
import 'package:layout_builder/notifier/theme_notifier.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  final items = [
    'Layout Builder',
    'Encryption',
    'Block Screenshot and recording',
    'Isolate',
    'Camera',
  ];

  @override
  Widget build(BuildContext context) {
    final themeAsync = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    bool _isToggled = (themeAsync == ThemeMode.dark);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Functionalities",
          style: TextStyle(color: Colors.white),
        ),
        actionsPadding: const EdgeInsets.only(right: 20),
        actions: [
          FlutterSwitch(
            height: 35,
            width: 55,
            activeColor: Color(0xff1f1f1f),
            inactiveColor: Colors.white,
            inactiveIcon: SvgPicture.asset('assets/images/sun.svg'),
            activeIcon: SvgPicture.asset('assets/images/moon.svg'),
            inactiveToggleColor: Colors.deepPurpleAccent,
            activeToggleColor: Colors.deepPurpleAccent,
            value: _isToggled,
            onToggle: (val) => setState(() {
              _isToggled = val;
              themeNotifier.toggleTheme();
            }),
          ),
        ],
        backgroundColor: Color(0xff111111),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0Xff111111),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 80,
          ),
          children: List.generate(items.length, (index) {
            return InkWell(
              onTap: () {
                late var destination;
                switch (index) {
                  case 0:
                    destination = LayoutBuilderDemo();
                  case 1:
                    destination = EncryptionDemo();
                  case 2:
                    destination = NoScreenshotDemo();
                  case 3:
                    destination = IsolateDemo();
                  case 4:
                    destination = CameraDemo();
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff1f1f1f),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    items[index],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
