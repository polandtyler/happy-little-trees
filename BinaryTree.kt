class Node<T>(
    var value: T
    var left: Node? = null
    var right: Node? = null)

class BinarySearchTree {
    var rootNode = Node("")
    var currentNode = Node("")

    /* Set up the tree with initial data */
    fun initialize(data: String, yesAnswer: String, noAnswer: String) {
        rootNode = Node(data = data, yesAnswer = Node(yesAnswer), noAnswer = Node(noAnswer) )
    }

    fun insert(currentNode: Node, data: String, userAnswer: String) {
        currentNode.left = Node(value = currentNode.data)
        currentNode.right = Node(userAnswer)
        currentNode.data = data
    }
}