// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of sudokulib;

class SudokuView {


  AbstractSudoku sudoku;
  var table;

  void setTable(var htmlTable){
    this.table = htmlTable;

  }

  void set_sudoku(AbstractSudoku s){
    this.sudoku = s;

  }

  void setWidth(int w){

  }
  void setHeight(int h){

  }


  void drawField(int pos, var style){

  }

  void drawAll(){
    print("got drawAll");
    print("sudoku: ${this.sudoku ?? "null"}");
    print("table: ${this.table ?? "null"}");



    //print("table:"+ this.table ?? "null") ;
    if( sudoku != null && table != null ){
      table.children.clear();


      for(int i=0;i<sudoku.get_width();i++){
        var tr = table.insertRow(i);

        for(int i1=0;i1<sudoku.get_height();i1++){
            var td = tr.insertCell(i1);
            td.text = "${sudoku.get_value_for_field(i,i1)} $i $i1";

            td.style.width = "2cm";
            td.style.height = "2cm";
            td.style.borderRight = "solid";
            td.style.borderTop = "double";

            var left = sudoku.get_border_for_field(i,i1, 0);
            var bottom =  sudoku.get_border_for_field(i,i1, 1);
            var right =  sudoku.get_border_for_field(i,i1, 2);
            var top =  sudoku.get_border_for_field(i,i1, 3);

            td.style.borderLeft = (left==1?"solid":"double");
            td.style.borderBottom = (bottom==1?"solid":"double");
            td.style.borderRight = (right==1?"solid":"double");
            td.style.borderTop = (top==1?"solid":"double");

            td.style.backgroundColor = (sudoku.get_colour_for_field(i,i1)==0?"white":"red");


        }
      }


    }else{
      print("not drawing");
    }

  }
  void reset(){

  }





}