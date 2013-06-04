outfile='t.pro'
out=open(outfile, "wb")
colours=['red', 'orange', 'yellow', 'green', 'blue', 'violet'] 
out.write("/* Coordinates are ROW, COLUMN */\n")

out.write("/* Define Colours */\n")
for colour in colours:
	out.write( "colour(%s).\n"%(colour) )

out.write("\n/* Define first row  */\n\n")
for column, colour in enumerate(colours):
	out.write( "tile(0,%d, colour(%s) ).\n"%(column, colour) )

out.write("\n/* General rule to locate possible colours for tiles*/\n")
out.write("possible(Row,Column, C) :-\n")
out.write("Row=0,\n")
out.write("Column=_,\n")
out.write("tile(Row, Column, colour(C)).\n")
out.write("\n/* Rules defined in terms of known facts */\n")
for row in range(1, 6): # skip first row
	for column in range(0, 6):
		out.write("possible(%d,%d, C) :- \n"%(row, column) )
		out.write("\t/* Tile cannot be the same as top tile in same column*/\n")
		out.write("\tcolour(C), tile(0,%d, colour(Compare) ), C\==Compare"%(column))
		if row==column or row+column==5: # detect either main diag
			if row==column: # define top-left main diaganol
				out.write(",\n\t/* Tile cannot be the same as top-left diag*/\n")
				out.write("\tcolour(C), tile(0,0, colour(Compare_tl) ), C\==Compare_tl.\n")
			if row+column==5: # define top-right main diaganol
				out.write(",\n\t/* Tile cannot be the same as top-right diag*/\n")
				out.write("\tcolour(C), tile(0,5, colour(Compare_tr) ), C\==Compare_tr.\n")
		else:
			out.write(".\n")

out.close()
