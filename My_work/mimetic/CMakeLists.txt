cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
project(mimetic)

set(MIMETIC_SOURCES
    mimetic/body.cxx
    mimetic/contentdescription.cxx
    mimetic/contentdisposition.cxx
    mimetic/contentid.cxx
    mimetic/contenttransferencoding.cxx
    mimetic/contenttype.cxx
    mimetic/fieldparam.cxx
    mimetic/header.cxx
    mimetic/message.cxx
    mimetic/mimeentity.cxx
    mimetic/mimeversion.cxx
    mimetic/strutils.cxx
    mimetic/utils.cxx
    mimetic/version.cxx
    mimetic/rfc822/mailboxlist.cxx
    mimetic/rfc822/group.cxx
    mimetic/rfc822/address.cxx
    mimetic/rfc822/fieldvalue.cxx
    mimetic/rfc822/addresslist.cxx
    mimetic/rfc822/message.cxx
    mimetic/rfc822/mailbox.cxx
    mimetic/rfc822/messageid.cxx
    mimetic/rfc822/field.cxx
    mimetic/rfc822/datetime.cxx
    mimetic/rfc822/header.cxx
    mimetic/codec/qp.cxx
    mimetic/codec/base64.cxx
    mimetic/os/file_iterator.cxx
    mimetic/os/utils.cxx
    mimetic/os/fileop.cxx
    mimetic/os/stdfile.cxx
)
if (NOT WIN32)
    list(APPEND MIMETIC_SOURCES os/mmfile.cxx)
endif()

set(MIMETIC_HEADERS
    mimetic/body.h
    mimetic/circular_buffer.h
    mimetic/config_win32.h
    mimetic/contentdescription.h
    mimetic/contentdisposition.h
    mimetic/contentid.h
    mimetic/contenttransferencoding.h
    mimetic/contenttype.h
    mimetic/fieldparam.h
    mimetic/header.h
    mimetic/libconfig.h
    mimetic/message.h
    mimetic/mimeentity.h
    mimetic/mimeentitylist.h
    mimetic/mimetic.h
    mimetic/mimeversion.h
    mimetic/streambufs.h
    mimetic/strutils.h
    mimetic/tokenizer.h
    mimetic/tree.h
    mimetic/utils.h
    mimetic/version.h
    mimetic/rfc822/fieldvalue.h
    mimetic/rfc822/field.h
    mimetic/rfc822/datetime.h
    mimetic/rfc822/mailboxlist.h
    mimetic/rfc822/body.h
    mimetic/rfc822/mailbox.h
    mimetic/rfc822/messageid.h
    mimetic/rfc822/header.h
    mimetic/rfc822/address.h
    mimetic/rfc822/rfc822.h
    mimetic/rfc822/addresslist.h
    mimetic/rfc822/group.h
    mimetic/rfc822/message.h
    mimetic/codec/codec_chain.h
    mimetic/codec/codec.h
    mimetic/codec/base64.h
    mimetic/codec/codec_base.h
    mimetic/codec/qp.h
    mimetic/codec/other_codecs.h
    mimetic/codec/code.h
    mimetic/parser/itparserdecl.h
    mimetic/parser/itparser.h
    mimetic/os/os.h
    mimetic/os/file_iterator.h
    mimetic/os/fileop.h
    mimetic/os/file.h
    mimetic/os/stdfile.h
    mimetic/os/directory.h
    mimetic/os/utils.h
)
if (NOT WIN32)
    list(APPEND MIMETIC_HEADERS os/mmfile.h)
endif()

add_library(mimetic STATIC ${MIMETIC_SOURCES})
target_include_directories(mimetic 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
        
)

install(
    TARGETS mimetic
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)

foreach (file ${MIMETIC_HEADERS})
    get_filename_component(dir ${file} DIRECTORY)
    install(FILES ${file} DESTINATION include/${dir})
endforeach()

