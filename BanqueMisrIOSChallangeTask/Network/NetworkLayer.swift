

import Foundation
class NetworkLayer {
    var session : URLSession
    init(session : URLSession = URLSession.shared)
    {
        self.session = session
    }

    public  func GetRequest<T:Decodable>( Model: T.Type,RequestConfiq: NetworkRouter,completionHandler: @escaping  (Response<T>) -> Void)
      {
        
      
        let url = URL(string: RequestConfiq.GetUrl())!
        var request = URLRequest(url: url)

          request.httpMethod = RequestConfiq.GetMethod()
        
        let task = session.dataTask(with: request , completionHandler: { data, response, error in
                    // Check the response
            data?.printJSON()

                    // server error
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                do{
                    let ErrorReponse =  try  JSONDecoder().decode(ErrorResponseModel.self, from: data!)
                    completionHandler(.failier(BanqueMisrError(message: ErrorReponse.message , type: .serverError , code : httpResponse.statusCode)))
                  }
             catch{
                 completionHandler(.failier(BanqueMisrError(message: ErrorMessage.unknownError.rawValue, type: .serverError)))
                  }
                return
              
                }
            
                    // connection error
                    if let error = error {
                        completionHandler(.failier(BanqueMisrError(message: error.localizedDescription, type: .ConnectionError, code: error._code)))

                        return
                    }

                    // Serialize the data into an object

              do{
               let result =  try  JSONDecoder().decode(Model, from: data!)
                  completionHandler(.Success(result))
                }
           catch{
               completionHandler(.failier(BanqueMisrError(message: ErrorMessage.serilizationError.rawValue, type: .serializationError)))
                }
                })
                task.resume()
    }
  
}
