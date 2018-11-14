//
//  NSObjectProperty.swift
//  CreateCustomTabBarUseCollectionView
//
//  Created by Wi on 14/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation
extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
