import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/user_profile/user_profile_header_widget.dart';
import 'package:kwik_client_flutter/widgets/confirmation_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/gender_switch_widget.dart';

enum Gender { male, female, other }

class UserProfile extends StatelessWidget {
  Gender gender = Gender.female;

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
        // Padding(
        //   padding: const EdgeInsets.only(left: 16),
        //   child: Text('Sexo',
        //       style: TextStyle(
        //           fontFamily: 'Lato',
        //           fontWeight: FontWeight.bold,
        //           color: Theme.of(context).primaryColor)),
        // ),
        // RadioListTile<Gender>(
        //     title: const Text('Feminino', style: TextStyle(fontFamily: 'Lato')),
        //     value: Gender.female,
        //     groupValue: gender,
        //     onChanged: null),
        // RadioListTile<Gender>(
        //     title:
        //         const Text('Masculino', style: TextStyle(fontFamily: 'Lato')),
        //     value: Gender.male,
        //     groupValue: gender,
        //     onChanged: null),
        // RadioListTile<Gender>(
        //     title:
        //         const Text('Não-Binário', style: TextStyle(fontFamily: 'Lato')),
        //     value: Gender.other,
        //     groupValue: gender,
        //     onChanged: null),
        //
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
