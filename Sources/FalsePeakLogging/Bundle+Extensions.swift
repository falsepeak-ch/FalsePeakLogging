//
//  Bundle+Extensions.swift
//  FalsePeakLogging
//
//  Created by Renimal on 21.07.2025
//

import Foundation

extension Bundle {
    
    private class Dummy {}
    
    public static let commons = Bundle(for: Bundle.Dummy.self)
    
    var displayAppName: String {
        
        if let displayName = infoDictionary?["CFBundleDisplayName"] as? String {
            displayName
        } else if let name = infoDictionary?["CFBundleName"] as? String {
            name
        } else {
            "Unknown"
        }
    }
    
    var displayBundleIdentifier: String {
        bundleIdentifier ?? "unknown"
    }
}
