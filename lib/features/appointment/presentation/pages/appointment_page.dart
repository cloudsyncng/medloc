import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:med_plus/features/appointment/presentation/bloc/bloc.dart';
import 'package:med_plus/features/appointment/presentation/utils/styles.dart';

import '../../../../injection_container.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(MdiIcons.more),
          )
        ],
      ),
      body: BlocProvider(
          builder: (context) => sl<MedlogBloc>(),
          child: BlocBuilder<MedlogBloc, MedlogState>(
            builder: (context, state) {
              if (state is Empty) {
                BlocProvider.of<MedlogBloc>(context)
                    .add(GetAppointmentsEvents());
                return Container();
              } else if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
                print(state.appointments);
                return ListView(
                  children: <Widget>[
                    buildExpandedTile(),
                    buildExpandedTile(),
                    buildExpandedTile(),
                    buildExpandedTile(),
                  ],
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
          )),
    );
  }

  Padding buildExpandedTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        child: ExpansionTile(
          onExpansionChanged: (isOpen) {},
          title: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "JUTH",
                  style: tileHeaderStyle,
                ),
                Text(
                  "2015-08-25",
                  style: tileHeaderStyle,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                )
              ],
            ),
          ),
          children: <Widget>[
            buildContentTile("Hospital:", "Jos University"),
            buildContentTile("Specialist:", "Dr Ajayi Bukola"),
            buildContentTile("Specialisation:", "Surgeon"),
            buildContentTile("Time:", "12:30 PM"),
          ],
        ),
      ),
    );
  }

  Padding buildContentTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, right: 50),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: tileContentLabelStyle,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            value,
            style: tileContentStyle,
          )
        ],
      )),
    );
  }
}
