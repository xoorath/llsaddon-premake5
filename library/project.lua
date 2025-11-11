--- @meta

--- @class project
local project = {}

--- @class config
local config = {}

--- Create a new project container instance.
--- @param name string
---
function project.new(name) end

--- Returns an iterator function for the configuration objects contained by
--- the project. Each configuration corresponds to a build configuration/
--- platform pair (i.e. "Debug|x86") as specified in the workspace.
---
--- @param prj project
---    The project object to query.
--- @return function
---    An iterator function returning configuration objects.
---
function project.eachconfig(prj) end


--- When an exact match is not available (project.getconfig() returns nil), use
--- this function to find the closest alternative.
---
--- @param prj project
---    The project object to query.
--- @param buildcfg string
---    The name of the build configuration on which to filter.
--- @param platform string|nil
---    Optional; the name of the platform on which to filter.
--- @return config
---    A configuration object.
function project.findClosestMatch(prj, buildcfg, platform)  end

--- Retrieve the project's configuration information for a particular build
--- configuration/platform pair.
---
--- @param prj project
---    The project object to query.
--- @param buildcfg string
---    The name of the build configuration on which to filter.
--- @param platform string|nil
---    Optional; the name of the platform on which to filter.
--- @return config
---    A configuration object.
function project.getconfig(prj, buildcfg, platform) end

--- Returns a list of sibling projects on which the specified project depends.
--- This is used to list dependencies within a workspace. Must consider all
--- configurations because Visual Studio does not support per-config project
--- dependencies.
---
--- @param prj project
---    The project to query.
--- @param mode 'linkOnly'|'dependOnly'
---    if mode == 'linkOnly', returns only siblings which are linked against (links) and skips siblings which are not (dependson).
---    if mode == 'dependOnly' returns only siblings which are depended on (dependson) and skips siblings which are not (links).
--- @return project[]
---    A list of dependent projects, as an array of project objects.
function project.getdependencies(prj, mode) end

--- Return the first configuration of a project, which is used in some
--- actions to generate project-wide defaults.
---
--- @param prj project
---    The project object to query.
--- @return config
---    The first configuration in a project, as would be returned by
---    eachconfig().
function project.getfirstconfig(prj) end

--- Return the relative path from the project to the specified file.
---
--- @param prj project
---    The project object to query.
--- @param filename string|string[]
---    The file path, or an array of file paths, to convert.
--- @return string|string[]
---    The relative path, or array of paths, from the project to the file.
function project.getrelative(prj, filename) end

--- Create a tree from a project's list of source files.
---
--- @param prj project
---    The project to query.
--- @param sorter function
---    An optional comparator function for the sorting pass.
--- @return table
---    A tree object containing the source file hierarchy. Leaf nodes,
---    representing the individual files, are file configuration
---    objects.
function project.getsourcetree(prj, sorter) end

--- Given a source file path, return a corresponding virtual path based on
--- the vpath entries in the project. If no matching vpath entry is found,
--- the original path is returned.
function project.getvpath(prj, abspath) end

--- Determines if project contains a configuration meeting certain criteria.
---
--- @param prj project
---    The project to query.
--- @param func function
---    A test function. Takes a project configuration as an argument and
---    returns a boolean result of the test.
--- @return boolean
---    True if the test function returned true.
function project.hasConfig(prj, func) end

--- Determines if a project contains a particular source code file.
---
--- @param prj project
---    The project to query.
--- @param filename string
---    The absolute path to the source code file being checked.
--- @return boolean
---    True if the file belongs to the project, in any configuration.
function project.hasfile(prj, filename) end


--- @return boolean
---     Returns true if the project uses a .NET language.
function project.isdotnet(prj) end

--- @return boolean
---     Returns true if the project uses a C# language.
function project.iscsharp(prj) end

--- @return boolean
---     Returns true if the project uses a F# language.
function project.isfsharp(prj) end

--- @return boolean
---     Returns true if the project uses a cpp language.
function project.isc(prj) end

--- @return boolean
---     Returns true if the project uses a cpp language.
function project.iscpp(prj) end

--- @return boolean
---     Returns true if the project has uses any 'native' languages.
---     which is basically anything other then .net at this point.
---     modules like the dlang should overload this to add 'project.isd(prj)' to it.
function project.isnative(prj) end

--- Given a build config/platform pairing, applies any project configuration maps
--- and returns a new (or the same) pairing.
---
--- TODO: I think this could be made much simpler by building a string pattern
--- like :part1:part2: and then doing string comparisons, instead of trying to
--- iterate over variable number of table elements.
function project.mapconfig(prj, buildcfg, platform) end

--- Given a project, returns requested min and max system versions.
function project.systemversion(prj) end

--- Retrieve the project's usage information for a particular usage.
--- @param name string
---    The name of the usage to retrieve.
--- @return unknown
---    The usage object with the specified name or nil if not found.
function project.findusage(self, name) end