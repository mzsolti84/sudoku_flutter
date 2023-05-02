import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku_flutter/ui/registration/registration_bloc.dart';

import '../../di/inject.dart';
import '../../domain/model/game_user.dart';
import '../widgets/custom_form_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => getIt<RegistrationBloc>(),
      child: const RegistrationContent(),
    );
  }
}

class RegistrationContent extends StatelessWidget {
  const RegistrationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Új felhasználó regisztrálása"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            finished: (error, successfullyFinished) async {
              if (successfullyFinished) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sikeres regisztráció!'),
                  ),
                );
                Future.delayed(const Duration(seconds: 1));
                Navigator.pop(context);
              } else if (error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hiba történt a regisztrációkor!'),
                  ),
                );
              }
            },
            passwordVisibility: (visibility) {},
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 22,
              left: 0,
              right: 0,
              child: Text(
                'Új felhasználó regisztrálása',
                textAlign: TextAlign.center,
                style: GoogleFonts.catamaran(
                  fontSize: 48,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned.fill(
              child: _buildRegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}

FormBuilder _buildRegisterForm() {
  var obscure = true;
  final emailTextFieldController = TextEditingController();

  void clearTextFiled() {
    emailTextFieldController.clear();
  }

  return FormBuilder(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
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
                  EmailValidator(errorText: 'Helytelen email formátum!'),
                ]),
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscure = !obscure;
                      context
                          .read<RegistrationBloc>()
                          .add(RegistrationEvent.passwordVisibility(!obscure));
                    },
                    icon: const Icon(Icons.password),
                    splashRadius: 24.0,
                  ),
                  hintText: 'Jelszó',
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'repassword',
                obscureText: obscure,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscure = !obscure;
                      context
                          .read<RegistrationBloc>()
                          .add(RegistrationEvent.passwordVisibility(!obscure));
                    },
                    icon: const Icon(Icons.password),
                    splashRadius: 24.0,
                  ),
                  hintText: 'Jelszó újra',
                  border: const UnderlineInputBorder(),
                ),
              ),
              const Divider(),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'lastname',
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Kötelező mező!'),
                ]),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                  prefixIcon: const Icon(Icons.people_alt),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    splashRadius: 24.0,
                    onPressed: clearTextFiled,
                  ),
                  hintText: 'Családnév',
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'firstname',
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Kötelező mező!'),
                ]),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                  prefixIcon: const Icon(Icons.face),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    splashRadius: 24.0,
                    onPressed: clearTextFiled,
                  ),
                  hintText: 'Keresztnév',
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'age',
                keyboardType: TextInputType.number,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Kötelező mező!'),
                ]),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(38, 47, 77, 0.2),
                  prefixIcon: const Icon(Icons.timelapse),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    splashRadius: 24.0,
                    onPressed: clearTextFiled,
                  ),
                  hintText: 'Életkor',
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              CustomFormButton(
                label: 'REGISTER',
                isEnabled: true,
                onPressed: () {
                  var form = FormBuilder.of(context)!;
                  if (form.saveAndValidate()) {
                    var email = form.value['email'] ?? '';
                    var password = form.value['password'] ?? '';
                    var firstname = form.value['firstname'] ?? '';
                    var lastname = form.value['lastname'] ?? '';
                    var age = int.tryParse(form.value['age']) ?? 0;
                    context.read<RegistrationBloc>().add(
                          RegistrationEvent.register(
                              email, password, firstname, lastname, age),
                        );
                  }
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}
