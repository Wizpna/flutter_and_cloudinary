class Data {
  List<Resources> resources;
  String nextCursor;

  Data({this.resources, this.nextCursor});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['resources'] != null) {
      resources = new List<Resources>();
      json['resources'].forEach((v) {
        resources.add(new Resources.fromJson(v));
      });
    }
    nextCursor = json['next_cursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resources != null) {
      data['resources'] = this.resources.map((v) => v.toJson()).toList();
    }
    data['next_cursor'] = this.nextCursor;
    return data;
  }
}

class Resources {
  String publicId;
  String format;
  int version;
  String resourceType;
  String type;
  String createdAt;
  int bytes;
  int width;
  int height;
  String url;
  String secureUrl;

  Resources(
      {this.publicId,
      this.format,
      this.version,
      this.resourceType,
      this.type,
      this.createdAt,
      this.bytes,
      this.width,
      this.height,
      this.url,
      this.secureUrl});

  Resources.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    format = json['format'];
    version = json['version'];
    resourceType = json['resource_type'];
    type = json['type'];
    createdAt = json['created_at'];
    bytes = json['bytes'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    secureUrl = json['secure_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['format'] = this.format;
    data['version'] = this.version;
    data['resource_type'] = this.resourceType;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['bytes'] = this.bytes;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['secure_url'] = this.secureUrl;
    return data;
  }
}
