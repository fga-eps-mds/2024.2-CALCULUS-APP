import 'package:aranduapp/core/log/log.dart';
import 'package:aranduapp/core/network/auth_api.dart'; // Certifique-se de que esta importação está correta
import 'package:aranduapp/core/network/studio_maker_api.dart';
import 'package:aranduapp/ui/trails/model/trails_request.dart'; // Importação do modelo de request
import 'package:aranduapp/ui/trails/model/trails_response.dart';
import 'package:dio/dio.dart'; // Importação do Dio para usar a classe Response

class TrailsService {
  // Método para editar uma trilha
  Future<TrailResponse?> edit(
      String trailId, TrailsRequest trailRequest) async {
    try {
      String path = '/trails/$trailId'; // Endpoint da API com o ID da trilha

      // Faz a requisição PUT (ou PATCH) para editar a trilha
      Response response = await StudioMakerApi.getInstance().put(
        path: path,
        data:
            trailRequest.toJson(), // Converte o objeto TrailsRequest para JSON
      );

      // Verifica se a requisição foi bem-sucedida
      if (response.statusCode == 200 && response.data != null) {
        return TrailResponse.fromJson(
            response.data); // Mapeia a resposta para TrailResponse
      } else {
        Log.e('Erro ao editar trilha: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      Log.e('Erro na requisição: $e');
      return null;
    }
  }
}
