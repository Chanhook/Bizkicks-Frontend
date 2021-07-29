class Kickboard {
  final String company_name;
  final double lat;
  final double lng;
  final int battery;
  final String model;
  final String img_url;

  Kickboard(this.company_name, this.lat, this.lng, this.battery, this.model,
      this.img_url);
  Kickboard.fromJson(Map<String, dynamic> json)
      : company_name = json['company_name'],
        lat = json['lat'],
        lng = json['lng'],
        battery = json['battery'],
        model = json['model'],
        img_url = json['img_url'];

  Map<String, dynamic> toJson() =>
      {
        'company_name' : company_name,
        'lat' :lat,
        'lng' :lng,
        'battery' :battery,
        'model' :model,
        'img_url':img_url
      };
  }


