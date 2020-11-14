Docker repo: https://hub.docker.com/r/uberhumus/vim-anywhere

GitHub repo: https://github.com/uberhumus/vim-anywhere

To build with ARGS: docker build --build-arg TZ=<Whatever> --build-arg USERNAME=<Whatever>

My preferred command to run this: docker run -itv /:/tmp/real_root uberhumus/vim-anywhere:latest vi <Filename>

