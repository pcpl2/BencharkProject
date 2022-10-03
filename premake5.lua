
function defaultProjectLocation()
	location "%{wks.location}/Out/%{prj.name}"
end

workspace "BenchmarkProject"
    startproject "BenchamrkProject"

    --TODO ADD arm for macos
    if os.target() == "macosx" then
        configurations { "Debug64", "Release64" }
		platforms { "x64" }
		defaultplatform "x64"
	else
        configurations { "Debug32", "Release32", "Debug64", "Release64" }
		platforms { "x86", "x64" }
		defaultplatform "x86"

        filter "configurations:*32"
            architecture "x86"

        filter "configurations:*64"
            architecture "x86_64"
	end

    filter "configurations:Release*"
        defines "NDEBUG"

    staticruntime "on"

    group "Vendor"
        include "/vendor/benchmark-1.7.0/Benchamrk.lua"

    include "/src/BenchamrkProject.lua"
