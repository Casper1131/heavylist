# heavylist
Dart asynchronous list
This is an asynchous list written in dart
>Example usage


                    
###Example
  ```HeavyList list = new HeavyList([1,2,3]);
  list.loop(
      new Duration(microseconds: 3),
      (data){
        list.empty();
      },
      (item,resume){
        print(item);
	//move to next item
        resume();
  });	
```
