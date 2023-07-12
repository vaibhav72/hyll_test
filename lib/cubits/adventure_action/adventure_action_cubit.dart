import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hyll_test/cubits/cubits.dart' show AdventureCubit;

part 'adventure_action_state.dart';

class AdventureActionCubit extends Cubit<AdventureActionState> {
  AdventureCubit _adventureCubit;
  AdventureActionCubit(this._adventureCubit) : super(AdventureActionLoaded(0));

  void changeIndex(int index) {
    emit(AdventureActionLoaded(index+1));
  }

void positiveAction() {
  changeIndex(state.index);
  _adventureCubit.removeTopItem();
   //TODO: implement positiveAction
  }

void negativeAction() {
  changeIndex(state.index);
  _adventureCubit.removeTopItem();
  //TODO: implement negativeAction
  }
}

