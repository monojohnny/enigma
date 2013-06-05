tile(0,0, colour(red) ).
tile(0,1, colour(orange) ).
tile(0,2, colour(yellow) ).
tile(0,3, colour(green) ).
tile(0,4, colour(blue) ).
tile(0,5, colour(violet) ).

/* Not working - suspect we are now jumping out of second 'possible' if row==column (when we really both tests need to be checked...)
possible(Row, Column, Colour) :-
	tile(Row, Column, colour(Colour) ).
possible(Row, Column, Colour) :-
	\+tile(Row, Column, Colour),
	Row\==Column,
	\+Row + Column is 5,
	\+tile(Row,_, colour(Colour) ), 
	\+tile(_,Column, colour(Colour) ).
possible(Row, Column, Colour) :-
	Row=Column,
	\+tile(Rdiag1, Cdiag1, colour(Colour)), Rdiag1=Cdiag1.
possible(Row, Column, Colour) :-
	Row + Column is 5,
	\+tile(Rdiag2, Cdiag2, colour(Colour)), Rdiag2+Cdiag2 is 5.
	
