part of 'country_data_cubit.dart';

@immutable
abstract class CountryDataState {}

class CountryDataInitial extends CountryDataState {}


class CountryDataProgress extends CountryDataState {}

class CountryDataSuccess extends CountryDataState {

  CountryDataSuccess({required this.countryDataModel});

  final CountryDataModel countryDataModel;
}

class CountryDataFailure extends CountryDataState{
  CountryDataFailure({required this.errorText});
  final String errorText;
}
