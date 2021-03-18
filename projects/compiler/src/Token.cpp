#include "Token.h"

using namespace std;

string toString(TokenType t) {
    switch (t) {
        case TokenType::INTEGER:
            return "Integer";
        case TokenType::REGISTER:
            return "Register";
        case TokenType::ASSIGNMENT:
            return "Assignment";
        case TokenType::OPERATION:
            return "Operation";
        case TokenType::END_OF_FILE:
            return "EOF";
        default:
            return "Unknown";
    }
}

Token::Token(TokenType type, string value) {
    this->type = type;
    this->value = value;
}

TokenType Token::getType() {
    return type;
}

string Token::getValue() {
    return value;
}

bool operator==(const Token& a, const Token& b) {
    return a.type == b.type && a.value == b.value;
}

ostream&
operator<<(ostream& os, const Token& token) {
    os << "Token <" << toString(token.type) << ", " << token.value << ">";

    return os;
}