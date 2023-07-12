part of 'adventure_cubit.dart';

 class AdventureState extends Equatable {
  final AdventureModel adventureModel;
  const AdventureState(this.adventureModel);

  @override
  List<Object> get props => [adventureModel];
}

class AdventureLoading extends AdventureLoaded  {
  AdventureLoading(super.adventureModel);

}
class AdventureLoaded extends AdventureState {
  final AdventureModel adventureModel;
  AdventureLoaded(this.adventureModel):super(adventureModel);

  @override
  List<Object> get props => [adventureModel];
}
class AdventureError extends AdventureState {
  final String message;
  AdventureError(AdventureModel adventureModel, this.message):super(adventureModel);

  @override
  List<Object> get props => [message];
}
