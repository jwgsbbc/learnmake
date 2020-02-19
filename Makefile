CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wno-c++17-extensions
BUILDDIR = build
SRCDIR = src

# make will think a target (e.g. build:) is already completed if a file
# with that name exists (e.g /build ), adding .PHONY (as in phony - not real) 
# means that it will always be executed
.PHONY: clean all

all: $(BUILDDIR) $(BUILDDIR)/main

# we can use a variable as a targer name!
$(BUILDDIR):
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
#
# Here I've added the build dir as an order-only prerequsite so that the
# date of dir is ignored when considering whether to rebuild (since we 
# don't care if the dir is newer, just that it exists) ("|")
# see: https://www.gnu.org/software/make/manual/make.html#Prerequisite-Types
#
$(BUILDDIR)/main: $(SRCDIR)/main.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(BUILDDIR)
