import 'package:http/http.dart' as http;
import 'package:http/http.dart' as path;
import 'package:kawal_desa2/constants/const.dart';
import 'package:kawal_desa2/models/company_unit_data.dart';

class ApiService{
  Future<CompanyUnitData> getCompanyUnit(String companyCode) async{
    final client=http.Client();
    try{
      final reportUrl= '${BASE_URL}company/$companyCode/units?code=true';
      final response = await client.get(reportUrl);
      final companyUnitData= companyUnitDataFromJson(response.body);
      if (companyUnitData.code !=200){
        return null;
      }
      return companyUnitData;
    } catch(e) {
      return null;
    }
  }
}