default: build


build:
	nix build .#sdImage

export: build
	mkdir -p out/
	cp \
	  --force \
	  result/sd-image/nixos-image-sd-card-*-aarch64-linux.img.zst \
	  out/nixos-sd_card.img.zst


update:
	nix flake update
