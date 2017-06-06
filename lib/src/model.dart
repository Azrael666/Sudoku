// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of sudokulib;

class AbstractSudoku{

  int set_field_value(int x,int y,var val) =>0;
  /*
    0   white
    1   blue
    2   red
   */
  int get_colour_for_field(int y, int x) =>0;
  /*
   *    return
    *   0   solid
    *   1   double
   */

  int erase_field(int x,int y)=> -1;
  int get_border_for_field(int y, int x, int side)=>0;
  int is_complete() => 0;
  int validate() => 0;
  int get_width() =>-1;
  int get_height() => -1;
  int is_bold(int x,int y) => 0;
  int get_value(int x, int y) =>0;
  List get_symbols() => [];

}
class Nonomino extends AbstractSudoku{

}
class StandardSudoku extends AbstractSudoku{

  int width;
  int height;

  List<int> fields = new List(81);
  List<int> user_fields  = new List(81);

  Random r= new Random.secure();


  int get_field(int x, int y) {
    int coord = y*9+x;
    if(fields[coord]==0)
        return user_fields[coord];
    return fields[coord];
  }

  @override int get_width() => width;
  @override int get_height() => height;


  @override int get_colour_for_field(int y, int x){
    if(x==3 && y == 7)
      return 2;
    return 0;
  }

  sample(){

    fields = <int>[
      1,2,3,4,5,6,7,8,9,
      4,5,6,7,8,9,1,2,3,
      7,8,9,1,2,3,4,5,6,
      2,3,1,5,6,4,8,9,7,
      5,6,4,8,9,7,2,3,1,
      8,9,7,2,3,1,5,6,4,
      3,1,2,6,4,5,9,7,8,
      6,4,5,9,7,8,3,1,2,
      9,7,8,3,1,2,6,4,5];

    for(int i=0;i<81;i++){
      user_fields[i]=0;
    }

    fields[r.nextInt(81)] = 0;
    fields[r.nextInt(81)] = 0;


  }

  StandardSudoku(){
    this.width = 9;
    this.height = 9;
    //super.width = 9;
    //super.height = 9;

    sample();
  }

  @override int get_border_for_field(int y, int x, int side){
    /*
          side
          key value
          0   left
          1   bottom
          2   right
          3   top
     */
    if(side == 0){
      if(x == 0 || x == 3 || x == 6){
        return 1;
      }
      return 0;
    }
    else if(side == 1){
      if( y == 2 || y == 5 || y == 8 )
        return 1;
      return 0;
    }
    else if( side == 2){
      if( x == 2 || x== 5 || x == 8)
        return 1;
      return 0;
    }
    else if(side == 3) {
      if (y == 0 || y== 3 || y== 6)
        return 1;
      return 0;
    }

  }
  @override get_symbols() => [1,2,3,4,5,6,7,8,9];


  @override int set_field_value(int x,int y,var val){
    if(!val is int){
      print ("input for field is not an int: $val");
      return -1;
    }
    else if (val<0 || val>9){
      print("input not in range: $val");
      return -1;
    }
    else if(fields[y*9+x]!=0){
      print("this field is preset");
      return -1;
    }

    print("setting field value x:$x y:$y, cal:$val");
    user_fields[y*9+x] = val;
  }
  @override int is_complete(){
    for(int i=0;i<81;i++)
      if(fields[i]==0 && user_fields[i] ==0)
        return 0;
    return 1;

  }
  @override int validate(){
    // check rows and colomns
    for(int i = 0;i<9;i++) {
      int vertical = 1;
      int horziontal = 1;
      for (int i1 = 0; i1 < 9; i1++) {
        vertical *= get_field(i, i1);
        horziontal *= get_field(i1, i);

      }
      if (vertical != 362880 || horziontal != 362880) {
        print("vert,hori: $vertical, $horziontal");
        return 0;
      }
    }

    // check 3x3 cube
    for(int i =0; i<3;i++){
      for(int i1=0;i1<3;i1++){
        int cube =1;
        for(int i2=0;i2<3;i2++){
          for(int i3=0;i3<3;i3++){
            cube *= get_field(i*3+i2, i1*3+i3);
          }
        }
        if (cube!= 362880) {
          print("cube:$cube");
          return 0;
        }
      }
    }
    return 1;
  }


  @override int erase_field(int x,int y){
    user_fields[y*9+x] = 0;
  }

  @override int is_bold(int x,int y){
    if (fields[y*9+x]!=0)
      return 1;
    return 0;
  }

  @override int get_value(int x,int y){return get_field(x, y);}

}