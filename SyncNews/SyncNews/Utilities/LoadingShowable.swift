//
//  LoadingShowable.swift
//  SyncNews
//
//  Created by Asude Nisa Tıraş on 11.05.2023.
//


import UIKit

protocol LoadingShowable where Self: UIViewController {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {
    func showLoading() {
        LoadingView.shared.startLoading()
    }
    
    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}

