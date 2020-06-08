
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/tlk00/BitMagic/archive/master.zip"
    FILENAME "bitmagic.zip"
    SHA512 c1dd6938a39d36869bebc238fc3e5db4fb6b41e997737c27044f20d7fbdc648b055658d8d6980b983375bdd9363e3a54888e8e53041f4d69604b3bdaf8fe0d04
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}

)
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG
        -DPSNIP_INSTALL_HEADERS=OFF
    OPTIONS_RELEASE
        -DPSNIP_INSTALL_HEADERS=ON
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/bit TARGET_PATH share/bit)

# Handle copyright
configure_file(${SOURCE_PATH}/license.txt ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright COPYONLY)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" )

