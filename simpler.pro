tile(0,0, colour(red) ).
tile(0,1, colour(orange) ).
tile(0,2, colour(yellow) ).
tile(0,3, colour(green) ).
tile(0,4, colour(blue) ).
tile(0,5, colour(violet) ).

possible(Row, Column, Colour) :-
	tile(Row, Column, colour(Colour) ).
possible(Row, Column, Colour) :-
	\+tile(Row, Column, _),
	\+tile(Row,_, colour(Colour) ), 
	\+tile(_,Column, colour(Colour) ).
	
