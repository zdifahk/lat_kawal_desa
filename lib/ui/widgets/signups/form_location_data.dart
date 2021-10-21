import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kawal_desa2/constants/const.dart';
import 'package:kawal_desa2/ui/shared/ui_helper.dart';
import 'package:kawal_desa2/viewmodels/sign_up_view_model.dart';
import 'package:latlong/latlong.dart';
import 'package:loading_overlay/loading_overlay.dart';

class FormLocationData extends StatelessWidget {
  SignUpViewModel model;
  FormLocationData({this.model});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LoadingOverlay(
        isLoading: model.busy,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: size.width,
                        height: size.height*0.8,
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(
                            model.lat, model.long
                          ),
                          zoom: 13.0,
                          onTap: model.handleTap
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a','b','c']
                          ),
                          MarkerLayerOptions(
                            markers: model.myPoint
                          )
                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                    TextField(
                      maxLines: 5,
                      controller: model.addressController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color_main
                        )
                        ),
                        border: OutlineInputBorder(),
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
