import 'package:eyepax_assignment/models/artical_model.dart';
import 'package:eyepax_assignment/services/rest_api_service.dart';
import 'package:eyepax_assignment/configs/url.dart';

Future<Result> fetchNewsData() async {
  Result result = Result();
  await fetchProcessedData(APIConstants.MAIN_URL, success: (data) async {
    result = resultFromJson(data);
    return result;
  }, failed: (code, title, message) {
    print('======== ERROR =======');
    return 'error';
  }, completed: (null));
  return result;
}
