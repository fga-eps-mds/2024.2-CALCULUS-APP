// Mocks generated by Mockito 5.4.4 from annotations
// in aranduapp/test/ui/content/viewmodel/content_viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:aranduapp/ui/content/model/content_request.dart' as _i5;
import 'package:aranduapp/ui/content/model/content_response.dart' as _i6;
import 'package:aranduapp/ui/content/service/content_service.dart' as _i3;
import 'package:async/async.dart' as _i2;
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

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ContentService].
///
/// See the documentation for Mockito's code generation for more information.
class MockContentService extends _i1.Mock implements _i3.ContentService {
  @override
  _i4.Future<_i2.Result<_i5.ContentRequest>> getContentsById(
          String? contentId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getContentsById,
          [contentId],
        ),
        returnValue: _i4.Future<_i2.Result<_i5.ContentRequest>>.value(
            _FakeResult_0<_i5.ContentRequest>(
          this,
          Invocation.method(
            #getContentsById,
            [contentId],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Result<_i5.ContentRequest>>.value(
                _FakeResult_0<_i5.ContentRequest>(
          this,
          Invocation.method(
            #getContentsById,
            [contentId],
          ),
        )),
      ) as _i4.Future<_i2.Result<_i5.ContentRequest>>);

  @override
  _i4.Future<List<_i6.ContentResponse>?> getContentsByTrail(String? trailID) =>
      (super.noSuchMethod(
        Invocation.method(
          #getContentsByTrail,
          [trailID],
        ),
        returnValue: _i4.Future<List<_i6.ContentResponse>?>.value(),
        returnValueForMissingStub:
            _i4.Future<List<_i6.ContentResponse>?>.value(),
      ) as _i4.Future<List<_i6.ContentResponse>?>);
}
