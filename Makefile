builddir = output
objects = $(builddir)/main.o $(builddir)/Engine.o $(builddir)/Bitboards.o

strixcc: $(objects)
		g++ -pg -o strixcc.out $(objects)
		make clean

$(builddir)/main.o: src/main.cc src/Chess/Engine.hh src/Chess/Types.hh
		g++ -o$(builddir)/main.o -c src/main.cc

$(builddir)/Bitboards.o: src/Chess/Bitboards.cc src/Chess/Bitboards.hh src/Chess/PrestoredMagics.hh src/Chess/Types.hh
		g++ -o$(builddir)/Bitboards.o -c src/Chess/Bitboards.cc

$(builddir)/Engine.o: src/Chess/Engine.cc src/Chess/Engine.hh src/Chess/Types.hh src/Chess/Utils.hh
		g++ -o$(builddir)/Engine.o -c src/Chess/Engine.cc

clean:
	rm $(objects)