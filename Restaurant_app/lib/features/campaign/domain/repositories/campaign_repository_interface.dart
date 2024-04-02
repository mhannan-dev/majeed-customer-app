import 'package:fodoq_restaurant/interface/repository_interface.dart';

abstract class CampaignRepositoryInterface implements RepositoryInterface {
  Future<dynamic> joinCampaign(int? campaignID);
  Future<dynamic> leaveCampaign(int? campaignID);
}
