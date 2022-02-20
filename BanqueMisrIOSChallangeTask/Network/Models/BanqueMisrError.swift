//
//  File.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 18/02/2022.
//

import Foundation
struct BanqueMisrError : Error
{
    var message : String?
    var type : ErrorType?
    var code : Int?
}
enum ErrorType : String
{
    case serverError = "Server Error"
    case ConnectionError = "Connection Error"
    case serializationError = "Serialization Error"
}
enum ErrorMessage : String
{
    case unknownError = "Unkown Error Accured"
    case serilizationError = "Error during JSON serialization"
}
