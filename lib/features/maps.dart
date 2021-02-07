import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlantsMap extends StatefulWidget {
//  final LatLng point;
 // final String status;

 // PlantsMap(this.point, this.status);

  @override
  _PlantsMapState createState() => _PlantsMapState();
}

class _PlantsMapState extends State<PlantsMap> {
  bool isLoading = true;
  GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: InkWell(child:
          Icon(Icons.arrow_back_ios, color: Colors.white70, size: 25,),
            onTap: () => Navigator.pop(context),
          ),
          title: Text("Fidan Haritası"),
        ),
        backgroundColor: Colors.white
        ,
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor:
            AlwaysStoppedAnimation<
                Color>(
                Colors.deepPurple),
          ),
        )

            : GoogleMap(

          mapType: MapType.normal,
          initialCameraPosition:
          CameraPosition(target:  LatLng(-38.956176, -67.920666), zoom: 20.0),
          //polyline,
          onMapCreated: onMapCreated,
          markers: _createMarkers(),
        )
    );
  }

  onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    print("Map Controller : $_mapController");

  }

  Set<Marker> _createMarkers() {
    var markers = Set<Marker>();

    markers.add(
      Marker(
          markerId: MarkerId("point"),
          position:  LatLng(-38.956176, -67.920666),
          infoWindow: InfoWindow(title: "plant"),
          icon:
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)),
    );
    return markers;
  }
}