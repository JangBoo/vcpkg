cmake_minimum_required(VERSION 2.8.3 FATAL_ERROR)

project(lzma)
add_definitions("-D_7ZIP_ST")

set(HDR_FILES
    ${PROJECT_SOURCE_DIR}/C/LzmaDec.h
    ${PROJECT_SOURCE_DIR}/C/LzmaEnc.h
    ${PROJECT_SOURCE_DIR}/C/LzFind.h
    ${PROJECT_SOURCE_DIR}/C/Alloc.h
    ${PROJECT_SOURCE_DIR}/C/7z.h
    ${PROJECT_SOURCE_DIR}/C/7zBuf.h
    ${PROJECT_SOURCE_DIR}/C/7zCrc.h
    ${PROJECT_SOURCE_DIR}/C/Lzma2Dec.h
    ${PROJECT_SOURCE_DIR}/C/CpuArch.h
    ${PROJECT_SOURCE_DIR}/C/Bra.h
    ${PROJECT_SOURCE_DIR}/C/Bcj2.h

)

set(SRC_FILES
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
    ${PROJECT_SOURCE_DIR}/C/Bra86.c)

if(WIN32)
    add_library(lzma STATIC
        ${SRC_FILES}
    )
endif (WIN32)

if (UNIX)
    add_library(lzma
        ${SRC_FILES}
    )   
endif (UNIX)


install(
    TARGETS lzma 
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install(
    FILES ${HDR_FILES}
    DESTINATION include
)
