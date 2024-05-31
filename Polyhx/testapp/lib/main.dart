import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:testapp/search_location.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 94, 117, 95), secondary: Colors.green, primary: Color.fromARGB(255, 104, 187, 104), surface: Color.fromARGB(255, 222, 238, 210), onSurface: Color.fromARGB(255, 244, 244, 244), background: Color.fromARGB(255, 255, 255, 255), onBackground: Colors.green, error: Colors.green, onError: Colors.green,),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
          
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(45.5019, -73.5674),
    zoom: 10,

  );
  int selectedIndex = 1;
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController _googleMapController;
  TextEditingController _searchController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text("C  O  C  O  C  A  R"),
        centerTitle: true,
        actions: [
          IconButton(
            
            icon: Image.asset("assets/images/logo.png", width: 44, height: 44,),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
        ),
      drawer: AppDrawer(),







      body:Column(
        children: 
        [
          const Row(children: [
            Expanded(child: 
              Text("-eco-Friendly-", textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 109, 148, 110), fontSize: 14,),),
            ),],
          ),
            Expanded (  
              child: GoogleMap(
              mapType:MapType.normal,
              initialCameraPosition: _initialCameraPosition,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false, 
              onMapCreated: (GoogleMapController controller) => _googleMapController = controller,
              )
            ),
       ],),



      floatingActionButton: FloatingActionButton(
        onPressed: () =>_googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          ),
        child: const Icon(Icons.center_focus_strong),
      ),






      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.car_detailed),
          label: 'CocoTime',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Profile',
        ),
      ],),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
/*
  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, lng), zoom: 12), ), );
  }*/
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        
        children: [
          const DrawerHeader(

            decoration: BoxDecoration(
              color: Color.fromARGB(255, 137, 201, 140),
            ),
            child: Text('Menu',textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 218, 247, 200), fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, height: 4),),
      
          ),
        
          ListTile(
            title: const Text('\n\n\n> Profile <',textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 52, 87, 58), fontSize: 23, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('\n> History <',textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 52, 87, 58), fontSize: 23, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),),
            onTap: () {
              Navigator.pop(context);
            },

          ),
          ListTile(
            title: const Text('\n> Settings <',textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 52, 87, 58), fontSize: 23, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('\n> Log Out <',textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 223, 81, 81), fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

  
