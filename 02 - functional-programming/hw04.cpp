#include <iostream>
#include <vector>

using namespace std;

int sum(vector<int> v) {
    if (v.size() == 0) return 0;
    return v[0] + sum(vector<int>(v.begin() + 1, v.end()));
}

int fibonacci(int n) {
    if (n < 2) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int toBinary(int n) {
    if (n <= 1) return n % 2;

    return toBinary(n / 2) * 10 + n % 2;
}

int main() {
    cout << toBinary(125) << endl;
    cout << sum({1, 5, 7869, 12, -14, 785, 2, 0}) << endl;
    cout << fibonacci(9) << endl;
}