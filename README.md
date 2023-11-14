This repository build a docker image to build specific version of [BMP Firmware](https://github.com/blackmagic-debug/blackmagic).

## To build the image:
To build a docker image run this command. By default BMP_VERSION points to v1.10.0 tag.
Refer to availabe [tags](https://github.com/blackmagic-debug/blackmagic/tags) (including
main).

```bash
# docker build -t "bmp-builder" . <--build-arg BMP_VERSION=REPO_TAG>
docker build -t "bmp-builder" . # to default tag
docker build -t "bmp-builder" . --build-arg BMP_VERSION=v1.9.2 #to specific tag
```

## To build the firmware:

To build the BMP firmware run this comand, you can (optionally) specify make args
refer to this [link](https://black-magic.org/hacking/hacking.html).

**PROBE_HOST=hosted with HOSTED_BMP_ONLY != 1 is not supported.**

```bash
# docker run --rm -v ./output:/root/blackmagic/output/ bmp-builder <MAKE ARGS>
docker run --rm -v ./output:/root/blackmagic/output/ bmp-builder #to native build
docker run --rm -v ./output:/root/blackmagic/output/ bmp-builder PROBE_HOST=launchpad-icdi #to specific platform
```

The firmware builded is copied to relative output folder

**Note:** This repro is only for educational purposes.
