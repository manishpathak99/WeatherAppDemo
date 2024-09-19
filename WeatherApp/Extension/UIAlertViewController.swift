//
//  UIAlertViewController.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import UIKit

extension UIAlertController {

    public static func make(title: String,
                            message: String,
                            cancelTitle: String? = nil,
                            okTitle: String,
                            preferredStyle: UIAlertAction.Style = .default,
                            preferredControllerStyle: UIAlertController.Style = .alert,
                            onCancel handler: ((UIAlertAction) -> Void)? = nil,
                            onOk okHandler: ((UIAlertAction) -> Void)? = nil,
                            onDidShow completion: (() -> Void)? = nil) -> UIAlertController {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredControllerStyle)
        if let cancelTitle = cancelTitle, let handler = handler {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: handler)
            alertController.addAction(cancelAction)
        }

        let okAction = UIAlertAction(title: okTitle, style: preferredStyle, handler: okHandler)
        alertController.addAction(okAction)
        return alertController
    }
}
