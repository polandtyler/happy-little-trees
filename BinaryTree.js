// Disclaimer: I do not profess to be an expert (or even very knowledgeable)
// with JavaScript, so please extend a bit of mercy :D - Tyler

"use strict";

class BinarySearchTree {
  constructor() {
    this.root = null;
  }



// INSERTION
/*
  If tree is empty, adds node with `data` as root
  Otherwise, calls insertNode to find the correct position
*/
  insert(data) {
    var newNode = new Node(data);

    if (this.root === null) {
      node.left = newNode;
    } else {
      tree.insertNode(this.root, newNode);
    }
  }

/*
  Compares the given `data` with the current node's data and moves left
  or right accordingly. Calls itself recursively until it finds
  the correct node (the one with a null value) and adds it there
*/
  insertNode(node, newNode) {
    // if data is less than Node
    // data move to left of tree
    if (newNode.data < node.data) {

      // if left is null, insert here
      if (node.left === null) {
        node.left = newNode;
      } else {
        // left is not null, call self recursively until null is found
        this.insertNode(node.left, newNode);
      }
    }

    // newNode data was greater than current node
    // so data moves to right of tree
    else {
      // if the right side is null, insert here
      if (node.right === null) {
        node.right = newNode;
      }

      // right side was not null, call self recursively until null is found
      else {
        this.insertNode(node.right, newNode);
      }
    }
  }

// DELETION
/*
  Recreates the root with the return value of `removeNode`
  (the tree without the removed value)
*/
  remove(data) {
    // re-init root with root of modified tree
    this.root = this.removeNode(this.root, data);
  }

  removeNode(node, key) {
    // check to see if root is null
    // if so, tree is empty
    if (node === null) {
      return null;
    }

    // if data to be removed is less than the root's data
    // move to left
    else if (key < node.data) {
      // move to left and call self recursively
      node.left = this.removeNode(node.left, key);
      return node;
    }

    // if data to be deleted is greater than roots data
    // move to the right subtree
    else if (key > node.data) {
      // move to right and call self recursively
      node.right = this.removeNode(node.right, key);
      return node;
    }

    // if you've reached this step, congratulations!
    // this IS the droid you're looking for.
    else {
      // if the node has no children
      if (node.left === null && node.right === null) {
        node = null;
        return node;
      }

      // if the node has a single child
      // move the node up and return (repeat for right and left)
      if (node.left === null) {
        node = node.right;
        return node;
      }

      if (node.right === null) {
        node = node.left;
        return node;
      }

      // NOTE: uses inorder traversal to find inorder successor and removed
      // inorder traversal (left, root, right)
      // method using parent pointer
      // 1. if the right subtree of node IS NOT null, find the min key-value in right subtree
      // 2. if the right subtree of node IS null, travel up the tree (using the parent pointer) until you see
      //    a node that is the left child of its parent. THAT node's parent is the successor.


      // otherwise, the node has max (two) children
      // 1. find the minimum of the children
      // 2. set the nodes data to the min
      var temp = this.findMinNode(node.right);
      node.data = temp.data;

      // 3.
      node.right = this.removeNode(node.right, temp.data);
      return node;
    }
  }

  // SEARCHING
  /*
    Finds the node with the minimum value, starting with the given node
  */
  findMinNode(node) {
    if (node.left === null) {
      return node;
    }

    // calls itself until it finds the leaf (node.left === null)
    else {
      return this.findMinNode(node.left);
    }
  }

  search(node, data) {
    // if the tree is empty return null
    if (node === null) {
      return null;
    }

    // if the node is less than the search term,
    // run self recursively on left subtree
    else if (data < node.data) {
      return this.search(node.left, data);
    }

    // if node is greater than search data,
    // run self recursively on right subtree
    else if (data > node.data) {
      return this.search(node.right, data);
    }

    // otherwise, congratulations!
    // this IS the droid you're looking for
    else {
      return node;
    }
  }
}
