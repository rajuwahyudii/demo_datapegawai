import 'package:demo/featured/admin/view/admin_profile.dart';
import 'package:demo/featured/admin/view/admin_view.dart';
import 'package:demo/featured/admin/view/user_view.dart';
import 'package:demo/featured/home/view/home_view.dart';
import 'package:demo/featured/login/view/login.dart';
import 'package:demo/featured/profile/view/profile_view.dart';
import 'package:demo/featured/register/view/register.dart';
import 'package:demo/featured/splash/view/splash.dart';
import 'package:demo/router/strings.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: RouteString.splash,
    builder: (_, __) => const SplashPageView(),
  ),
  GoRoute(
    path: '/home',
    name: RouteString.home,
    builder: (_, __) => const HomeView(),
    routes: [
      GoRoute(
        path: RouteString.login,
        name: RouteString.login,
        builder: (_, __) => const LoginView(),
      ),
      GoRoute(
        path: RouteString.register,
        name: RouteString.register,
        builder: (_, __) => const RegisterView(),
      ),
      GoRoute(
        path: RouteString.profile,
        name: RouteString.profile,
        builder: (_, __) => ProfileView(),
      ),
    ],
  ),
  GoRoute(
      path: '/admin',
      name: RouteString.admin,
      builder: (_, __) => const AdminView(),
      routes: [
        GoRoute(
            path: RouteString.adminUser,
            name: RouteString.adminUser,
            builder: (_, __) => UserView(),
            routes: [
              GoRoute(
                path: RouteString.adminProfile,
                name: RouteString.adminProfile,
                builder: (context, state) {
                  String id = state.extra as String;
                  return AdminProfileView(
                    id: id,
                  );
                },
              ),
            ]),
      ])
]);
