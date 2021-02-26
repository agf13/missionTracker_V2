


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mission_tracker_v2/entities/Mission.dart';


class MissionDisplayWidget extends StatefulWidget {
  MissionDisplayWidget({this.mission});

  Mission mission;

  @override
  _MissionDisplayWidgetState createState() => _MissionDisplayWidgetState();
}

class _MissionDisplayWidgetState extends State<MissionDisplayWidget> {

  double _paddingValue = 10.0;
  double _underLabel_padding = 0.0;

  //some styling values
  final _details_labelStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[900]);
  final _additionalInformation_labelStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[900]);

  final _title_style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _importance_style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final _details_style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]);
  final _additionalInformation_style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: Colors.green[900]);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              "Mission Details"
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(this._paddingValue),
                child: Text(
                  widget.mission.getTitle(),
                  style: this._title_style,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(this._paddingValue),
                child: Text(
                  "Importance: " + widget.mission.getImportance(),
                  style: this._importance_style,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(this._paddingValue),
                child: Text(
                  "Details: ",
                  style: this._details_labelStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(this._underLabel_padding),
                child: Text(
                  widget.mission.getDetails(),
                  style: this._details_style,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(this._paddingValue * 2),
                child: Text(
                  "Additional Information: ",
                  style: this._additionalInformation_labelStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(this._underLabel_padding),
                child: Text(
                  widget.mission.getAdditionalInformation(),
                  style: this._additionalInformation_style,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
