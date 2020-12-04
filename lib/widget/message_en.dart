import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "loadData": MessageLookupByLibrary.simpleMessage("Loading Data"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading"),
        "title": MessageLookupByLibrary.simpleMessage("To-Do List")
      };
}
