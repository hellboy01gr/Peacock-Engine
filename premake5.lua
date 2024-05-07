workspace "Peacock-Engine"
  configurations { "Debug", "Release" }
  platforms { "StaticWin64", "SharedWin64" }

project "PeacockEngine"
  -- Build a static Windows 64-bit library
  filter "platforms:StaticWin64" 
    includedirs { "C:/VulkanSDK/1.3.268.0/include" }

    system "Windows"
    architecture "x86_64"

    kind "StaticLib"

  -- Build a dynamically linked Windows 64-bit dll
  filter "platforms:SharedWin64" 

    includedirs { "C:/VulkanSDK/1.3.268.0/include" }

    system "Windows"
    architecture "x86_64"

    kind "SharedLib"

  language "C++"
  targetdir "./%{cfg.buildcfg}"

  files { "**.h", "**.hpp", "**.cpp" }

  filter "configurations:Debug"
    defines { "DEBUG" }
    symbols "On"
  
  filter "configurations:Release"
    defines { "RELEASE" }
    optimize "On"