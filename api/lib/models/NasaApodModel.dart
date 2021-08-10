class NasaApodModel {
/*
{
  "date": "2021-08-10",
  "explanation": "What does fire look like in space? In the gravity on Earth, heated air rises and expands, causing flames to be teardrop shaped. In the microgravity of the air-filled International Space Station (ISS), however, flames are spheres. Fire is the rapid acquisition of oxygen, and space flames meet new oxygen molecules when they float by randomly from all directions -- creating the enveloping sphere.  In the featured image taken in the ISS's Combustion Integration Rack, a spherical flame envelopes clusters of hot glowing soot.  Without oxygen, say in the vacuum of empty space, a fire would go out immediately.  The many chemical reactions involved with fire are complex, and testing them in microgravity is helping humanity not only to better understand fire -- but how to put out fire, too.",
  "hdurl": "https://apod.nasa.gov/apod/image/2108/SpaceFlame_nasa_1100.jpg",
  "media_type": "image",
  "service_version": "v1",
  "title": "Fire in Space",
  "url": "https://apod.nasa.gov/apod/image/2108/SpaceFlame_nasa_960.jpg"
} 
*/

  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;

  NasaApodModel({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });
  NasaApodModel.fromJson(Map<String, dynamic> json) {
    date = json["date"]?.toString();
    explanation = json["explanation"]?.toString();
    hdurl = json["hdurl"]?.toString();
    mediaType = json["media_type"]?.toString();
    serviceVersion = json["service_version"]?.toString();
    title = json["title"]?.toString();
    url = json["url"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["date"] = date;
    data["explanation"] = explanation;
    data["hdurl"] = hdurl;
    data["media_type"] = mediaType;
    data["service_version"] = serviceVersion;
    data["title"] = title;
    data["url"] = url;
    return data;
  }
}
