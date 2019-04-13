//
//  FormatStringHelper.swift
//  Eazip
//
//  Created by Marie on 14/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation

extension String {
    var pascalCase: String {
        return self.components(separatedBy: " ")
            .map {
                if $0.count <= 3 {
                    return $0.uppercased()
                } else {
                    if $0.index(of: "-") != nil {
                        return $0.components(separatedBy: "-").map { $0.pascalCase }.joined(separator: "-")
                    } else {
                        return $0.capitalized
                    }
                }
            }
            .joined(separator: " ")
    }
}
