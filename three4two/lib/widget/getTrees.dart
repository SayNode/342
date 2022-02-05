import 'dart:convert';
import 'package:three4two/Utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import "package:hex/hex.dart";

Future getTrees() async {
  globals.trees = [];
  var bestBlock = await http.get(Uri.parse(globals.nodeURL + 'blocks/best'));
  var bestBlockList = json.decode(bestBlock.body);
  int best = (bestBlockList['number']);
  try {
    Map form = {
      "range": {"unit": "block", "from": 0, "to": best},
      "options": {"offset": 0, "limit": 300},
      "criteriaSet": [
        {
          "address": "0xca4B53CF539e30d61D7111cf784BFFA3587C4FE0",
          "topic0":
              "0xeb3a151fbf02ed5c90d14b23ba486256b168f6ab2364c5b47319046b11547836"
        }
      ],
      "order": "asc"
    };
    var sendToNode = await http.post(Uri.parse(globals.nodeURL + 'logs/event'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(form));

    List<dynamic> nodeResponse = json.decode(sendToNode.body);
    for (var i = 0; i < nodeResponse.length; i++) {
      String treeAddress = nodeResponse[i]['topics'][2];
      globals.trees.add("0x" + treeAddress.substring(26, treeAddress.length));
    }
    getTreeNames();
    return;
  } on Exception catch (e) {
    return "fail";
  }
}

Future getTreeNames() async {
  globals.treeNames = [];
  for (var i = 0; i < globals.trees.length; i++) {
    var treeName = await http.get(Uri.parse(globals.nodeURL +
        'accounts/' +
        globals.trees[i] +
        '/storage/0x0000000000000000000000000000000000000000000000000000000000000004'));
    var data = json.decode(treeName.body)["value"];
    print(utf8.decode(HEX.decode(data.substring(2, data.length))));
    globals.treeNames
        .add(utf8.decode(HEX.decode(data.substring(2, data.length))));
  }
}
