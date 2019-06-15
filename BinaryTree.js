// Disclaimer: I do not profess to be an expert (or even very knowledgeable)
// with JavaScript, so please extend a bit of mercy :D - Tyler

"use strict";

class BinarySearchTree {
  constructor() {
    this.root = null;
  }



// INSERTION
  insert(data) {
    var newNode = new Node(data);

    if (this.root === null) {
      node.left = newNode;
    } else {
      tree.insertNode(this.root, newNode);
    }
  }

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


}
