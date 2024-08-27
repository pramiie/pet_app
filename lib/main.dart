import 'package:pet_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_app/ui/authentication/splash.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/authentication/welcome.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 1000),
      builder: (context, child) {
        return MaterialApp(
          initialRoute: '/',
          routes: {
             '/': (context) => Splash(),
            '/welcome': (context) => Welcome(),


          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
