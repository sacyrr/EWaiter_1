//
//  Utils.swift
//  Ewaiter_1
//
//  Created by sachin on 24/01/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static func createViewController(id:String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id)
        return vc
    }
    
}
