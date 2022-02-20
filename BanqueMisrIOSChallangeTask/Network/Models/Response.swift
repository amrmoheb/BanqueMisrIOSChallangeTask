//
//  Response.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 18/02/2022.
//

import Foundation
enum Response<T>
{
    case Success(T)
    case failier(BanqueMisrError)
}
