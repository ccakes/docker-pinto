# docker-pinto

[Pinto](https://metacpan.org/pod/Pinto) is an application for managing a local, potentially private, CPAN-like repository of Perl modules.

This image wraps up Pinto into a simple to use container which can be useful for local development.

### Usage
**Local Development**
```
mkdir ~/.pinto
docker run -d -p 3111:3111 -v $HOME/.pinto:/pinto --name pinto ccakes/perl-pinto # run daemon

# use the client to push or read repo
docker run -it --rm -v $(pwd):/pwd --link pinto ccaakes/perl-pinto \
  pinto -r http://pinto:3111 add /pwd/My-Module-1.2.tar.gz
docker run -it --rm --link pinto ccakes/perl-pinto \
  pinto -r http://pinto:3111 list
```
**Deployment**
```
mkdir /var/local/pinto
docker run -d -p 3111:3111 -v /var/local/pinto:/pinto --name pinto ccakes/perl-pinto
```
**Installing modules**
```
PERL_CARTON_MIRROR=http://localhost:3111 carton install
cpanm --from http://localhost:3111 -i My::Module
```
