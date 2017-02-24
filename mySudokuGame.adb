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
    type boolElems is array(ValRange) of boolean;
    type array_of_array_type is array(ValRange) of boolElems;
    --type colNums is array(ElemRange) of ValRange;
    --subtype myRandomInteger is Integer range 1 .. myInteger'Last;
    
    package randValNum is new Ada.Numerics.Discrete_Random(ElemRange);
    use randValNum;
    --package randElemNum is new Ada.Numerics.Discrete_Random(ElemRange);
    --use randElemNum;
    
    sudokuGame    : SudokuBoard         := (others=> (others=> 0));
    rowColumnMat  : SudokuBoard         := (others=> (others=> 0));
    ElemValsFlags : Elems_and_Vals      := (others=> (others=> False));
    elemBools     : boolElems           := (others => False);
    rowVals       : numArray            := (others => 1);
    colVals       : numArray            := (others => 1);
    array_of_rows : array_of_array_type := (others=> (others=> False));
    array_of_cols : array_of_array_type := (others=> (others=> False));
    rowColIdx     : Integer             := 1;
    valCount      : Integer             := 1;
    valNum        : ElemRange;
    rowNum        : ValRange;
    colNum        : ValRange;
    elemNum       : ElemRange;
    randNum       : Generator;
    

begin -- Display_Board 
  
  --Ada.Text_IO.New_Line;
  --Ada.Text_IO.Put(Item => "-----------------------------------------------");
  --Ada.Text_IO.New_Line;
  
  for i in ValRange
  loop
    for j in ValRange
    loop
        rowColumnMat(i,j) := rowColIdx;
        --myInt.Put(Item => rowColumnMat(i,j), Width => 3); 
        rowColIdx := rowColIdx + 1;   
    end loop;
    --Ada.Text_IO.New_Line; 
  end loop;
  
  for Row in ValRange loop
    -- Display all columns of current row
      --Reset(valRandNum);
      --valNum := Random(valRandNum);
      --usedNumArray(Row) := valNum;
      --myInt.Put(Item => usedNumArray(Row), Width => 3);
      
    for Column in ValRange loop
    
      -- Initialize random number generator
      Reset(randNum);      
        
        -- must loop until value less than 10 is found 
        -- due to not being able to use random_discrete package 
        -- more than once for different variable names of the same type but different variable ranges.       
        find_cell_value:
        loop 
          valNum := Random(randNum); 
            if valNum < 10 then
              find_elem_num:
              loop        
                  -- Determine cell number
                  elemNum := Random(randNum);
                    if ElemValsFlags(valNum,elemNum) = false then 
                     exit 
              end loop find_elem_num;
            end if;
            
          --Ada.Text_IO.New_Line;
          --myInt.Put(Item => valCount, Width => 3);
          valCount := valCount + 1;
          exit when valNum < 10;
        end loop find_cell_value;
  
        find_row_column:
        for init in ValRange
        loop
          --rowVals(init) := init;
          --myInt.Put(Item => rowVals(init), Width => 3);
          for rowElem in ValRange
          loop
            rowNum := init;
            colNum := rowElem;
            exit find_row_column when rowColumnMat(init,rowElem) = elemNum;
          --rowVals(init) := rowElem;
          --array_of_arrays(init)(rowElem) := rowVals(init);
          --array_of_arrays(init)(rowelem) := rowVals(rowelem);
          --myInt.Put(Item => rowVals(init), Width => 3);
          --myInt.Put(Item => array_of_arrays(init)(rowelem), Width => 3);
          end loop;
        end loop find_row_column;
        
        --set_row_bools:
        --for rows in ValRange
        --  loop
        --    for value in ValRange
        --      loop
        --        array_of_rows() 
        --      end loop;
        --  
        --  end loop set_row_bools;
        
        --valNumArray(Column_i) := valNum;
      --end loop;
      --Ada.Text_IO.Put(Item => " |");
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
    --Ada.Text_IO.Put(Item => " |");
    --Ada.Text_IO.New_Line;
    --Ada.Text_IO.Put(Item => "-----------------------------------------------");
    --Ada.Text_IO.New_Line;
      --myInt.Put(Item => valNum, Width => 3);
      --myInt.Put(Item => elemNum, Width => 3);
  end loop;
      Ada.Text_IO.New_Line;
      myInt.Put(Item => rowNum, Width => 3);
      myInt.Put(Item => colNum, Width => 3);
      myInt.Put(Item => elemNum, Width => 3);
      Ada.Text_IO.New_Line;
      myInt.Put(Item => valCount, Width => 3);
      Ada.Text_IO.New_Line;
      myInt.Put(Item => valNum, Width => 3);
  
end mySudokuGame;














