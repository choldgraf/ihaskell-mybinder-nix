FROM nixorg/nix:v1.1.0

ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
ENV PATH ${HOME}:$PATH

RUN nix-shell \
    -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/06c576b0525da85f2de86b3c13bb796d6a0c20f6.tar.gz \
    -p busybox \
    --run "adduser --disabled-password --gecos 'Default user' --uid ${NB_UID} ${NB_USER}" \
    && nix-collect-garbage -d

COPY . ${HOME}
USER root
WORKDIR ${HOME}
RUN chown -R ${NB_UID} ${HOME}
RUN chown -R ${NB_UID} /tmp

RUN nix-build default.nix && nix-collect-garbage -d
RUN jupyter notebook --version
RUN blahdfdsdfs

USER ${NB_USER}

CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
