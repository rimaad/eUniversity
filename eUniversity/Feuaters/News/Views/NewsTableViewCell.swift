//
//  NewsTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 17/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    
    func populateCell(news:News) {
        newsTitleLabel.text = news.Title
        newsTextLabel.text = news.Text?.html2String
        newsDateLabel.text = news.Date
        newsImageView.image = setImage(imageID: news.AnnouncementIconID)
    }

    
    func setImage(imageID:Int) -> UIImage {
        
        switch imageID {
        case 0:
            return #imageLiteral(resourceName: "tip_default")
        case 1:
            return #imageLiteral(resourceName: "tip_info")
        case 2:
            return #imageLiteral(resourceName: "tip_datum")
        default:
         return #imageLiteral(resourceName: "tip_default")
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8),
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
