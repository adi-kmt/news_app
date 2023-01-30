import '../news_favourites_feature/ui/screen/news_favourite_screen.dart';
import '../news_list_feature/ui/screen/news_list_screen.dart';
import '../news_source_feature/ui/screen/source_list_screen.dart';

class RoutesUtils {
  RoutesUtils._();

  static const navigationList = [
    NewsListScreen(),
    SourceListScreen(),
    NewsFavouriteScreen()
  ];
}
