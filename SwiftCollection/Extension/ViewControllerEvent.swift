//
//  ViewControllerEvent.swift
//  SwiftCollection
//
//  Created by onewh on 2018/7/11.
//  Copyright © 2018年 onewh. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController:BaseViewControllerProtocol {
//    override func viewDidAppear(_ animated: Bool) {
//        self.viewDidAppear(animated)
//    }

}

extension BaseViewControllerProtocol {
    func viewDidAppear(_ animated: Bool) {
        self.viewDidAppear(animated)
        print(#function)
    }
}
