//
//  ImagesController.swift
//  eUniversity
//
//  Created by Damir Ramic on 27/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  ImagesControllerDelegate: class {
    func onSuccess(response:AnnouncementPhotos)
    func onError()
}

class ImagesController: NSObject {
    weak var delegate : ImagesControllerDelegate?
    static let sharedController = ImagesController()
    let apiClient = ApiClient()
   // var images = [Image]
    
    func getAnnouncmentsImages(announcmentID:String) {
        apiClient.getAnnouncmentsImages(announcmentId:announcmentID) { (response, error) in
            
            if response != nil {
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
    
    func decodeImage(imageString:String) -> UIImage {
        let dataDecoded : Data = Data(base64Encoded: imageString, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
         return decodedimage!
        
    }
}
