
function defaultProjectLocation()
	location "%{wks.location}/Out/%{prj.name}"
end

workspace "BenchmarkProject"
    startproject "BenchamrkProject"
    configurations { "Debug", "Release" }

    --TODO ADD arm for macos
    if os.target() == "macosx" then
		platforms { "x64" }
		defaultplatform "x64"
	else
		platforms { "x86", "x64" }
		defaultplatform "x86"
	end

    filter "configurations:Release*"
        defines "NDEBUG"

    staticruntime "on"

    include "/src/BenchamrkProject.lua"

    group "Vendor"
        include "/vendor/benchmark-1.7.0/Benchamrk.lua"