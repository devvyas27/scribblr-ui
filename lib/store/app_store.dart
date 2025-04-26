import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @action
  void setDarkMode() {
    isDarkModeOn = !isDarkModeOn;
  }
}
