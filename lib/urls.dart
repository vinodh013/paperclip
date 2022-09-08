
import 'package:paperclip/services/http_services.dart';

class Urls {

   static final bankOverview = HttpService().getBankDetail(
    "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en");
  
 static final bankPerformance = HttpService().getBankDetail(
"https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en");  

}