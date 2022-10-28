import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:query_params/api/country_api.dart';
import 'package:query_params/models/county_model/country_model.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit({required CountryApiClient countryApiClient})
      : _countryApiClient = countryApiClient,
        super(CountriesInitial());

  final CountryApiClient _countryApiClient;

  Future<void> onCountryFetchStarted() async {
    emit(CountriesInProgress());
    try{
      final counties = await _countryApiClient.getCounties();
      emit(CountriesInSuccess(countries: counties));
    }catch(_){
      emit(CountriesInFailure());
    }
  }
}
