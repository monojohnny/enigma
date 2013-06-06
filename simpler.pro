colour(red).
colour(orange).
colour(yellow).
colour(green).
colour(blue).
colour(violet).

row(0).
row(1).
row(2).
row(3).
row(4).
row(5).
column(0).
column(1).
column(2).
column(3).
column(4).
column(5).

tile(row(0), column(0), colour(red) ).
tile(row(0), column(1), colour(orange) ).
tile(row(0), column(2), colour(yellow) ).
tile(row(0), column(3), colour(green) ).
tile(row(0), column(4), colour(blue) ).
tile(row(0), column(5), colour(violet) ).

tile(0,0, colour(red) ).
tile(0,1, colour(orange) ).
tile(0,2, colour(yellow) ).
tile(0,3, colour(green) ).
tile(0,4, colour(blue) ).
tile(0,5, colour(violet) ).

grid(Row, Column, Colour):-
	tile( row(Row), column(Column), colour(Colour) ).


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
	colour(C1), colour(C2), colour(C3), colour(C4),
	C1\==C2, C1\==C3, C1\==C4, C2\==C3, C2\==C4, C3\==C4,
	possible(StartRow, StartColumn, C1),
	Row2 is 1+StartRow, Col2 is 1+StartColumn, possible(Row2, Col2, C2),
	Row3 is 2+StartRow, Col3 is 2+StartColumn, possible(Row3, Col3, C3),
	Row4 is 3+StartRow, Col4 is 3+StartColumn, possible(Row4, Col4, C4).
	
/* Test for Top-Right Diag to start with only...this can only work 'downwards' */
fourInDiag(StartRow, StartColumn, C1, C2, C3, C4 ) :-
	5 is StartRow + StartColumn,
	colour(C1), colour(C2), colour(C3), colour(C4),
	C1\==C2, C1\==C3, C1\==C4, C2\==C3, C2\==C4, C3\==C4,
	possible(StartRow, StartColumn, C1),
	Row2 is StartRow+1 ,Col2 is StartColumn-1, possible(Row2, Col2, C2),
	Row3 is StartRow+2 ,Col3 is StartColumn-2, possible(Row3, Col3, C3),
	Row4 is StartRow+3 ,Col4 is StartColumn-3, possible(Row4, Col4, C4).

/* We are also given the state of another row - we are just not told which , and since it is a mirror of the top-row, we need to use the diag rule to find where it fits */
/* We are being slightly cheeky here and rewriting the requirement in terms of the already defined row1, rather than having open ended args here...*/
/* Thinking we can cheekier again and use recursion here... ? (hence that 'Rownum<6' to ensure we have an exit clause....) */
rowFits(Rownum):-
	Rownum<6,
/* Instantiate (in reverse order to row1) our colours */
	tile(0,0, colour(C5) ),
	tile(0,1, colour(C4) ),
	tile(0,2, colour(C3) ),
	tile(0,3, colour(C2) ),
	tile(0,4, colour(C1) ),
	tile(0,5, colour(C0) ),
	dummy=dummy.

	/* construct fourInDiag tests here - using 'Rownum' as the 'anchor'...*/
	/*TBD:*/

