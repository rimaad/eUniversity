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
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseJSON { (response) in
            print(response)
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    guard let responseData  = response.data  else {
                        return }
                   
                    do {
                        let user = try JSONDecoder().decode(Value.self, from: responseData)
                       UserController.sharedController.userName = user.value.FirstName
                       UserController.sharedController.accessToken = user.value.AuthToken
                       UserController.sharedController.StudentID = user.value.StudentID
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
    
    func getNews(onResponse:@escaping (_ success:Announcements?, _ error:NSError?)->Void) {
        
        
        let urlString = "http://api.euniversity.ba/api/students/announcements/get"
        let url = URL(string:urlString)
        
        guard let accessToken = UserController.sharedController.accessToken else {
            return
        }
        
        let headers = [
            "authToken":"\(accessToken)"
        ]
      
        Alamofire.request(url!, method: .get, parameters: nil, encoding:URLEncoding.queryString, headers:headers).responseJSON { (response) in
            if let status = response.response?.statusCode {
                switch(status){
                case 200:

                    guard let responseData  = response.data  else {
                        return }
                    do {
                        let announcments = try JSONDecoder().decode(ValueNews.self, from: responseData)
                        print(announcments)
                        onResponse(announcments.value,nil)
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
    
    func getStudentStatus(onResponse:@escaping (_ success:StudentData?, _ error:NSError?)->Void) {
        
        
        let urlString = baseUrl + "/students/statusinformation/get"
        let url = URL(string:urlString)
        
        guard let accessToken = UserController.sharedController.accessToken else {
            return
        }
        
        let headers = [
            "authToken":"\(accessToken)"
        ]
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding:URLEncoding.queryString, headers:headers).responseJSON { (response) in
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    
                    guard let responseData  = response.data  else {
                        return }
                    do {
                        let studentData = try JSONDecoder().decode(ValueStudentData.self, from: responseData)
                        print(studentData)
                        onResponse(studentData.value,nil)
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
    
    func getAnnouncmentsImages(announcmentId:String,onResponse:@escaping (_ success:Image?, _ error:NSError?)->Void) {
        let urlString = baseUrl + "/students/announcementphotos/GetByAnnouncementId/?announcementId=\(announcmentId)"
        let url = URL(string:urlString)
        
        guard let accessToken = UserController.sharedController.accessToken else {
            return
        }
        
        let headers = [
            "authToken":"\(accessToken)"
        ]
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding:URLEncoding.queryString, headers:headers).responseJSON { (response) in
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    
                    guard let responseData  = response.data  else {
                        return }
                    do {
                        let imageData = try JSONDecoder().decode(ValueImage.self, from: responseData)
                        onResponse(imageData.value,nil)
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
    
    func getGrades(onResponse:@escaping (_ success:StudentGrades?, _ error:NSError?)->Void) {
        let urlString = baseUrl + "/students/studentgrades/get"
        let url = URL(string:urlString)
        
        guard let accessToken = UserController.sharedController.accessToken else {
            return
        }
        
        let headers = [
            "authToken":"\(accessToken)"
        ]
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding:URLEncoding.queryString, headers:headers).responseJSON { (response) in
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    
                    guard let responseData  = response.data  else {
                        return }
                    do {
                        let gradesData = try JSONDecoder().decode(GradesValue.self, from: responseData)
                        onResponse(gradesData.value,nil)
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
