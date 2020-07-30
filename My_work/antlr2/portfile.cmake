vcpkg_download_distfile(antlrArchive
    URLS "https://www.antlr2.org/download/antlr-2.7.7.tar.gz"
    FILENAME "antlr-2.7.7.zip"
    SHA512 faa72d2ddcba434ef1233e70c1549e63eba67c00793966322e821cf7f015cccb804448cb92d8fbef0429f59928fad65ec954f8ffbda0acbb8e983de0806d349d
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH antlrSourcePath
    ARCHIVE ${antlrArchive}
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${antlrSourcePath})

vcpkg_configure_cmake(
    SOURCE_PATH ${antlrSourcePath}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
configure_file(${CMAKE_CURRENT_LIST_DIR}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
