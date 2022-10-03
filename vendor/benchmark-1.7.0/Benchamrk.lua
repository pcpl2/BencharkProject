project "GoogleBenchmark"
	kind "StaticLib"
	language "C++"
    cppdialect "C++17"
	warnings "Extra"

	targetdir "../../Out/%{cfg.buildcfg}"
	objdir "../../Obj/%{prj.name}/%{cfg.buildcfg}"
	location "../../Out"

    defines { "USE_PRECOMPILED_HEADERS" }

    vpaths {
		["Headers"] = { "**.h" },
		["Sources"] = { "**.cc" },
		["Docs"] = "**.md",
    }

    xcodebuildsettings { 
        ["ALWAYS_SEARCH_USER_PATHS"] = "YES"
    }

    includedirs {
		"include/"
	}

	files {
        "include/**.h",
        "src/**.h",
        "src/**.cc"
    }

	filter "system:Windows"
        disablewarnings { "4996" }
        toolset "v142"
        characterset "MBCS"
        defines {"WIN32"}
        flags { "MultiProcessorCompile" }
