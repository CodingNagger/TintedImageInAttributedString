//
//  ViewController.swift
//  TintedImageInAttributedString
//
//  Created by JD on 28/04/2016.
//  Copyright © 2016 IamNguele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelWithColoredImage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the label text color as red
        labelWithColoredImage.textColor = .blueColor()
        
        // align the text to the center
        labelWithColoredImage.textAlignment = .Center;
        
        // load the image
        let image: UIImage = UIImage(named: "swift_logo")!.imageWithRenderingMode(.AlwaysTemplate)
        
        // create the text attachment
        let textAttachment: NSTextAttachment = NSTextAttachment()
        
        // assign the loaded image to the text attachment
        textAttachment.image = image
        
        // create an attributed string with our text attachment
        let attributedStringWithImage: NSAttributedString = NSAttributedString(attachment: textAttachment);
        
        // now create the full string to display
        let stringToDisplay = "That text written at 4:20AM\nfor reasons."
        let fullAttributedString: NSMutableAttributedString =
            NSMutableAttributedString(string: "\(stringToDisplay) ")
        
        // append space the string to display with our string containing the image
        fullAttributedString.appendAttributedString(attributedStringWithImage)
        
        // color the image part of the string
        fullAttributedString.addAttribute(
            NSForegroundColorAttributeName,
            value: UIColor.greenColor(),
            range: NSMakeRange(
                stringToDisplay.startIndex.distanceTo(
                    stringToDisplay.endIndex), attributedStringWithImage.length))
        
        // assign it to the label
        labelWithColoredImage.attributedText = fullAttributedString;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

