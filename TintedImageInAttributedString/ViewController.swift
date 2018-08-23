//
//  ViewController.swift
//  TintedImageInAttributedString
//
//  Created by Jean-Dominique Nguele on 23/08/2018.
//  Copyright © 2018 CodingNagger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelWithColoredImage: UILabel!
    
    override func viewDidLoad() {
        labelWithColoredImage.textColor = .blue
        
        labelWithColoredImage.textAlignment = .center
        
        if let image = UIImage(named:  "swift_logo", in: Bundle.main, compatibleWith: nil) {
            let templateImage = image.withRenderingMode(.alwaysTemplate)
            
            let textAttachment = NSTextAttachment()
            textAttachment.image = templateImage
            
            let attributedStringWithImage = NSAttributedString(attachment: textAttachment);
            
            let stringToDisplay = "That text written at 4:20AM\nfor reasons."
            
            let fullAttributedString = NSMutableAttributedString(string:"\(stringToDisplay) ")
            
            fullAttributedString.append(attributedStringWithImage)
            
            fullAttributedString.addAttribute(
                NSAttributedString.Key.foregroundColor,
                value: UIColor.green,
                range: NSMakeRange(
                    stringToDisplay.count, attributedStringWithImage.length))
            
            labelWithColoredImage.attributedText = fullAttributedString
        }
    }
}

