module BinaryBuilderToolchains
using Base.BinaryPlatforms, BinaryBuilderSources
using Pkg.Types: VersionSpec

export AbstractToolchain, toolchain_sources, toolchain_env

"""
    AbstractToolchain

An `AbstractToolchain` represents a set of JLLs that should be downloaded to
provide some kind of build capability; an example of which is the C toolchain
which is used in almost every recipe, but fortran, go, rust, etc.. are all
other toolchains which can be included in the build environment.

All toolchains must define the following methods:

* Constructor
    - used to configure tool versions, etc...
* toolchain_sources(toolchain)
    - returns a vector of `AbstractSource`'s representing the dependencies
      needed to run this toolchain
* toolchain_env(toolchain)
    - returns a dictionary listing the environment variables to be added
      in to commands that use this toolchain.
"""
abstract type AbstractToolchain; end

include("PlatformExtensions.jl")
include("Microarchitectures.jl")
include("WrapperUtils.jl")
include("toolchains/CToolchain.jl")
include("toolchains/HostToolsToolchain.jl")
include("PkgUtils.jl")
include("InteractiveUtils.jl")


end # module