#include <iostream>
#include <string>
#include <vector>

#include "Scanner.h"
#include "Token.h"

using namespace std;

int main() {
    Analyzer analyzer;

    string file = "MOV 2354 #A MOV #A #C SUM #A #B ;";

    vector<Token> tokens = analyzer.read(file);

    for (auto token : tokens) {
        cout << token << endl;
    }
}