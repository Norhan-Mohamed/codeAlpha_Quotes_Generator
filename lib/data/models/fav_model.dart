class FavModel {
  IdF? iId;
  String? quote;
  String? author;
  String? tags;

  FavModel({this.iId, this.quote, this.author, this.tags});

  FavModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new IdF.fromJson(json['_id']) : null;
    quote = json['Quote'];
    author = json['Author'];
    tags = json['Tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['Quote'] = this.quote;
    data['Author'] = this.author;
    data['Tags'] = this.tags;
    return data;
  }
}

class IdF {
  String? oid;

  IdF({this.oid});

  IdF.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}