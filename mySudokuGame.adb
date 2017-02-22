with Ada.Text_Io;
use Ada.Text_Io;
with Ada.Float_Text_Io;
with Ada.Integer_Text_Io;
with Ada.Numerics.Discrete_Random;

procedure mySudokuGame is

    package myInt is new Integer_IO(Integer); use myInt;
    package myFloat is new Float_IO(Float); use myFloat;

    subtype ValRange is Positive range 1 .. 9;
    subtype ElemRange is Positive range 1 .. 81;
    type SudokuBoard is array(ValRange, ValRange) of Integer;
    type Elems_and_Vals is array(ValRange, ElemRange) of boolean;
    type subBoard is array(1..3,1..3) of Integer;
    type blockList is array(ValRange) of subBoard;
    type rowNums is array(ElemRange) of ValRange;
    type colNums is array(ElemRange) of ValRange;
    type boolElems is array(ElemRange) of boolean;
    --subtype myRandomInteger is Integer range 1 .. myInteger'Last;
    
    package myRandomNum is new Ada.Numerics.Discrete_Random(ValRange);
    use myRandomNum;
    
    sudokuGame   : SudokuBoard := (others=> (others=> 0));
    elemBools    : boolElems   := (others => False);
    --usedNumArray : UsedNums    := (others => 0);
    --elemNumArray : UsedNums    := (others => 0);
    elemNum      : ValRange;
    randNum      : Generator;
    --colNum  : Generator;
    

begin -- Display_Board 

  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put(Item => "-----------------------------------------------");
  Ada.Text_IO.New_Line;
  
  Populate_Game_Board:
  for Row in ValRange loop
    -- Display all columns of current row
      --Reset(randNum);
      --elemNum := Random(randNum);
      --usedNumArray(Row) := elemNum;
      --myInt.Put(Item => usedNumArray(Row), Width => 3);
    for Column in ValRange loop
      --for Column_i in ValRange loop
        Reset(randNum);
        elemNum := Random(randNum);
        --elemNumArray(Column_i) := elemNum;
      --end loop;
      Ada.Text_IO.Put(Item => " |");
      --if elemNum not in sudokuGame( 
      --sudokuGame(Row,Column) := elemNum;
      --for Column_j in ValRange loop
        --Reset(randNum);
        --elemNum := Random(randNum);
        --if elemNum /= elemNumArray(Column_j) then 
          --sudokuGame(Row,Column) := elemNum;
       --end if;          
      --  Reset(randNum);
      --  elemNum := Random(randNum);
      --    --if elemNum not in sudokuGame(:,Column) then 
      --    --    if elemNum not in sudokuGame(Row,:) then
      --    --        sudokuGame(Row,Column) := elemNum;
      --    --    end if;
      --    --end if;
      --  
      --end loop;
      myInt.Put(Item => sudokuGame(Row,Column), Width => 3);
      --myInt.Put(Item => usedNumArray(Column), Width => 3);
      --elemNum := elemNum + 1;
    end loop;
    Ada.Text_IO.Put(Item => " |");
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put(Item => "-----------------------------------------------");
    Ada.Text_IO.New_Line;
  end loop Populate_Game_Board; 
  
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put(Item => "-----------------------------------------------");
  Ada.Text_IO.New_Line;
  
  for Row in ValRange loop
    -- Display all columns of current row
      --Reset(randNum);
      --elemNum := Random(randNum);
      --usedNumArray(Row) := elemNum;
      --myInt.Put(Item => usedNumArray(Row), Width => 3);
    for Column in ValRange loop
      --for Column_i in ValRange loop
        Reset(randNum);
        elemNum := Random(randNum);
        --elemNumArray(Column_i) := elemNum;
      --end loop;
      Ada.Text_IO.Put(Item => " |");
      --if elemNum not in sudokuGame( 
      --sudokuGame(Row,Column) := elemNum;
      --for Column_j in ValRange loop
        --Reset(randNum);
        --elemNum := Random(randNum);
        --if elemNum /= elemNumArray(Column_j) then 
          sudokuGame(Row,Column) := elemNum;
       --end if;          
      --  Reset(randNum);
      --  elemNum := Random(randNum);
      --    --if elemNum not in sudokuGame(:,Column) then 
      --    --    if elemNum not in sudokuGame(Row,:) then
      --    --        sudokuGame(Row,Column) := elemNum;
      --    --    end if;
      --    --end if;
      --  
      --end loop;
      myInt.Put(Item => sudokuGame(Row,Column), Width => 3);
      --myInt.Put(Item => usedNumArray(Column), Width => 3);
      --elemNum := elemNum + 1;
    end loop;
    Ada.Text_IO.Put(Item => " |");
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put(Item => "-----------------------------------------------");
    Ada.Text_IO.New_Line;
  end loop;
  
end mySudokuGame;














