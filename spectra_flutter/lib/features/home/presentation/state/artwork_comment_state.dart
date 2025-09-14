// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ArtworkCommentState {
  final bool isLoading;
  final String? errorMessage;
  final TextEditingController textController;
  final String text;

  ArtworkCommentState({
    this.isLoading = false,
    this.errorMessage,
    required this.textController,
    this.text = '',
  });

  ArtworkCommentState copyWith({
    bool? isLoading,
    String? errorMessage,
    TextEditingController? textController,
    String? text,
  }) {
    return ArtworkCommentState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      textController: textController ?? this.textController,
      text: text ?? this.text,
    );
  }

  factory ArtworkCommentState.initial() {
    return ArtworkCommentState(
      textController: TextEditingController(),
    );
  }
}
