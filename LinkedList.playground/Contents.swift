import UIKit

class Node {
    var value : Int = 0
    var nextNode : Node?
    
    init(_ value : Int , _ node : Node?) {
        self.value = value
        self.nextNode = node
    }
}

class LinkedList {
    var head : Node?
    
    func displayLinkedList() {
        var current = head
        while current != nil {
            print(current?.value ?? "abc")
            current = current?.nextNode
        }
    }
    func insert(_ value : Int)  {
        
        if head == nil {
            head = Node(value, nil)
            return
        }
        var current = head
        while current?.nextNode != nil{
            current = current?.nextNode
        }
        current?.nextNode = Node(value , nil)
    }
    
    
    func findLargestNumber() -> Node {
        var HighestNumber = 0
        var current = head
        var highestNode = Node.init(0, nil)
        while current != nil {
            if HighestNumber < current!.value {
                highestNode = current!
                HighestNumber = current!.value
            }
            current = current?.nextNode
        }
        return highestNode
    }
    
    func findSmallestNumber () -> Node {
        var smallestNumber = Int.max
        var smallestNode = Node.init(0, nil)
        var current = head
        
        while current != nil {
            if smallestNumber > current!.value {
                smallestNumber = current!.value
                smallestNode = current!
            }
            current = current!.nextNode

        }
        return smallestNode
    }
    
     func findMiddleNode() -> Node {
        if   head == nil {
            return Node.init(0, nil)
        }
           var slowNode = head
           var fastNode = head
        
        while fastNode != nil && fastNode?.nextNode != nil {
            fastNode = fastNode?.nextNode?.nextNode
            slowNode = slowNode?.nextNode
        }
        return slowNode!
       }
    
    
    func delete(value : Int)  {
        
        if head?.value == value {
            head = head?.nextNode
            return
        }
        var current = head
        var prev = current
        while current != nil && current?.value != value {
            prev = current
            current = current?.nextNode
        }
        prev?.nextNode = current?.nextNode
    
        
    }
}


var linkedList = LinkedList()
linkedList.insert(3)
linkedList.insert(-4)
linkedList.insert(1)
linkedList.insert(13)
linkedList.insert(9)
linkedList.insert(2)

linkedList.displayLinkedList()
//linkedList.delete(value: 5)
print("afteer deleteion")
//linkedList.displayLinkedList()
print("Highest Number in the linkedList is \(linkedList.findLargestNumber().value)")
print("Smallest Number in the linkedList is \(linkedList.findSmallestNumber().value)")
print("Middle of the  linkedList is \(linkedList.findMiddleNode().value)")
