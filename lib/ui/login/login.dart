import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../di/inject.dart';
import '../widgets/custom_snackbar.dart';
import 'login_bloc.dart';

class LoginPage extends StatelessWidget {
  final String title;

  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: LoginContent(title: title),
    );
  }
}

class LoginContent extends StatelessWidget {
  final String title;

  const LoginContent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFinished) {
            if (state.successfullyFinished) {
              Navigator.pushReplacementNamed(context, '/sudokuUI');
            } else if (state.error != null &&
                state.error is FirebaseAuthException) {
              var errorCode = (state.error as FirebaseAuthException).code;
              switch (errorCode) {
                case 'network-request-failed':
                  showCustomSnackBar(
                    buildContext: context,
                    text: 'Hálózati hiba! Nincs internet elérhetőség!',
                  );
                  break;
                case 'user-not-found':
                  showCustomSnackBar(
                    buildContext: context,
                    text: 'Hibás felhasználónév és/vagy jelszó!',
                  );
                  break;
                case 'wrong-password':
                  showCustomSnackBar(
                    buildContext: context,
                    text: 'Hibás felhasználónév és/vagy jelszó!',
                  );
                  break;
              }
            }
          } else if (state is LoginRegisterStart) {
            Navigator.pushReplacementNamed(context, '/register');
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 82,
              left: 0,
              right: 0,
              child: Text(
                '$title Login',
                textAlign: TextAlign.center,
                style: GoogleFonts.catamaran(
                  fontSize: 48,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned.fill(
              child: _buildForm(),
            ),
          ],
        ),
      ),
    );
  }
}

FormBuilder _buildForm() {
  var obscure = true;
  final emailTextFieldController = TextEditingController();
  const TextStyle textStyleWhite = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  void clearTextFiled() {
    emailTextFieldController.clear();
  }

  return FormBuilder(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: 'email',
                controller: emailTextFieldController,
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'A mező nem lehet üres'),
                  FormBuilderValidators.email(
                      errorText: 'Érvénytelen email formátum'),
                ]),
                enabled: state is! LoginLoading,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    splashRadius: 24.0,
                    onPressed: clearTextFiled,
                  ),
                  hintText: 'Email',
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'password',
                obscureText: obscure,
                enabled: state is! LoginLoading,
                validator: FormBuilderValidators.minLength(6,
                    errorText:
                        'A jelszó minimum 6 karakterből kell hogy álljon'),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscure = !obscure;
                      context
                          .read<LoginBloc>()
                          .add(LoginVisibilityEvent(!obscure));
                    },
                    icon: const Icon(Icons.password),
                    splashRadius: 24.0,
                  ),
                  hintText: 'Password',
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              AnimatedButton(
                color: Theme.of(context).primaryColor,
                width: 164,
                height: 40,
                shadowDegree: ShadowDegree.light,
                onPressed: () {
                  var form = FormBuilder.of(context)!;
                  if (form.saveAndValidate()) {
                    var email = form.value['email'] ?? '';
                    var password = form.value['password'] ?? '';
                    context.read<LoginBloc>().add(
                          LoginStartLoginEvent(
                            email,
                            password,
                          ),
                        );
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 4),
                      child: const Text(
                        'BELÉPÉS',
                        style: textStyleWhite,
                      ),
                    ),
                    if (state is LoginLoading)
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              AnimatedButton(
                color: Theme.of(context).primaryColor,
                width: 164,
                height: 40,
                shadowDegree: ShadowDegree.light,
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginStartLoginAnonymouslyEvent(),
                      );
                },
                child: const Text(
                  'NÉVTELEN BELÉPÉS',
                  style: textStyleWhite,
                ),
              ),
              const SizedBox(height: 24),
              AnimatedButton(
                color: Theme.of(context).primaryColor,
                width: 164,
                height: 40,
                shadowDegree: ShadowDegree.light,
                onPressed: () {
                  context.read<LoginBloc>().add(LoginRegisterStartEvent());
                },
                child: const Text(
                  'ÚJ FELHASZNÁLÓ',
                  style: textStyleWhite,
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
