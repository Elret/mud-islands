CC = g++
BUILD = .toejam/build/
LIBS =   
DEPS = src/islands.h 

islands: $(BUILD)islands.o
	$(CC) -o bin/islands $^ $(LIBS)

$(BUILD)islands.o: src/islands.cpp $(DEPS)
	$(CC) -c src/islands.cpp -o $@

.PHONY: clean

clean:
	rm .toejam/build/*.o
	rm -rf bin
