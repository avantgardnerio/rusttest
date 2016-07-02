FROM ubuntu:16.04

# --------------------------- ubuntu ------------------------------------------
RUN apt-get -y update
RUN apt-get install -y curl wget vim emacs nano git gcc cmake build-essential
RUN cd root && \
	curl https://sh.rustup.rs -sSf > /root/rustup.sh && \
	chmod ugo+x /root/rustup.sh && \
	/root/rustup.sh -y
ENV PATH /root/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN rustc --version && \
	cargo --version && \
	rustup --version && \
	multirust --version

# Optionally, install RustDT https://github.com/RustDT/RustDT/blob/latest/documentation/Installation.md#installation
# wget http://eclipse.mirror.rafal.ca/eclipse/downloads/drops4/R-4.6-201606061100/eclipse-platform-4.6-linux-gtk-x86_64.tar.gz
# https://rustdt.github.io/releases/

RUN cargo install racer && \
	cargo install rustfmt && \
	cargo install --git https://github.com/RustDT/Rainicorn --tag version_1.x && \
	racer --version && \
	rustfmt --version && \
	rainicorn --version
	
RUN cd /root && \
	git clone https://github.com/rust-lang/rust.git
ENV RUST_SRC_PATH /root/rust
	
RUN mkdir -p /root/workspace && \
	cd /root/workspace && \
	git clone https://github.com/bgard6977/rusttest.git && \
	cd rusttest && \
	cargo build