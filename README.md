# VM

## Build

### Option 1

```sh
nix-build -A vm nixos.nix
```

### Option 2

```sh
nixos-generate -c configuration.nix -f vm
```

## Run

```sh
./result/bin/run-nixos-vm
```

# A bootable iso image

## Build

### Option 1

```sh
nix-build -A iso nixos.nix
```

### Option 2

```sh
nixos-generate -c configuration.nix -f iso
```

## Result

```
$ exa result/iso/nixos.iso

Permissions Size User Date Modified  Name
.r--r--r--  285M root  1 janv.  1970 result/iso/nixos.iso
```

# The generated nginx config

```
[...]
http {
    [...]
	server {
		listen 0.0.0.0:80 ;
		listen [::]:80 ;
		server_name localhost ;
		location /service-a/ {
			proxy_pass http://localhost:2000/;
		}
		location /service-b/ {
			proxy_pass http://localhost:8081/;
		}
	}
}
```
