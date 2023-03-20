import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_full_learn/product/service/vexana_network_manager.dart';
import 'package:kartal/kartal.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_cubit_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = "Login";
  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // burası blocprovider ile sarmalanmıştı
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginCubit, LoginState>(builder: (context, state){
          return state.isLoading ? CircularProgressIndicator(color: context.colorScheme.secondary)
          : SizedBox();
        }),
      ),
      body: Form(
        key: _formLoginKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: PagePadding.all(),
          child: Column(
            children: [
              _LoginEmailFields(
                controller: _emailController,
                passwordController: _passwordController,
              ),
              _LoginButton(formLoginKey: _formLoginKey, emailController: _emailController,
                  passwordController: _passwordController, loginText: _loginText),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String loginText,
  }) : _formLoginKey = formLoginKey, _emailController = emailController, _passwordController = passwordController, _loginText = loginText, super(key: key);

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state){
        if(state.isCompleted){
          context.navigateToPage(ImageLearn202());
        }
      },
      builder: (context, state){
        return SizedBox(
          width: context.dynamicWidth(0.4),
          child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return ElevatedButton(onPressed: (){
                  if(_formLoginKey.currentState?.validate() ?? false){
                    context.read<LoginCubit>().checkUser(_emailController.text, _passwordController.text);
                  }
                }, child: Text("$_loginText - ${state.model?.email ?? ""}"));
              }
          ));
      },
    );
  }
}

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields({
    Key? key,
    required TextEditingController controller,
    required TextEditingController passwordController,
  }) : _emailController = controller, _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
      return AnimatedOpacity(
        duration: context.durationLow,
        opacity: state ? 0.3 : 1,
        child: Column(
          children: [
            Padding(
              padding: PagePadding.bottom(),
              child: TextFormField(
                controller: _emailController,
                validator: (String? data) => (data?.isValidEmail ?? false) ? null : "Problem",
                decoration: InputDecoration(
                  labelText: "Email"
                ),
              ),
            ),
            Padding(
              padding: PagePadding.bottom(),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (String? data) => ((data?.length ?? 0) > 6) ? null : "Problem",
                decoration: InputDecoration(
                    labelText: "Password"
                ),
              ),
            ),
          ],
         ),
      );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  PagePadding.all() : super.all(20);
  PagePadding.bottom() : super.only(bottom: 10);

}