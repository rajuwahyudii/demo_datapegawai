import 'package:demo/featured/admin/view_model/admin_view_model.dart';
import 'package:demo/featured/diagnosa/view_model/diagnosa_view_model.dart';
import 'package:demo/featured/home/view_model/home_view_model.dart';
import 'package:demo/featured/login/view_model/login_view_model.dart';
import 'package:demo/featured/register/view_model/register_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<RegisterViewModel>(RegisterViewModel());
  getIt.registerSingleton<LoginViewModel>(LoginViewModel());
  getIt.registerSingleton<HomeViewModel>(HomeViewModel());
  getIt.registerSingleton<AdminViewModel>(AdminViewModel());
  getIt.registerSingleton<DiagnosaViewModel>(DiagnosaViewModel());
}
