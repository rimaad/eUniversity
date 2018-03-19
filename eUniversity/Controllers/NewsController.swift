//
//  NewsController.swift
//  eUniversity
//
//  Created by Damir Ramic on 17/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol NewsControllerDelegate: class {
    func onSuccess(response:Announcements)
    func onError()
}

class NewsController: NSObject {

    weak var delegate : NewsControllerDelegate?
    static let sharedController = NewsController()
    var announcments : Announcements?
    let apiClient = ApiClient()
    
    func getNews() {
        apiClient.getNews(){ (response, error) in
            if response != nil  {
                self.announcments = response
                self.delegate?.onSuccess(response:response!)
            } else if error != nil {
                self.delegate?.onError()
            }
        }
    }
    
    func getNewsBySyllabus(SyllabusID:Int) {
        apiClient.getNewsBySyllabus(syllabusID: SyllabusID) { (response, error) in
            if response != nil  {
                self.announcments = response
                self.delegate?.onSuccess(response:response!)
            } else if error != nil {
                self.delegate?.onError()
            }
        }
        }
    }
