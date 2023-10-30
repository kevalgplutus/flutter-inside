class ItemModel {
  List<Data>? data;

  ItemModel({this.data});

  ItemModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<String>? titleData;
  List<String>? subTitleData;
  String? type;
  String? empName;
  String? days;
  String? rM;
  String? fromDate;
  String? toDate;
  String? reason;
  String? date;
  String? createdBy;
  String? status;
  String? action;
  bool expanded = false;

  Data(
      {this.titleData,
        this.subTitleData,
        this.type,
        this.empName,
        this.days,
        this.rM,
        this.fromDate,
        this.toDate,
        this.reason,
        this.date,
        this.createdBy,
        this.status,
        this.action
      }
  );

  Data.fromJson(Map<String, dynamic> json) {
    titleData = json['title_data'].cast<String>();
    subTitleData = json['sub_title_data'].cast<String>();
    type = json['type'];
    empName = json['emp_name'];
    days = json['days'];
    rM = json['r_m'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    reason = json['reason'];
    date = json['date'];
    createdBy = json['created_by'];
    status = json['status'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_data'] = this.titleData;
    data['sub_title_data'] = this.subTitleData;
    data['type'] = this.type;
    data['emp_name'] = this.empName;
    data['days'] = this.days;
    data['r_m'] = this.rM;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['reason'] = this.reason;
    data['date'] = this.date;
    data['created_by'] = this.createdBy;
    data['status'] = this.status;
    data['action'] = this.action;
    return data;
  }
}