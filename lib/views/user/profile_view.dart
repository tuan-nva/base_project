import 'package:base_project/models/user/profile_model.dart';
import 'package:base_project/views/user/layouts/profile_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  final ProfileModel profile;
  ProfileView(this.profile);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileModel>(
          create: (_) => ProfileModel.instance(input: profile),
        ),
      ],
      child: Consumer<ProfileModel>(
        builder: (context, viewModel, child) {
          return ProfileLayout();
        },
      ),
    );
  }
}
