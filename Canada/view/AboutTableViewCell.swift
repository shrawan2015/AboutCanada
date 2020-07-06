//
//  AboutTableViewCell.swift
//  Canada
//
//  Created by ShrawanKumar Sharma on 05/07/20.
//  Copyright © 2020 Shrawan. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptiion: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var gallaryImage: CustomImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var about:About?{
        didSet{
            descriptiion.text = about?.description
            title.text = about?.title
            gallaryImage.loadImageUsingUrlString(urlString: about?.imageHref ?? "")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
