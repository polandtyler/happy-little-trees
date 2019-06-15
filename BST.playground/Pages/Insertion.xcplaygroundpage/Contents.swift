import Foundation

// MARK: INSERTION
extension BinarySearchTree {
    public func insert(value: T) {
        
        // Check to see if there's a left value
        if value < self.value {
            if let left = left {
                // Recursively call insert to repeat the process
                left.insert(value: value)
            }
                
                // Left is nil, create new node
            else {
                left = BinarySearchTree(value: value)
                // ...and set parent to root
                left?.parent = self
            }
        }
            
            // Repeat the process for right side
        else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
        
    }
}

// MARK: Insertion Test
let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 12, 1])
print(tree)




