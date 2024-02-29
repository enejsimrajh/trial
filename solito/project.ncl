let inputs = import "./nickel.lock.ncl" in
let organist = inputs.organist in

{
  shells = organist.shells.Javascript,

  shells.build = {
    packages = {
      bun = organist.import_nix "nixpkgs#bun"
    },
  },

  shells.dev = {
    packages = {},
  },
}
  | (
    organist.OrganistExpression
    & organist.tools.direnv.Schema
  )
