import 'package:fodoq/common/models/product_model.dart';
import 'package:fodoq/interface/repository_interface.dart';

abstract class ProductRepositoryInterface implements RepositoryInterface {
  @override
  Future<List<Product>?> getList({int? offset, String? type});
}
