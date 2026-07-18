{
  description = "A very basic flake";
  inputs = {
     nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
     home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
     };
     niri = {
         url = "github:sodiboo/niri-flake";
	 inputs.nixpkgs.follows = "nixpkgs";
     };

     zen-browser = {
    	url = "github:youwen5/zen-browser-flake";
    	inputs.nixpkgs.follows = "nixpkgs";
     };
    
 };
  outputs = inputs@{ self, nixpkgs, home-manager, niri, zen-browser,  ... }: {
  nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      modules = [
	  ./configuration.nix
	  niri.nixosModules.niri
	  home-manager.nixosModules.home-manager

	  {
	   home-manager.useGlobalPkgs = true;
	   home-manager.useUserPackages = true;
	   home-manager.extraSpecialArgs = { inherit inputs; };
	   home-manager.users.dinzz = ./home/dinzz/home.nix;
	  }
	];
    };
  };
}
