import 'package:aranduapp/core/log/log.dart';
import 'package:aranduapp/ui/login/model/login_request.dart';
import 'package:aranduapp/ui/navbar/view/navbar_view.dart';
import 'package:aranduapp/ui/shared/text_and_link.dart';
import 'package:aranduapp/ui/shared/command_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:aranduapp/ui/login/viewmodel/login_viewmodel.dart';

import 'package:aranduapp/ui/recover_account/view/recover_account_view.dart';
import 'package:aranduapp/ui/register_account/view/register_account_view.dart';

import 'package:aranduapp/ui/shared/title_slogan.dart';
import 'package:aranduapp/ui/shared/text_email.dart';
import 'package:aranduapp/ui/shared/error_popup.dart';
import 'package:aranduapp/ui/shared/text_password.dart';
import 'package:aranduapp/ui/shared/or_divider.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: GetIt.instance<LoginViewModel>(),
      child: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel.validadeTokenCommand,
        builder: (context, child) {
          if (viewModel.validadeTokenCommand.isOk) {
            return _authDevice(viewModel, context);
          } else if (viewModel.validadeTokenCommand.isError) {
            return _emailAndPassword(viewModel, context);
          } else if (viewModel.validadeTokenCommand.running) {
            return _loadingScreen(viewModel, context);
          } else {
            return _emailAndPassword(viewModel, context);
          }
        },
      ),
    );
  }

  Widget _loadingScreen(LoginViewModel viewModel, BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(value: null),
    );
  }

  Widget _authDevice(LoginViewModel viewModel, BuildContext context) {
    Log.d("Mostrando tela de autorização do dispositivo");

    viewModel.loginWithDeviceAuth().then((ok) {
      if (ok) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          goToNavbar(context);
        });
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Icon(
              Icons.lock_sharp,
              color: Theme.of(context).colorScheme.primary,
              size: 120,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            width: 291,
            height: 64,
            child: ElevatedButton(
              onPressed: () async {
                viewModel.loginWithDeviceAuth().then((ok) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    goToNavbar(context);
                  });
                });
              },
              child: const Text('Usar senha do celular'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailAndPassword(LoginViewModel viewModel, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 80),
          const TitleSlogan(),
          const SizedBox(height: 80),
          const SizedBox(height: 10),
          _formSection(viewModel),
          _forgotPasswordLink(context),
          const SizedBox(height: 80),
          _loginButtonSection(context),
          const OrDivider(),
          _loggingInWithOther(context),
          TextAndLink(
              text: 'É novo pro aqui?',
              link: 'Cria a sua conta',
              action: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const RegisterAccount()),
                );
              }),
        ],
      ),
    );
  }

  Widget _formSection(LoginViewModel viewModel) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextEmail(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            controller: emailController,
          ),
          TextPassWord(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            controller: passwordController,
          ),
        ],
      ),
    );
  }

  Widget _forgotPasswordLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RecoverAccount(),
          ),
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'esqueceu sua senha ?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ),
    );
  }

  Widget _loginButtonSection(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return CommandButton(
        tap: () {
          if (formKey.currentState!.validate()) {
            viewModel.loginCommand.execute(
                LoginRequest(emailController.text, passwordController.text));
          }
        },
        command: viewModel.loginCommand,
        onErrorCallback: (String e) {
          showDialog<Object>(
            context: context,
            builder: (BuildContext context) => ErrorPopUp(content: Text(e)),
          );
        },
        onSuccessCallback: () {
          goToNavbar(context);
        },
        nameButton: 'Entrar');
  }

  Widget _loggingInWithOther(BuildContext context) {
    return GestureDetector(
      onTap: () => Log.d(""),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          color: Colors.transparent,
        ),
        child: Icon(
          FontAwesomeIcons.google,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  void goToNavbar(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const NavbarView(),
      ),
    );
  }
}
