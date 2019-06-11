"use strict";

class BinarySearchTree {
  constructor() {
    this.root = null;
  }

  insertNumberNode(data, left = null, right = null) {
    let Node = {
      data,
      left,
      right
    };

    let currentNumberNode;
    if (!this.root) {
      // if not root, make it root by passing one
      this.root = Node;
    } else {
      currentNumberNode = this.root;
      while (currentNumberNode) {
        if (data < currentNumberNode.data) {
          if (!currentNumberNode.left) {
            currentNumberNode.left = Node;
            break;
          } else {

          }
        } else if (data > currentNumberNode.data) {
          if (!currentNumberNode.right) {
            currentNumberNode.right = Node;
            break;
          } else {
            currentNumberNode = currentNumberNode.right;
          }
        } else {
          console.log("Try a different value");
          break;
        }
      }
    }
  }




}
