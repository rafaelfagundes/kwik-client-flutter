import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/user_profile/user_profile_header_widget.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/slide_switch_widget.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Gender gender = Gender.FEMALE;

  void _setGender(value) {
    setState(() {
      gender = value;
    });
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
            child: CustomTextField(labelText: 'Nome')),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(labelText: 'Sobrenome')),
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
                label: 'Não-Binário',
                value: Gender.OTHER,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(labelText: 'Número Celular')),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(labelText: 'Data de Nascimento')),
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
