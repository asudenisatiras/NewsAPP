//
//  File.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 17.05.2023.
//

import UIKit


extension UIView {

   @IBInspectable var cornerRadius: CGFloat{
       get{return self.cornerRadius}
       set{
            self.layer.cornerRadius = newValue
        }
    }
}
