
// By : Mousa Salha   -PALESTINE- 
void main() {


  Stack stack1 = Stack();
  print('\n challeng 1 for stack : ');
  List<int> numbers = [1,2,3,4,5];
  print('original numbers ');
  print(numbers);
  print('in reverse order');
  stack1.reversestack(numbers); // 5 , 4 , 3 , 2 , 1 


  String mystr = '((2)+(((3))))'; // it will give true
  String mystr2 = '(((2)+(((3))))'; // it will give false

  print('\n challenge 2 for stack : ');

  Stack stack2 = Stack();
  print('is  ${stack2.checkpar(mystr)}');
  print('is  ${stack2.checkpar(mystr2)}');
  // print(checkpar(mystr)); 
  // print(checkpar(mystr2));

  print('\n challenge 1 for LinkedList : ');
    Challeng1 linkedList1 = Challeng1();


  linkedList1.addNewNode(5);
  linkedList1.addNewNode(4);
  linkedList1.addNewNode(3);
  linkedList1.addNewNode(2);
  linkedList1.addNewNode(1);


  linkedList1.printReverse();


  
  
  print('\n challenge 2 for LinkedList : ');

  Challeng2 linkedList2 = Challeng2();
  linkedList2.addNewNode(5);
  linkedList2.addNewNode(4);
  linkedList2.addNewNode(3);
  linkedList2.addNewNode(2);
  linkedList2.addNewNode(1);

  linkedList2.printMiddleNode();


  print('\n challenge 3 for LinkedList : ');

  Challeng3 linkedList3 = Challeng3();
  linkedList3.addNewNode(10);
  linkedList3.addNewNode(9);
  linkedList3.addNewNode(8);
  linkedList3.addNewNode(7);
  linkedList3.addNewNode(6);
  // linked list is like this             6 -> 7 -> 8 -> 9 -> 10 
  linkedList3.reversemylist();
                        // will be      10 -> 9 -> 8 -> 7 -> 6 


  print('\n challenge 4 for linked list : ');
  Challeng4 challeng4 = Challeng4();
  challeng4.addNewNode(5);
  challeng4.addNewNode(6);
  challeng4.addNewNode(5);
  challeng4.addNewNode(5);

  challeng4.removeoccurrences(5);

}

class Stack {
void reversestack(List<int> list){
  for (int i = list.length -1 ;i >=0; i--){
    print(list[i]);
  } 
}

bool checkpar(String str){
  List<String> mystack = [];
  print('**this string \n $str ');
  for (int i =0 ; i< str.length ; i++){
    String currentchar = str[i];

    if (currentchar == '(' || currentchar == '{' || currentchar == '[' ){
      // add it to mystack
      mystack.add(currentchar);

    }
    else if (currentchar == ')' || currentchar == '}' || currentchar == ']'){
      // first check mystack ?

      if (mystack.isEmpty){
        return false;
      }
      String topMyStack = mystack.removeLast();
      if (!((currentchar == ')' && topMyStack=='(') || 
          (currentchar == '}' && topMyStack == '{') ||
          (currentchar == ']' && topMyStack == '[') )){

            //then it will be false 
            return false;
          }
    }
  }
  
    return mystack.isEmpty;
    

}
}

class Node {
  dynamic data;
  Node? next;

  Node(this.data, [this.next]);
}

class LinkedList {
  Node? head;

  void addNewNode(dynamic data) {   // the linked list 0 -> 1 -> 2 -> null
    Node addnode = Node(data);   // add 5  
    addnode.next = head;         // 5 -> 0 -> 1 -> 2 -> null 
    head = addnode;

  }

}
class Challeng1 extends LinkedList{
  void printLL() {
    Node? current = head;
    
    while(current != null) {  // if the current = null then  
      print(current.data);           // its the end of the data
      current = current.next;

    }
    
  }
  void printreverse(Node? node) {
    if (node == null) {
      return;
    }

    printreverse(node.next);
    print(node.data);
  }


  void printReverse() {
    print('the original linked list ');
    printLL();
    print('the linked list in reversd order ');
    printreverse(head);
  }
}

class Challeng2 extends LinkedList{
  
  Node? midnode (){
    Node? current = head;
    
    if(head == null ) {
      return null;
    }

    int length = 0 ;
    while(current != null){
      
      current = current.next;
      length++ ;
      }

    current = head;

    for (int i =0 ; i < length ~/ 2 ; i++){
      current = current?.next;
      
    }
    return current;
    
  }
   void printMiddleNode() {
    Node? middleNode = midnode();
    middleNode != null ? print('the middle node is  : ${middleNode.data}') 
    : print('linked list empty ');
    
  }
}


class Challeng3 extends LinkedList {
  
  void reversemylist(){
    Node? current = head;
    Node? prev = null ;
    Node? mynext ; 

    while(current != null){
      mynext = current.next;
      current.next = prev ; 
      prev = current;
      current = mynext ;

    }

      head = prev ; // to print from the head 
      current = head;
      while(current != null ){
        
        print(current.data);
        current = current.next;
      }

  }
}


class Challeng4 extends LinkedList {
  

  void removeoccurrences(dynamic x ){
    
    if(head == null){
      return ;
    }

    while(head != null && head?.data == x){
      head = head?.next ;

    }

    Node? current = head ;
    Node? prev = null ;

    while (current != null){
      if (current.data == x ){  // if x = the data of the node then remove
        prev!.next = current.next ; // this node and skip to the next
        current = current.next;
      }
      else {
        prev = current ;   // go to the next node remove  
        current = current.next;

      }


      current = head ;
      print('removed occurrences of $x');
      print('the linked list : ');
      while(current != null){
        print(current.data);
        current = current.next;
      }
    }


  }
}