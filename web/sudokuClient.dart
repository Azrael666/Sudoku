// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:Sudoku/sudoku.dart';

import 'dart:html';
import 'dart:async';



void main(){
  var controller= new SudokuController();


  var table = document.querySelector('#sudokuGameField');

  controller.getView().setTable(table);
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





    document.querySelector('#welcome').text ="hello world";
  var test_button0 = document.querySelector('#test-button0');
  test_button0.onClick.listen((e) => document.querySelector('#welcome').text ="mars");





  print("hello world");


}