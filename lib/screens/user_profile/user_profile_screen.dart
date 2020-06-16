import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/user_profile/user_profile_header_widget.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/confirmation_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/gender_switch_widget.dart';

class UserProfile extends StatelessWidget {
  final Gender gender = Gender.FEMALE;

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
          child: GenderSwitchWidget(),
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
          child: ConfirmationButton(
            buttonText: 'Salvar',
            onPressed: () {
              print('Save Profile');
            },
          ),
        )
      ],
    );
  }
}
