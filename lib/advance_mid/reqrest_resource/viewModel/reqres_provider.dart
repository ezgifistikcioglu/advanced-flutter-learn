import 'package:flutter/cupertino.dart';

import '../model/resource_model.dart';
import '../service/reqrest_service.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqrestService reqrestService;
  List<Data> resources = [];

  ReqresProvider(this.reqrestService) {
    _fetch();
  }

  Future<void> _fetch() async {
    resources = (await reqrestService.fetchResourceItem())?.data ?? [];
  }
}
