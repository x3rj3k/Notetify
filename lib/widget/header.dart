import 'package:mobile_project/widget/view_item.dart';
import 'item.dart';

class Header implements Item {
  final String date;
  Header({this.date});

  @override
  ViewType getViewType() {
    return ViewType.HEADER;
  }
}
