#include <vector>

#include "Token.h"

class Parser {
   public:
    Parser();

    void parse(std::vector<Token> &tokens);

    void parseOperation(std::vector<Token> &tokens);

    void parseAssignment(std::vector<Token> &tokens);

    void match(std::vector<Token> &tokens, TokenType type);

    void match(std::vector<Token> &tokens, Token token);
};