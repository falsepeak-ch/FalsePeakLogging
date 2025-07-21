//
//  Log.swift
//  BringExtensionKit
//
//  Created by Beat on 13.03.18.
//

import Foundation
import OSLog

public enum Log {
    
    // MARK: Constants
    
    #if DEBUG
        private static let logger = Logger(subsystem: Bundle.main.displayBundleIdentifier, category: Bundle.main.displayAppName)
    #endif
    
    // MARK: Logger
    
    #if DEBUG
    
        /// Log info message (info).
        public static func i(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
            logger.info("\(format(message, filename: filename, function: function, line: line), privacy: .public)")
        }
    
        /// Log verbose message (trace).
        public static func v(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
            logger.trace("\(format(message, filename: filename, function: function, line: line), privacy: .public)")
        }
    
        /// Log debug message (debug).
        public static func d(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
            logger.debug("\(format(message, filename: filename, function: function, line: line), privacy: .public)")
        }
    
        /// Log class debug message (debug).
        public static func c(_ message: String, filename: String = #file, function: String = #function, line: Int = #line) {
            logger.debug("\(format(message, filename: filename), privacy: .public)")
        }
    
        /// Log warning message (warning).
        public static func w(_ message: String, filename: String = #file, function: String = #function, line: Int = #line) {
            logger.warning("[WARNING] ⚠️ \(format(message, filename: filename, function: function, line: line), privacy: .public)")
        }
    
        /// Log error message (fault).
        public static func e(_ message: String, filename: String = #file, function: String = #function, line: Int = #line) {
            logger.fault("[ERROR] ⛔️ \(format(message, filename: filename, function: function, line: line), privacy: .public)")
        }
    
        /// Log error  description (fault).
        public static func ed(_ error: Error, filename: String = #file, function: String = #function, line: Int = #line) {
            logger.fault("[ERROR] ⛔️ \(format(error.localizedDescription, filename: filename, function: function, line: line), privacy: .public)")
        }
    
        private static func format(_ message: String, filename: String, function: String, line: Int) -> String {
            "[\((filename as NSString).lastPathComponent):\(line)] \(function) \(message)"
        }
    
        private static func format(_ message: String, filename: String) -> String {
            "[\((filename as NSString).lastPathComponent)] \(message)"
        }
    #else
        public static func i(_ message: String = "") {}
        public static func v(_ message: String = "") {}
        public static func d(_ message: String = "") {}
        public static func c(_ message: String) {}
        public static func w(_ message: String) {}
        public static func e(_ message: String) {}
        public static func ed(_ error: Error, filename: String = #file, function: String = #function, line: Int = #line) {}
    #endif
}
