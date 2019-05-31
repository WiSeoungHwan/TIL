//
//  Protocols.swift
//  UdemyInstargramCopy
//
//  Created by Wi on 30/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation


protocol UserProfileHeaderDelegate {
    
    func handleEditFollowTapped(for header: UserProfileHeader)
    func setUserStats(for header: UserProfileHeader)
}
