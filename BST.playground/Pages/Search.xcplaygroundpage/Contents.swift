import Foundation
import UIKit

// MARK: Search
extension BinarySearchTree {
    
    // Recursive
    public func searchRecursive(value: T) -> BinarySearchTree? {
        if value < self.value {
            // not quite the droid youre looking for
            return left?.searchRecursive(value: value)
        } else if value > self.value {
            // still not quite right...
            return right?.searchRecursive(value: value)
        } else {
            // You've found the droid you're looking for!
            return self
        }
    }
    
    public func searchIterative(_ value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let unwrappedNode = node {
            if value < unwrappedNode.value {
                node = unwrappedNode.left
            } else if value > unwrappedNode.value {
                node = unwrappedNode.right
            } else {
                return node
            }
        }
        
        return nil
    }
}

// MARK: Insertion Test

/*
 NOTE: If there are duplicate items in the tree, search() returns the "highest" node
        because we start searching from the root downwards.
*/
let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 12, 9, 3, 8, 3, 5])

// Should return a tree
tree.searchRecursive(value: 2)
tree.searchIterative(2)

// Should return nil
tree.searchRecursive(value: 99)
tree.searchIterative(99)

// Should return a single value
tree.searchRecursive(value: 9)
tree.searchIterative(9)

tree.searchRecursive(value: 3)




