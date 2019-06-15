import Foundation
import UIKit

extension BinarySearchTree {
    
    @discardableResult
    public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        // if right != nil
        if let right = right {
            // set the minimum from right side to the replacement
            replacement = right.minimum()
        // if left is not nil
        } else if let left = left {
            // set the minimum from left side to the replacement
            replacement = left.maximum()
        // right and left were both nil
        } else {
            // nil out replacement
            replacement = nil
        }
        
        // then call self again
        replacement?.remove()
        
        // Put the replacement on currentNode's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node: replacement)
        
        // currentNode is no longer part of the tree... clean it up.
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
}
