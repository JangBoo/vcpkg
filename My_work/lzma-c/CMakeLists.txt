cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

PROJECT(lzma)
add_library(lzma "")
target_compile_definitions(lzma PRIVATE _7ZIP_ST)
target_include_directories(lzma
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>
        $<INSTALL_INTERFACE:include>
)

target_sources(lzma
    PRIVATE
        ${PROJECT_SOURCE_DIR}/C/LzmaDec.c
        ${PROJECT_SOURCE_DIR}/C/LzmaEnc.c
        ${PROJECT_SOURCE_DIR}/C/LzFind.c
        ${PROJECT_SOURCE_DIR}/C/Alloc.c
        ${PROJECT_SOURCE_DIR}/C/7zDec.c
        ${PROJECT_SOURCE_DIR}/C/7zBuf.c
        ${PROJECT_SOURCE_DIR}/C/7zCrc.c
        ${PROJECT_SOURCE_DIR}/C/7zCrcOpt.c
        ${PROJECT_SOURCE_DIR}/C/7zStream.c
        ${PROJECT_SOURCE_DIR}/C/Lzma2Dec.c
        ${PROJECT_SOURCE_DIR}/C/CpuArch.c
        ${PROJECT_SOURCE_DIR}/C/Bra.c
        ${PROJECT_SOURCE_DIR}/C/Bcj2.c
        ${PROJECT_SOURCE_DIR}/C/Bra86.c
)

install(
    TARGETS lzma
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

file(GLOB HDR_FILES  ${PROJECT_SOURCE_DIR}/C/*.h)
install(
    FILES ${HDR_FILES}
    DESTINATION include/lzma
)
