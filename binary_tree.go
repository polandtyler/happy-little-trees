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
	t.root.Insert(node)
}

func (t *Tree) Find(val int) *Node {
	if t.root == nil {
		return nil
	}
	return t.root.Find(val)
}

// Node Methods

func (n *Node) Insert(newNode *Node) {
	if newNode.val < n.val {
		if n.left == nil {
			n.left = newNode
		} else {
			n.left.Insert(newNode)
		}
	} else {
		if n.right == nil {
			n.right = newNode
		} else {
			n.right.Insert(newNode)
		}
	}
}

func (n *Node) Find(val int) *Node {
	if n != nil {
		if n.val == val {
			return n
		} else if val < n.val {
			n.left.Find(val)
		} else {
			n.right.Find(val)
		}
	}

	return nil
}
