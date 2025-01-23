import 'package:aranduapp/core/log/log.dart';
import 'package:aranduapp/core/network/studio_maker_api.dart';
import 'package:aranduapp/ui/subjects/model/subject.dart';
import 'package:dio/dio.dart';

class SubjectService {
  Future<List<Subject>> getSubjects() async {
    Response response =
        await StudioMakerApi.getInstance().get(path: '/subjects');

    List<dynamic> subjectList = response.data as List<dynamic>;

    Log.i(subjectList);

    return subjectList.map((e) {
      final Map<String, dynamic> subjectMap = e as Map<String, dynamic>;

      return Subject(
          name: subjectMap['name']!,
          shortName: subjectMap['shortName']!,
          description: subjectMap['description']!);
    }).toList();
  }
}
