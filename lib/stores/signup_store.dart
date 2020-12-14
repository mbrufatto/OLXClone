import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/helpers/extensions.dart';
import 'package:xlo_clone/models/user.dart';
import 'package:xlo_clone/repositories/user_repository.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {

  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if(name == null || nameValid)
      return null;
    else if(name != null && name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if(email == null || emailValid)
      return null;
    else if(email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if(phone == null || phoneValid)
      return null;
    else if(phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Telefone inválido';
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 6;
  String get passwordError {
    if(password == null || passwordValid)
      return null;
    else if(password.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @observable
  String confirmPassword;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get confirmPasswordValid => confirmPassword != null && confirmPassword == password;
  String get confirmPasswordError {
    if(confirmPassword == null || confirmPasswordValid)
      return null;
    else
      return 'Senhas não coincidem';
  }

  @computed
  bool get isFormValid => nameValid && emailValid && phoneValid && passwordValid
      && confirmPasswordValid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: password
    );

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch(e) {
      error = e;
    }

    loading = false;
  }
}