//
//  Message.swift
//  Monday Guaded
//
//  Created by Bobba Kadush on 6/3/19.
//  Copyright © 2019 SRUSSELLH. All rights reserved.
//

import Foundation
import CloudKit

struct Constants {
    static let recordKey = "Message"
    static let textKey = "text"
    static let timestampKey = "timestamp"
}

class Message {
    var text: String
    var timestamp: Date
    var ckRecordID: CKRecord.ID
    
    init(text:String, timestamp: Date, ckRecordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.text = text
        self.timestamp = timestamp
        self.ckRecordID = ckRecordID
    }
    
    convenience init?(ckRecord: CKRecord) {
        guard let text = ckRecord[Constants.textKey] as? String, let timestamp = ckRecord[Constants.timestampKey] as? Date else {return nil}
        
        self.init(text: text, timestamp: timestamp, ckRecordID: ckRecord.recordID)
    }
}

extension CKRecord {
    convenience init(message: Message){
        self.init(recordType: Constants.recordKey, recordID: message.ckRecordID)
        self.setValue(message.text, forKey: Constants.textKey)
        self.setValue(message.timestamp, forKey: Constants.timestampKey)
    }
}

extension Message: Equatable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        <#code#>
    }
    
    
}
