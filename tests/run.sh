#!/bin/bash

# if ! snapctl is-connected "gaming-mesa"; then
#   echo "ERROR: not connected to the gaming-mesa content interface."
#   echo "To connect:"
#   echo "sudo snap connect gaming-graphics-tests:gaming-mesa gaming-graphics-core22"
#   exit 1
# fi

dir=$(dirname $0)

$dir/glx
glx_failed=$?

if [[ $glx_failed -eq 0 ]]; then
  echo "GLX passed"
else
  echo "GLX failed"
fi

$dir/vulkan
vulkan_failed=$?

if [[ $vulkan_failed -eq 0 ]]; then
  echo "Vulkan passed" 
else 
  echo "Vulkan failed"
fi

exit $glx_failed || $vulkan_failed