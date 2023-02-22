

class BodyPost{

  String? user;
  String? tableName;
  String? whereCondition;
  String? rowsLimit;
  List<String>? selectedFields;
  List<Filters>? filters;
  String? orderBy;

  BodyPost({this.user,this.tableName,this.whereCondition,this.rowsLimit, this.selectedFields, this.filters, this.orderBy});

// 'tableName' : well_test,
// 'rowsLimit' : 2,
// 'selectedFields' : ['uwi', 'well_completion_s', 'activity_name'],
// 'filters' : [
// { 'name' : 'USER_ID', 'value' : '2487823' },
// { 'name' : 'activity_name", 'value' : 'PORTABLE' },
// { 'name' : 'start_time', 'value' : '10/24/2021 8:15:00 AM' }
// ],
// 'orderBy' : null
// }
  Map<String,dynamic> toJson() => {

    "user"           : user,
    "tableName"      : tableName,
    "whereCondition" : whereCondition,
    "rowsLimit"      : rowsLimit,
    "selectedFields" : selectedFields,
    "filters"        : filters,
    "orderBy"        : orderBy
  };

}

class Filters {
  String? name;
  String? value;

  Filters(this.name, this.value);

  Map<String,dynamic> toJson() => {
    'name' : name,
    'value' : value,
  };
}

class User{
  String? user;
  User({this.user});

  Map<String,dynamic> toJson() => {
    'user' : user,
  };

}