import 'package:dart_frog/dart_frog.dart';
import '../../exension/ex_request.dart';
import '../_middleware.dart';

//通配符路由
//例如，如果你创建了一个名为routes/pages/[…action]的文件.Dart，
//那么它将可以在任何以/pages/开头的路径上访问，具有任意数量的级别，允许从/pages/action1， /pages/action2/等等调用。
Future<Response> onRequest(
  RequestContext context,
  String action,
) async {
  final json = await context.postParams;
  late String targetApi;
  switch (action) {
    case 'add':
      targetApi = 'arrival add - api';
    case 'query':
      targetApi = 'arrival query - api';
    default:
      return Response(statusCode: 404);
  }
  final response = <String, dynamic>{};
  response['target'] = targetApi;
  response['postParams'] = json;

  final dataSource = context.read<DataSource>();
  final queryData = await dataSource.mockFetchData();
  response['data'] = queryData;
  return Response.json(body: response);
}
