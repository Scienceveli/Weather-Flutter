String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=ac536439903c5b56948fdd5f85225de5";
  return url;
}
