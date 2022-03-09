import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/ui/global_widgets/background_image.dart';

/** Pages */
import 'package:watch_movie_app/src/ui/pages/root_page.dart';
import 'package:watch_movie_app/src/ui/pages/welcome/welcome_page.dart';

/** providers */
import 'package:watch_movie_app/src/domain/providers/auth_provider.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context, ref),
        builder: (context, snapshot) {
          return Stack(
            children: [
              const BackgroundImage(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 20),
                    Text(
                      'Cargando...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context, WidgetRef ref) async {
    final isLogin = ref.watch(authProvider);
    //final socketService = Provider.of<SocketService>(context, listen: false);

    //final isLogin = true;
    //await Future.delayed(const Duration(seconds: 2));
    if (isLogin) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => RootPage(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        // Here you can write your code
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const WelcomePage(),
            transitionDuration: const Duration(milliseconds: 0),
          ),
        );
      });
    }
  }
}
