  import 'package:healr/features/home/presentation/views/widgets/chat_bot_tab.dart';
import 'package:healr/features/home/presentation/views/widgets/home_tab.dart';
import 'package:healr/features/home/presentation/views/widgets/notification_tab.dart';
import 'package:healr/features/home/presentation/views/widgets/profile_tab.dart';
import 'package:healr/features/home/presentation/views/widgets/search_tab.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';


List<PersistentTabConfig> tabs() => [
        homeTab(),
        searchTab(),
        chatBotTab(),
        notificationTab(),
        profileTab(),
      ];