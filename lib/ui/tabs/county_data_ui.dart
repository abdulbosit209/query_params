import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:query_params/cubit/country_data_cubit/country_data_cubit.dart';
import 'package:query_params/main.dart';

class CountryDataUI extends StatefulWidget {
  const CountryDataUI({Key? key}) : super(key: key);

  @override
  State<CountryDataUI> createState() => _CountryDataUIState();
}

class _CountryDataUIState extends State<CountryDataUI> {


  String dropDownButtonValue = codes.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "CountryData",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: [
          DropdownButton<String>(
            icon: const Icon(Icons.arrow_downward_sharp),
            value: dropDownButtonValue,
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            onChanged: (String? value) {
              setState(() {
                dropDownButtonValue = value!;
                print(dropDownButtonValue);
              });
            },
            items: codes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
      body: BlocBuilder<CountryDataCubit, CountryDataState>(
        builder: (context, state) {
          if(state is CountryDataProgress){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is CountryDataFailure){
            return const Center(child: Text("error"));
          }
          if(state is CountryDataSuccess){
            return Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow:  [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 4,
                    offset: const Offset(1,3),
                    color: Colors.grey.withOpacity(0.3)
                  )
                ]
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(state.countryDataModel.native),
                    title: Text(state.countryDataModel.capital),
                    trailing: Text(state.countryDataModel.currency),
                  ),
                  ListTile(
                    title:  Text(state.countryDataModel.languages[0].name),
                    trailing: Text(state.countryDataModel.emoji),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(dropDownButtonValue);
          BlocProvider.of<CountryDataCubit>(context).onCountyFetchData(code: dropDownButtonValue);
        },
        child: const Text("search"),
      ),
    );
  }
}
