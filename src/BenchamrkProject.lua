project "BenchamrkProject"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	warnings "Extra"

    targetdir "../../Out/%{cfg.buildcfg}"
	objdir "../../Obj/%{prj.name}/%{cfg.buildcfg}"
	location "../../Out"
    
    vpaths {
		["Headers"] = { "**.h" },
		["Sources"] = { "**.c", "**.cpp" },
		["Docs"] = "**.md"
	}

    links {
        "GoogleBenchmark"
    }
    defines { "BENCHMARK_STATIC_DEFINE" }

    xcodebuildsettings { 
        ["ALWAYS_SEARCH_USER_PATHS"] = "YES"
    }

    includedirs {
        "../vendor/benchmark-1.7.0/include"
    }

    files {
        "**.cpp",
        "**.h"
    }
