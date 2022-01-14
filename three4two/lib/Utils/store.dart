import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

const String FileName = 'transactionsID.json';
late File _filePath;
Map<String, dynamic> _json = {};
late String _jsonString;

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/$FileName');
}

void writeJson(String key, dynamic value) async {
  // Initialize the local _filePath
  _filePath = await _localFile;
  print(_filePath);
  print(_json);

  //1. Create _newJson<Map> from input<TextField>
  Map<String, dynamic> _newJson = {key: value};
  print('1.(_writeJson) _newJson: $_newJson');

  //2. Update _json by adding _newJson<Map> -> _json<Map>
  _json.addAll(_newJson);
  print('2.(_writeJson) _json(updated): $_json');

  //3. Convert _json ->_jsonString
  _jsonString = jsonEncode(_json);
  print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

  //4. Write _jsonString to the _filePath
  _filePath.writeAsString(_jsonString);
}

Future<List> readJson() async {
  // Initialize _filePath
  _filePath = await _localFile;

  // 0. Check whether the _file exists
  var _fileExists = await _filePath.exists();
  print('0. File exists? $_fileExists');

  // If the _file exists->read it: update initialized _json by what's in the _file
  if (_fileExists) {
    try {
      //1. Read _jsonString<String> from the _file.
      _jsonString = await _filePath.readAsString();
      print('1.(_readJson) _jsonString: $_jsonString');

      //2. Update initialized _json by converting _jsonString<String>->_json<Map>

      Map<String, dynamic> myMap = json.decode(_jsonString);
      List<String> txID = [];
      myMap.forEach((key, value) {
        txID.add(value);
      });
      return txID;
    } catch (e) {
      return [];
      // Print exception errors
      // If encountering an error, return null
    }
  }
  return [];
}
