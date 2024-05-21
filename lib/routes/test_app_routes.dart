import 'package:test_app/features/actions/actions.dart';
import 'package:test_app/features/map/map.dart';
import 'package:test_app/features/stop_watch/stop_watch.dart';

final testAppRoutes = {
  '/stopWatch': (context) => const StopWatchScreen(),
  '/map': (context) => const MapScreen(),
  '/actions': (context) => const ActionsScreen(),
};
