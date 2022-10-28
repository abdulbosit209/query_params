import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:query_params/api/country_data.dart';
import 'package:query_params/models/country_data/county_data_model.dart';

part 'country_data_state.dart';

class CountryDataCubit extends Cubit<CountryDataState> {
  CountryDataCubit({required CountryDataApiClient countryDataApiClient})
      : _countryDataApiClient = countryDataApiClient,
        super(CountryDataInitial());

  final CountryDataApiClient _countryDataApiClient;


  Future<void> onCountyFetchData({required String code}) async {
    emit(CountryDataProgress());
    try{
      var countryData = await _countryDataApiClient.getCountiesData(code: code);
      print( "CountyYYY DaTTTTTAAAAAA $countryData");
      emit(CountryDataSuccess(countryDataModel: countryData));
    }catch(e){
      emit(CountryDataFailure(errorText: e.toString()));
      print("ERRRRROOOOORRRRR ${e.toString()}");
    }
  }
}
