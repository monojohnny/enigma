colour(red).
colour(orange).
colour(yellow).
colour(green).
colour(blue).
colour(violet).

tile(0,0, colour(red) ).
tile(0,1, colour(orange) ).
tile(0,2, colour(yellow) ).
tile(0,3, colour(green) ).
tile(0,4, colour(blue) ).
tile(0,5, colour(violet) ).

rowBlocked(Row, Column, Colour) :-
	tile(Row, ColumnCompare, colour(Colour) ),
	ColumnCompare \== Column.
columnBlocked(Row, Column, Colour) :-
	tile(RowCompare, Column, colour(Colour) ),
	RowCompare \== Row.

topLeftDiagBlocked(Row, Column, Colour) :-
	tile(RowCompare, ColumnCompare, colour(Colour) ),
	RowCompare=ColumnCompare,
	Row=Column,
	Row\==RowCompare, Column\==ColumnCompare.

topRightDiagBlocked(Row, Column, Colour) :-
	tile(RowCompare, ColumnCompare, colour(Colour) ),
	5 is RowCompare + ColumnCompare,
	5 is Row + Column,
	Row\==RowCompare, Column\==ColumnCompare.

possible(Row, Column, Colour) :-
	tile(Row, Column, colour(Colour) ).

possible(Row, Column, Colour) :-
	\+tile(Row, Column, Colour),
	\+rowBlocked(Row, Column, Colour),
	\+columnBlocked(Row, Column, Colour),
	\+topLeftDiagBlocked(Row, Column, Colour),
	\+topRightDiagBlocked(Row, Column, Colour).

/* Test for Top-Left Diag to start with only...this can only work 'downwards!' */
fourInDiag(StartRow, StartColumn, C1, C2, C3, C4 ) :-
	StartRow=StartColumn,
	possible(StartRow, StartColumn, C1),
	Row2 is 1+StartRow, Col2 is 1+StartColumn, possible(Row2, Col2, C2),
	Row3 is 2+StartRow, Col3 is 2+StartColumn, possible(Row3, Col3, C3),
	Row4 is 3+StartRow, Col4 is 3+StartColumn, possible(Row4, Col4, C4).
	
/* Test for Top-Right Diag to start with only...this can only work 'downwards' */
fourInDiag(StartRow, StartColumn, C1, C2, C3, C4 ) :-
	5 is StartRow + StartColumn,
	possible(StartRow, StartColumn, C1),
	Row2 is StartRow+1 ,Col2 is StartColumn-1, possible(Row2, Col2, C2),
	Row3 is StartRow+2 ,Col3 is StartColumn-2, possible(Row3, Col3, C3),
	Row4 is StartRow+3 ,Col4 is StartColumn-3, possible(Row4, Col4, C4).
