//
//  ApiClient.swift
//  eUniversity
//
//  Created by Damir Ramic on 11/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

let baseUrl = "http://api.euniversity.ba/api"

class ApiClient {
    

    func login(userName:String,password:String,onResponse:@escaping (_ success:User?, _ error:NSError?)->Void) {
        let deviceToken = UserDefaults.standard.object(forKey: "fcmToken")
        let urlString = "http://api.euniversity.ba/api/students/authentication/login"
        guard let url = URL(string:urlString) else {return}
        let parameters : Parameters = ["username" : userName,
                          "password" : password,
                          "deviceToken" : deviceToken!]
        let headers = [
            "Accept": "application/json",
            "Content-Type" :"application/json"
        ]
        
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseJSON { (response) in
            print(response)
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    var jsonData = Data()
                    guard let responseData  = response.data  else {
                        return }
                   
                    do {
                        let user = try JSONDecoder().decode(Value.self, from: responseData)
                       UserController.sharedController.userName = user.value.FirstName
                       UserController.sharedController.accessToken = user.value.AuthToken
                       onResponse(user.value,nil)
                    }
                    catch let jsnError{
                        print("jsonError",jsnError)
                    }
                default:
                    print("error with response status: \(status)")
                    onResponse(nil,nil)
                }
            }
        }
    }
    
    func getNews(onResponse:@escaping (_ success:User?, _ error:NSError?)->Void) {
        
        
        let urlString = "http://api.euniversity.ba/api/students/announcements/get"
        let url = URL(string:urlString)
        
        guard let accessToken = UserController.sharedController.accessToken else {
            return
        }
        
        let headers = [
            "authToken":"\(accessToken)"
        ]
        
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding:URLEncoding.queryString, headers:headers).responseJSON { (response) in
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    var jsonData = Data()
                    guard let responseData  = response.data  else {
                        return }
                    print(response.value)
                    do {
                        let news = try JSONDecoder().decode(ValueNews.self, from: responseData)
                        print(news)
                        onResponse(nil,nil)
                    }
                    catch let jsnError{
                        print("jsonError",jsnError)
                    }
                default:
                    print("error with response status: \(status)")
                    onResponse(nil,nil)
                }
            }
           
        }
        
    }
}
