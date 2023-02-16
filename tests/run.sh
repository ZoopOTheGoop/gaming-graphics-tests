#!/bin/bash

# if ! snapctl is-connected "gaming-mesa"; then
#   echo "ERROR: not connected to the gaming-mesa content interface."
#   echo "To connect:"
#   echo "sudo snap connect gaming-graphics-tests:gaming-mesa gaming-graphics-core22"
#   exit 1
# fi

dir=$(dirname $0)
`$dir/glx` && echo "GLX passed" || echo "GLX failed"
glx_failed=$?
`$dir/vulkan` && echo "Vulkan passed" || echo "Vulkan failed"
vulkan_failed=$?

exit $glx_failed || $vulkan_failed