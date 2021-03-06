vcpkg_download_distfile(lzmaArchive
    URLS "https://www.7-zip.org/a/lzma1900.7z"
    FILENAME "lzma1900.7z"
    SHA512 60532483249d86960d5c481dc88ebeafabb7e435afb6188bc26f38177b8534ef3da83317d6920d99103d4f10a8dcdb624489ea5ddad8e0c8732bab1bb4ebd7eb
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH lzmaSourcePath
    ARCHIVE ${lzmaArchive}
    NO_REMOVE_ONE_LEVEL
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${lzmaSourcePath})

vcpkg_configure_cmake(
    SOURCE_PATH ${lzmaSourcePath}
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
configure_file(${CMAKE_CURRENT_LIST_DIR}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
