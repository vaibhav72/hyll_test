import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hyll_test/respository/adventure_repository.dart';

import '../../models/adventure_model.dart';

part 'adventure_state.dart';

class AdventureCubit extends Cubit<AdventureState> {
  AdventureRepository _adventureRepository;
  AdventureCubit(
    this._adventureRepository,
  ) : super(AdventureLoading(AdventureModel(data: [])));
  int limit = 10;
  int offset = 10;
  bool isFirstFetch = true;
  fetchAdventures() async {
    try {
      emit(AdventureLoading(state is AdventureLoaded
          ? (state as AdventureLoaded).adventureModel
          : AdventureModel(data: [])));
      AdventureModel adventureModel = await _adventureRepository
          .getAdventures(limit, offset, isFirstFetch: isFirstFetch);
      isFirstFetch = false;
      emit(AdventureLoaded(adventureModel));
      offset = offset + 10;
    } catch (e) {
      emit(AdventureError(state.adventureModel, e.toString()));
    }
  }

  refreshData() async {
    try {
      emit(AdventureLoading(state is AdventureLoaded
          ? (state as AdventureLoaded).adventureModel
          : AdventureModel(data: [])));
      AdventureModel adventureModel =
          await _adventureRepository.getAdventures(10, 10);
      emit(AdventureLoaded(adventureModel));
    } catch (e) {
      emit(AdventureError(state.adventureModel, e.toString()));
    }
  }

  removeTopItem() {
    AdventureModel adventureModel = state.adventureModel;
    adventureModel.data!.removeLast();
    if (adventureModel.data!.length == 5) {
      fetchAdventures();
    }
    emit(AdventureLoaded(adventureModel));
  }
}
