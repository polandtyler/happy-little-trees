import Foundation

// MARK: Helper Functions
extension BinarySearchTree {
    
    // MARK: Array -> BST
    public convenience init(array: [T]) {
        precondition(array.count > 0, "There must be at least one item in the array to build a BinarySearchTree.")
        self.init(value: array.first!)
        
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }

    public var isLeaf: Bool {
        return left == nil && right == nil
    }

    public var isLeftChild: Bool {
        return parent?.left === self
    }

    public var isRightChild: Bool {
        return parent?.right === self
    }

    // MARK: Insert
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    // MARK: Semi-visual output to visualize the tree
    public var description: String {
        var string = ""
        if let left = left {
            string += "(\(left.description)) <- "
        }
        string += "\(value)"
        if let right = right {
            string += " -> (\(right.description))"
        }
        return string
    }
    
    // MARK: Recombine
    public func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    // MARK: Min and Max
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
}
