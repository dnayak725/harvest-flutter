import 'dart:convert';

import 'package:havest/Model/AddCorp.dart';
import 'package:havest/Model/CommodityVariety.dart';
import 'package:havest/Model/FarmerList.dart';
import 'package:havest/Model/GetDistrict.dart';
import 'package:havest/Model/GetMondal.dart';
import 'package:havest/Model/GetVillage.dart';
import 'package:havest/Model/LoginModel.dart';
import 'package:havest/Model/ParentCommodity.dart';
import 'package:havest/Model/comodity.dart';
import 'package:havest/Model/farmerAdd.dart';
import 'package:http/http.dart' as http;

// login api
class LoginApiService {
  Future<LoginResponse> login(Map<String, dynamic> param) async {
    String url = "https://ahdap.quocent.com/api/user/login";

    final response = await http.post(Uri.parse(url),
        headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
        body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(data);
    } else {
      return LoginResponse.fromError(data);
    }
  }
}
// get farmer details

class FarmerListApiService {
  Future<FarmerListResponse> farmerlist() async {
    String url = "https://ahdap.quocent.com/api/farmers";

    final response = await http.get(
      Uri.parse(url),
      headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return FarmerListResponse.fromJson(data);
    } else {
      return FarmerListResponse.fromError(data);
    }
  }
}

// farmer add
class FarmerAddApiService {
  Future<FarmerAddResponse> farmeradd(Map<String, dynamic> param) async {
    print(param);
    String url = "https://ahdap.quocent.com/api/farmer/add";

    final response = await http.post(Uri.parse(url),
        headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
        body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return FarmerAddResponse.fromJson(data);
    } else {
      return FarmerAddResponse.fromError(data);
    }
  }
}

// get district

class GetDistrictApiService {
  Future<GetDistrictResponse> getdistrict() async {
    String url = "https://ahdap.quocent.com/api/districts/get";

    final response = await http.get(
      Uri.parse(url),
      headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GetDistrictResponse.fromJson(data);
    } else {
      return GetDistrictResponse.fromError(data);
    }
  }
}

// get mondal
// // farmer add
// class GetMondalApiService {
//   Future<GetMondalResponse> getmondal(param) async {
//     print("from api");
//     print(param.runtimeType);
//     String url = "https://ahdap.quocent.com/api/mandals/get?district_id=$param";

//     final response = await http.post(Uri.parse(url),
//         headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
//         body: param);

//     final data = jsonDecode(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       return GetMondalResponse.fromJson(data);
//     } else {
//       return GetMondalResponse.fromError(data);
//     }
//   }
// }

// sub mondal
class GetMondalApiService {
  Future<GetMondalResponse> getmondal(param) async {
    String url = "https://ahdap.quocent.com/api/mandals/get?district_id=$param";

    final response = await http.get(
      Uri.parse(url),
      headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      return GetMondalResponse.fromJson(data);
    } else {
      return GetMondalResponse.fromError(data);
    }
  }
}

// sub village
class GetVillageApiService {
  Future<GetVillagelResponse> getvillage(param) async {
    String url = "https://ahdap.quocent.com/api/villages/get?mandal_id=$param";

    final response = await http.get(
      Uri.parse(url),
      headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      return GetVillagelResponse.fromJson(data);
    } else {
      return GetVillagelResponse.fromError(data);
    }
  }
}

// get comodity

class ComodityApiService {
  Future<ComodityResponse> getcommodity() async {
    String url = "https://ahdap.quocent.com/api/commodity-groups/get";

    final response = await http.get(
      Uri.parse(url),
      headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ComodityResponse.fromJson(data);
    } else {
      return ComodityResponse.fromError(data);
    }
  }
}

// parent commodity
class ParentCommodityApiService {
  Future<ParentComodityResponse> getparentcommodity(param) async {
    String url =
        "https://ahdap.quocent.com/api/parent-commodity/get?commodity_id=$param";

    final response = await http.get(
      Uri.parse(url),
      headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      return ParentComodityResponse.fromJson(data);
    } else {
      return ParentComodityResponse.fromError(data);
    }
  }
}

//commodity variety
class CommodityVarietyApiService {
  Future<CommodityVarietyResponse> commodityvariety(param) async {
    print(param);
    // String url = "https://helobn.com/api/search?$param";

    final response = await http.get(
      Uri.https('ahdap.quocent.com', '/api/products/get', param),
      headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      return CommodityVarietyResponse.fromJson(data);
    } else {
      return CommodityVarietyResponse.fromError(data);
    }
  }
}

// farmer corp data
class AddCorpApiService {
  Future<AddCorpResponse> addcorpdata(Map<String, dynamic> param) async {
    print(param);
    String url = "https://ahdap.quocent.com/api/crop/add";

    final response = await http.post(Uri.parse(url),
        headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQDretrHy"},
        body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return AddCorpResponse.fromJson(data);
    } else {
      return AddCorpResponse.fromError(data);
    }
  }
}
