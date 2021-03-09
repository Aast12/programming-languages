#include "Token.h"

std::string toString(TokenType t) {
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

Token::Token(TokenType type, std::string value) {
    this->type = type;
    this->value = value;
}

TokenType Token::getType() {
    return type;
}

std::string Token::getValue() {
    return value;
}

std::ostream&
operator<<(std::ostream& os, const Token& token) {
    os << "Token <" << toString(token.type) << ", " << token.value << ">";

    return os;
}