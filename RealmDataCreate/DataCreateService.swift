//
//  DataCreateService.swift
//  RealmDataCreate
//
//  Created by pyngit on 2015/10/27.
//

import Foundation
import RealmSwift


class DataCreateService{
    func exec(){
        print("Data CreateService exec start.");
        //マスターデータのアプリケーションバンドルパス
        let masterDataPath = NSBundle.mainBundle().pathForResource("MasterData", ofType:"realm");
        
        
        do{
            let filePath = NSBundle.mainBundle().pathForResource("MasterData", ofType: "json");
            print("filePath:\(filePath)");
            let fileData = try String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding);
            print("data:\(fileData)");
            
            let jsonData = fileData.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!

            let json = try NSJSONSerialization.JSONObjectWithData(jsonData,options: []) as! NSDictionary;
            print("json:\(json)");
            
            let itemList = json["SingsZodiac"] as! [NSDictionary];
            print("\(itemList)");
            
            let config = Realm.Configuration(path: masterDataPath)
            
            // デフォルトRealmに新しい設定を適用します
            Realm.Configuration.defaultConfiguration = config
            
            let realm = try Realm()
            print("realmfile:\(realm.configuration.path)");
            
            try realm.write {
                // アイテム保存
                for item in itemList {
//                    print("item:\(item["id"]):\(item["name"]):\(item["mindate"]):\(item["maxdate"])");
                    realm.create(SingsZodiacDomain.self, value: item, update: true)
                }
            }
            
        }catch  let error as NSError{
            print("error:\(error)");
        }
    }
}