package main

import "fmt"

func main() {
	fmt.Println("needs tests")
}

// Types

type Tree struct {
	root *Node
}

type Node struct {
	val   int
	left  *Node
	right *Node
}

// Tree Methods
func (t *Tree) Insert(node *Node) {
	if t.root == nil {
		t.root = node
		return
	}
	insert(t.root, node)
}

func (t *Tree) Find(val int) *Node {
	if t.root == nil {
		return nil
	}
	return find(t.root, val)
}

func (t *Tree) FindWhere(pred func(*Node) bool) *Node {
	if t.root == nil {
		return nil
	}
	return findWhere(t.root, pred)
}

// Node Methods

func insert(rootNode *Node, newTreeNode *Node) {
	if newTreeNode.val < rootNode.val {
		if rootNode.left == nil {
			rootNode.left = newTreeNode
		} else {
			insert(rootNode.left, newTreeNode)
		}
	} else {
		if rootNode.right == nil {
			rootNode.right = newTreeNode
		} else {
			insert(rootNode.right, newTreeNode)
		}
	}
}

func find(n *Node, val int) *Node {
	if n != nil {
		if n.val == val {
			return n
		} else if val < n.val {
			find(n.left, val)
		} else {
			find(n.right, val)
		}
	}

	return nil
}

func findWhere(n *Node, pred func(*Node) bool) *Node {
	if n != nil {
		if pred(n) {
			return n
		}
		findWhere(n.left, pred)
		findWhere(n.right, pred)
	}

	return n
}
