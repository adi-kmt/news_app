import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_favourite_state.dart';

class NewsFavouriteCubit extends Cubit<NewsFavouriteState> {
  NewsFavouriteCubit() : super(NewsFavouriteInitial());
}
