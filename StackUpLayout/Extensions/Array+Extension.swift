//
//  Array+Extension.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 11/12/22.
//

import Foundation

extension Array {
    
    ///This now allows you to write the following:
    /// array[guarded: 5] ?? 0 // 0
    subscript(guarded idx: Int) -> Element? {
        
        guard (startIndex..<endIndex).contains(idx) else {
            return nil
        }
        return self[idx]
    }
    
    func isIndexExists(idx: Int) -> Bool {
        return (startIndex..<endIndex).contains(idx)
    }
    
    func getElementsAfter(index: Int) -> Array? {
        
        guard (startIndex..<endIndex).contains(index) else {
            return nil
        }
        let elements = self[index..<count]
        return Array(elements)
    }
}
