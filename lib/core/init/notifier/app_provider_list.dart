import 'package:math_app/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instace;
  static ApplicationProvider? get instance {
    if (_instace == null) _instace = ApplicationProvider._init();
    return _instace;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier(), lazy: true),
  ];
}
