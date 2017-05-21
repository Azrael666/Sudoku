// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of sudokulib;

class SudokuController {



   var selected_field_x =0;
   var selected_field_y = 0;

   refresh_view(){
     view.drawAll();
   }


   move_up(){
     selected_field_y--;
     if(selected_field_y<0)
       selected_field_y = 0;

     refresh_view();
   }

   move_down(){
     selected_field_y++;
     if(selected_field_y>= game.get_height())
       selected_field_y = game.get_height()-1;

     refresh_view();

   }

   move_left(){
     selected_field_x --;
     if(selected_field_x<0)
       selected_field_x =0;

     refresh_view();

   }
   move_right(){
     selected_field_x++;
     if(selected_field_x>= game.get_width())
       selected_field_x = game.get_width()-1;

     refresh_view();



   }


  var game = new StandardSudoku();

  var view = new SudokuView();



  SudokuController () {
    view.set_sudoku(game);
  }

  getView() => this.view;
}