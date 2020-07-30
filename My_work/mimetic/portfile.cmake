file(MAKE_DIRECTORY "${CURRENT_BUILDTREES_DIR}/src")
set(SOURCE_PATH "${CURRENT_BUILDTREES_DIR}/src")

find_program(GIT NAMES git git.cmd)

#Download source

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH}/mimetic/mimetic)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/mimetic/mimetic
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

configure_file(${CMAKE_CURRENT_LIST_DIR}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")