cmake_minimum_required(VERSION 3.0)

project(bm)


set( CMAKE_VERBOSE_MAKEFILE on )


find_package(Threads REQUIRED)

function (check_if_header_only output_variable files)
    set(is_header_only 1)

    foreach (entry ${files})
        get_filename_component(file_ext ${entry} EXT)
        if (file_ext STREQUAL .c)
            set(is_header_only 0)
        endif ()
    endforeach ()

    set(${output_variable} ${is_header_only} PARENT_SCOPE)
endfunction ()


file(GLOB HEADER_LIST CONFIGURE_DEPENDS "${PROJECT_SOURCE_DIR}/src/*.h")
check_if_header_only(header_only "${HEADER_LIST}")




add_library(myHeaderLib INTERFACE )

target_include_directories(
            myHeaderLib 
            INTERFACE
                $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
        )

set(namespace Headerlib)
add_library(${namespace}::myHeaderLib  ALIAS myHeaderLib )
install(FILES ${HEADER_LIST} DESTINATION include)
install(TARGETS myHeaderLib  EXPORT bit-config)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

install(
    EXPORT bit-config
    NAMESPACE ${namespace}::
    DESTINATION share/bit
    PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
)