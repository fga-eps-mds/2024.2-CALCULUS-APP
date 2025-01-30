import 'package:aranduapp/core/network/token_manager/model/user_model.dart';
import 'package:aranduapp/core/network/token_manager/repository/auth_repository.dart';
import 'package:aranduapp/core/state/command.dart';
//import 'package:aranduapp/ui/trails/model/trails_request.dart';
//import 'package:aranduapp/ui/trails/service/trails_service.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TrailsViewmodel extends ChangeNotifier {
  late Command1<void, TrailsViewmodel> editCommand;
  late Command0<UserModel> getUserCommand;
}
