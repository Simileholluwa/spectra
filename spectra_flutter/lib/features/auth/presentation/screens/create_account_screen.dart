import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + TSizes.defaultSpace,
            top: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const AuthHeader(
                authTitle: "Create an account",
                authSubTitle:
                    'Welcome to a world of unlimited AI arts',
              ),
              CreateAccountForm(),
            ],
          ),
        ),
      ),
    );
  }
}
