#!/bin/bash

read -r className

cpp=$className.cpp
hpp=$className.hpp

touch $cpp
touch $hpp

header=${className^^}


#.hpp
echo "#ifndef "$header"_H_"  >> $hpp
echo "#define "$header"_H_"  >> $hpp
echo >> $hpp
echo >> $hpp

echo "class "$className >> $hpp
echo -e "{\\n\\tpublic:" >> $hpp
echo -e "\\t"$className"();" >> $hpp
echo -e "\\t~"$className"();" >> $hpp
echo -e "\\n\\tprivate:" >> $hpp
echo -e "\\n};" >> $hpp

echo >> $hpp
echo >> $hpp
echo -n "#endif" >> $hpp

#.cpp

echo -e "#include \""$hpp"\"\\n" >> $cpp
echo $className"::"$className"()" >> $cpp
echo -e "{\\n\\n}\\n" >> $cpp
echo $className"::~"$className"()" >> $cpp
echo -e -n "{\\n\\n}\\n" >> $cpp