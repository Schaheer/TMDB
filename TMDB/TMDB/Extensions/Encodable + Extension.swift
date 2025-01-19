//
//  Encodable + Extension.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    var removingEmptyStringDictionary: [String: Any]? {
        do {
            // Encode the object to JSON data
            let data = try JSONEncoder().encode(self)
            
            // Convert the JSON data to a dictionary
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            guard let dictionary = jsonObject as? [String: Any] else {
                return nil
            }
            
            // Recursively remove nil or NSNull values
            return dictionary.removingNullValues()
            
        } catch {
            print("Error converting to dictionary: \(error.localizedDescription)")
            return nil
        }
    }
}

fileprivate extension Dictionary where Key == String, Value == Any {
    /// Recursively removes NSNull values from a dictionary
    func removingNullValues() -> [String: Any] {
        var filteredDictionary = self
        
        for (key, value) in self {
            if value is NSNull {
                filteredDictionary.removeValue(forKey: key)
            } else if let stringValue = value as? String {
                if stringValue == "" {
                    filteredDictionary.removeValue(forKey: key)
                }
            } else if let dictionaryValue = value as? [String: Any] {
                filteredDictionary[key] = dictionaryValue.removingNullValues()
            } else if let arrayValue = value as? [Any] {
                filteredDictionary[key] = arrayValue.removingNullValues()
            }
        }
        
        return filteredDictionary
    }
}

fileprivate extension Array where Element == Any {
    /// Recursively removes NSNull values from an array
    func removingNullValues() -> [Any] {
        return self.compactMap { element in
            if element is NSNull {
                return nil
            } else if let dictionaryElement = element as? [String: Any] {
                return dictionaryElement.removingNullValues()
            } else if let arrayElement = element as? [Any] {
                return arrayElement.removingNullValues()
            } else {
                return element
            }
        }
    }
}
