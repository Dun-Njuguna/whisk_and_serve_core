import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:whisk_and_serve_core/api/network_exception.dart';
import 'package:whisk_and_serve_core/coms/generic_message.dart';
import 'package:whisk_and_serve_core/coms/message_type.dart';

/// Handles displaying error or info messages in a snackbar with appropriate styling.
class SnackbarHandler {
  final BuildContext context;

  SnackbarHandler(this.context);

  // Maps DioExceptionType to ContentType for NetworkException handling
  static const Map<DioExceptionType, ContentType> _networkErrorTypeMap = {
    DioExceptionType.connectionTimeout: ContentType.warning,
    DioExceptionType.sendTimeout: ContentType.warning,
    DioExceptionType.receiveTimeout: ContentType.warning,
    DioExceptionType.badResponse: ContentType.failure,
  };

  // Maps MessageType to ContentType for generic messages
  static const Map<MessageType, ContentType> _genericMessageTypeMap = {
    MessageType.error: ContentType.failure,
    MessageType.info: ContentType.help,
    MessageType.warning: ContentType.warning,
  };

  /// Displays a snackbar based on the provided error type.
  void show(Object error) {
    if (error is NetworkException) {
      _showNetworkErrorSnackbar(error);
    } else if (error is GenericMessage) {
      _showGenericMessageSnackbar(error);
    } else {
      _showGenericMessageSnackbar(GenericMessage(
        type: MessageType.error,
        message: "An unexpected error occurred.",
      ));
    }
  }

  /// Shows a snackbar for `NetworkException` with its mapped type and message.
  void _showNetworkErrorSnackbar(NetworkException error) {
    final contentType = _networkErrorTypeMap[error.type] ?? ContentType.warning;
    _showSnackbar(error.message, contentType);
  }

  /// Shows a snackbar for `GenericMessage` with its mapped type and message.
  void _showGenericMessageSnackbar(GenericMessage message) {
    final contentType =
        _genericMessageTypeMap[message.type] ?? ContentType.failure;
    _showSnackbar(message.message, contentType);
  }

  /// Helper method to display a snackbar with the specified message and type.
  void _showSnackbar(String message, ContentType type) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: type == ContentType.failure
            ? "Error"
            : type == ContentType.warning
                ? "Warning"
                : "Info",
        message: message,
        contentType: type,
      ),
      duration: const Duration(seconds: 3),
    );
    print("called.......");
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
