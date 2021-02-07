import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../globals.dart';

class PlantsMap extends StatefulWidget {
  final int plantsQty;
  PlantsMap(this.plantsQty);

  @override
  _PlantsMapState createState() => _PlantsMapState();
}

class _PlantsMapState extends State<PlantsMap> {
  bool isLoading = true;
  GoogleMapController _mapController;
  LatLng capital = LatLng(39.9334, 32.8597);
  LatLng centerOfTurkey = LatLng(39.1702, 35.1430);
  LatLng oldCity = LatLng(39.1702, 35.1430);
  LatLng secondCity = LatLng(41.0082 , 28.9784);
  LatLng thirdCity = LatLng(36.8969 , 30.7133 );
  LatLng fourthCity = LatLng( 38.4237 , 27.1428 );
  List idList = ["point", "point2", "point3","point4", "point5", "point6"];
  List titleList = ["Ankara", "İstanbul", "Eskişehir","Yozgat", "Antalya", "İzmir",];


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
        backgroundColor: colorSecondaryShade
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
          CameraPosition(target:  centerOfTurkey, zoom: 4.7),
          //polyline,
          onMapCreated: onMapCreated,
          markers: _createMarkers(),
        )
    );
  }

  onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    print("Map Controller : $_mapController");
    await createMarkerImageFromAsset(context);
  }
  BitmapDescriptor plantIcon;
  Future<void> createMarkerImageFromAsset(BuildContext context) async {
    final ImageConfiguration imageConfiguration =
    createLocalImageConfiguration(context);
    var bitmap = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, 'assets/images/plant.png');

    setState(() {
      plantIcon = bitmap;

    });
  }

  Set<Marker> _createMarkers() {
    List<LatLng> positionList = [capital, secondCity, oldCity,centerOfTurkey,thirdCity,fourthCity];

    var markers = Set<Marker>();
    for(int i=0; i<widget.plantsQty; i++){
      markers.add(
        Marker(
            markerId: MarkerId(idList[i]),
            position:  positionList[i],
            infoWindow: InfoWindow(title: titleList[i]),
            zIndex: 2,
            icon: plantIcon),
      );
    }


    return markers;
  }
}