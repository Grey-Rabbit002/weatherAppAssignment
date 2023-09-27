/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class Condition {
    String? text;
    String? icon;
    int? code;

    Condition({this.text, this.icon, this.code}); 

    Condition.fromJson(Map<String, dynamic> json) {
        text = json['text'];
        icon = json['icon'];
        code = json['code'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['text'] = text;
        data['icon'] = icon;
        data['code'] = code;
        return data;
    }
}

class Current {
    int? lastupdatedepoch;
    String? lastupdated;
    double? tempc;
    double? tempf;
    int? isday;
    Condition? condition;
    double? windmph;
    double? windkph;
    int? winddegree;
    String? winddir;
    double? pressuremb;
    double? pressurein;
    double? precipmm;
    double? precipin;
    int? humidity;
    int? cloud;
    double? feelslikec;
    double? feelslikef;
    double? viskm;
    double? vismiles;
    double? uv;
    double? gustmph;
    double? gustkph;

    Current({this.lastupdatedepoch, this.lastupdated, this.tempc, this.tempf, this.isday, this.condition, this.windmph, this.windkph, this.winddegree, this.winddir, this.pressuremb, this.pressurein, this.precipmm, this.precipin, this.humidity, this.cloud, this.feelslikec, this.feelslikef, this.viskm, this.vismiles, this.uv, this.gustmph, this.gustkph}); 

    Current.fromJson(Map<String, dynamic> json) {
        lastupdatedepoch = json['last_updated_epoch'];
        lastupdated = json['last_updated'];
        tempc = json['temp_c'];
        tempf = json['temp_f'];
        isday = json['is_day'];
        condition = json['condition'] != null ? Condition?.fromJson(json['condition']) : null;
        windmph = json['wind_mph'];
        windkph = json['wind_kph'];
        winddegree = json['wind_degree'];
        winddir = json['wind_dir'];
        pressuremb = json['pressure_mb'];
        pressurein = json['pressure_in'];
        precipmm = json['precip_mm'];
        precipin = json['precip_in'];
        humidity = json['humidity'];
        cloud = json['cloud'];
        feelslikec = json['feelslike_c'];
        feelslikef = json['feelslike_f'];
        viskm = json['vis_km'];
        vismiles = json['vis_miles'];
        uv = json['uv'];
        gustmph = json['gust_mph'];
        gustkph = json['gust_kph'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['last_updated_epoch'] = lastupdatedepoch;
        data['last_updated'] = lastupdated;
        data['temp_c'] = tempc;
        data['temp_f'] = tempf;
        data['is_day'] = isday;
        data['condition'] = condition!.toJson();
        data['wind_mph'] = windmph;
        data['wind_kph'] = windkph;
        data['wind_degree'] = winddegree;
        data['wind_dir'] = winddir;
        data['pressure_mb'] = pressuremb;
        data['pressure_in'] = pressurein;
        data['precip_mm'] = precipmm;
        data['precip_in'] = precipin;
        data['humidity'] = humidity;
        data['cloud'] = cloud;
        data['feelslike_c'] = feelslikec;
        data['feelslike_f'] = feelslikef;
        data['vis_km'] = viskm;
        data['vis_miles'] = vismiles;
        data['uv'] = uv;
        data['gust_mph'] = gustmph;
        data['gust_kph'] = gustkph;
        return data;
    }
}

class Location {
    String? name;
    String? region;
    String? country;
    double? lat;
    double? lon;
    String? tzid;
    int? localtimeepoch;
    String? localtime;

    Location({this.name, this.region, this.country, this.lat, this.lon, this.tzid, this.localtimeepoch, this.localtime}); 

    Location.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        region = json['region'];
        country = json['country'];
        lat = json['lat'];
        lon = json['lon'];
        tzid = json['tz_id'];
        localtimeepoch = json['localtime_epoch'];
        localtime = json['localtime'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['name'] = name;
        data['region'] = region;
        data['country'] = country;
        data['lat'] = lat;
        data['lon'] = lon;
        data['tz_id'] = tzid;
        data['localtime_epoch'] = localtimeepoch;
        data['localtime'] = localtime;
        return data;
    }
}

class Root {
    Location? location;
    Current? current;

    Root({this.location, this.current}); 

    Root.fromJson(Map<String, dynamic> json) {
        location = json['location'] != null ? Location?.fromJson(json['location']) : null;
        current = json['current'] != null ? Current?.fromJson(json['current']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['location'] = location!.toJson();
        data['current'] = current!.toJson();
        return data;
    }
}

