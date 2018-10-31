//
//  User.swift
//  FeedExample
//
//  Created by Wi on 31/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct Feed {
    var contents: String
    init?(dictionary:[String: String]) {
        guard let contents = dictionary["contents"] else {return nil}
        self.contents = contents
    }
}
