import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/barrel.dart';

@RoutePage()
class AuthHomePage extends StatelessWidget {
  const AuthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/auth_home_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.percentOfHeight(0.16)),
                  SizedBox(
                    height: context.percentOfHeight(0.1),
                    width: context.percentOfWidth(0.7),
                    child: SvgPicture.asset(
                      "assets/logo.svg",
                      // ignore: deprecated_member_use
                      color: CustomColors.offWhite,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    context.appTexts.tagline,
                    style: const TextStyle(color: CustomColors.offWhite, fontSize: 25),
                  ),
                  const Spacer(),
                  Text(
                    context.appTexts.authHomeWelcomingMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: CustomColors.offWhite, fontSize: 23),
                  ),
                  SizedBox(height: context.percentOfHeight(0.035)),
                  CustomTextButton(
                    text: context.appTexts.signin,
                    onPressed: () {
                      context.router.push(const SignInRoute());
                    },
                    backgroundColor: CustomColors.offWhite,
                    textColor: CustomColors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: context.percentOfHeight(0.018)),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${context.appTexts.authHomeSignUpMessage} ",
                            style: const TextStyle(color: CustomColors.offWhite, fontSize: 18),
                          ),
                          TextSpan(
                            text: context.appTexts.signup,
                            style: const TextStyle(
                              color: CustomColors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.router.push(const SignUpRoute());
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
