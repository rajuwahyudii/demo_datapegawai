import 'package:demo/featured/admin/model/model_aturan.dart';
import 'package:demo/featured/admin/view/add_aturan.dart';
import 'package:demo/featured/admin/view/admin_profile.dart';
import 'package:demo/featured/admin/view/admin_view.dart';
import 'package:demo/featured/admin/view/aturan_view.dart';
import 'package:demo/featured/admin/view/detail_aturan.dart';
import 'package:demo/featured/admin/view/gejala_view.dart';
import 'package:demo/featured/admin/view/kerusakan_view.dart';
import 'package:demo/featured/admin/view/user_view.dart';
import 'package:demo/featured/diagnosa/view/diagnosa_view.dart';
import 'package:demo/featured/home/view/home_view.dart';
import 'package:demo/featured/login/view/login.dart';
import 'package:demo/featured/menu/view/menu_view.dart';
import 'package:demo/featured/profile/view/profile_view.dart';
import 'package:demo/featured/register/view/register.dart';
import 'package:demo/featured/result/view/result_view.dart';
import 'package:demo/featured/riwayat/view/detail_riwayat.dart';
import 'package:demo/featured/riwayat/view/riwayat_view.dart';
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
        builder: (_, __) => const ProfileView(),
      ),
      GoRoute(
        path: RouteString.menu,
        name: RouteString.menu,
        builder: (_, __) => const MenuView(),
      ),
      GoRoute(
          path: RouteString.diagnosa,
          name: RouteString.diagnosa,
          builder: (_, __) => const DiagnosaView(),
          routes: [
            GoRoute(
              path: RouteString.riwayatDiagnosa,
              name: RouteString.riwayatDiagnosa,
              builder: (_, __) => const RiwayatView(),
            ),
            GoRoute(
                path: RouteString.detailDiagnosa,
                name: RouteString.detailDiagnosa,
                builder: (context, state) {
                  String kode = state.extra as String;
                  return DetailRiwayatView(
                    kode: kode,
                  );
                }),
            GoRoute(
              path: RouteString.hasilDiagnosa,
              name: RouteString.hasilDiagnosa,
              builder: (context, state) {
                String kode = state.extra as String;
                return ResultView(
                  kode: kode,
                );
              },
            ),
          ]),
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
        GoRoute(
          path: RouteString.adminKerusakan,
          name: RouteString.adminKerusakan,
          builder: (_, __) => KerusakanView(),
        ),
        GoRoute(
            path: RouteString.adminAturan,
            name: RouteString.adminAturan,
            builder: (_, __) => const AturanView(),
            routes: [
              GoRoute(
                  path: RouteString.detailAdminAturan,
                  name: RouteString.detailAdminAturan,
                  builder: (context, state) {
                    ModelAturan modelAturan = state.extra as ModelAturan;

                    return DetailAturan(
                      modelAturan: modelAturan,
                    );
                  }),
              GoRoute(
                  path: RouteString.addAdminAturan,
                  name: RouteString.addAdminAturan,
                  builder: (context, state) {
                    ModelAturan modelAturan = state.extra as ModelAturan;

                    return AddAturanView(
                      modelAturan: modelAturan,
                    );
                  }),
            ]),
        GoRoute(
          path: RouteString.adminGejala,
          name: RouteString.adminGejala,
          builder: (_, __) => GejalaView(),
        ),
      ])
]);
