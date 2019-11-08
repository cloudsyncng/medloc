import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:med_plus/features/appointment/data/models/hospital_model.dart';
import 'package:med_plus/features/appointment/presentation/bloc/bloc.dart';
import 'package:med_plus/injection_container.dart';

class HospitalsPage extends StatelessWidget {
  const HospitalsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.blueAccent),
        ),
        body: BlocProvider(
          builder: (context) => sl<MedlogBloc>(),
          child: BlocBuilder<MedlogBloc, MedlogState>(
            builder: (context, state) {
              if (state is Empty) {
                BlocProvider.of<MedlogBloc>(context).add(GetHospitalsEvent());
                return Container();
              } else if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                return HospitalsList(
                  hospitals: state.hospitals,
                );
              } else if (state is Error) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(fontFamily: "Anton", fontSize: 20),
                  ),
                );
              }
            },
          ),
        ));
  }
}

class HospitalsList extends StatelessWidget {
  final List<HospitalModel> hospitals;
  const HospitalsList({
    Key key,
    this.hospitals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5),
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(MdiIcons.hospitalBoxOutline),
                        title: Text(hospitals[index].name),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text(hospitals[index].country),
                      ),
                      ListTile(
                        leading: Icon(Icons.local_activity),
                        title: Text(hospitals[index].state),
                      ),
                      ListTile(
                        leading: Icon(Icons.local_hotel),
                        title: Text(hospitals[index].lga),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
