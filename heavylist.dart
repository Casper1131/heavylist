import 'dart:async';
//used for timed foreach
class HeavyList{
  List _list;
  int index;
  int length;
  List _registered;
  HeavyList(
    List list
    ){
    this._registered = new List();
    this._list = list;
    this.index = -1;
    this.length = this._list.length;
  }
  void addItem(item){
    this._list.add(item);
    this.length += 1;
  }
  void removeItem(item){
    int index = _list.indexOf(item);
    if(index >= 0){
      this._list.removeAt(index);
      this.length -= 1;
    }
  }
  void loop(
    Duration time,
    Function finished,
    Function each
  ){
    var resume,h;
    resume = (){
      new Timer(time,h);
    };
    h = (){
      this.index+= 1;
      if(this.index<this.length){
        this._registered.add(this._list[this.index]);
      }
      this.index == this.length ? finished(this._list) : each(this._list[this.index],resume);
    };
    resume();
  }
  void empty(){
    this._list = new List();
    this.index = -1;
    this.length = 0;
  }
  void clearRegistered(){
    this._registered.forEach((item){
       this._list.remove(item);
    });
    this._registered = new List();
    this.index  = -1;
    this.length = this._list.length;
  }
  List getList(){
    return this._list;
  }
  int getSize(

      ){
    return this._list.length;
  }
}