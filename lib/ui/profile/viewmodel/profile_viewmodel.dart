import 'package:aranduapp/core/log/log.dart';
import 'package:aranduapp/core/network/token_manager/model/user_model.dart';
import 'package:aranduapp/core/network/token_manager/repository/auth_repository.dart';
import 'package:aranduapp/core/state/command.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:aranduapp/core/data/local/storage_value.dart';
import 'package:get_it/get_it.dart';

class ProfileViewModel extends ChangeNotifier {
  late Command0<void> logoutCommand;
  late Command0<void> getUserCommand;

  UserModel? user;

  ProfileViewModel() {
    logoutCommand = Command0<void>(logout);
    getUserCommand = Command0<void>(getUser);

    if (user == null) getUserCommand.execute();
  }

  Future<Result<void>> logout() async {
    await StorageValue.getInstance().clear();
    await GetIt.I.reset();

    Log.d("Usuário deslogado com sucesso.");
    return Result.value(null);
  }

  Future<Result<UserModel>> getUser() async {
    UserModel user = await GetIt.instance<AuthRepository>().getUser();
    _setUser(user);
    return Result.value(user);
  }

  void _setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }
}
