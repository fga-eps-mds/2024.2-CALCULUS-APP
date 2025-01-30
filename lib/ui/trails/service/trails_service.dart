import 'package:aranduapp/core/network/auth_api.dart';
import 'package:aranduapp/ui/trails/model/trails_request.dart';

class TrailsService {
  Future<void> edit(TrailsRequest editProfileRequest) async {
    //await AuthApi.getInstance(auth: true)
    //.patch(path: '/users', data: editProfileRequest.toJson()); Não queremos isso!
  }
}
