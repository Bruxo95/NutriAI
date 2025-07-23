import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:opennutritracker/core/presentation/widgets/app_banner_version.dart';
import 'package:opennutritracker/core/utils/app_const.dart';
import 'package:opennutritracker/core/utils/url_const.dart';
import 'package:opennutritracker/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingIntroPageBody extends StatefulWidget {
  const OnboardingIntroPageBody({super.key, required this.setPageContent});

  final Function(bool active, bool acceptedDataCollection) setPageContent;

  @override
  State<OnboardingIntroPageBody> createState() =>
      _OnboardingIntroPageBodyState();
}

class _OnboardingIntroPageBodyState extends State<OnboardingIntroPageBody> {
  bool _acceptedPolicy = false;
  bool _acceptedDataCollection = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: -533,
            top: -232,
            child: Container(
              width: 1084,
              height: 1084,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://placehold.co/1084x1084"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 419,
            child: Text(
              'Bem-vindo ao NutriAI!',
              style: TextStyle(
                color: const Color(0xFF666666),
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 36,
            top: 597,
            child: SizedBox(
              width: 320,
              child: Text(
                'Para oferecer nosso melhor serviço, precisamos de mais informações suas.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF666666),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Positioned(
            left: 121,
            top: 129,
            child: Container(
              width: 150,
              height: 150,
              decoration: ShapeDecoration(
                color: const Color(0xFFF1F0E8),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: const Color(0xFF96B6C5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 122,
            top: 279,
            child: SizedBox(
              width: 149,
              child: Text(
                'NutriAI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF666666),
                  fontSize: 32,
                  fontFamily: 'Saira',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -2.56,
                ),
              ),
            ),
          ),
          Positioned(
            left: 166,
            top: 154,
            child: Container(
              width: 100,
              height: 100,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: const Color(0xFFCCE6F1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 211,
            top: 179,
            child: Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: const Color(0xFFEEE0C9),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _togglePolicy() {
    setState(() {
      _acceptedPolicy = !_acceptedPolicy;
      widget.setPageContent(_acceptedPolicy, _acceptedDataCollection);
    });
  }

  void _toggleDataCollection() {
    setState(() {
      _acceptedDataCollection = !_acceptedDataCollection;
      widget.setPageContent(_acceptedPolicy, _acceptedDataCollection);
    });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(URLConst.privacyPolicyURLEn),
        mode: LaunchMode.externalApplication)) {}
  }
}
