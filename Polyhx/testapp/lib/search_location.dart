import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchLocation {
  final String key = 'AIzaSyD-QgyF4dcnJnkxBIzjJi6SR6soV2XEu2U';

  Future<String> getPlaceId(String input) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&fields=place_id&key=$key';
    
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;

    return placeId;

  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    print(results);
    return results;
  } 
}
/*TextFormField(
              controller: _searchController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Enter Location',
                labelText: 'Search',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 20.0),
                prefixIcon: const Icon(CupertinoIcons.leaf_arrow_circlepath, color: Color.fromARGB(255, 105, 158, 107)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                print(value);
              }
            ),
            ),
            IconButton(
              onPressed: () async {
                var place = 
                  await SearchLocation().getPlace(_searchController.text);
                  _goToPlace(place);
            }, icon: Icon(CupertinoIcons.search_circle_fill),), */