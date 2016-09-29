//: Playground - noun: a place where people can play

import CoreImage
import UIKit

class JasonDrawView: UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        // set transparent so we still see the image
//        self.backgroundColor = .yellowColor() //.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) not implemented")
    }
    
    override func drawRect(rect: CGRect)
    {
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center
        
        let textFontAttributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(62),
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSParagraphStyleAttributeName: textStyle
        ]
        
        let sizeOfText: CGSize = "Plebby".sizeWithAttributes(textFontAttributes)
        
        let textOrigin = CGPointMake(70, 10)
        
        let centerOfTextRectX = textOrigin.x + sizeOfText.width/2.0
        let centerOfTextRectY = textOrigin.y + sizeOfText.height/2.0
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0))
        
        let rads: CGFloat = atan2(0.75226400671941029, 1.1327425844281331)
        
        CGContextConcatCTM(context, CGAffineTransformMakeTranslation(centerOfTextRectX, centerOfTextRectY))
        CGContextConcatCTM(context, CGAffineTransformMakeRotation(rads))
        CGContextConcatCTM(context, CGAffineTransformMakeTranslation(-centerOfTextRectX, -centerOfTextRectY))
        
        //"Plebby".drawInRect(rect, withAttributes: textFontAttributes)
        "Plebby".drawAtPoint(textOrigin, withAttributes: textFontAttributes)
    }
}

let jasonView: JasonDrawView = JasonDrawView(frame: CGRectMake(0,0,301,402))


