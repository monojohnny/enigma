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


/* Need to use a 'cut' here I think */
possible(Row, Column,  Colour) :-
	tile(Row, Column,  colour(Colour) ); /* is the specific tile defined */
(
	tile(DifferentRow, Column,  colour(CompareCol) ), DifferentRow \==Row, Colour \== CompareCol, /* Make sure no-conflict on the column */
	tile(Row, DifferentColumn,  colour(CompareRow) ), DifferentColumn \==Column, Colour \==CompareRow); /* Make sure no-conflicts in the row */
	Row=Column, tile(DiagRow1, DiagCol1, colour(CompareDiagTL) ), DiagRow1\==Row, DiagCol1\==Column, DiagRow1=DiagCol1,Colour\==CompareDiagTL; /*Top Left Diag*/
	Row + Column is 5,  /* Top Right Diag*/
		tile(DiagRow2, DiagCol2, colour(CompareDiagTR) ),
		DiagRow2\==Row, 
		DiagCol2\==Column, 
		DiagRow2+DiagCol2 is 5, 
		Colour\==CompareDiagTR. 

