//
//  BaseViewController.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import UIKit

protocol BaseViewControllerLogic: AnyObject {
    func showToast(message: String, state: ToastState)
}

class BaseViewController: UIViewController, BaseViewControllerLogic {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showToast(message: String, state: ToastState) {
        let toast = CustomToast(type: state, message: message)
        toast.show()
    }
}
