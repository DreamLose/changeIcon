//
//  UINavigationBar-Extention.swift
//  IconChange
//
//  Created by 2020 on 2020/9/3.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit
extension UINavigationBar {
    func apply(gradient colors : [UIColor]) {
        var frameAndStatusBar: CGRect = self.bounds
        frameAndStatusBar.size.height += kStatusH // 包含状态栏
        setBackgroundImage(UINavigationBar.gradient(size: frameAndStatusBar.size, colors: colors), for: .default)
    }
    
    //MARK: ------- 将view转成图片
    static func gradient(size : CGSize, colors : [UIColor]) -> UIImage? {
        // 将colors 转成cgcolors
        let cgcolors = colors.map { $0.cgColor }
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        defer { UIGraphicsEndImageContext() }
        var locations : [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgcolors as NSArray as CFArray, locations: &locations) else { return nil }
        context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: size.width, y: 0.0), options: [])   
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
