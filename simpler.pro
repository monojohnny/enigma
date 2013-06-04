/* Coordinates are ROW, COLUMN */
/* Define Colours */
colour(red).
colour(orange).
colour(yellow).
colour(green).
colour(blue).
colour(violet).

/* Define first row  */

tile(0,0, colour(red) ).
tile(0,1, colour(orange) ).
tile(0,2, colour(yellow) ).
tile(0,3, colour(green) ).
tile(0,4, colour(blue) ).
tile(0,5, colour(violet) ).
/*Test Data - not in the puzzle!*/
/* tile(1,0, colour(blue) ). */

possible(Row, Column,  Colour) :-
	tile(Row, Column,  colour(Colour) ). /* is the specific tile defined */

/* need to split this up ; if we do NOT find a tile in the same column (ie, sameRow), we should pass this, but only after also ensuring no other (same row for instance) constraints are found...*/
possible(Row, Column,  Colour) :-
	\+tile(Row, Column, colour(C) ), C\==Colour,
		Colour \== CompareCol,
		DifferentRow \==Row, 
		tile(DifferentRow, Column,  colour(CompareCol) ),
 		Colour \==CompareRow,
		DifferentColumn \==Column, 
		tile(Row, DifferentColumn,  colour(CompareRow) ).

/*
		DifferentColumn \==Column, 
		Colour \==CompareRow.
	Row=Column, tile(DiagRow1, DiagCol1, colour(CompareDiagTL) ), DiagRow1\==Row, DiagCol1\==Column, DiagRow1=DiagCol1,Colour\==CompareDiagTL; 
	Row + Column is 5,  
		tile(DiagRow2, DiagCol2, colour(CompareDiagTR) ),
		DiagRow2\==Row, 
		DiagCol2\==Column, 
		DiagRow2+DiagCol2 is 5, 
		Colour\==CompareDiagTR. 
*/
