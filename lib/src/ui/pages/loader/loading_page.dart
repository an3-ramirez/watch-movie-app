import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/** Pages */
import 'package:watch_movie_app/src/ui/pages/login/login_page.dart';
import 'package:watch_movie_app/src/ui/pages/home/home_page.dart';

/** providers */
import 'package:watch_movie_app/src/data/providers/auth_provider.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context, ref),
        builder: (context, snapshot) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image:
                      AssetImage("assets/images/undraw_our_neighborhood.png"),
                  alignment: Alignment(1, 1)
                  //fit: BoxFit.contain,
                  ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text(
                    'Cargando...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context, WidgetRef ref) async {
    final isLogin = ref.watch(authProvider);
    //final socketService = Provider.of<SocketService>(context, listen: false);

    //final autenticado = false;
    if (isLogin) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomePage(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        // Here you can write your code
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginPage(),
            transitionDuration: const Duration(milliseconds: 0),
          ),
        );
      });
    }
  }
}
