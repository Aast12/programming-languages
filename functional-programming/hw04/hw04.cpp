#include <string>
#include <vector>

using namespace std;

int sum(const vector<int>& vec, int pos = 0) {
    if (pos == vec.size()) return 0;
    return vec[pos] + sum(vec, pos + 1);
}

int fib(int n) {
    if (n < 2) return n;
    return fib(n - 1) + fib(n - 2);
}

string intToBin(int n) {
    if (n <= 1) return {char(n % 2 + '0')};
    return intToBin(n / 2) + char(n % 2 + '0');
}
