// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of sudokulib;

class SudokuController {
  var game = new StandardSudoku();

  var view = new SudokuView();

  var selected_field_x = 0;
  var selected_field_y = 0;


  int get_selected_x() => selected_field_x;
  int get_selected_y() => selected_field_y;



  refresh_view() {
    /*

    if (game.validate() == 1) {
      window.alert("sucess");
    } else if(game.is_complete()==1) {
      window.alert("fail");
    }
    */

    view.drawAll();
  }



  erase_selected_field(){
    print("got erase");
    game.erase_field(selected_field_x, selected_field_y);
    refresh_view();
  }

  set_field(int val){

    print ("got set field $val");
    game.set_field_value(selected_field_x, selected_field_y, val);
    refresh_view();
  }

  set_selected_field(int x,int y){
    selected_field_y = y;
    selected_field_x = x;
    refresh_view();
  }


  move_up() {
    selected_field_y--;
    if (selected_field_y < 0) selected_field_y = 0;

    refresh_view();
  }

  move_down() {
    selected_field_y++;
    if (selected_field_y >= game.get_height())
      selected_field_y = game.get_height() - 1;

    refresh_view();
  }

  move_left() {
    selected_field_x--;
    if (selected_field_x < 0) selected_field_x = 0;

    refresh_view();
  }

  move_right() {
    selected_field_x++;
    if (selected_field_x >= game.get_width())
      selected_field_x = game.get_width() - 1;

    refresh_view();
  }

  SudokuController() {
    view.set_sudoku(game);
    view.setController(this);
  }

  SudokuView getView() => this.view;
}
