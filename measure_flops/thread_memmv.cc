#include <thread>
#include <iostream>
#include <condition_variable>
#include <mutex>
#include <chrono>
#include <string.h>

#define M (4096 * 4096 * 8)

using namespace std::chrono;

std::condition_variable cv;
std::mutex m;

int mem = 0;
int dt = 0;

void tf() {
	char* c = (char*) malloc(M);
	char* d = (char*) malloc(M);
	memset(c, 0, M);
	{
		std::unique_lock<std::mutex> lock(m);
		cv.wait(lock);
	}
	auto start = system_clock::now();
	memcpy(d, c, M);
	auto duration = 
		duration_cast<milliseconds>(
			system_clock::now() - start
		);
	auto tim = duration.count();
	{
		std::unique_lock<std::mutex> lock(m);
		mem += M / 1024 / 1024;
		dt += tim;
	}
	std::cout << tim << "ms\n";
}

void start(int n) {
	std::thread t[n];
	for (int i = 0; i < n; ++i) {
		t[i] = std::thread(tf);
	}
	std::this_thread::sleep_for(seconds(1));
	cv.notify_all();
	for (int i = 0; i < n; ++i) {
		t[i].join();
	}
	std::cout << "copied " << mem
		<< " MB in " << dt << "ms" << " = "
		<< mem * 1000 / dt << " MB/s" << "\n\n";
	mem = 0; dt = 0;
}

int main() {
	// bandwidth for one thread
	start(1);
	// bandwidth when 4 threads are moving memory
	start(4);
}

