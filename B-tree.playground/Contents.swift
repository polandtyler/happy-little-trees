import Foundation

class BTreeNode<Key: Comparable, Value> {
    unowned var owner: BTree<Key, Value>
    
    fileprivate var keys = [Key]()
    fileprivate var values = [Value]()
    var children: [BTreeNode]?
    
    var isLeaf: Bool {
        return children == nil
    }
    
    var numberOfKeys: Int {
        return keys.count
    }
    
    init(owner: BTree<Key, Value>) {
        self.owner = owner
    }
    
    convenience init(owner: BTree<Key, Value>, keys: [Key], values: [Value], children: [BTreeNode]? = nil) {
        self.init(owner: owner)
        self.keys += keys
        self.values += values
        self.children = children
    }
}

// MARK: Search
extension BTreeNode {
    
    func value(for key: Key) -> Value? {
        var index = keys.startIndex
        
        while (index + 1) < keys.endIndex && keys[index] < key {
            index = (index + 1)
        }
        
        if key == keys[index] {
            return values[index]
        } else if key < keys[index] {
            return children?[index].value(for: key)
        } else {
            return children?[index + 1].value(for: key)
        }
    }
}

// MARK: Insertion
extension BTreeNode {
    
}

public class BTree<Key: Comparable, Value> {
    
}
