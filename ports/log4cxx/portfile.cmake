
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO apache/logging-log4cxx
    REF master
    SHA512 b8a8756133c9fb4610a34351c210a75bf3d5307eb6c0c05e76ec48ccaa6092631a144479cf9d9789b279b8025c9e49502a18b3a70c8d70b064bd9fead29e5933
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DLOG4CXX_INSTALL_PDB=ON
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)


vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
