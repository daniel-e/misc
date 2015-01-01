#include <string.h>
#include <stdlib.h>
#include <iostream>
#include <chrono>

using namespace std::chrono;

int main()
{
	#define N (8192 * 8292 * 8)
	char* c = (char*) malloc (N);
	char* d = (char*) malloc (N);
	memset(c, 0, N);
	auto start = system_clock::now();
	memcpy(d, c, N);
	auto duration = 
		duration_cast<milliseconds>(
			system_clock::now() - start
		);
	std::cout << duration.count() << std::endl;
}

