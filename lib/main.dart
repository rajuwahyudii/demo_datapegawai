import 'package:demo/packages/get_it.dart';
import 'package:demo/router/router.dart';
import 'package:demo/services/auth_services.dart';
import 'package:demo/services/provider_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var status = await Permission.notification.status;
  if (!status.isGranted) {
    await Permission.notification.request();
  }
  configureDependencies();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ProviderServices>(
          create: (_) => ProviderServices()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.FirebaseUserStream,
      initialData: null,
      child: GestureDetector(
        child: ChangeNotifierProvider(
          create: (context) => ProviderServices(),
          child: MaterialApp.router(
            title: 'Demo App',
            theme: ThemeData(primarySwatch: Colors.blue),
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}
