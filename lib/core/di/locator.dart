import 'package:aranduapp/ui/edit_password/di/di_edit_password.dart';
import 'package:aranduapp/ui/edit_profile/di/di_edit_profile.dart';
import 'package:aranduapp/ui/login/di/di_login.dart';
import 'package:aranduapp/ui/navbar/di/di_navbar.dart';
import 'package:aranduapp/ui/onboarding/di/di_onboarding.dart';
import 'package:aranduapp/ui/recover_account/di/di_recover_account.dart';
import 'package:aranduapp/ui/register_account/di/di_register_account.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  setupLoginDI();
  setupRegisterDI();
  setupEditProfileDI();
  setupRecoverAccountDI();
  setupEditPasswordDI();
  setupNavBarDI();
  setupOnboardingDI();
  setupLoginDI();
}
