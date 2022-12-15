//
//  Stack.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 15/12/22.
//

import Foundation

struct Stack<U> {
    
    var items: [U] = []
    
    mutating func push(_ item: U) {
        items.append(item)
    }
    
    @discardableResult
    mutating func pop() -> U? {
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
    
    mutating func peek() -> U? {
        return items.last
    }
}
