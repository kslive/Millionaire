//
//  Message.swift
//  Millionaire
//
//  Created by Eugene Kiselev on 15.12.2020.
//

import UIKit

enum MessageType {
    case error(message: String)
    case success(message: String)
    case info(message: String)
}

class Message: NSObject {
    static let shared = Message.init()
    
    private override init() {}
    
    private func alertViewController(title: String, action: String, message: String) -> UIAlertController {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: action, style: .default))
        return alertViewController
    }
    
    func show(_ message: MessageType, sender: UIViewController, after delay: TimeInterval = 0) {
        switch message {
        case .error(message: let message):
            sender.present(alertViewController(title: MessageConstants.Error.title, action: MessageConstants.action, message: MessageConstants.Error.message(in: message)), animated: true)
        case .info(message: let message):
            sender.present(alertViewController(title: MessageConstants.Info.title, action: MessageConstants.action, message: message), animated: true)
        case .success(message: let message):
            sender.present(alertViewController(title: MessageConstants.Success.title, action: MessageConstants.action, message: message), animated: true)
        }
    }
}
