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
    
    var isHost: Bool {
        //return ('string' === typeof addr && isIP(addr)) || isDomain(addr) || addr === 'localhost'
        
        return false
        
    }
    
    var isPort: Bool {
        
        guard let a:Int = Int(self) else { return false }
        if (a > -1 || a < 65536) { return true }
        
        return false
        
    }
    
    

    
    
    var isLink: Bool { 
        
        let pattern = self as NSString
        
        ///^((@|%|&)[A-Za-z0-9\/+]{43}=\.[\w\d]+)(\?(.+))?$/
        
        let linkRegex = try? NSRegularExpression(pattern: "^(@|%|&)[A-Za-z0-9\\/+]{43}=\\.[\\w\\d]+$",options: .caseInsensitive)
        
        let matches = linkRegex?.matches(in: self, options: [], range: NSRange(location: 0, length: pattern.length)) .map {
            pattern.substring(with: $0.range)
        }
        
        if (matches?.isEmpty)! { return false }
        return true;
    
    }
    
    var isFeedID: Bool {
        
        let pattern = self as NSString
        
        // var feedIdRegex = exports.feedIdRegex = /^@[A-Za-z0-9\/+]{43}=\.(?:sha256|ed25519)$/
        
        let feedIdRegex = try? NSRegularExpression(pattern: "/^@[A-Za-z0-9\\/+]{43}=\\.(?:sha256|ed25519)$/",options: .caseInsensitive)
        
        let matches = feedIdRegex?.matches(in: self, options: [], range: NSRange(location: 0, length: pattern.length)) .map {
            pattern.substring(with: $0.range)
        }
        
        if (matches?.isEmpty)! { return false }
        return true;
        
    }
    
    var isMsgId: Bool {
        
        let pattern = self as NSString
        
        // var feedIdRegex = exports.feedIdRegex = /^@[A-Za-z0-9\/+]{43}=\.(?:sha256|ed25519)$/
        
        let msgIdRegex = try? NSRegularExpression(pattern: "/^%[A-Za-z0-9\\/+]{43}=\\.sha256$/",options: .caseInsensitive)
        
        let matches = msgIdRegex?.matches(in: self, options: [], range: NSRange(location: 0, length: pattern.length)) .map {
            pattern.substring(with: $0.range)
        }
        
        if (matches?.isEmpty)! { return false }
        return true;
        
    }
    
    var isBlobId: Bool {
        
        let pattern = self as NSString
        
        // var feedIdRegex = exports.feedIdRegex = /^@[A-Za-z0-9\/+]{43}=\.(?:sha256|ed25519)$/
        
        let blobIdRegex = try? NSRegularExpression(pattern: "/^&[A-Za-z0-9\\/+]{43}=\\.sha256$/",options: .caseInsensitive)
        
        let matches = blobIdRegex?.matches(in: self, options: [], range: NSRange(location: 0, length: pattern.length)) .map {
            pattern.substring(with: $0.range)
        }
        
        if (matches?.isEmpty)! { return false }
        return true;
        
    }
    
    
    
}




