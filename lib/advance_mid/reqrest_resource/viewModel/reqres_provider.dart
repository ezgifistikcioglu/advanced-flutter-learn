import 'package:flutter/cupertino.dart';

import '../model/resource_model.dart';
import '../service/reqrest_service.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqrestService reqrestService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresProvider(this.reqrestService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqrestService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }
}
