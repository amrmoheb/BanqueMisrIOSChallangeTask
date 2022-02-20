import Foundation

enum NetworkRouter {
    static let baseURLString = "https://api.edmunds.com/api/vehicle"
 static let apiKey = "2ep93tpnyh6p5hgaxmp6pasq"
  static let pageSize = 20

    case getAllMakes(Int)
    case getMakeModels(String, Int)

    func getUrl() -> String {

        var relativePath = ""

        switch self {
        case .getAllMakes( let pageNumber):
            relativePath = "/v3/makes?&pageNum=\(pageNumber)&pageSize=\(NetworkRouter.pageSize)"

        case .getMakeModels( let makeNiceName, let pageNumber):
            relativePath = "/v3/models?makeNiceName=\(makeNiceName)&modelYears.year=2022&publicationStates=NEW&pageNum=\(pageNumber)&pageSize=\(NetworkRouter.pageSize)"
        }
      print(NetworkRouter.baseURLString + relativePath + "&api_key=" + NetworkRouter.apiKey)
        return NetworkRouter.baseURLString + relativePath  + "&api_key=" + NetworkRouter.apiKey
    }

    func getMethod() -> String {
        switch self {

        case .getAllMakes, .getMakeModels :
             return "Get"

        }
    }

}
