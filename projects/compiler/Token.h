#pragma once
#include <iostream>

enum TokenType {
    INTEGER,
    REGISTER,
    ASSIGNMENT,
    OPERATION,
    END_OF_FILE,
    ERROR
};

std::string ToString(TokenType);

class Token {
    TokenType type;
    std::string value;

   public:
    Token(TokenType, std::string);

    TokenType getType();

    std::string getValue();

    friend std::ostream& operator<<(std::ostream&, const Token&);
};