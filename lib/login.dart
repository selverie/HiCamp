import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  final void Function(BuildContext) onLogin;

  const LoginPage({Key? key, required this.onLogin}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  // method static untuk memudahkan pemanggilan
  static void goToLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email = 'user';
  String password = 'pw';
  String errorMessage = '';
  bool isPasswordVisible = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    setState(() {
      errorMessage = message;
    });
  }

  void _clearError() {
    setState(() {
      errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Login'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  onChanged: (_) => _clearError(),
                                  decoration: const InputDecoration(
                                    labelText: 'Username',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  onChanged: (_) => _clearError(),
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: !isPasswordVisible,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTapDown: (_) {
                            _animationController.forward();
                          },
                          onTapUp: (_) {
                            _animationController.reverse();
                          },
                          onTapCancel: () {
                            _animationController.reverse();
                          },
                          onTap: () {
                            if (emailController.text == email &&
                                passwordController.text == password) {
                              _clearError();
                              widget.onLogin(context);
                            } else {
                              _showError('Email or password is incorrect');
                            }
                          },
                          child: AnimatedBuilder(
                            animation: _scaleAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.deepPurpleAccent,
                                        Color.fromARGB(255, 214, 59, 253),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'or',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/google.png',
                              width: 24,
                              height: 24,
                            ),
                            label: const Text(
                              'Sign up With Google',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                            ),
                          ),
                        ),
                        if (errorMessage.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
