import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../di/inject.dart';
import '../widgets/custom_form_button.dart';
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
              Navigator.pushReplacementNamed(context, '/home', arguments: state.uid);
            }
            else if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error logging in!'),
                ),
              );
            }
          } else if (state is LoginRegisterStart) {
            debugPrint('BlocListener');
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
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Kötelező mező!'),
                    EmailValidator(
                        errorText: 'Helytelen email formátum!'),
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
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscure = !obscure;
                        context.read<LoginBloc>().add(LoginVisibilityEvent(!obscure));
                      },
                      icon: const Icon(Icons.password),
                      splashRadius: 24.0,
                    ),
                    hintText: 'Password',
                    border: const UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                CustomFormButton(
                  label: 'BELÉPÉS',
                  isEnabled: state is! LoginLoading,
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
                ),
                const SizedBox(height: 8),
                CustomFormButton(
                  label: 'NÉVTELEN BELÉPÉS',
                  isEnabled: state is! LoginLoading,
                  onPressed: () {
                      context.read<LoginBloc>().add(
                        LoginStartLoginAnonymouslyEvent(),
                      );
                  },
                ),
                const SizedBox(height: 16),
                CustomFormButton(
                  label: 'ÚJ FELHASZNÁLÓ',
                  isEnabled: state is! LoginLoading,
                  onPressed: () {
                    debugPrint('New button');
                    context.read<LoginBloc>().add(LoginRegisterStartEvent());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

