
mkproject() {
	if [ -z $1 ];
	then
		echo "Error: project name is empty...";
	else
		MAIN_SRC_BASE="#include <iostream>\n\nint main() {\n\tstd::cout << \"hello\" << std::endl;\n\treturn 0;\n}"
		CMAKE_SRC_BASE="cmake_minimum_required(VERSION 3.10)\n\nproject($1 VERSION 1.0)\n\nadd_executable(\${CMAKE_PROJECT_NAME}\n\tsrc/main.cpp\n)"
		echo "Create $1 project tree";
		mkdir -p $1/src
		mkdir -p $1/include
		mkdir -p $1/build
		echo -e $MAIN_SRC_BASE > $1/src/main.cpp
		echo -e $CMAKE_SRC_BASE > $1/CMakeLists.txt

		origin_dir=$(pwd)
		cd $1/build;
		cmake ../ > /dev/null
		cmake --build ./ > /dev/null
		if [ $? -eq 0 ];
		then
			echo "$(tput setaf 2)Success!"
		else
			echo "$(tput setaf 1)Failed to create project tree"
		fi
		cd $origin_dir

	fi
}


