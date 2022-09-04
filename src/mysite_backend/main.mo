import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Int "mo:base/Int";

actor {

 /***
  调用函数并打印结果
  */
  public func quicksort(arr : [Int]) {
      //将不可变的数组转成可变数组
      var mArr=Array.thaw<Int>(arr);
      qsort(mArr,0,mArr.size());
     
  };

  /**
  *  快速排序
  */
  private func qsort(mArr : [var Int], start : Nat, end : Nat)  {
    
    var base = mArr[start];
    //i和j记录数组的角标
    var i : Nat = start;
    var j : Nat = end;
    while (i < j) {
      while (mArr[j] >= base) j -= 1;
      while (mArr[i] <= base) i += 1;
      swap(mArr, i, j);
    };
    swap(mArr, start, i);
    //Array.freeze 将可变数组转成不可变数组
    qsort(mArr, start, j -1);
    qsort(mArr, j +1, end);
     //打印结果
      for( item in mArr.keys()){
         Debug.print("item:" # Int.toText(mArr[item]));
      }
  };
  /**
  * 数组中交换数据
  */
  private func swap(arr : [var Int], left : Nat, right : Nat) {
    let temp = arr[left];
    arr[left] := arr[right];
    arr[right] := temp;
  };

  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
