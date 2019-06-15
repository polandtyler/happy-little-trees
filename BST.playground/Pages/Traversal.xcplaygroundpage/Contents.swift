import Foundation

// MARK: Recursive traversals
extension BinarySearchTree {
    
    public func inorderTraversal(process: (T) -> Void) {
        left?.inorderTraversal(process: process)
        process(value)
        right?.inorderTraversal(process: process)
    }
    
    public func preorderTraversal(process: (T) -> Void) {
        process(value)
        left?.preorderTraversal(process: process)
        right?.preorderTraversal(process: process)
    }
    
    public func postorderTraversal(process: (T) -> Void) {
        left?.postorderTraversal(process: process)
        right?.postorderTraversal(process: process)
        process(value)
    }
}

let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 12, 1])

printInorder()
printPreorder()
printPostorder()


func printInorder() {
    tree.inorderTraversal { value in print("Inorder: \(value)") }
    print("-------------------------")
}

func printPreorder() {
    tree.preorderTraversal { value in print("Preorder: \(value)") }
    print("-------------------------")
}

func printPostorder() {
    tree.postorderTraversal { value in print("Postorder: \(value)") }
    print("-------------------------")
}

extension BinarySearchTree {
// You can do some cool things with traversals...
    
// EX: add a map function that calls the transform closure on each node in the tree and collects the results in an array
// works by calling traversing the tree in order
    public func map(transform: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(transform: transform) }
        a.append(transform(value))
        if let right = right { a += right.map(transform: transform) }
        return a
    }
    
    // using the map
    func doubleAndAddToArray() -> [Int] {
        return tree.map { $0 * 2 }
    }
}

print("Map In Action:\n")
print(tree.doubleAndAddToArray())
print("-------------------------")




