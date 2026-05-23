import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:layout_builder/notifier/theme_notifier.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
    'Location',
    'Value Listener',
    'Custom Widget',
    'Page View',
    'Multi page',
  ];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final theme = Theme.of(context);

    print("didChangeDependencies called : ${theme.brightness}");
  }

  @override
  Widget build(BuildContext context) {
    final themeAsync = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    bool _isToggled = (themeAsync == ThemeMode.dark);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Functionalities",
        ),
        actionsPadding: const EdgeInsets.only(right: 20),
        actions: [
          Switch(/*
            height: 35,
            width: 55,*/
            //  inactiveThumbImage: Image(image: Svg('assets/images/sun.svg')),
            // activeThumbImage: SvgPicture.asset('assets/images/moon.svg'),
            inactiveThumbColor: Colors.deepPurpleAccent,
            activeThumbColor: Colors.deepPurpleAccent,
            value: _isToggled,
            onChanged: (val) => themeNotifier.toggleTheme(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
                    destination = "layout_builder"
                    /*LayoutBuilderDemo()*/;
                  case 1:
                    destination = "encryption"
                    /*EncryptionDemo()*/;
                  case 2:
                    destination = "block_screenshot"
                    /*NoScreenshotDemo()*/;
                  case 3:
                    destination = "isolate"
                    /*IsolateDemo()*/;
                  case 4:
                    destination = "camera"
                    /*CameraDemo()*/;
                  case 5:
                    destination = "location"
                    /*LocationDemo()*/;
                  case 6:
                    destination = "value_listenable"
                    /*ValueListenableDemo()*/;
                  case 7:
                    destination = "custom_widget"
                    /*CustomWidgetDemo()*/;
                  case 8:
                    destination = "pageview"
                    /*PageViewDemo()*/;
                  case 9:
                    destination = "multi_page"
                    /*MultiPageDemo()*/;
                }
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );*/
                context.pushNamed(destination, extra: destination);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    items[index],
                    style: TextStyle(fontSize: 20, color: Theme.of(context).textTheme.bodySmall!.color),
                    maxLines: 2,
                    minFontSize: 10,
                  ),
                  /*Text(
                    items[index],
                    style: TextStyle(color: Colors.white, fontSize: AdaptiveFontSize.getFontSize(context, 15)),
                  )*/
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
