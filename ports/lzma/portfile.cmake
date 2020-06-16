
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JangBoo/lzma
    REF master
    SHA512 f8ce33d366d03df9c78512bd523791ec809bea4c36bc4771b3ee631b2b920ce1ceac4149465cb27d8929307552614f860c65b61026b09fbd4ee88a9367463703
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA 

)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

SET(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)
SET(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib" "${CURRENT_PACKAGES_DIR}/lib")
configure_file(${CMAKE_CURRENT_LIST_DIR}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
