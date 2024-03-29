import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/models/user.dart';
import 'package:xlo_clone/repositories/user_repository.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

part 'edit_account_store.g.dart';

class EditAccountStore = _EditAccountStore with _$EditAccountStore;

abstract class _EditAccountStore with Store {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  _EditAccountStore() {
    user = userManagerStore.user;

    userType = user.type;
    name = user.name;
    phone = user.phone;
  }

  User user;

  @observable
  UserType userType;

  @action
  void setUserType(int value) => userType = UserType.values[value];

  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length >= 6;
  String get nameError =>
      nameValid || name == null ? null : 'Campo Obrigatório';

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError =>
      phoneValid || phone == null ? null : 'Campo Obrigatório';

  @observable
  String pass1 = '';

  @action
  void setPass1(String value) => pass1 = value;

  @observable
  String pass2 = '';

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get passValid => pass1 == pass2 && (pass1.length >= 6 || pass1.isEmpty);
  String get passError {
    if (pass1.isNotEmpty && pass1.length < 6)
      return 'Senha muito curta';
    else if (pass1 != pass2)
      return 'Senhas não coincidem';
    else
      return null;
  }

  @computed
  bool get isFormValid => nameValid && phoneValid && passValid;

  @observable
  bool loading = false;

  @computed
  VoidCallback get savePressed => (isFormValid && !loading) ? _save : null;

  @action
  Future<void> _save() async {
    loading = true;

    user.name = name;
    user.phone = phone;
    userType = userType;
    if (pass1.isNotEmpty)
      user.password = pass1;
    else
      user.password = null;

    try {
      await UserRepository().save(user);
      userManagerStore.setUser(user);
    } catch (e) {
      print(e);
    }
    loading = false;
  }

  void logout() => userManagerStore.logout();
}
