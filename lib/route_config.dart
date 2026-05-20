import 'package:go_router/go_router.dart';
import 'package:layout_builder/multipage/screen2.dart';
import 'package:layout_builder/route_wrapper.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => Dashboard()),
    GoRoute(
      name: 'layout_builder',
      path: '/layout_builder',
      builder: (context, state) => LayoutBuilderDemo(),
    ),
    GoRoute(
      name: 'encryption',
      path: '/encryption',
      builder: (context, state) => EncryptionDemo(),
    ),
    GoRoute(
      name: 'block_screenshot',
      path: '/block_screenshot',
      builder: (context, state) => NoScreenshotDemo(),
    ),
    GoRoute(
      name: 'isolate',
      path: '/isolate',
      builder: (context, state) => IsolateDemo(),
    ), GoRoute(
      name: 'camera',
      path: '/camera',
      builder: (context, state) => CameraDemo(),
    ),
    GoRoute(
      name: 'location',
      path: '/location',
      builder: (context, state) => LocationDemo(),
    ),
    GoRoute(
      name: 'value_listenable',
      path: '/value_listenable',
      builder: (context, state) => ValueListenableDemo(),
    ),
    GoRoute(
      name: 'custom_widget',
      path: '/custom_widget',
      builder: (context, state) => CustomWidgetDemo(),
    ),
    GoRoute(
      name: 'pageview',
      path: '/pageview',
      builder: (context, state) => PageViewDemo(),
    ),
    GoRoute(
      name: 'multi_page',
      path: '/multi_page',
      builder: (context, state) {
        final txt= state.extra as String;
        return MultiPageDemo(name: txt,);
      },
      routes: [
        GoRoute(
          name: 'screen2',
          path: 'screen2',
          builder: (context, state) => Screen2(),
        ),
      ]
    ),
  ],
);
