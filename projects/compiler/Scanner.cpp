#include "Scanner.h"

#include <string>
#include <vector>

#include "Token.h"

using namespace std;

Analyzer::Analyzer() {
    transition_matrix = {
        {3, 1, 2, T_EOF, 0, T_ERROR},
        {T_ERROR, 1, T_ERROR, T_ERROR, T_INTEGER, T_ERROR},
        {T_REGISTER, T_ERROR, T_ERROR, T_ERROR, T_ERROR, T_ERROR},
        {3, T_ERROR, T_ERROR, T_ERROR, T_RESERVED_WORD, T_ERROR},
    };
}

int Analyzer::filter(char ch) {
    if (ch >= 'A' && ch <= 'Z')
        return T_LETTER;
    if (ch >= '0' && ch <= '9')
        return T_DIGIT;
    if (ch == '#')
        return T_HASH;
    if (ch == ';')
        return T_SEMICOLON;
    if (isspace(ch))
        return T_BLANK;
    return T_OTHER;
}

int Analyzer::validateToken(int state, string value) {
    switch (state) {
        case T_INTEGER:
            return TokenType::INTEGER;
        case T_REGISTER:
            if (value == "#A" || value == "#B" || value == "#C") return TokenType::INTEGER;
            std::cerr << "Invalid register " << value << endl;
        case T_RESERVED_WORD:
            if (value == "SUM" || value == "SUB" || value == "MUL" || value == "DIV") return TokenType::OPERATION;
            if (value == "MOV") return TokenType::ASSIGNMENT;
            std::cerr << "Invalid reserved word " << value << endl;
        case T_EOF:
            return TokenType::END_OF_FILE;
        default:
            return TokenType::ERROR;
    }
}

vector<Token> Analyzer::read(string s) {
    vector<Token> tokens;

    int state = 0;
    string last_value;
    for (int i = 0; i < s.size(); i++) {
        state = transition_matrix[state][filter(s[i])];

        if (state > 0) {
            if (filter(s[i]) != T_BLANK) last_value.push_back(s[i]);

            if (state >= 100) {
                int token_type = validateToken(state, last_value);

                if (token_type != TokenType::ERROR) {
                    tokens.push_back(Token(TokenType(token_type), last_value));
                } else {
                    return tokens;
                }

                last_value = string();
                state = 0;
            }
        }
    }

    return tokens;
}