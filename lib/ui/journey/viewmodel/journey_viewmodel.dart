import 'package:aranduapp/core/state/command.dart';
import 'package:aranduapp/ui/journey/model/journey_request.dart';
import 'package:aranduapp/ui/journey/model/journey_model.dart';
import 'package:aranduapp/ui/journey/service/journey_service.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class JourneyViewModel extends ChangeNotifier {
  late Command1<List<JourneyModel>, String> getJourneyCommand;

  JourneyViewModel() {
    getJourneyCommand = Command1(getJourney);
  }

  Future<Result<List<JourneyModel>>> getJourney(String subjectId) async {
    List<JourneyModel> res = await GetIt.instance<JourneyService>()
        .getJourneys(JourneyRequest(subjectId: subjectId));

    return Result.value(res);
  }
}
