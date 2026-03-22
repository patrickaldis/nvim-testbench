{
  description = "Pinned nix shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
