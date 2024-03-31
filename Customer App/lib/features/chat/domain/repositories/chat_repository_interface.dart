import 'package:fodoq/api/api_client.dart';
import 'package:fodoq/features/chat/domain/models/conversation_model.dart';
import 'package:fodoq/features/chat/domain/models/message_model.dart';
import 'package:fodoq/features/chat/enums/user_type_enum.dart';
import 'package:fodoq/interface/repository_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';

abstract class ChatRepositoryInterface extends RepositoryInterface {
  Future<ConversationsModel?> getConversationList(int offset, String type);
  Future<ConversationsModel> searchConversationList(String name);
  @override
  Future<Response> get(String? id,
      {int? offset, UserType? userType, int? conversationID});
  Future<MessageModel?> sendMessage(String message, List<MultipartBody> images,
      int? userID, UserType userType, int? conversationID);
}
