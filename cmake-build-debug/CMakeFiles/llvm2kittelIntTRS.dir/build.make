# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/lee/Softwares/clion-2016.3.2/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/lee/Softwares/clion-2016.3.2/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lee/Development/llvm2kittel-proj

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lee/Development/llvm2kittel-proj/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/llvm2kittelIntTRS.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/llvm2kittelIntTRS.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/llvm2kittelIntTRS.dir/flags.make

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o: CMakeFiles/llvm2kittelIntTRS.dir/flags.make
CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o: ../lib/IntTRS/Constraint.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lee/Development/llvm2kittel-proj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o -c /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Constraint.cpp

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Constraint.cpp > CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.i

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Constraint.cpp -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.s

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.requires:

.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.requires

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.provides: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.requires
	$(MAKE) -f CMakeFiles/llvm2kittelIntTRS.dir/build.make CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.provides.build
.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.provides

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.provides.build: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o


CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o: CMakeFiles/llvm2kittelIntTRS.dir/flags.make
CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o: ../lib/IntTRS/Polynomial.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lee/Development/llvm2kittel-proj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o -c /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Polynomial.cpp

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Polynomial.cpp > CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.i

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Polynomial.cpp -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.s

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.requires:

.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.requires

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.provides: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.requires
	$(MAKE) -f CMakeFiles/llvm2kittelIntTRS.dir/build.make CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.provides.build
.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.provides

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.provides.build: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o


CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o: CMakeFiles/llvm2kittelIntTRS.dir/flags.make
CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o: ../lib/IntTRS/Rule.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lee/Development/llvm2kittel-proj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o -c /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Rule.cpp

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Rule.cpp > CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.i

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Rule.cpp -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.s

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.requires:

.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.requires

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.provides: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.requires
	$(MAKE) -f CMakeFiles/llvm2kittelIntTRS.dir/build.make CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.provides.build
.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.provides

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.provides.build: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o


CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o: CMakeFiles/llvm2kittelIntTRS.dir/flags.make
CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o: ../lib/IntTRS/Term.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lee/Development/llvm2kittel-proj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o -c /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Term.cpp

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Term.cpp > CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.i

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lee/Development/llvm2kittel-proj/lib/IntTRS/Term.cpp -o CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.s

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.requires:

.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.requires

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.provides: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.requires
	$(MAKE) -f CMakeFiles/llvm2kittelIntTRS.dir/build.make CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.provides.build
.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.provides

CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.provides.build: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o


# Object files for target llvm2kittelIntTRS
llvm2kittelIntTRS_OBJECTS = \
"CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o" \
"CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o" \
"CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o" \
"CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o"

# External object files for target llvm2kittelIntTRS
llvm2kittelIntTRS_EXTERNAL_OBJECTS =

libllvm2kittelIntTRS.a: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o
libllvm2kittelIntTRS.a: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o
libllvm2kittelIntTRS.a: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o
libllvm2kittelIntTRS.a: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o
libllvm2kittelIntTRS.a: CMakeFiles/llvm2kittelIntTRS.dir/build.make
libllvm2kittelIntTRS.a: CMakeFiles/llvm2kittelIntTRS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lee/Development/llvm2kittel-proj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libllvm2kittelIntTRS.a"
	$(CMAKE_COMMAND) -P CMakeFiles/llvm2kittelIntTRS.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/llvm2kittelIntTRS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/llvm2kittelIntTRS.dir/build: libllvm2kittelIntTRS.a

.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/build

CMakeFiles/llvm2kittelIntTRS.dir/requires: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Constraint.cpp.o.requires
CMakeFiles/llvm2kittelIntTRS.dir/requires: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Polynomial.cpp.o.requires
CMakeFiles/llvm2kittelIntTRS.dir/requires: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Rule.cpp.o.requires
CMakeFiles/llvm2kittelIntTRS.dir/requires: CMakeFiles/llvm2kittelIntTRS.dir/lib/IntTRS/Term.cpp.o.requires

.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/requires

CMakeFiles/llvm2kittelIntTRS.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/llvm2kittelIntTRS.dir/cmake_clean.cmake
.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/clean

CMakeFiles/llvm2kittelIntTRS.dir/depend:
	cd /home/lee/Development/llvm2kittel-proj/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lee/Development/llvm2kittel-proj /home/lee/Development/llvm2kittel-proj /home/lee/Development/llvm2kittel-proj/cmake-build-debug /home/lee/Development/llvm2kittel-proj/cmake-build-debug /home/lee/Development/llvm2kittel-proj/cmake-build-debug/CMakeFiles/llvm2kittelIntTRS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/llvm2kittelIntTRS.dir/depend
