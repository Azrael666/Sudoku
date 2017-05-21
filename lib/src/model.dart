// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of sudokulib;

class AbstractSudoku{
  int width;
  int heigth;


  SudokuView view;

  void setView(SudokuView v){
    this.view = v;
  }

  /*
    0   white
    1   blue
    2   red
   */
  int get_colour_for_field(int y, int x){
    if(x==3 && y == 7)
      return 2;
    return 0;
  }



  /*
   *    return
    *   0   solid
    *   1   double
   */
  int get_border_for_field(int y, int x, int side){
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

  int get_style_for_field(int pos){
    return  0;
  }

  int get_width(){return this.width;}
  int get_height(){return this.heigth;}

  int get_value_for_field(int x, int y){return 0;}



}
class Nonomino extends AbstractSudoku{

}
class StandardSudoku extends AbstractSudoku{



  StandardSudoku(){
    this.width = 9;
    this.heigth = 9;
    //super.width = 9;
    //super.height = 9;
  }


  @override int get_value_for_field(int x,int y){return x+y;}



}