//
//  ssb-ref.swift
//  sscb swift
//
//  Created by sami on 2018/06/01.
//  Copyright © 2018年 osuuskunta hastur. All rights reserved.
//

import Foundation

//https://github.com/ssbc/ssb-ref



typealias ssbref = String

extension ssbref {
    
    var isLink: Bool { 
        
        let pattern = self as NSString
        
        ///^((@|%|&)[A-Za-z0-9\/+]{43}=\.[\w\d]+)(\?(.+))?$/
        
        let linkRegex = try? NSRegularExpression(pattern: "/^(@|%|&)[A-Za-z0-9\\/+]{43}=\\.[\\w\\d]+$/",options: .caseInsensitive)
        
        let matches = linkRegex?.matches(in: self, options: [], range: NSRange(location: 0, length: pattern.length)) .map {
            pattern.substring(with: $0.range)
        }
        
    
        return true;
    
    }
    
}




