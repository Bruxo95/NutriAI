import 'package:flutter/material.dart';
import 'package:opennutritracker/core/utils/navigation_options.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              _buildLogo(),
              const SizedBox(height: 16),
              const Text(
                'NutriAI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 32,
                  fontFamily: 'Saira',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -2.56,
                ),
              ),
              const Spacer(flex: 3),
              _buildLoginButton(context),
              const SizedBox(height: 24),
              _buildSignUpRow(context),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: const ShapeDecoration(
          color: Color(0xFFF1F0E8),
          shape: OvalBorder(
            side: BorderSide(
              width: 4,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF96B6C5),
            ),
          ),
        ),
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(
                side: BorderSide(
                  width: 4,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFCCE6F1),
                ),
              ),
            ),
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 4,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFEEE0C9),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, NavigationOptions.loginRoute);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF96B6C5),
        padding: const EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Entrar',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Text(
            'Não tem uma conta?',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, NavigationOptions.signupRoute);
          },
          child: const Text(
            'Cadastre-se',
            style: TextStyle(
              color: Color(0xFF96B6C5),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
