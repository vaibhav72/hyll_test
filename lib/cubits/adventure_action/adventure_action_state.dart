part of 'adventure_action_cubit.dart';

class AdventureActionState extends Equatable {
final  int index;
  const AdventureActionState(this.index);

  @override
  List<Object> get props => [index];
}

class AdventureActionLoaded extends AdventureActionState {
  AdventureActionLoaded(super.index);
}
