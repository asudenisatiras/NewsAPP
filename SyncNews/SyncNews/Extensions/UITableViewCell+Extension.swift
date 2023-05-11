//
//  UITableViewCell+Extension.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
        
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
