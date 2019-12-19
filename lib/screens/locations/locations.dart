import 'package:flutter/material.dart';
import 'package:flutter_examples/widgets/image_banner.dart';
import '../../app.dart';
import '../../models/location.dart';
import 'tile_overlay.dart';
import 'package:flutter_examples/style.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TOURISM & CO.', style: Theme.of(context).appBarTheme.textTheme.title),
        backgroundColor: Colors.white,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) => _itemBuilder(context, locations[index]),
      ));
  }
  _onLocationTap(BuildContext context, int locationID){
  Navigator.pushNamed(context, LocationDetailRoute, arguments: {"id" : locationID});
  }
  Widget _itemBuilder(BuildContext context, Location location){
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
      child: Container(
        height: 245.0,
        child: Stack(
          children: [
            ImageBanner(assetPath : location.imagePath, height: 245.0,),
            TileOverlay(location),
          ],
        ),
      ),
    );
  }
}
