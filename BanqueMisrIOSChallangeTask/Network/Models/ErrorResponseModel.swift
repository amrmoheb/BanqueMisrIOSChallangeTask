//
//  ErrorResponseModel.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 18/02/2022.
//

import Foundation
struct ErrorResponseModel : Decodable
{
    let status : String?
    let errorType : String?
    let message : String?
    let moreInfoUrl : String?
}

