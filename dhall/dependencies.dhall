let Dependency =
      https://raw.githubusercontent.com/eta-lang/dhall-to-etlas/master/dhall/types/Dependency.dhall sha256:eb325fc6883b1cd00e273bae1e52d12ac2c40163664e47591c3429a6e10e6df3

let v =
      https://raw.githubusercontent.com/eta-lang/dhall-to-etlas/master/dhall/Version/v.dhall sha256:33726964ba62af58225ffbe64fb963999569b965058dbd9c30bffb72cc1279ab

let thisVersion =
      https://raw.githubusercontent.com/eta-lang/dhall-to-etlas/master/dhall/VersionRange/thisVersion.dhall sha256:3e719126ed40d8dbfe1688d35eacc595d02f8ddc02cdd28a1a16d89e7e2b77de

let idx-types = ./types.dhall

let idx = ./index.dhall

let boot = ./boot-packages.dhall

let idxPkgToDep =
        λ(pkg : idx-types.IndexedPackage)
      → { package = pkg.name, bounds = thisVersion (v pkg.lastest) }

let pkgToDep =
        λ(pkg : idx-types.Package)
      → { package = pkg.name, bounds = thisVersion (v pkg.version) }

let deps = idx Dependency idxPkgToDep ⫽ boot Dependency pkgToDep

in  deps
