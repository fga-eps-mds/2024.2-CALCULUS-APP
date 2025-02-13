// Mocks generated by Mockito 5.4.4 from annotations
// in aranduapp/test/ui/join_subjects/join_subjects_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:aranduapp/core/state/command.dart' as _i2;
import 'package:aranduapp/ui/join_subjects/viewmodel/join_subjects_viewmodel.dart'
    as _i4;
import 'package:async/async.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCommand1_0<T, A> extends _i1.SmartFake
    implements _i2.Command1<T, A> {
  _FakeCommand1_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResult_1<T> extends _i1.SmartFake implements _i3.Result<T> {
  _FakeResult_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [JoinSubjectsViewmodel].
///
/// See the documentation for Mockito's code generation for more information.
class MockJoinSubjectsViewmodel extends _i1.Mock
    implements _i4.JoinSubjectsViewmodel {
  @override
  _i2.Command1<void, String> get joinsubjectsCommand => (super.noSuchMethod(
        Invocation.getter(#joinsubjectsCommand),
        returnValue: _FakeCommand1_0<void, String>(
          this,
          Invocation.getter(#joinsubjectsCommand),
        ),
        returnValueForMissingStub: _FakeCommand1_0<void, String>(
          this,
          Invocation.getter(#joinsubjectsCommand),
        ),
      ) as _i2.Command1<void, String>);

  @override
  set joinsubjectsCommand(_i2.Command1<void, String>? _joinsubjectsCommand) =>
      super.noSuchMethod(
        Invocation.setter(
          #joinsubjectsCommand,
          _joinsubjectsCommand,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.Future<_i3.Result<void>> joinsubjects(String? subjectId) =>
      (super.noSuchMethod(
        Invocation.method(
          #joinsubjects,
          [subjectId],
        ),
        returnValue: _i5.Future<_i3.Result<void>>.value(_FakeResult_1<void>(
          this,
          Invocation.method(
            #joinsubjects,
            [subjectId],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Result<void>>.value(_FakeResult_1<void>(
          this,
          Invocation.method(
            #joinsubjects,
            [subjectId],
          ),
        )),
      ) as _i5.Future<_i3.Result<void>>);

  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Command1].
///
/// See the documentation for Mockito's code generation for more information.
class MockCommand1<T, A> extends _i1.Mock implements _i2.Command1<T, A> {
  @override
  _i5.Future<_i3.Result<T>> Function(A) get action => (super.noSuchMethod(
        Invocation.getter(#action),
        returnValue: (A __p0) =>
            _i5.Future<_i3.Result<T>>.value(_FakeResult_1<T>(
          this,
          Invocation.getter(#action),
        )),
        returnValueForMissingStub: (A __p0) =>
            _i5.Future<_i3.Result<T>>.value(_FakeResult_1<T>(
          this,
          Invocation.getter(#action),
        )),
      ) as _i5.Future<_i3.Result<T>> Function(A));

  @override
  bool get isError => (super.noSuchMethod(
        Invocation.getter(#isError),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isOk => (super.noSuchMethod(
        Invocation.getter(#isOk),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get running => (super.noSuchMethod(
        Invocation.getter(#running),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.Future<_i3.Result<T>> execute(A? arg1) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [arg1],
        ),
        returnValue: _i5.Future<_i3.Result<T>>.value(_FakeResult_1<T>(
          this,
          Invocation.method(
            #execute,
            [arg1],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Result<T>>.value(_FakeResult_1<T>(
          this,
          Invocation.method(
            #execute,
            [arg1],
          ),
        )),
      ) as _i5.Future<_i3.Result<T>>);

  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
