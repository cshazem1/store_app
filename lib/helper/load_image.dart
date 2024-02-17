import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

Future<ImageProvider> loadImage(String url) async {
  try {
    // Check if the URL is valid
    if (url.isNotEmpty && Uri.parse(url).isAbsolute) {
      // Send an HTTP GET request to fetch the image
      final response = await http.get(Uri.parse(url));

      // Check the status code of the response
      if (response.statusCode == 200) {
        // If the request was successful, return the image
        return NetworkImage(url);
      } else if (response.statusCode == 404) {
        // If the server responded with a 404 status code, handle it accordingly
        debugPrint("HTTP error: Resource not found.");
        throw Exception("HTTP request failed: Resource not found.");
      } else {
        // Handle other HTTP errors
        debugPrint("HTTP error: ${response.statusCode}");
        throw Exception(
            "HTTP request failed with status code: ${response.statusCode}");
      }
    } else {
      // Throw an exception for invalid URL
      throw Exception("Invalid URL: $url");
    }
  } on SocketException {
    // Handle network-related errors, such as host lookup failure
    debugPrint("Network error: Unable to connect to the server.");
    throw Exception("Network error occurred.");
  } catch (e) {
    // Handle other types of errors
    debugPrint("Error loading image: $e");
    throw Exception("Failed to load image");
  }
}
