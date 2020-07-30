cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
project (antlr)
add_library(antlr "")
target_include_directories(antlr
    PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp
)

target_sources(antlr
    PRIVATE
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/ANTLRUtil.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/ASTFactory.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/ASTNULLType.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/ASTRefCount.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/BaseAST.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/BitSet.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/CharBuffer.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/CharScanner.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/CommonAST.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/CommonASTWithHiddenTokens.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/CommonHiddenStreamToken.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/CommonToken.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/InputBuffer.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/LLkParser.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/MismatchedCharException.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/MismatchedTokenException.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/NoViableAltException.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/NoViableAltForCharException.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/Parser.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/RecognitionException.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/String.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/Token.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/TokenBuffer.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/TokenRefCount.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/TokenStreamBasicFilter.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/TokenStreamHiddenTokenFilter.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/TokenStreamRewriteEngine.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/TokenStreamSelector.cpp
        ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/src/TreeParser.cpp
)

install(
    TARGETS antlr
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

set(ANTLR_HDR
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ANTLRException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ANTLRUtil.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/AST.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ASTArray.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ASTFactory.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ASTNULLType.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ASTPair.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ASTRefCount.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/BaseAST.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/BitSet.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CharBuffer.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CharInputBuffer.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CharScanner.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CharStreamException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CharStreamIOException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CircularQueue.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CommonAST.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CommonASTWithHiddenTokens.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CommonHiddenStreamToken.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/CommonToken.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/IOException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/InputBuffer.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/LLkParser.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/LexerSharedInputState.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/MismatchedCharException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/MismatchedTokenException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/NoViableAltException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/NoViableAltForCharException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/Parser.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/ParserSharedInputState.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/RecognitionException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/RefCount.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/SemanticException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/String.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/Token.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenBuffer.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenRefCount.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStream.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamBasicFilter.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamHiddenTokenFilter.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamIOException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamRecognitionException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamRetryException.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamRewriteEngine.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenStreamSelector.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TokenWithIndex.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TreeParser.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/TreeParserSharedInputState.hpp
    ${CMAKE_CURRENT_LIST_DIR}/lib/cpp/antlr/config.hpp
    )

install(
    FILES ${ANTLR_HDR}
    DESTINATION include/antlr
)
