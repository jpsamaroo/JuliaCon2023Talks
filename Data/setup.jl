using Pkg; Pkg.activate(@__DIR__)
ENV["JULIA_PROJECT"] = pwd()

ENV["MEMPOOL_EXPERIMENTAL_FANCY_ALLOCATOR"] = "1"

using Dagger, DTables, DataFrames
using CSV, Arrow, Parquet2, SQLite, Tables
import .Dagger: MemPool
using Serialization

function flexi_serialize(io::IO, x)
    if Tables.istable(x)
        Arrow.write(io, x)
    else
        serialize(io, x)
    end
end
function flexi_deserialize(io::IO)
    isarrow = read(io, UInt64) == 0x000031574f525241
    seek(io, 0)
    if isarrow
        return Arrow.Table(io)
    else
        return deserialize(io)
    end
end

membound = 8*(1024^3)
diskpath = joinpath(homedir(), ".mempool", "juliacon23-data")
diskdevice = MemPool.GenericFileDevice{flexi_serialize,flexi_deserialize,true,false}(diskpath)
diskbound = 32*(1024^3)
kind = :MRU
MemPool.GLOBAL_DEVICE[] = MemPool.SimpleRecencyAllocator(membound,
                                                         diskdevice,
                                                         diskbound,
                                                         kind)
