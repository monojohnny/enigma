tile(red).
tile(orange).
tile(yellow).
tile(green).
tile(blue).
tile(violet).

different(T1, T2) :-
	T1 \== T2,
	tile(T1),
	tile(T2).

row(T1, T2, T3, T4, T5, T6) :-
	different(T1, T2), different(T1, T3), 
	different(T1, T4), different(T1, T5), 
	different(T1, T6), 
	different(T2, T3), different(T2, T4),
	different(T2, T5), different(T2, T6),
	different(T3, T4), different(T3, T5), 
	different(T3, T6),
	different(T4, T5), different(T4, T6),
	different(T5, T6).
	
