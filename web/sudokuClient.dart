// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:Sudoku/sudoku.dart';

import 'dart:html';
import 'dart:async';



void main(){
  var controller= new SudokuController();


  TableElement table = document.querySelector('#sudokuGameField');
  TableElement input_table = document.querySelector("#input_table");


  ParagraphElement header_line = document.querySelector("#header_line");



  controller.getView().setTable(table);
  controller.getView().set_input_table(input_table);
  controller.getView().set_header_line(header_line);
  controller.getView().drawAll();


  window.onKeyDown.listen((KeyboardEvent e) {
    print("keyboardEvent:${e.keyCode}");

    if (e.keyCode == 37)
      controller.move_left();
    if (e.keyCode == 38)
      controller.move_up();
    if (e.keyCode == 39)
      controller.move_right();
    if (e.keyCode == 40)
      controller.move_down();
  }
  );










  print("hello world");


}