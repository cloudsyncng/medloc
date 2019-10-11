import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Hospital extends Equatable {
  final int hospitalId;
  final String name;
  final String state;
  final String country;
  final String lga;
  final List<dynamic> geoPoint;

  Hospital(
      {this.hospitalId,
      @required this.name,
      @required this.state,
      @required this.country,
      @required this.lga,
      @required this.geoPoint})
      : super([hospitalId, name, state, country, lga, geoPoint]);
}
