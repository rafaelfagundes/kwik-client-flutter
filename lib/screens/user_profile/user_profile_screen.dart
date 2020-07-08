import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/modules/auth/auth_store.dart';
import 'package:kwik_client_flutter/screens/user_profile/user_profile_header_widget.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/slide_switch_widget.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Gender gender;
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController phoneNumber;
  TextEditingController dateOfBirth;

  void _setGender(value) {
    setState(() {
      gender = value;
    });
  }

  @override
  void initState() {
    this.gender = context.read<AuthStore>().user.gender;
    this.firstName =
        TextEditingController(text: context.read<AuthStore>().user.firstName);
    this.lastName =
        TextEditingController(text: context.read<AuthStore>().user.lastName);
    this.phoneNumber = TextEditingController(
        text: context.read<AuthStore>().user.phoneNumber != null
            ? context.read<AuthStore>().user.phoneNumber.replaceFirst('+55', '')
            : "");
    this.dateOfBirth = TextEditingController(
        text: context.read<AuthStore>().user.dateOfBirth != null
            ? context.read<AuthStore>().user.dateOfBirth.toString()
            : "");
    super.initState();
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed.
    this.firstName.dispose();
    this.lastName.dispose();
    this.phoneNumber.dispose();
    this.dateOfBirth.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Perfil',
      children: <Widget>[
        UserProfileHeaderWidget(),
        SizedBox(height: 30),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              labelText: 'Nome',
              controller: firstName,
            )),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              labelText: 'Sobrenome',
              controller: lastName,
            )),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SlideSwitchWidget(
            value: gender,
            onChanged: _setGender,
            options: [
              SlideSwitchOption(
                label: 'Feminino',
                value: Gender.FEMALE,
              ),
              SlideSwitchOption(
                label: 'Masculino',
                value: Gender.MALE,
              ),
              SlideSwitchOption(
                label: 'Não-Informar',
                value: Gender.OTHER,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
                labelText: 'Número Celular', controller: phoneNumber)),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
                labelText: 'Data de Nascimento', controller: dateOfBirth)),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomButtonWidget(
            buttonText: 'Salvar',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
