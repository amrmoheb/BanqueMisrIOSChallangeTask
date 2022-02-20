//
//  PrintJson.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 18/02/2022.
//

import Foundation
extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}
