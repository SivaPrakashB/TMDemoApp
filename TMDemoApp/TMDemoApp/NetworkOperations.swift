//
//  NetworkOperations.swift
//  TMDemoApp
//
//  Created by Interaction on 6/11/20.
//  Copyright © 2020 TechMahindra. All rights reserved.
//

import Foundation

class NetworkOperations:NSObject{
    func fetchDetails(urlString:String,completionHandler:@escaping(DetailList?, Error?)->()){
        let session = URLSession.shared
        let url = URL(string: urlString)!
        var request=URLRequest(url: url)
        request.setValue("text/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
              
                completionHandler(nil,error)
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                
                completionHandler(nil,error)
                return
            }
            guard let mime = response.mimeType, mime == "text/plain" else {
               
                completionHandler(nil,error)
                return
            }
            do {
                print(data!)
                let utf8Data = String(decoding: data!, as: UTF8.self).data(using: .utf8)
                let json = try JSONSerialization.jsonObject(with: utf8Data!, options: [])
                let responseDict = json as? Dictionary<String,Any> ?? [:]
                let detailList = self.parseInfo(responseDict)
                completionHandler(detailList,nil)
               
            } catch {
               
                completionHandler(nil,error)
            }
        }

        task.resume()
    }
    func parseInfo(_ responseDict: Dictionary<String,Any>) -> DetailList {
        let title = responseDict["title"] as? String ?? ""
        
        let rows = responseDict["rows"] as? [[String:Any]] ?? [[:]]
       
        let detailList:DetailList = DetailList()
        detailList.title = title
        for item in rows
        {
            
            if item.filter({ "\($0.value)" != "<null>" }).isEmpty == false{
            let rowList: RowsList = RowsList()
            rowList.title = item["title"] as? String ?? ""
            rowList.details = item["description"] as? String ?? ""
            rowList.imageHref = item["imageHref"] as? String ?? ""
            detailList.rows.append(rowList)
            }
        
        }
        
        return detailList
    }
}
