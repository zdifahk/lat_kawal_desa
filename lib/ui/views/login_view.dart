import 'package:flutter/material.dart';
import 'package:kawal_desa2/constants/const.dart';
import 'package:kawal_desa2/ui/shared/shared_style.dart';
import 'package:kawal_desa2/ui/shared/ui_helper.dart';
import 'package:kawal_desa2/ui/views/sign_up_view.dart';
import 'package:kawal_desa2/ui/widgets/button_widget.dart';
import 'package:kawal_desa2/ui/widgets/text_field_widget.dart';
import 'package:kawal_desa2/viewmodels/login_view_model.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: LoadingOverlay(
          isLoading: model.busy,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      verticalSpaceMedium,
                      Text("Workshop Kawal Desa", style: titleTextStyle,),
                      verticalSpaceSmall,
                      Image.asset(
                        'assets/logo.png',
                        width: size.width*0.3,
                        height: size.width*0.3,
                      ),
                      verticalSpaceMedium,
                      TextFieldWidget(
                          hintText: 'Email',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                          textFieldController: null,
                          colorIcon: color_main,
                      ),
                      verticalSpaceSmall,
                      TextFieldWidget(
                        hintText: 'Password',
                        icon: Icons.lock,
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        textFieldController: null,
                        colorIcon: color_main,
                      ),
                      verticalSpaceLarge,
                      ButtonWidget(
                        title: 'Login',
                        onPressedfunction: (){
                          // model.loginAccount(context);
                        },
                        bgColor: color_main,
                      ),
                      verticalSpaceSmall,
                      InkWell(
                        onTap: (){},
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color_main),),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? '),
                          InkWell(
                            onTap: (){
                              model.navigateToSignUpView();
                            },
                              child: Text('Sign up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                color: color_main,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceLarge
                    ],
                  ),
                ),
              ),
            ),
          )
        )
      ),
        );
  }
}
