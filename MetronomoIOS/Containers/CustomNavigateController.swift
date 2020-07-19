//
//  CustomNavigateController.swift
//  Exemplos
//
//  Created by Arthur Luiz Lara Quites on 11/12/19.
//  Copyright © 2019 Arthur Luiz Lara Quites. All rights reserved.
//


import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
    
    // dando o overload, podemos delegar para cada subclasse definir as orientações suportadas
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return self.topViewController!.supportedInterfaceOrientations
    }
}

