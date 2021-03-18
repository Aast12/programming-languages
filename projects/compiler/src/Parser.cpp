#include "Parser.h"

#include <iostream>

using namespace std;

Parser::Parser() {
}

void Parser::parse(vector<Token> &tokens) {
    if (tokens.size() == 0) {
        cerr << "Missing tokens. Expected EOF." << endl;
        exit(0);
    }
    switch (tokens[0].getType()) {
        case OPERATION:
            parseOperation(tokens);
            break;
        case ASSIGNMENT:
            parseAssignment(tokens);
            break;
        case END_OF_FILE:
            match(tokens, END_OF_FILE);
            if (tokens.size() > 0) {
                cerr << "!!! Found more tokens after EOF !!!" << endl;
            } else {
                cout << "File succesfully parsed" << endl;
            }
            return;
        default:
            cerr << "Invalid file" << endl;
            exit(0);
            break;
    }

    parse(tokens);
}

void Parser::parseOperation(vector<Token> &tokens) {
    match(tokens, OPERATION);
    match(tokens, REGISTER);
    match(tokens, REGISTER);
}

void Parser::parseAssignment(vector<Token> &tokens) {
    match(tokens, ASSIGNMENT);
    if (tokens.size() == 0) {
        cerr << "Expected a register or integer" << endl;
        exit(0);
    }
    switch (tokens[0].getType()) {
        case REGISTER:
            match(tokens, REGISTER);
            break;
        case INTEGER:
            match(tokens, INTEGER);
            break;
        default:
            cerr << "Expected a register or integer" << endl;
            exit(0);
            break;
    }
    match(tokens, REGISTER);
}

void Parser::match(vector<Token> &tokens, TokenType type) {
    if (tokens.size() == 0 || tokens[0].getType() != type) {
        cerr << "ERROR: Expected token of type " << toString(type) << endl;
        exit(0);
    } else {
        cout << "matched " << tokens[0] << endl;
        tokens.erase(tokens.begin());
    };
}

void Parser::match(vector<Token> &tokens, Token token) {
    if (tokens.size() == 0 || !(tokens[0] == token)) {
        cerr << "ERROR: Expected token " << token << endl;
        exit(0);
    } else {
        cout << "matched " << token << endl;
        tokens.erase(tokens.begin());
    };
}