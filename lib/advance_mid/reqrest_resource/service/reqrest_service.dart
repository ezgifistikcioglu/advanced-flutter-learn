import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_full/advance_mid/reqrest_resource/model/resource_model.dart';

abstract class IReqrestService {
  IReqrestService(this.dio);
  final Dio dio;

  Future<List<ResourceModel>?> fetchResourceItem();
}

enum _ReqrestPaths { resource }

class ReqrestService extends IReqrestService {
  ReqrestService(Dio dio) : super(dio);

  @override
  Future<List<ResourceModel>?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqrestPaths.resource.name}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((json) => ResourceModel.fromJson(json)).toList();
      }
    }
    return null;
  }
}
