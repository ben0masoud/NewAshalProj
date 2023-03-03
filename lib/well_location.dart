import 'dart:async';

import 'package:ashal_ver_3/services/wellLatest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WellLocation extends StatefulWidget {
  WellLatest? item;

   WellLocation({Key? key,  this.item}) : super(key: key);



  @override
  State<WellLocation> createState() => _WellLocationState();
}

class _WellLocationState extends State<WellLocation> {
 // late final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
//  late GoogleMapController _controller;

  Set<Marker> _markers = {};
//  late Set<Marker> markers={};
 // late BitmapDescriptor customIcon;




/*  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(30.0747047, 47.7612693),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/


  @override

  void initState() {
    // TODO: implement initState
    //getIcon();

    super.initState();

  }
/*  @override
  void dispose(){

    super.dispose();
  }*/

/*
  Future<void> getIcon() async {
    markers = Set.from([]);
    await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(32, 32)), 'assets/icons/oil_location1.png')
        .then((icon) {
      customIcon = icon;
    });
  }*/
  GoogleMapController? mapController;

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    //createMarker(context);
    double la = double.parse(widget.item!.LATITUDE.toString());
    double lo = double.parse(widget.item!.LONGITUDE.toString());
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(la, lo),
      zoom: 14.4746,
    );

      _markers.add(
          Marker(
              markerId: MarkerId('Well'),
              position: _kGooglePlex.target,
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(
                  title: widget.item!.AREA,
                  snippet: widget.item!.UWI
              )
          )
      );

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18.r),topRight: Radius.circular(18.r)),
                  color:  Color(0xffaabbd5)
              ),
              height: 0.05.sh,
              width: 0.7.sw,
              child: Text(
                "Well Location",
                style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300,
              padding: EdgeInsets.all(8.r),
              color:  Color(0xffaabbd5),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(la, lo),
                  zoom: 9//14.4746
                ),
                onMapCreated: _onMapCreated,//(GoogleMapController controller) {
                 // if(!_controller.isCompleted) {
               //     _controller.complete(controller);
                  //}
                //},
                markers: _markers,
              ),
            )
          ],
        ),
      ),
    );
  }
}
