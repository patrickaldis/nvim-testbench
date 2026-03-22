{
  description = "Pinned nix shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    markview-nvim = {
      flake = false;
      type = "github";
      owner = "OXY2DEV";
      repo = "markview.nvim";
      rev = "1861f959599ae03cfd59f56222a542035b0cd947";
      narHash = "sha256-T6ZVy7o9sSGa2vOolvmL7KO3cXkyEwJ9F4n6BbWdPGk=";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            neovim = final.wrapNeovimUnstable final.neovim-unwrapped {

              plugins = [
                (final.vimUtils.buildVimPlugin {
                  pname = "markview-nvim";
                  version = "22-03-2026";
                  src = inputs.markview-nvim;
                })
              ];

              luaRcContent = builtins.readFile ./init.lua;
            };
          })
        ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "nvim-workbench";
        packages = [
          pkgs.neovim
        ];
      };
      packages.${system}.default = pkgs.writeShellScriptBin "run-example" ''
        ${pkgs.neovim}/bin/nvim ${./example.md} -u ${
          pkgs.writeText "no-store-warning.lua" /* lua */ ''
            vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
              callback = function()
                vim.opt_local.readonly = false
              end,
            })
          ''
        }
      '';
    };
}
