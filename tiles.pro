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

/* The following rule should perhaps be called 'known'.... */
possible(Column,Row, C) :-
	Row=0,
	Column=_,
	tile(Row,Column, colour(C)).

possible(1,0, C) :-
	tile(0,0, colour(Compare) ), C\==Compare.

possible(1,1, C) :-
	tile(0,0, colour(Compare1) ), C\==Compare1,
	tile(0,1, colour(Compare2) ), C\==Compare2.


