FROM fedora:40
#FROM fedora-minimal:40

WORKDIR /app

# dnf or microdnf on fedora-minimal
RUN dnf install -y mono-core && dnf clean all && rm -rf /var/cache/dnf
