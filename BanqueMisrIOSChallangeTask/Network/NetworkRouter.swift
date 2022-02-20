

import Foundation

enum NetworkRouter
{
    static let baseURLString = "https://api.edmunds.com/api/vehicle"
 static let apiKey = "2ep93tpnyh6p5hgaxmp6pasq"
  static let pageSize = 20
    
    case GetAllMakes(Int)
    case GetMakeModels(String , Int)

    func GetUrl() -> String {
  
        var relativePath = ""
        
        switch self {
        case .GetAllMakes( let pageNumber):
            relativePath = "/v3/makes?&pageNum=\(pageNumber)&pageSize=\(NetworkRouter.pageSize)"

        case .GetMakeModels( let makeNiceName , let pageNumber):
            relativePath = "/v3/models?makeNiceName=\(makeNiceName)&modelYears.year=2022&publicationStates=NEW&pageNum=\(pageNumber)&pageSize=\(NetworkRouter.pageSize)"
        }
      print(NetworkRouter.baseURLString + relativePath + "&api_key=" + NetworkRouter.apiKey)
        return NetworkRouter.baseURLString + relativePath  + "&api_key=" + NetworkRouter.apiKey
    }
    
    func GetMethod() -> String {
        switch self {
       
        case .GetAllMakes,.GetMakeModels :
             return "Get"
      
        }
    }

  
    
}
