import 'package:flutter/material.dart';

class InfoDisplayArguments {
  final bool isSignIn;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  InfoDisplayArguments({
    required this.isSignIn,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });
}

class AuthPage extends StatelessWidget {
  /*@override
  Widget build(BuildContext context) {
    final bool isSignIn = ModalRoute.of(context)!.settings.arguments as bool;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(isSignIn ? 'Sign In' : 'Sign Up'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Sign In'),
              Tab(text: 'Sign Up'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginPage(),
            SignUpPage(),
          ],
        ),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int initialTabIndex = args['initialTabIndex'] as int;
    return DefaultTabController(
      length: 2,
      initialIndex: initialTabIndex,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Auth Page'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Sign In'),
              Tab(text: 'Sign Up'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginPage(),
            SignUpPage(),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _showPassword = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Index to track the selected tab in the bottom navigation bar
  int _selectedIndex = 0;

  // Function to handle tab changes in the bottom navigation bar
  /*void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Login form fields
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    obscureText: !_showPassword,
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          Text('Remember Me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/info',
                        arguments: InfoDisplayArguments(
                          isSignIn: true, // Pass true to isSignIn
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20.0),
                  Text("Don't have an account?"),
                  SizedBox(height: 20.0),
                  OutlinedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/signup');
                      Navigator.pushNamed(context, '/auth',
                          arguments: {'initialTabIndex': 1});
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              if (index == 0) {
                Navigator.pushNamed(context, '/');
              }
            });
          }
          //onTap: _onItemTapped,
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.info),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showPassword = false;
  bool _acceptTerms = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // Index to track the selected tab in the bottom navigation bar
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(labelText: 'First Name'),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(labelText: 'Last Name'),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: !_showPassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: !_showPassword,
                        controller: _confirmPasswordController,
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                  ),
                  Text('I accept the Terms of Use and Privacy Policy'),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/info',
                    arguments: InfoDisplayArguments(
                      isSignIn: false, // Pass false to isSignIn
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Already have an account? ',
                style: TextStyle(fontSize: 16.0),
              ),
              TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/signin');
                  Navigator.pushNamed(context, '/auth',
                      arguments: {'initialTabIndex': 0});
                },
                child: Text(
                  'Login Here',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0) {
              Navigator.pushNamed(context, '/');
            }
          });
        },
      ),
    );
  }
}

class InfoDisplayPage extends StatelessWidget {
  final bool isSignIn;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  InfoDisplayPage({
    required this.isSignIn,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(isSignIn ? 'Sign In Info' : 'Sign Up Info'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement logout functionality here
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          /*children: [
            if (!isSignIn) ...[
              Text('First Name: $firstName'),
              SizedBox(height: 10),
              Text('Last Name: $lastName'),
              SizedBox(height: 10),
            ],
            Text('Email: $email'),
            SizedBox(height: 10),
            if (!isSignIn) Text('Password: $password'),
          ],*/
          children: [
            if (!isSignIn && firstName != null) Text('First Name: $firstName'),
            SizedBox(height: 10),
            if (!isSignIn && lastName != null) Text('Last Name: $lastName'),
            SizedBox(height: 10),
            if (email != null) Text('Email: $email'),
            SizedBox(height: 10),
            if (password != null) Text('Password: $password'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
