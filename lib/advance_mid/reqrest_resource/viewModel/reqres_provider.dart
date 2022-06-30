import 'package:flutter/cupertino.dart';
import 'package:flutter_full/product/global/resource_context.dart';

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

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
