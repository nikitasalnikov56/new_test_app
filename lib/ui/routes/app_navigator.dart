import 'package:app/ui/pages/calendar_page/calendar_page.dart';
import 'package:app/ui/pages/home_page/home_page.dart';
import 'package:app/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.calendar,
        builder: (context, state) => const CustomCalendar(),
      ),
    ],
  );
  GoRouter get router => _router;
}
