## Dagger Data and HPC talks - JuliaCon 2023

<img src="https://github.com/JuliaParallel/Dagger.jl/blob/master/docs/logo.jpg" alt="Dagger.jl">

#### Required package branches:
- MemPool: `jps/storage-tags`
- Dagger: `jps/storage-tags`
- DTables: `jps/dagger-file`
- FoldsDagger: `jps/dagger-0.18` (package is unregistered)
- DaggerGPU: `0.1.7`

#### Notes on using these notebooks:

- MPI cells not evaluated because no MPI in Jupyter
- GPU cells not evaluated because AMDGPU likes to crash my laptop :)
- Data notebook may use way too much RAM and crash your kernel
- Dagger APIs may be subject to some minor changes (esp. around MPI/GPU code)
