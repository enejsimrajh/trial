let inputs = import "./nickel.lock.ncl" in
let organist = inputs.organist in

{
  shells = organist.shells.Bash,

  shells.build = {
    packages = {
      bun = organist.import_nix "nixpkgs#bun"
    },
  },

  shells.dev = {
    packages = {
      ts-lsp = organist.import_nix "nixpkgs#nodePackages_latest.typescript-language-server",
    },
  },
}
  | (
    organist.OrganistExpression
    & organist.tools.direnv.Schema
  )
