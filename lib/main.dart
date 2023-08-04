import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/features/auth/domain/auth_cubit.dart';
import 'core/bloc_observer.dart';
import 'core/data/local/cacheHelper.dart';
import 'core/router/router.dart';
import 'features/admin/home_cubit.dart';
import 'features/home/cubit/getProduct_cubit.dart';
import 'features/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(DevicePreview(
    enabled: false,
    builder: (BuildContext context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()..productList),
        BlocProvider(create: (context) => AuthCubit()..userList),
        BlocProvider(create: (context) => AdminCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF53714B)),
          scaffoldBackgroundColor: const Color(0xFF53714B),
          useMaterial3: true,
        ),
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, _) => MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(fontFamily: 'Montserrat'),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            onGenerateRoute: onGenerateRoute,
            home: const AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark),
                child: SplashScreen()),
          ),
        ),
      ),
    );
  }
}
