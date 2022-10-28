import 'package:graphql/client.dart';
import 'package:query_params/models/country_data/county_data_model.dart';
import 'package:query_params/queries/get_country_data.dart';

class GetCountryDataRequestFailure implements Exception {}

class CountryDataApiClient {

  const CountryDataApiClient({required GraphQLClient graphQLClient}) : _graphQLClient = graphQLClient;

  final GraphQLClient _graphQLClient;

  factory CountryDataApiClient.create(){
    final httpLink = HttpLink('https://countries.trevorblades.com/graphql');
    final link = Link.from([httpLink]);
    return CountryDataApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  Future<CountryDataModel> getCountiesData({required String code}) async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(getCountryData),
        variables:<String, dynamic> {'code': code},
      ),
    );
    if (result.hasException) {
      throw Exception();
    }
    print("CountyYYYY DATA aaaa ${result.data?["country"] as Map<String, dynamic>}");
    return CountryDataModel.fromJson(result.data?["country"] as Map<String, dynamic>);
  }

}