b3_system:
	 em++ src/main.cpp -c -O0 -std=gnu++2b -emit-llvm -mtail-call -mbulk-memory -mnontrapping-fptoint -msign-ext -msimd128
	 emcc main.o -o std001.js -mllvm -O0 -mtail-call -mbulk-memory -mnontrapping-fptoint -msign-ext -msimd128 -emit-llvm \
	 -fwhole-program -polly -sALLOW_MEMORY_GROWTH=0 -sINITIAL_MEMORY=2048mb \
	 -msimd128 -mavx -mpclmul -maes -mavx2 -msha \
	 -Xclang -menable-no-nans -Xclang -menable-no-infs \
	 -msse -msse2 -msse3 -mssse3 -msse4 -msse4.1 -msse4.2 \
	 -sPRECISE_F32=1 -sWASM_BIGINT \
	 -sEXPORTED_FUNCTIONS='["_main","_sy"]' -sEXPORTED_RUNTIME_METHODS='["ccall"]' \
	 --pre-js rSlider.js --pre-js slideOut.js

all: b3_system
	echo 'Built 1ink.us std::system test.'
