import 'package:graphql/client.dart';
import 'package:query_params/models/county_model/country_model.dart';
import 'package:query_params/queries/get_country.dart';

class GetCountryRequestFailure implements Exception {}

class CountryApiClient {

  const CountryApiClient({required GraphQLClient graphQLClient}) : _graphQLClient = graphQLClient;

  final GraphQLClient _graphQLClient;

  factory CountryApiClient.create(){
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return CountryApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  Future<List<Countries>> getCounties() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(getCountriesQuery)),
    );
    if(result.hasException) throw GetCountryRequestFailure();
    final data = result.data?["countries"] as List;
    return data.map((dynamic e) => Countries.fromJson(e as Map<String, dynamic>)).toList();
    }
}