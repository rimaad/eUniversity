//
//  NewsDetailViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 3/19/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var titleLabelText: UILabel!
    var news :News?
    @IBOutlet weak var titleDocument: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.height+100)
        ImagesController.sharedController.delegate = self
        titleLabelText.text = news?.Title
        textLabel.text = news?.Text?.html2String
        dateLabel.text = "\(news?.Date ?? "")\(" | ")\(news?.Author ?? "")"
        ImagesController.sharedController.getAnnouncmentsImages(announcmentID: "\(news?.AnnouncementID ?? 0)")
        if (news?.HasDocuments)! {
            
            downloadButton.isHidden = false
            titleDocument.text = ""
        }else {
            downloadButton.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    
    func openDocument() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NewsDetailViewController:ImagesControllerDelegate {
    func onSuccess(response:AnnouncementPhotos) {
        if  response.AnnouncementPhotos.count > 0 {
       guard let imageNews = response.AnnouncementPhotos[0].PhotoBase64 else {
        return
        }
         imageView.image = ImagesController.sharedController.decodeImage(imageString: imageNews)
    }
         }
    func onError() {
        
    }
}
