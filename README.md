# docker-folding-at-home

## Usage

```
docker build . -t folding-at-home

docker run --rm -it --name fah -p 80:7396  folding-at-home  --user=<name> --team=<team> --gpu=false --smp=true
```
