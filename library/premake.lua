--- @meta

--- @class premake Base definitions required by all the other scripts.
--- @copyright 2002-2015 Jess Perkins and the Premake project
premake = {}

premake._VERSION = "5.0.0-dev"
premake.modules = {}
premake.extensions = premake.modules

premake.C               = "C"
premake.CLANG           = "clang"
premake.CONSOLEAPP      = "ConsoleApp"
premake.CPP             = "C++"
premake.CSHARP          = "C#"
premake.GCC             = "gcc"
premake.HAIKU           = "haiku"
premake.ANDROID         = "android"
premake.EMSCRIPTEN      = "emscripten"
premake.IOS             = "ios"
premake.TVOS            = "tvos"
premake.LINUX           = "linux"
premake.MACOSX          = "macosx"
premake.MAKEFILE        = "Makefile"
premake.MBCS            = "MBCS"
premake.MSC             = "msc"
premake.NONE            = "None"
premake.DEFAULT         = "Default"
premake.OBJECTIVEC      = "Objective-C"
premake.OBJECTIVECPP    = "Objective-C++"
premake.ON              = "On"
premake.OFF             = "Off"
premake.POSIX           = "posix"
premake.PS3             = "ps3"
premake.SHAREDITEMS     = "SharedItems"
premake.SHAREDLIB       = "SharedLib"
premake.STATICLIB       = "StaticLib"
premake.UNICODE         = "Unicode"
premake.UNIVERSAL       = "universal"
premake.UTILITY         = "Utility"
premake.UWP             = "uwp"
premake.PACKAGING       = "Packaging"
premake.WINDOWEDAPP     = "WindowedApp"
premake.WINDOWS         = "windows"
premake.X86             = "x86"
premake.X86_64          = "x86_64"
premake.ARM             = "ARM"
premake.ARM64           = "ARM64"
premake.RISCV64         = "RISCV64"
premake.LOONGARCH64     = "loongarch64"
premake.PPC             = "ppc"
premake.PPC64           = "ppc64"
premake.WASM32          = "wasm32"
premake.WASM64          = "wasm64"
premake.E2K             = "e2k"
premake.MIPS64EL        = "mips64el"

--- Provide an alias for a function in a namespace. Calls to the alias will
--- invoke the canonical function, and attempts to override the alias will
--- instead override the canonical call.
---
--- @param scope table
---    The table containing the function to be overridden. Use _G for
---    global functions.
--- @param canonical string
---    The name of the function to be aliased (a string value)
--- @param alias string
---    The new alias for the function (another string value).
function premake.alias(scope, canonical, alias) end

--- Call a list of functions.
---
--- @param funcs function[]
---    The list of functions to be called, or a function that can be called
---    to build and return the list. If this is a function, it will be called
---    with all of the additional arguments (below).
--- @param ... unknown[]
---    An optional set of arguments to be passed to each of the functions as
---    as they are called.
function premake.callArray(funcs, ...) end

--- Compare a version string that uses semver semantics against a
--- version comparison string. Comparisons take the form of ">=5.0" (5.0 or
--- later), "5.0" (5.0 or later), ">=5.0 <6.0" (5.0 or later but not 6.0 or
--- later).
---
--- @param version string
---    The version to be tested.
--- @param checks string
---    The comparison string to be evaluated.
--- @return boolean
---    True if the comparisons pass, false if any fail.
function premake.checkVersion(version, checks) end

function premake.clearWarnings() end

--- Finds the correct premake script filename to be run.
---
--- @param fname string
---    The filename of the script to run.
--- @return string,function
---    The correct of filename of the script to run, and the function to load the chunk.
---
function premake.findProjectScript(fname) end

--- "Immediate If" - returns one of the two values depending on the value
--- of the provided condition. Note that both the true and false expressions
--- will be evaluated regardless of the condition, even if only one result
--- is returned.
---
--- @param condition boolean
---    A boolean condition, determining which value gets returned.
--- @param trueValue unknown
---    The value to return if the condition is true.
--- @param falseValue unknown
---    The value to return if the condition is false.
--- @return unknown
---    One of trueValue or falseValue.
function iif(condition, trueValue, falseValue) end

--- Override an existing function with a new implementation; the original
--- function is passed as the first argument to the replacement when called.
---
--- @param scope table
---    The table containing the function to be overridden. Use _G for
---    global functions.
--- @param name string
---    The name of the function to override (a string value).
--- @param repl function
---    The replacement function. The first argument to the function
---    will be the original implementation, followed by the arguments
---    passed to the original call. 
function premake.override(scope, name, repl) end

--- @param scope table
---    The table containing the function to be overridden. Use _G for
---    global functions.
--- @param name string
---    The name of the function to resolve.
--- @return string
---    The canonical scope and function name (a string value).
function premake.resolveAlias(scope, name) end

--- Raise an error, with a formatted message built from the provided
--- arguments.
---
--- @param message string
---    The error message, which may contain string formatting tokens.
--- @param ... unknown[]
---    Values to fill in the string formatting tokens.
function premake.error(message, ...) end

--- Display a warning, with a formatted message built from the provided
--- arguments.
---
--- @param message string
---    The warning message, which may contain string formatting tokens.
--- @param ... unknown[]
---    Values to fill in the string formatting tokens.
function premake.warn(message, ...) end

--- Displays a warning just once per run.
---
--- @param key string
---    A unique key to identify this warning. Subsequent warnings messages
---    using the same key will not be shown.
--- @param message string
---    The warning message, which may contain string formatting tokens.
--- @param ... unknown[]
---    Values to fill in the string formatting tokens.
function premake.warnOnce(key, message, ...) end

--- Display information in the term.infoColor color.
---
--- @param message string
---    The info message, which may contain string formatting tokens.
--- @param ...unknown[]
---    Values to fill in the string formatting tokens.
function premake.info(message, ...) end

--- A shortcut for printing formatted output.
--- 
--- @param msg string
--- @param ... unknown[]
function printf(msg, ...) end

--- A shortcut for printing formatted output in verbose mode.
--- 
--- @param msg string
--- @param ... unknown[]
function verbosef(msg, ...) end

--- make a string from debug.getinfo information.
--- @return string
function filelineinfo(level) end

--- check if version is semver.
--- @param version string
--- @return boolean
function premake.isSemVer(version) end

return premake