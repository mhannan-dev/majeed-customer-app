import 'package:fodoq/features/home/domain/models/banner_model.dart';
import 'package:fodoq/features/home/domain/repositories/home_repository_interface.dart';
import 'package:fodoq/features/home/domain/services/home_service_interface.dart';

class HomeService implements HomeServiceInterface {
  final HomeRepositoryInterface homeRepositoryInterface;
  HomeService({required this.homeRepositoryInterface});

  @override
  Future<BannerModel?> getBannerList() async {
    return await homeRepositoryInterface.getList();
  }
}