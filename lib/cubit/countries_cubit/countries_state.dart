part of 'countries_cubit.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesInProgress extends CountriesState {}

class CountriesInSuccess extends CountriesState {

  CountriesInSuccess({required this.countries});

  final List<Countries> countries;
}

class CountriesInFailure extends CountriesState {}