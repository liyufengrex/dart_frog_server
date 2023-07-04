import 'package:dart_frog/dart_frog.dart';

extension ExRequest on RequestContext {
  Future<Map<String, dynamic>> get postParams async {
    late Map<String, dynamic> bodyParams;
    // 接收 post 传参
    try {
      bodyParams =
          await request.json().then((value) => value as Map<String, dynamic>);
    } catch (e) {
      bodyParams = {};
    }
    return bodyParams;
  }
}
