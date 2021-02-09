# deepsimulator
Docker image for [DeepSimulator](https://github.com/liyu95/DeepSimulator) - Nanopore sequencing simulator.

## Usage
Sample usage:
```
docker run -it --rm -v $(pwd):/deepsimulator/data/ -e UID=$(id -u) adamnapieralski/deepsimulator -i data/seq.fasta -o data/out -G 1 -B 2 -n -1 -P 2 -O 1
```
This specific container's path for data - `/deepsimulator/data` is required to use in volumes and as `data/` prefix for input (`-i`) and output (`-o`) file paths.

