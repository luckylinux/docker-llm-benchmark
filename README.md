# docker-llm-benchmark
A Docker Image to run LLM Benchmark.

This includes the Following:
- [Ollama](https://github.com/ollama/ollama)
- [llm-benchmark](https://github.com/aidatatools/ollama-benchmark)

`ollama` is installed from the AMD64 Tarball into a Dedicated Folder.

`llm-benchmark` is installed via `pip` in a Dedicated Virtual Environment.

# Important Notes
Currently the Image:
- Only supports `amd64` Architecture
- Is NOT built in the most Space-efficient Way (e.g. NO multi-stage Builds, some Development Tools stay installed on the running Image)
- Includes all the `ollama` Standard Stack, the same Way as a Binary `ollama` Install on GNU/Linux:
  - CPU AVX
  - CPU AVX2
  - NVIDIA CUDA v11
  - NVIDIA CUDA v12
  - AMD ROCM
- Is available in an `python:<${PYTHON_VERSION}>-alpine` and `python:<${PYTHON_VERSION}>-bookworm` Python Base

It can be argued "why not using the Ollama Image as the Base, then install `llm_benchmark` on top of it" ?

The Truth is that I usually have a Set of Scripts and "Templates" that I usually use as Reference and those are usually using `alpine` and `debian` Bases. More Bases can of course be added, but so far I didn't have a need for it.

There are most likely 100 different Ways to do it, that's the beauty of Open Source I guess :smile:.

# Requirements
Container System:
- `podman` (tested)
- `docker` (untested)

Optionally Container Compose:
- `podman-compose` (tested)
- `docker-compose` (untested)

Image:
- Each final Image takes approx. 4-5 GB of Space
- Space will be doubled to approx. 10GB for each Image if you need to use the Local Registry "Trick" in order for `podman-compose` to be able to find the Image

Model:
- Expect approx. 30GB-35GB for the Standard Models that `llm_benchmark` automatically downloads:
  - `phi3:3.8b`
  - `qwen2:7b`
  - `gemma2:9b`
  - `mistral:7b`
  - `llama3.1:8b`
  - `llava:7b`
  - `llava:13b`

Clone the required Container Build Tools if not done already:
(this can be skipped if you are willing to manually issue Docker / Podman `build` Commands and handle all of the tagging Process yourself)
```
git clone https://github.com/luckylinux/container-build-tools.git
```

# Setup
Clone the Repository:
```
git clone https://github.com/luckylinux/docker-llm-benchmark.git
```

Change to the Docker LLM Benchmark Repository Directory:
```
cd docker-llm-benchmark
```

Create Symlink:
```
ln -s ../container-build-tools includes
```

Build the Image:
```
./build_container.sh
```

# Define Variables
Some parameters can/must to be defined in the `.env` file.

Copy Example File:
```
cp .env.example .env
```

Modify using your preferred Text Editor:
```
nano .env
```

Currently only `ENABLE_INFINITE_LOOP` is supported.
