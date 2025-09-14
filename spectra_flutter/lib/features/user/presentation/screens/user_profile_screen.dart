import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
