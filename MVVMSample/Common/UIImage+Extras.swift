//
//  UIImage+Extras.swift
//  LiebherrBaumaBranding
//
//  Created by Dennis Hirschgänger on 12.09.18.
//

import UIKit

public extension UIImage {
    
    /// Creates a image with given size and filled with the given `color`.
    /// Default size of the image is 1px x 1px
    ///
    /// - parameter color: the background color of the image
    /// - parameter size: the width and height of the image
    ///
    /// - returns: the new image or nil if creating the image fails
    public static func image(withColor color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
