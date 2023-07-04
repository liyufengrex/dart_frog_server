import 'package:dart_frog/dart_frog.dart';

final _dataSource = DataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<DataSource>((_) => _dataSource));
}

class DataSource {
  //模拟获取异步数据
  Future<String> mockFetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'mockFutureData is 李小轰';
  }
}
