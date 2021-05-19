//
//  Extensions.swift
//  MVVM-C
//
//  Created by Josh R on 5/18/21.
//

import UIKit

extension UIViewController: UIAdaptivePresentationControllerDelegate {}

//MARK: UIApplication
extension UIApplication {
    //Source: https://stackoverflow.com/questions/26667009/get-top-most-uiviewcontroller
    class func getTopMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}
