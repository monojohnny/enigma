/* Not working - suspect we are now jumping out of second 'possible' if row==column (when we really both tests need to be checked...)*/
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
