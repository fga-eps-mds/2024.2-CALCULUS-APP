import 'package:aranduapp/core/state/command.dart';
import 'package:aranduapp/ui/register_account/view/register_account_view.dart';
import 'package:aranduapp/ui/shared/ErrorPopUp.dart';
import 'package:aranduapp/ui/shared/TextAndLink.dart';
import 'package:aranduapp/ui/shared/TextEmail.dart';
import 'package:aranduapp/ui/shared/TextPassword.dart';
import 'package:aranduapp/ui/shared/TitleSlogan.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

@GenerateNiceMocks([MockSpec<RegisterAccountViewModel>(), MockSpec<Command0>()])
import 'package:aranduapp/ui/register_account/viewModel/register_view_model.dart';

import 'register_account_view_test.mocks.dart';

void main() {
  late MockRegisterAccountViewModel mockViewModel;
  late MockCommand0 mockCommand0;

  setUp(() {
    mockViewModel = MockRegisterAccountViewModel();
    mockCommand0 = MockCommand0();

    when(mockCommand0.execute()).thenAnswer((_) async => Result.value(null));

    when(mockViewModel.registerCommand).thenReturn(mockCommand0);
    when(mockViewModel.formKey).thenReturn(GlobalKey<FormState>());
    when(mockViewModel.nameController).thenReturn(TextEditingController());
    when(mockViewModel.emailController).thenReturn(TextEditingController());
    when(mockViewModel.userNameController).thenReturn(TextEditingController());
    when(mockViewModel.passwordController).thenReturn(TextEditingController());
    when(mockViewModel.isTermsAccepted).thenReturn(false);
  });

  Widget createLoginScreen(MockRegisterAccountViewModel mockViewModel) {
    return ChangeNotifierProvider<RegisterAccountViewModel>.value(
      value: mockViewModel,
      builder: (context, child) {
        return const MaterialApp(
          home: RegisterAccountScreen(),
        );
      },
    );
  }

  testWidgets('Register Account screen displays fields and send button',
      (WidgetTester tester) async {
    when(mockViewModel.registerCommand).thenReturn(
        Command0<void>(() => Future.delayed(const Duration(seconds: 1))));

    await tester.pumpWidget(createLoginScreen(mockViewModel));
    await tester.pump();

    expect(find.byType(TitleSlogan), findsOneWidget);
    expect(find.byKey(const Key('nameField')), findsOneWidget);
    expect(find.byKey(const Key('userNameField')), findsOneWidget);
    expect(find.byType(TextEmail), findsOneWidget);
    expect(find.byType(TextPassWord), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);

    expect(find.text('Registrar'), findsOneWidget);
    expect(find.byType(TextAndLink), findsOneWidget);
  });

  testWidgets('Test sending the request', (WidgetTester tester) async {
    await tester.pumpWidget(createLoginScreen(mockViewModel));

    when(mockViewModel.registerCommand).thenReturn(mockCommand0);

    final sendButton = find.text('Registrar');

    await tester.tap(sendButton);
    await tester.pump();

    verify(mockCommand0.execute()).called(1);
  });

  testWidgets('Register Account Test User Input', (WidgetTester tester) async {
    when(mockViewModel.registerCommand).thenReturn(mockCommand0);

    await tester.pumpWidget(createLoginScreen(mockViewModel));

    const name = 'test';
    const email = 'test@example.com';
    const userName = 'test123';
    const password = 'password123';

    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('nameField')), name);
    await tester.enterText(find.byKey(const Key('userNameField')), userName);
    await tester.enterText(find.byType(TextEmail), email);
    await tester.enterText(find.byType(TextPassWord), password);
    await tester.pumpAndSettle();

    expect(mockViewModel.nameController.text, name);
    expect(mockViewModel.userNameController.text, userName);
    expect(mockViewModel.passwordController.text, password);
    expect(mockViewModel.emailController.text, email);
  });

  testWidgets('Register Account user notification snackbar',
      (WidgetTester tester) async {
    when(mockViewModel.registerCommand).thenReturn(mockCommand0);
    when(mockCommand0.isOk).thenReturn(true);

    await tester.pumpWidget(createLoginScreen(mockViewModel));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
  });

  testWidgets('Register Account user notification popup error',
      (WidgetTester tester) async {
    when(mockViewModel.registerCommand).thenReturn(mockCommand0);
    when(mockCommand0.isError).thenReturn(true);

    const error = 'error message.';

    when(mockCommand0.result).thenReturn(Result.error(error));

    await tester.pumpWidget(createLoginScreen(mockViewModel));
    await tester.pumpAndSettle();

    expect(find.byType(ErrorPopUp), findsOneWidget);
    expect(find.text(error), findsOneWidget);
  });

}
