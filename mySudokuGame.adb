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
    type numArray is array(ElemRange) of ElemRange;
    type array_of_Array_type is array(ElemRange) of numArray;
    --type colNums is array(ElemRange) of ValRange;
    type boolElems is array(ElemRange) of boolean;
    --subtype myRandomInteger is Integer range 1 .. myInteger'Last;
    
    package randValNum is new Ada.Numerics.Discrete_Random(ElemRange);
    use randValNum;
    --package randElemNum is new Ada.Numerics.Discrete_Random(ElemRange);
    --use randElemNum;
    
    sudokuGame      : SudokuBoard         := (others=> (others=> 0));
    ElemValsFlags   : Elems_and_Vals      := (others=> (others=> False));
    elemBools       : boolElems           := (others => False);
    rowVals         : numArray            := (others => 1);
    colVals         : numArray            := (others => 1);
    array_of_arrays : array_of_Array_type := (others=> (others=> 1));
    valNum          : ElemRange;
    elemNum         : ElemRange;
    randNum         : Generator;
    rowIdx          : Integer             := 0;
    

begin -- Display_Board 
  
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put(Item => "-----------------------------------------------");
  Ada.Text_IO.New_Line;
  
  for init in ValRange
  loop
    rowVals(init) := init;
    --myInt.Put(Item => rowVals(init), Width => 3);
    rowIdx := rowIdx + 1;
    for rowIdx in ValRange'First .. ValRange'Last + 1
    loop
    rowVals(init) := rowIdx;
    array_of_arrays(init)(rowIdx) := rowVals(init);
    ----array_of_arrays(init)(rowelem) := rowVals(rowelem);
    myInt.Put(Item => rowVals(init), Width => 3);
    ----myInt.Put(Item => array_of_arrays(init)(rowelem), Width => 3);
    end loop;
  end loop;
  
  for Row in ValRange loop
    -- Display all columns of current row
      --Reset(valRandNum);
      --valNum := Random(valRandNum);
      --usedNumArray(Row) := valNum;
      --myInt.Put(Item => usedNumArray(Row), Width => 3);
    for Column in ValRange loop
      --for Column_i in ValRange loop
        --Reset(valRandNum);
        --valNum := Random(valRandNum);
        
        row_column_search:
        loop        
            -- Initialize random number generator
            Reset(randNum);            
            -- Determine cell number
            elemNum := Random(randNum);
            
            exit when elemNum = 56;            
        end loop row_column_search;          
        
        -- must loop until value less than 10 is found 
        -- due to not being able to use random_discrete package 
        -- more than once for different variable names of the same type but different variable ranges.       
        find_cell_value:
        loop 
            valNum := Random(randNum);
                exit when valNum < 10;
        end loop find_cell_value;
        
        --valNumArray(Column_i) := valNum;
      --end loop;
      Ada.Text_IO.Put(Item => " |");
      --if valNum not in sudokuGame( 
      --sudokuGame(Row,Column) := valNum;
      --for Column_j in ValRange loop
        --Reset(valRandNum);
        --valNum := Random(valRandNum);
        --if valNum /= valNumArray(Column_j) then 
        
          --must typecast variable since not able to use random_discrete package 
          --for than once for different variable names of the same type but different variable ranges.
          sudokuGame(Row,Column) := ValRange(valNum);
       --end if;          
      --  Reset(valRandNum);
      --  valNum := Random(valRandNum);
      --    --if valNum not in sudokuGame(:,Column) then 
      --    --    if valNum not in sudokuGame(Row,:) then
      --    --        sudokuGame(Row,Column) := valNum;
      --    --    end if;
      --    --end if;
      --  
      --end loop;
      --Ada.Text_IO.Put(Item => boolean'Image(ElemValsFlags(Row,Column)));
      --myInt.Put(Item => sudokuGame(Row,Column), Width => 3);
      --myInt.Put(Item => elemNum, Width => 3);
      --myInt.Put(Item => usedNumArray(Column), Width => 3);
      --valNum := valNum + 1;
    end loop;
    Ada.Text_IO.Put(Item => " |");
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put(Item => "-----------------------------------------------");
    Ada.Text_IO.New_Line;
      --myInt.Put(Item => valNum, Width => 3);
      --myInt.Put(Item => elemNum, Width => 3);
  end loop;
      --myInt.Put(Item => elemNum, Width => 3);
  
end mySudokuGame;














