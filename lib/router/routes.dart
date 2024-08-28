import 'package:demo/router/router.dart';
import 'package:demo/router/strings.dart';

class Routes {
  static goSplash() => router.pushReplacement(RouteString.splash);
  static goLogin() => router.pushReplacementNamed(RouteString.login);
  static goHome() => router.pushReplacementNamed(RouteString.home);
  static goRegister() => router.pushReplacementNamed(RouteString.register);
  static goProfile() => router.pushNamed(RouteString.profile);
  static goDiagnosa() => router.pushNamed(RouteString.diagnosa);
  static goAdmin() => router.pushReplacementNamed(RouteString.admin);
  static goAdminKerusakan() => router.pushNamed(RouteString.adminKerusakan);
  static goAdminAturan() => router.pushNamed(RouteString.adminAturan);

  static goAdminUser() => router.pushNamed(RouteString.adminUser);

  static goAdminGejala() => router.pushNamed(RouteString.adminGejala);
  static goRiwayatDiagnosa() => router.pushNamed(RouteString.riwayatDiagnosa);
  static goHasilDiagnosa(String kode) {
    router.pushNamed(RouteString.hasilDiagnosa, extra: kode);
  }

  static goDetailDiagnosa(String kode) => router.pushNamed(
        RouteString.detailDiagnosa,
        extra: kode,
      );
  static goAdminProfile(String id) => router.pushNamed(
        RouteString.adminProfile,
        extra: id,
      );
}
