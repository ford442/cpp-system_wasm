b3_system:
	 em++ src/main.cpp -c -O0 -sUSE_BOOST_HEADERS=1 -std=gnu++17 -flto=thin -mtail-call -mbulk-memory -mnontrapping-fptoint -msign-ext -msimd128
	 emcc main.o -o std001.js -sUSE_BOOST_HEADERS=1 -mllvm -O0 -mtail-call -mbulk-memory -mnontrapping-fptoint -msign-ext -msimd128 -flto=thin \
	 -fwhole-program -polly -sALLOW_MEMORY_GROWTH=0 -sINITIAL_MEMORY=2048mb \
	 -Xclang -menable-no-nans -Xclang -menable-no-infs \
	 -sPRECISE_F32=1 -sWASM_BIGINT \
	 -sEXPORTED_FUNCTIONS='["_main","_sy"]' -sEXPORTED_RUNTIME_METHODS='["ccall"]' \
	 --pre-js src/rSlider.js --pre-js src/slideOut.js

all: b3_system
	echo 'Built 1ink.us std::system test.'
