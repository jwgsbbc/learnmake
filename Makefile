CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wno-c++17-extensions
BUILDDIR = build

# make will think a target (e.g. build:) is already completed if a file
# with that name exists (e.g /build ), adding .PHONY (as in phony - not real) 
# means that it will always be executed
.PHONY: clean

all: build/main

build/main:
	mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) src/main.cpp -o build/main

clean:
	rm -rf $(BUILDDIR)
