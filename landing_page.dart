import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 150,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/signin');
                //Navigator.pushNamed(context, '/auth', arguments: true);
                Navigator.pushNamed(context, '/auth',
                    arguments: {'initialTabIndex': 0});
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/auth', arguments: false);
                Navigator.pushNamed(context, '/auth',
                    arguments: {'initialTabIndex': 1});
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
