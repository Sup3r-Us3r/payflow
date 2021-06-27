import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Container(
              height: _size.height * 0.36,
              width: _size.width,
              color: AppColors.primary,
            ),
            Positioned(
              top: 40.0,
              left: 0.0,
              right: 0.0,
              child: Image.asset(
                AppImages.person,
                height: 300.0,
                width: 208.0,
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: _size.height * 0.10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 70.0),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleHome,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: SocialLoginButtonWidget(
                      onTap: () => _controller.handleGoogleSignIn(context),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
