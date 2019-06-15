import Foundation

public class Node<T> {
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
}

public class BinarySearchTree<T: Comparable> {
    public var value: T
    public var parent: BinarySearchTree?
    public var left: BinarySearchTree?
    public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
}
