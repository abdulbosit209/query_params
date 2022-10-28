import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:query_params/cubit/countries_cubit/countries_cubit.dart';

class CountriesUI extends StatelessWidget {
  const CountriesUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<CountriesCubit>(context).onCountryFetchStarted();

    return Scaffold(
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if(state is CountriesInProgress){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is CountriesInFailure){
            return const Text("error");
          }
          if(state is CountriesInSuccess){
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemCount: state.countries.length,
                itemBuilder: (_, index){
                  return ListTile(
                    leading: Text(state.countries[index].code),
                    title: Text(state.countries[index].name),
                    subtitle: Text(state.countries[index].emoji),
                  );
                }
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
