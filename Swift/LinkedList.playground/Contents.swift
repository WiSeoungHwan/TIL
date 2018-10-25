//
//  main.swift
//  LinkedList
//
//  Created by Wi on 25/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

class Node {
    let value: String
    var next: Node?
    init(value: String) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    var isEmpty: Bool {
        return head == nil ? true : false
    }
    var size: Int {
        return 0
    }
    func push(node: Node) {
        size += 1
        if isEmpty {
            head = node
            print("head pushed")
        }else{
            while node.next == nil{
                node.next = node
                print("pushed")
            }
        }
    } // 데이터 삽입
    
        func pop() -> String? {
            if isEmpty {
                print("No Node")
                return "No Node"
            }
            size -= 1
            while  {
                
            }
            return ""
        }  // 데이터 반출.
        func peek() -> String? {
            guard 
            return ""
        } // 마지막 데이터 확인
}

var linkedList = LinkedList()
var node1 = Node(value: "1")
var node2 = Node(value: "2")
var node3 = Node(value: "3")
linkedList.push(node: node1)
linkedList.push(node: node2)
linkedList.push(node: node3)
