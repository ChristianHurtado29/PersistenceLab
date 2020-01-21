//
//  FileManager+Extensions.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/21/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

extension FileManager {
    static func getDocumentsDirectory() -> URL {
       return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    // documents/schedules/plist "schedules.plist"
    static func pathToDocumentsDirectory(with filename: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
}
