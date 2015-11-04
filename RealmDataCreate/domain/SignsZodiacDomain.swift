//
//  SignsZodiacDomain.swift
//  RealmSample
//
//  Created by pyngit on 2015/10/22.
//

import Foundation
import RealmSwift

class SingsZodiacDomain:Object{
    dynamic var id = "";
    dynamic var name = "";
    dynamic var mindate = 0;
    dynamic var maxdate = 0;
    override static func primaryKey() -> String? {
        return "id"
    }
}