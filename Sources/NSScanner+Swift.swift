// NSScanner+Swift.swift
// A set of Swift-idiomatic methods for NSScanner
//
// (c) 2015 Nate Cook, licensed under the MIT license

import Foundation

extension Scanner {
    
    // MARK: Strings
    
    /// Returns a string, scanned as long as characters from a given character set are encountered, or `nil` if none are found.
    func scanCharacters(from set: CharacterSet) -> String? {
        var value: NSString? = ""
        if scanCharacters(from: set, into: &value) {
            return value as String?
        }
        return nil
    }
    
    /// Returns a string, scanned until a character from a given character set are encountered, or the remainder of the scanner's string. Returns `nil` if the scanner is already `atEnd`.
    func scanUpToCharacters(from set: CharacterSet) -> String? {
        var value: NSString? = ""
        if scanUpToCharacters(from: set, into: &value) {
            return value as String?
        }
        return nil
    }
    
    /// Returns the given string if scanned, or `nil` if not found.
    @discardableResult func scanString(_ str: String) -> String? {
        var value: NSString? = ""
        if scanString(str, into: &value) {
            return value as String?
        }
        return nil
    }

    @discardableResult func scanString(_ str: NSString, options: NSString.CompareOptions) -> String? {
        let scanRange = NSRange(location: self.scanLocation, length: str.length)
        let string = self.string as NSString
        guard scanRange.location + str.length <= string.length else { return nil }

        let scanned = string.substring(with: scanRange)
        if (scanned.compare(str as String, options: options, range: nil, locale: nil) == .orderedSame) {
            self.scanLocation += str.length
            return str as String
        } else {
            return nil
        }
    }
    
    /// Returns a string, scanned until the given string is found, or the remainder of the scanner's string. Returns `nil` if the scanner is already `atEnd`.
    func scanUpTo(_ str: String) -> String? {
        var value: NSString? = ""
        if scanUpTo(str, into: &value) {
            return value as String?
        }
        return nil
    }
}
