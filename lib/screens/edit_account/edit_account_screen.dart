import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xlo_clone/stores/edit_account_store.dart';
import 'package:xlo_clone/stores/page_store.dart';

class EditAccountSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditAccountStore store = EditAccountStore();

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Observer(
                    builder: (_) {
                      return IgnorePointer(
                        ignoring: store.loading,
                        child: LayoutBuilder(
                          builder: (_, constraints) {
                            return ToggleSwitch(
                              minWidth: constraints.biggest.width / 2.01,
                              labels: [
                                'Particular',
                                'Profissional',
                              ],
                              cornerRadius: 20,
                              activeBgColor: Colors.purple,
                              inactiveBgColor: Colors.grey,
                              activeFgColor: Colors.white,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex: store.userType.index,
                              onToggle: store.setUserType,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: store.name,
                      enabled: !store.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nome *',
                        errorText: store.nameError,
                      ),
                      onChanged: store.setName,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: store.phone,
                      enabled: !store.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Telefone *',
                        errorText: store.phoneError,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: store.setPhone,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Nova Senha',
                        ),
                        obscureText: true,
                        onChanged: store.setPass1,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      enabled: !store.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Confirmar Nova Senha',
                        errorText: store.passError,
                      ),
                      obscureText: true,
                      onChanged: store.setPass2,
                    );
                  }),
                  const SizedBox(
                    height: 12,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.orange,
                        disabledColor: Colors.orange.withAlpha(100),
                        elevation: 0,
                        child: store.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text('Salvar'),
                        textColor: Colors.white,
                        onPressed: store.savePressed,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.red,
                      elevation: 0,
                      child: Text('Sair'),
                      textColor: Colors.white,
                      onPressed: () {
                        store.logout();
                        GetIt.I<PageStore>().setPage(0);
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
