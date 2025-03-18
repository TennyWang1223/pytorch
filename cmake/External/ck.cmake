#
# create INTERFACE target for CK library
#

# set source and destination
set(SOURCE_URL "https://compute-artifactory.amd.com/artifactory/rocm-generic-local/torch_ck_gen_lib/ck_8086bbe3a78d931eb96fe12fdc014082e18d18d3/rocm_6.2.0/torch_2.5/libck_kernels.so")
set(DESTINATION "${CMAKE_SOURCE_DIR}/torch/lib/libck_kernels.so")

# download CK library
file(DOWNLOAD ${SOURCE_URL} ${DESTINATION} SHOW_PROGRESS STATUS download_status)
if(NOT download_status)
	message(STATUS "Downloaded CK library successfully.")
else()
	message(FATAL_ERROR "Failed to download the CK library from ${SOURCE_URL}.")
endif()

# create INTERFACE target
add_library(__ck_lib INTERFACE)

# specify path to CK library
target_link_libraries(__ck_lib INTERFACE ${DESTINATION})

