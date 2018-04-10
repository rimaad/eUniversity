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

let baseUrl = "https://api.euniversity.ba/api"

class ApiClient {
    

    func login(userName:String,password:String,onResponse:@escaping (_ success:User?, _ error:eUniversityError?)->Void) {
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
                    if status == 401 {
                        do {
                             let errorData = try JSONDecoder().decode(eUniversityError.self, from:response.data! )
                            
                                onResponse(nil,errorData)
            
                        }
                        catch let jsnError{
                            print("jsonError",jsnError)
                        }
                    }
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
    
    func getNewsBySyllabus(syllabusID:Int,onResponse:@escaping (_ success:Announcements?, _ error:NSError?)->Void) {
        
        
        let urlString = "http://api.euniversity.ba/api/students/announcements/get/?syllabusId=" + "\(syllabusID)"
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
                        let announcment = try JSONDecoder().decode(ValueNews.self, from: responseData)
                        print(announcment)
                        onResponse(announcment.value,nil)
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
    
    func getSyllabusses(onResponse:@escaping (_ success:Syllabuses?, _ error:NSError?)->Void) {
        let urlString = baseUrl + "/students/syllabuses/get"
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
                        let syllabusesData = try JSONDecoder().decode(SyllabusValue.self,from: responseData)
                        print(syllabusesData)
                        onResponse(syllabusesData.value,nil)
                    }
                    catch let jsnError{
                        print("jsonError",jsnError)
                    }
                default:
                    print("error with response status: \(status)")
                    if status == 401 {
                        guard let responseData  = response.data  else {
                            return }
                        //
                        onResponse(nil,nil)
                    }
                    
                    
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
                    if status == 401 {
                        guard let responseData  = response.data  else {
                            return }
                     //
                         onResponse(nil,nil)
                    }
                    
                   
                }
            }
            
        }
    }
    
    func getAnnouncmentsImages(announcmentId:String,onResponse:@escaping (_ success:AnnouncementPhotos?, _ error:NSError?)->Void) {
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
    
    func getGradesByYear(year:String,onResponse:@escaping (_ success:StudentGrades?, _ error:NSError?)->Void) {
        let urlString = baseUrl + "/students/studentgrades/get?studyYear=" + year
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
    
    func getGradesBySuccess(isPassed:String,onResponse:@escaping (_ success:StudentGrades?, _ error:NSError?)->Void) {
        let urlString = baseUrl + "/students/studentgrades/get/?passed=" + isPassed
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
    
    func getAverageGrades(onResponse:@escaping (_ success:AverageGrades?, _ error:NSError?)->Void) {
        let urlString = baseUrl + "/students/averagegrades/get/?byStudyYears=true"
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
                        let averageGradesData = try JSONDecoder().decode(AverageGradesValue.self, from: responseData)
                        onResponse(averageGradesData.value,nil)
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
    
    func getSemesters(onResponse:@escaping (_ success:Semesters?, _ error:NSError?)->Void) {
      
            let urlString = "http://api.euniversity.ba/api/students/semesters/get"
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
                            let semesters = try JSONDecoder().decode(SemestarValue.self, from: responseData)
                            print(semesters.value)
                            onResponse(semesters.value,nil)
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
    
    func getAttendances(onResponse:@escaping (_ success:Attendances?, _ error:NSError?)->Void) {
        
        
        let urlString = "http://api.euniversity.ba/api/students/attendance/get"
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
                        let attendancesData = try JSONDecoder().decode(AttendanceValue.self, from: responseData)
                        onResponse(attendancesData.value,nil)
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
    
    func getSemesterDetail(onResponse:@escaping (_ success:Attendances?, _ error:NSError?)->Void) {
        
        
        let urlString = "http://api.euniversity.ba/api/students/attendance/get"
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
                        let attendancesData = try JSONDecoder().decode(AttendanceValue.self, from: responseData)
                        onResponse(attendancesData.value,nil)
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
    
    func getCertificates(byAcademicYear:Bool,academicYearId:String,onResponse:@escaping (_ success:Certificates?, _ error:NSError?)->Void) {
        var urlString : String?
        
        if byAcademicYear {
            
            urlString = "https://api.euniversity.ba/api/students/certificates/get/?academicYearId=" + academicYearId
         } else {
            urlString = "https://api.euniversity.ba/api/students/certificates/get"
            
        }
        let url = URL(string:urlString ?? "")
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
                        let certificatesData = try JSONDecoder().decode(CertificateValue.self, from: responseData)
                        onResponse(certificatesData.value,nil)
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
    
    
    func getAttendanceDetail(syllabusID:String,onResponse:@escaping (_ success:AttendancesDetails?, _ error:NSError?)->Void) {
        
        
        let urlString = "https://api.euniversity.ba/api/students/attendance/get/?syllabusId=" + syllabusID
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
                        let attendancesDetailData = try JSONDecoder().decode(AttendanceDetailValue.self, from: responseData)
                        onResponse(attendancesDetailData.value,nil)
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
    
    func getExamPeriods(onResponse:@escaping (_ success:ExamPeriods?, _ error:NSError?)->Void) {
    
        let urlString = "https://api.euniversity.ba/api/students/examperiods/get"
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
                        let examPeriodsData = try JSONDecoder().decode(ExamPeriodsValue.self, from: responseData)
                        onResponse(examPeriodsData.value,nil)
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
    
    func getExamTerms(examTermId:Int,onResponse:@escaping (_ success:ExamTerms?, _ error:NSError?)->Void) {
        
        let urlString = "https://api.euniversity.ba/api/students/examterms/getbyexamperioid?examPeriodId=" + "\(examTermId)"
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
                        let examTermsData = try JSONDecoder().decode(ExamsValue.self, from: responseData)
                        onResponse(examTermsData.value,nil)
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
    
    func updateExam(ExamRegistrationID:Int,selected:Int,onResponse:@escaping (_ success:Certificate?, _ error:eUniversityError?)->Void) {
        
        var urlString = String()
            urlString = "https://api.euniversity.ba/api/students/examterms/UnregisterExamTerm?examRegistrationId=" + "\(ExamRegistrationID)"

        guard let url = URL(string:urlString) else {return}
        
        guard let accessToken = UserController.sharedController.accessToken else {
            return
        }
        
        
        let headers = [
            "Accept": "application/json",
            "Content-Type" :"application/json",
             "authToken":"\(accessToken)"
        ]
        
     
        Alamofire.request(url, method:.get, parameters:nil, encoding:URLEncoding.queryString, headers:headers).responseJSON { (response) in
            print(response)
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    NotificationCenter.default.post(name:.updatedExam, object: nil)
                    guard let responseData  = response.data  else {
                        return }
                    
                    do {
                        let certificateData = try JSONDecoder().decode(Certificate.self, from: responseData)
                        onResponse(certificateData,nil)
                    }
                    catch let jsnError{
                        print("jsonError",jsnError)
                    }
                default:
                    print("error with response status: \(status)")
                    if status == 401 {
                        do {
                            let errorData = try JSONDecoder().decode(eUniversityError.self, from:response.data! )
                            onResponse(nil,errorData)
                            
                        }
                        catch let jsnError{
                            print("jsonError",jsnError)
                        }
                    }
                }
            }
        }
    }
    
    
 func registerExam(ExamTermID:Int,onResponse:@escaping (_ success:Certificate?, _ error:eUniversityError?)->Void) {
        
        var urlString = String()
        urlString = "https://api.euniversity.ba/api/students/examterms/RegisterExamTerm"
        
        guard let url = URL(string:urlString) else {return}
        
        guard let accessToken = UserController.sharedController.accessToken else {
            return
        }
        
        
        let headers = [
            "Accept": "application/json",
            "Content-Type" :"application/json",
            "authToken":"\(accessToken)"
        ]
        
        let parameters = [
            "ExamTermID" : "\(ExamTermID)"
        ]
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseJSON { (response) in
            print(response)
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    NotificationCenter.default.post(name:.registeredExam, object: nil)
                    guard let responseData  = response.data  else {
                        return }
                    
                    do {
                        let certificateData = try JSONDecoder().decode(Certificate.self, from: responseData)
                        onResponse(certificateData,nil)
                    }
                    catch let jsnError{
                        print("jsonError",jsnError)
                    }
                default:
                    print("error with response status: \(status)")
                    if status == 401 {
                        do {
                            let errorData = try JSONDecoder().decode(eUniversityError.self, from:response.data! )
                            onResponse(nil,errorData)
                            
                        }
                        catch let jsnError{
                            print("jsonError",jsnError)
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    func getPayments(byAcademicYear:Bool,yearId:String,onResponse:@escaping (_ success:Payments?, _ error:NSError?)->Void) {
        var urlString = String()
        

        
        if byAcademicYear {
            urlString = "https://api.euniversity.ba/api/students/payments/get/?academicYearId=" + yearId
            
        } else {
             urlString = "https://api.euniversity.ba/api/students/payments/get"
            
        }
        
        
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
                        let paymentsData = try JSONDecoder().decode(PaymentsValue.self, from: responseData)
                        onResponse(paymentsData.value,nil)
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
    
    func getAcademicYears(onResponse:@escaping (_ success:AcademicYears?, _ error:NSError?)->Void) {
          let   urlString = "https://api.euniversity.ba/api/students/academicyears/get"
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
                        let academicYearsData = try JSONDecoder().decode(AcademicYearValues.self, from: responseData)
                        onResponse(academicYearsData.value,nil)
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
    
    func getCertificatesPurpose(onResponse:@escaping (_ success:CertificatePurposes?, _ error:NSError?)->Void) {
        let   urlString = "https://api.euniversity.ba/api/students/certificatepurposes/get"
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
                        let certificatePurposeData = try JSONDecoder().decode(CertifcatePurposeValue.self, from: responseData)
                        onResponse(certificatePurposeData.value,nil)
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
    
    func getCertificatesType(onResponse:@escaping (_ success:CertificateTypes?, _ error:NSError?)->Void) {
        let   urlString = "https://api.euniversity.ba/api/students/certificatetypes/get"
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
                        let certificateTypesData = try JSONDecoder().decode(CertifcateTypesValue.self, from: responseData)
                        onResponse(certificateTypesData.value,nil)
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
    
    func createCertificate(purposeID:Int,typeID:Int,note:String,onResponse:@escaping (_ success:Certificate?, _ error:eUniversityError?)->Void) {
        let urlString = "https://api.euniversity.ba/api/students/certificates/PostCertificate"
        guard let url = URL(string:urlString) else {return}
        let parameters : Parameters = ["StudentID" : "\(UserController.sharedController.StudentID ?? 0)",
                                       "CertificatePurposeID" : "\(purposeID)",
            "CertificateTypeID" : "\(typeID)","Note":note]
        let headers = [
            "Accept": "application/json",
            "Content-Type" :"application/json"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseJSON { (response) in
            print(response)
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    guard let responseData  = response.data  else {
                        return }
                    
                    do {  let certificateData = try JSONDecoder().decode(Certificate.self, from: responseData)
                        onResponse(certificateData,nil)
                    }
                    catch let jsnError{
                        print("jsonError",jsnError)
                    }
                default:
                    print("error with response status: \(status)")
                    if status == 401 {
                        do {
                            let errorData = try JSONDecoder().decode(eUniversityError.self, from:response.data! )
                            onResponse(nil,errorData)
                            
                        }
                        catch let jsnError{
                            print("jsonError",jsnError)
                        }
                    }
                }
            }
        }
    }
    
    func getReminders(onResponse:@escaping (_ success:Reminders?, _ error:NSError?)->Void) {
        let   urlString = "https://api.euniversity.ba/api/students/reminders/get"
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
                        let reminderData = try JSONDecoder().decode(ReminderValue.self, from: responseData)
                        onResponse(reminderData.value,nil)
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
