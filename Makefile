CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wno-c++17-extensions
BUILDDIR = build

# make will think a target (e.g. build:) is already completed if a file
# with that name exists (e.g /build ), adding .PHONY (as in phony - not real) 
# means that it will always be executed
.PHONY: clean

all: build build/main

build:
	mkdir -p $(BUILDDIR)

# this is a target that points to a file that is built by the command
# by putting a dependancy here on a file (src/main.cpp) we can trigger
# a rebuild when src/main.cpp changes! This is nice but obviously doesn't
# cover the issue where a file referenced in src/main.cpp changes (e.g an
# included header) ... I guess this is why we use ccache?
#
# here using $< (the first dependancy name) and $@ the target name we can
# remove some duplication, also we're building up to making a pattern
# that can be reused for lots of files
build/main: src/main.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(BUILDDIR)
