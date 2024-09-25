import 'dart:convert';
import 'package:autojidelna/src/freezed/freezed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> getLatestRelease() async {
  const url = 'https://api.github.com/repos/App-Elevate/AUT.aplikace/releases/latest';
  final response = await http.get(Uri.parse(url));

  GithubRelease release = GithubRelease.fromJson(json.decode(response.body));

  debugPrint(release.assets[0].browserDownloadUrl);
}
