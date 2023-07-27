using Pkg; Pkg.activate(@__DIR__)
ENV["JULIA_PROJECT"] = pwd()

using Distributed
if length(procs()) == 1
    addprocs(2; exeflags=["-t", "auto"])
end

@everywhere using Dagger, DaggerGPU, KernelAbstractions
import DaggerGPU: Kernel
# @everywhere using CUDA
# @everywhere using AMDGPU
# @everywhere using Metal
