//
//  AlertUtil.swift
//  MetronomoIOS
//
//  Created by Arthur Luiz Lara Quites on 17/01/20.
//  Copyright © 2020 Arthur Luiz Lara Quites. All rights reserved.
//

import Foundation
import UIKit

class AlertUtil {
    class func present(msg: String, titulo: String, viewController: UIViewController, handler: @escaping () ->Void){
        let alert = UIAlertController(title: titulo, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(alerta: UIAlertAction!) in handler()}))
        viewController.present(alert, animated: true, completion: nil)
    }
}
