{
  description = "Python, uv, and Jupyter development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      jupyter = pkgs.python3.withPackages (ps: [
        ps.jupyterlab
        ps.notebook
        ps.nbconvert
        ps.ipywidgets
      ]);
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [ pkgs.python315 pkgs.uv jupyter ];

        # Let Jupyter discover kernels installed in the project's virtualenv.
        shellHook = ''
          # PyPI wheels such as pyzmq need the C++ runtime on NixOS.
          export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
          export JUPYTER_PATH="$PWD/.venv/share/jupyter''${JUPYTER_PATH:+:$JUPYTER_PATH}"
        '';
      };
    };
}
