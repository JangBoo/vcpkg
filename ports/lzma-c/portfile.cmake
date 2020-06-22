




#vcpkg_download_distfile(lzmaArchive
#    URLS "https://www.7-zip.org/a/lzma1900.7z"
#   FILENAME "lzma-19.00.zip"
#    SHA512 60532483249d86960d5c481dc88ebeafabb7e435afb6188bc26f38177b8534ef3da83317d6920d99103d4f10a8dcdb624489ea5ddad8e0c8732bab1bb4ebd7eb
#)

#vcpkg_extract_source_archive_ex(
#    OUT_SOURCE_PATH SOURCE_PATH
#    ARCHIVE ${lzmaArchive}
#    NO_REMOVE_ONE_LEVEL
#    PATCHES ${PATCHES}
#)
#file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})


#vcpkg_extract_source_archive_ex(
#    OUT_SOURCE_PATH SOURCE_PATH
#    ARCHIVE ${SOURCE_PATH}
#    NO_REMOVE_ONE_LEVEL
#    PATCHES ${PATCHES}
#)


vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JangBoo/lzma
    REF c90a15641bdf72f6fcf0ae24d8f3a2adca3dc42a
    SHA512 3c967247ad5ad368260bf47568cdff6818b45edfa7dcaf60a38634615d00f9a32742b5f86bf40533f616adf71de04e541afe2a40a470ee9a45405377c6af7b4c
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})


vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA 
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
configure_file(${CMAKE_CURRENT_LIST_DIR}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)