CC = g++
BUILD = .toejam/build/
LIBS =   
DEPS = src/islands.h src/connections/connect.h 

islands: $(BUILD)islands.o $(BUILD)connect.o
	$(CC) -o bin/islands $^ $(LIBS)

$(BUILD)islands.o: src/islands.cpp $(DEPS)
	$(CC) -c src/islands.cpp -o $@

$(BUILD)connect.o: src/connections/connect.cpp $(DEPS)
	$(CC) -c src/connections/connect.cpp -o $@

.PHONY: clean

clean:
	rm .toejam/build/*.o
	rm -rf bin
