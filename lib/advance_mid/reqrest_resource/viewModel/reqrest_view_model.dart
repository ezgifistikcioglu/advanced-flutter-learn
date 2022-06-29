import 'package:flutter_full/advance_mid/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full/advance_mid/reqrest_resource/service/reqrest_service.dart';
import 'package:flutter_full/advance_mid/reqrest_resource/view/reqrest_view.dart';
import 'package:flutter_full/mid/cache/shared_learn_cache.dart';
import 'package:flutter_full/product/service/project_dio.dart';

abstract class ReqrestViewModel extends LoadingStatefull<ReqrestView>
    with ProjectDioMixin {
  late final IReqrestService reqrestService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqrestService = ReqrestService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading(); //LoadingStatefull baseView ile kolayca çektik
    resources = (await reqrestService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
