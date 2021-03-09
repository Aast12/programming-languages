#pragma once
#include <map>
#include <string>
#include <vector>

#include "Token.h"

enum Transition {
    T_LETTER = 0,
    T_DIGIT,
    T_HASH,
    T_SEMICOLON,
    T_BLANK,
    T_OTHER,
    T_INTEGER = 101,
    T_REGISTER,
    T_RESERVED_WORD,
    T_EOF,
    T_ERROR = 999
};

class Analyzer {
    std::vector<std::vector<int>> transition_matrix;
    std::map<char, int> keys;

   public:
    Analyzer();

    int filter(char ch);

    std::vector<Token> read(std::string);

    int validateToken(int, std::string);
};