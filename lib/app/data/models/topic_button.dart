import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/routes/app_routes.dart';

class TopicButton {
  CardTopic icon;
  String label;
  String screen = AppRoutes.topicDetail;
  TopicButton({required this.icon, required this.label});
}
