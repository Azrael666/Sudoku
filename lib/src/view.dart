// Copyright (c) 2017, Dirk Teschner. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of sudokulib;

class SudokuView {

  SudokuController controller;
  AbstractSudoku sudoku;
  TableElement table;
  TableElement input_table;
  ParagraphElement header_line;



  set_header_line(ParagraphElement p){
    header_line  = p;
  }

  set_input_table(TableElement it){
    input_table = it;
    init();
  }

  void setController(SudokuController c){
    controller = c;
  }

  void setTable(TableElement htmlTable){
    this.table = htmlTable;

  }

  void set_sudoku(AbstractSudoku s){
    this.sudoku = s;

  }
  void update_header_line(){
    if ( header_line is! ParagraphElement)
      return;


    if(sudoku.validate()==1){
      header_line.text = "sucess";
      header_line.style.color = "green";
    }
    else if(sudoku.is_complete() == 0){
      header_line.text = "not yet done";
      header_line.style.color = "black";
    }
    else if(sudoku.is_complete() == 1){
      header_line.text = "fail";
      header_line.style.color = "red";
    }

  }

  void init(){
    var symbols = sudoku.get_symbols();

    int cell_count =0;
    input_table.children.clear();

    TableRowElement tr = input_table.insertRow(0);

    for(var s in symbols){
      if(cell_count>=3){
        tr = input_table.insertRow(0);
        cell_count = 0;
      }



        TableCellElement tce = tr.insertCell(0);
        tce.text = "$s";
        tce.onClick.listen((event){
          controller.set_field(s);
        });

      tce.className = "input_cell";
      cell_count ++;

    }
    TableRowElement tr2 = input_table.insertRow(input_table.childNodes.length-1);
    TableCellElement clear = tr2.insertCell(0);
    clear.className = "input_cell";
    clear.text =" erase";
    clear.onClick.listen((e){controller.erase_selected_field();});
  }


  void drawField(int pos, var style){

  }

  void drawAll(){
    print("got drawAll");
    print("sudoku: ${this.sudoku ?? "null"}");
    print("table: ${this.table ?? "null"}");


    update_header_line();


    //print("table:"+ this.table ?? "null") ;
    if( sudoku != null && table != null ){
      table.children.clear();
     // table.style.border_collapse = "collapse";



    for(int i=0;i<sudoku.get_width();i++){
        var tr = table.insertRow(i);

        for(int i1=0;i1<sudoku.get_height();i1++){
            var td = tr.insertCell(i1);
            if (sudoku.get_value(i,i1) != 0)
              td.text = "${sudoku.get_value(i,i1)}";// y:$i x:$i1";
            else
              td.text= "";

            if(sudoku.is_bold(i, i1)==1)
              td.style.fontWeight = "bold";
            else
              td.style.color = "green";

            var left = sudoku.get_border_for_field(i,i1, 0);
            var bottom =  sudoku.get_border_for_field(i,i1, 1);
            var right =  sudoku.get_border_for_field(i,i1, 2);
            var top =  sudoku.get_border_for_field(i,i1, 3);

            td.style.borderLeft = (left==1?"solid":"double");
            td.style.borderBottom = (bottom==1?"solid":"double");
            td.style.borderRight = (right==1?"solid":"double");
            td.style.borderTop = (top==1?"solid":"double");

           // td.style.backgroundColor = (sudoku.get_colour_for_field(i,i1)==0?"white":"red");

            if(i1 == controller.get_selected_y() && i == controller.get_selected_x())
              td.style.backgroundColor = "blue";


            td.onClick.listen((event){
              controller.set_selected_field(i, i1);
            });
        }
      }


    }else{
      print("not drawing");
    }

  }
  void reset(){

  }





}