class LoginResponseModel {
  String? message;
  int? adminId;
  String? name;
  String? adminType;
  List<Farmers>? farmers;

  LoginResponseModel(
      {this.message, this.adminId, this.name, this.adminType, this.farmers});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    adminId = json['adminId'];
    name = json['name'];
    adminType = json['adminType'];
    if (json['farmers'] != null) {
      farmers = <Farmers>[];
      json['farmers'].forEach((v) {
        farmers!.add(new Farmers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['adminId'] = this.adminId;
    data['name'] = this.name;
    data['adminType'] = this.adminType;
    if (this.farmers != null) {
      data['farmers'] = this.farmers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Farmers {
  int? id;
  String? farmerName;
  int? adminId;
  String? mobile;
  String? aadharNo;
  String? address;
  String? motorId;
  bool? isActive;

  Farmers(
      {this.id,
        this.farmerName,
        this.adminId,
        this.mobile,
        this.aadharNo,
        this.address,
        this.motorId,
        this.isActive});

  Farmers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerName = json['farmerName'];
    adminId = json['adminId'];
    mobile = json['mobile'];
    aadharNo = json['aadharNo'];
    address = json['address'];
    motorId = json['motorId'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['farmerName'] = this.farmerName;
    data['adminId'] = this.adminId;
    data['mobile'] = this.mobile;
    data['aadharNo'] = this.aadharNo;
    data['address'] = this.address;
    data['motorId'] = this.motorId;
    data['isActive'] = this.isActive;
    return data;
  }
}
