import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:query_params/api/country_api.dart';
import 'package:query_params/api/country_data.dart';
import 'package:query_params/cubit/countries_cubit/countries_cubit.dart';
import 'package:query_params/cubit/country_data_cubit/country_data_cubit.dart';
import 'package:query_params/ui/tabs/tab_box.dart';

List<String> codes = ["RU", "UZ", "KZ", "TJ", "AF", "DE", "GB"];

void main() {
  runApp( MyApp(countryApiClient: CountryApiClient.create(), countryDataApiClient: CountryDataApiClient.create(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.countryApiClient, required this.countryDataApiClient});

  final CountryApiClient countryApiClient;
  final CountryDataApiClient countryDataApiClient;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountriesCubit(
            countryApiClient: countryApiClient,
          ),
        ),
        BlocProvider(
          create: (context) => CountryDataCubit(
              countryDataApiClient: countryDataApiClient
          ),
        )
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBox()
    );
  }
}

