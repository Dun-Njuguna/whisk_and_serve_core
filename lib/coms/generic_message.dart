
import 'package:whisk_and_serve_core/coms/message_type.dart';

class GenericMessage {
  final MessageType type;
  final String message;

  GenericMessage({required this.type, required this.message});
}