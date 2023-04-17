# box-bayou

This is my take on a Toolbox / Distrobox container based on the ideas of [ublue-box](https://github.com/tepene/ublue-box).

The goal of this project is to have a companion distrobox container for
my custom [ublue-bayou](https://github.com/tepene/ublue-bayou) Fedora Silverblue
setup. It's my default terminal for daily usage.

## Tools

The container is based on the latest Alpine image from the [Toolbx Community Images](https://github.com/toolbx-images/images)
and and is spruced up with the following configuration.

### Installed in the container

The following tools are shipped with the container:

- [chezmoi](https://www.chezmoi.io/) for dotfile management
- [pipx](https://pypa.github.io/pipx/) to run python applications in isolated environments
- [Poetry](https://python-poetry.org/) for python `venv` management
- [python-3](https://www.python.org/) to run python applications
- [starship](https://starship.rs/) cross-shell prompt for that <3
- [zsh](https://www.zsh.org/) as an additional shell

### Mapped from Host OS

The following tools are symlinked from the host system:

- [btop++](https://github.com/aristocratos/btop)
- [flatpak](https://www.flatpak.org/)
- [just](https://github.com/casey/just)
- [podman](https://podman.io/)
- [rmp-ostree](https://rpm-ostree.readthedocs.io/en/stable/)

## How to use

If you use distrobox:

```sh
distrobox create -i ghcr.io/tepene/box-bayou:latest -n box-bayou
distrobox enter ublue-box
```

If you use toolbox:

```sh
toolbox create -i ghcr.io/tepene/box-bayou:latest -c box-bayou
toolbox enter ublue-box
```

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/).
You can verify the signature by downloading the `cosign.pub` key from this repo
and running the following command:

`cosign verify --key cosign.pub ghcr.io/tepene/box-bayou:latest`

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/)
with cosign. The public key can be in your public repo (your users need it to check
the signatures), and you can paste the private key in Settings -> Secrets -> Actions.
