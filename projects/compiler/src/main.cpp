#include <iostream>
#include <string>
#include <vector>

#include "Scanner.h"
#include "Token.h"
#include "Parser.h"

using namespace std;

int main() {
    Analyzer analyzer;

    string file = "MOV 52 #A MOV #A #BA SUM #A #BA;";

    vector<Token> tokens = analyzer.read(file);
    
    cout << "Tokens found:" << endl;
    for (auto token : tokens) {
        cout << token << endl;
    }

    Parser parser;

    parser.parse(tokens);
}