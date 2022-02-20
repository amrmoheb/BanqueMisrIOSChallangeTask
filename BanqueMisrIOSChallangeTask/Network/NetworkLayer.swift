import Foundation
class NetworkLayer {
    var session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    public  func getRequest<T: Decodable>( model: T.Type, requestConfiq: NetworkRouter, completionHandler: @escaping  (Response<T>) -> Void) {

        let url = URL(string: requestConfiq.getUrl())!
        var request = URLRequest(url: url)

          request.httpMethod = requestConfiq.getMethod()

        let task = session.dataTask(with: request, completionHandler: { data, response, error in
                    // Check the response
            data?.printJSON()

                    // server error
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                do {
                    let errorReponse =  try  JSONDecoder().decode(ErrorResponseModel.self, from: data!)
                    completionHandler(.failier(BanqueMisrError(message: errorReponse.message, type: .serverError, code: httpResponse.statusCode)))
                  } catch {
                 completionHandler(.failier(BanqueMisrError(message: ErrorMessage.unknownError.rawValue, type: .serverError)))
                  }
                return

                }

                    // connection error
                    if let error = error {
                        completionHandler(.failier(BanqueMisrError(message: error.localizedDescription, type: .connectionError, code: error._code)))

                        return
                    }

                    // Serialize the data into an object

              do {
               let result =  try  JSONDecoder().decode(model, from: data!)
                  completionHandler(.success(result))
                } catch {
               completionHandler(.failier(BanqueMisrError(message: ErrorMessage.serilizationError.rawValue, type: .serializationError)))
                }
                })
                task.resume()
    }

}
