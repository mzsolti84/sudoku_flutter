import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku_flutter/ui/registration/registration_bloc.dart';

import '../../di/inject.dart';
import '../widgets/custom_form_button.dart';
import '../widgets/custom_snackbar.dart';

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
                showCustomSnackBar(
                    buildContext: context, text: 'Sikeres regisztráció!');

                Future.delayed(const Duration(seconds: 2));
                await Navigator.pushReplacementNamed(context, '/sudokuUI');
              } else if (error != null) {
                showCustomSnackBar(
                    buildContext: context,
                    text: 'Hiba történt a regisztrációkor!');
              }
            },
            passwordVisibility: (visibility) {},
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Text(
              'Új felhasználó regisztrálása',
              textAlign: TextAlign.center,
              style: GoogleFonts.catamaran(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Positioned.fill(
              top: 32,
              child: _buildRegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}

SingleChildScrollView _buildRegisterForm() {
  var obscure = true;
  final emailTextFieldController = TextEditingController();

  void clearTextFiled() {
    emailTextFieldController.clear();
  }

  return SingleChildScrollView(
    child: FormBuilder(
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'A mező nem lehet üres'),
                    FormBuilderValidators.email(
                        errorText: 'Érvénytelen email formátum'),
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
                  initialValue: '',
                  obscureText: obscure,
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
                  initialValue: '',
                  obscureText: obscure,
                  validator: (val) {
                    String password =
                        FormBuilder.of(context)!.value['password'] ?? '';
                    if (val!.length < 6) {
                      return 'A jelszó minimum 6 karakterből kell hogy álljon';
                    } else if (val.compareTo(password) != 0) {
                      return 'A két jelszó nem egyezik meg';
                    }
                  },
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
                  validator: FormBuilderValidators.required(
                      errorText: 'A mező nem lehet üres'),
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
                  validator: FormBuilderValidators.required(
                      errorText: 'A mező nem lehet üres'),
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
                  validator: FormBuilderValidators.required(
                      errorText: 'A mező nem lehet üres'),
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
    ),
  );
}
