//
//  CustomTabBarNavigation.swift
//  MetronomoIOS
//
//  Created by Arthur Luiz Lara Quites on 17/01/20.
//  Copyright © 2020 Arthur Luiz Lara Quites. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarNavigation: UITabBarController {
    
    // dando o overload, podemos delegar para cada subclasse definir as orientações suportadas
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return self.selectedViewController!.supportedInterfaceOrientations
    }
}
