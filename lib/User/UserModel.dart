
class UserModel {
  int? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? birthDate;
  String? createdAt;
  String? updatedAt;
  Null? username;
  Null? roleId;
  Null? roleName;
  String? designationId;
  String? designationName;
  String? designation;
  String? cAddress;
  String? pAddress;
  String? reportingEmployeeId;
  int? isWorking;
  int? isActive;
  int? isSuperuser;
  String? personalEmail;
  Null? referenceEmployeeId;
  String? joiningDate;
  String? contactPrimary;
  String? contactAlternative;
  String? contactEmergency;
  Null? machineId;
  String? aadharCardNumber;
  String? accountStatus;
  String? permissions;
  String? profilePic;
  String? token;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.birthDate,
      this.createdAt,
      this.updatedAt,
      this.username,
      this.roleId,
      this.roleName,
      this.designationId,
      this.designationName,
      this.designation,
      this.cAddress,
      this.pAddress,
      this.reportingEmployeeId,
      this.isWorking,
      this.isActive,
      this.isSuperuser,
      this.personalEmail,
      this.referenceEmployeeId,
      this.joiningDate,
      this.contactPrimary,
      this.contactAlternative,
      this.contactEmergency,
      this.machineId,
      this.aadharCardNumber,
      this.accountStatus,
      this.permissions,
      this.profilePic,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    birthDate = json['birth_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    username = json['username'];
    roleId = json['role_id'];
    roleName = json['role_name'];
    designationId = json['designation_id'];
    designationName = json['designation_name'];
    designation = json['designation'];
    cAddress = json['c_address'];
    pAddress = json['p_address'];
    reportingEmployeeId = json['reporting_employee_id'];
    isWorking = json['is_working'];
    isActive = json['is_active'];
    isSuperuser = json['is_superuser'];
    personalEmail = json['personal_email'];
    referenceEmployeeId = json['reference_employee_id'];
    joiningDate = json['joining_date'];
    contactPrimary = json['contact_primary'];
    contactAlternative = json['contact_alternative'];
    contactEmergency = json['contact_emergency'];
    machineId = json['machine_id'];
    aadharCardNumber = json['aadhar_card_number'];
    accountStatus = json['account_status'];
    permissions = json['permissions'];
    profilePic = json['profile_pic'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['birth_date'] = this.birthDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['role_id'] = this.roleId;
    data['role_name'] = this.roleName;
    data['designation_id'] = this.designationId;
    data['designation_name'] = this.designationName;
    data['designation'] = this.designation;
    data['c_address'] = this.cAddress;
    data['p_address'] = this.pAddress;
    data['reporting_employee_id'] = this.reportingEmployeeId;
    data['is_working'] = this.isWorking;
    data['is_active'] = this.isActive;
    data['is_superuser'] = this.isSuperuser;
    data['personal_email'] = this.personalEmail;
    data['reference_employee_id'] = this.referenceEmployeeId;
    data['joining_date'] = this.joiningDate;
    data['contact_primary'] = this.contactPrimary;
    data['contact_alternative'] = this.contactAlternative;
    data['contact_emergency'] = this.contactEmergency;
    data['machine_id'] = this.machineId;
    data['aadhar_card_number'] = this.aadharCardNumber;
    data['account_status'] = this.accountStatus;
    data['permissions'] = this.permissions;
    data['profile_pic'] = this.profilePic;
    data['token'] = this.token;
    return data;
  }
}
