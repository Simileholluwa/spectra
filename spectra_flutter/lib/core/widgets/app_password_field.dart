import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class AppPasswordField extends StatelessWidget {
  const AppPasswordField({
    required this.textController,
    required this.validator,
    this.prefixIcon = Iconsax.password_check,
    this.textInputType = TextInputType.visiblePassword,
    this.textInputAction = TextInputAction.done,
    this.iconSize = 24,
    this.hintText = 'Enter a strong password',
    this.onChanged,
    super.key,
  });

  final TextEditingController textController;
  final IconData prefixIcon;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final double iconSize;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return TextFormField(
        controller: textController,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            size: iconSize,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: IconButton(
              onPressed: () {
                if (ref.watch(showPasswordProvider)) {
                  ref.watch(showPasswordProvider.notifier).setValue(false);
                } else {
                  ref.watch(showPasswordProvider.notifier).setValue(true);
                }
              },
              icon: ref.watch(showPasswordProvider) == false
                  ? const Icon(
                      Icons.visibility,
                    )
                  : const Icon(
                      Icons.visibility_off,
                    ),
            ),
          ),
          
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
          errorMaxLines: 2,
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        obscureText: !ref.watch(showPasswordProvider),
        textInputAction: textInputAction,
        keyboardType: textInputType,
      );
    });
  }
}
