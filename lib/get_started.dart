import 'package:flutter/material.dart';
import 'login.dart';

class GetStartedPage extends StatelessWidget {
  static const String routeName = '/get_started';

  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/img/bailu.gif',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Opacity(
                  opacity: 0.8,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    icon: const Icon(
                      Icons.double_arrow_rounded,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
