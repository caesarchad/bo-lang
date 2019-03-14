# BO-Lang

BO is an llvm based programming language to write smart contract.
It is based on a modified version of LLVM to enhance its ability to process BPF bytecode.

## Customized LLVM

LLVM is a set of tools and framework for users to create powerful compilers. 
We use LLVM to create BO language, which enhance the BPF part. This version is not yet pulled to the LLVM mainline

We use docker file to build LLVM binaries. The offical github repo convietnly provides several template for use to modify.
More details about the LLVM docker, can be found [here](https://github.com/llvm-mirror/llvm/blob/master/docs/Docker.rst).
This very docker is modified from [here](https://github.com/llvm-mirror/llvm/blob/master/utils/docker/debian8/Dockerfile).

As we are working on Ubuntu 18.04 LTS, which is Debian 10.
The version of Debian version of Ubuntu can be found via

```
vim /etc/debian_version

    buster/sid

```
Buster is the development codename for Debian 10.

## Building

Two sets of images will be built, Linux and MacOS. 
Results are saved to ``/docker_image`` folder, then tagged and pushed to **bitconch/llvm** on **dockerhub.com**.
1. install docker

```bash
sudo apt install docker.io

```
2. manage docker as non-root user (remove sudo ahead of docker)

    create the docker user group
```bash
 sudo groupadd docker
```
    Add your the current user to the docker group, replace $USER with any user you like
```bash
sudo usermod -aG docker $USER
```
or
```bash
sudo usermod -aG docker peter
```
    **notice**: need to log off and log in, in order the change take effect.

    verify docker works perfectly.
    
    more details can be found on [docker offical website](https://docs.docker.com/install/linux/linux-postinstall/)

```bash
docker run hello-world
```

3. log into docker hub

```bash
docker login -u username -p password

Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

4. build docker file and copy to 

```bash
$ ./build.sh
```


## Dependencies

This repos is onlly a builder, all the sources are stored in the following repos

- llvm
- clang
* clang-tools-extra
- compiler-rt
- lld

Any changes that need to go into an LLVM release must be made in the appropriate repos listed above.

## File Structures

```
linux/build.sh ---> sync and build for Linux(Debian 10)
macos/build.sh ---> sync and build for MacOS

```
