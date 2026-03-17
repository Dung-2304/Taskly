import 'package:taskly/Apinetwork/apiendpoint.dart';
import 'package:taskly/Apinetwork/dio_client.dart';
import 'package:taskly/model/areas_model.dart';
import 'package:taskly/request/areas/create_areas_request.dart';

class AreasRepository {
    DioClient _dioClient = DioClient();

  Future<void> createAreas(CreateAreasRequest req) async {
    try {
      final res = await _dioClient.post(
        ApiEndpoint.createAreas,
        data: req.toJson(),
      );
    }on FormatException catch (e)  {
      rethrow;
    }
    
  }

   Future<List<AreasModel>> fetchArea() async{
    try{
      final res = await _dioClient.get(ApiEndpoint.getallAreas);
      final areas = await res.data['data'];
      return (areas as List<Map<String, dynamic>>).map((e) => AreasModel.fromJson(e),).toList();

    }on FormatException catch (e){
      rethrow;
    }
    


  }

}
