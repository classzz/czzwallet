czzwallet
=========
[![Build Status](https://travis-ci.org/classzz/czzwallet.png?branch=master)](https://travis-ci.org/classzz/czzwallet)
[![Go Report Card](https://goreportcard.com/badge/github.com/classzz/czzwallet)](https://goreportcard.com/report/github.com/classzz/czzwallet)
[![ISC License](http://img.shields.io/badge/license-ISC-blue.svg)](http://copyfree.org)
[![GoDoc](https://img.shields.io/badge/godoc-reference-blue.svg)](http://godoc.org/github.com/classzz/czzwallet)

czzwallet is a daemon handling bitcoin cash wallet functionality for a
single user.  It acts as both an RPC client to czzd and an RPC server
for wallet clients and legacy RPC applications.

Public and private keys are derived using the hierarchical
deterministic format described by
[BIP0032](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki).
Unencrypted private keys are not supported and are never written to
disk.  czzwallet uses the
`m/44'/<coin type>'/<account>'/<branch>/<address index>`
HD path for all derived addresses, as described by
[BIP0044](https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki).
The default general derivation path for a fresh wallet is as follows:

 - mainnet: `m/44'/145'/0'` (if you are not sure, this is what you need)
 - testnet: `m/44'/1'/0'`
 - simnet: `m/44'/115'/0'`

Due to the sensitive nature of public data in a BIP0032 wallet,
czzwallet provides the option of encrypting not just private keys, but
public data as well.  This is intended to thwart privacy risks where a
wallet file is compromised without exposing all current and future
addresses (public keys) managed by the wallet. While access to this
information would not allow an attacker to spend or steal coins, it
does mean they could track all transactions involving your addresses
and therefore know your exact balance.  In a future release, public data
encryption will extend to transactions as well.

czzwallet is not an SPV client and requires connecting to a local or
remote czzd instance for asynchronous blockchain queries and
notifications over websockets.  Full czzd installation instructions
can be found [here](https://github.com/classzz/classzz).  An alternative
SPV mode that is compatible with czzd and Bitcoin Core is planned for
a future release.

Wallet clients can use one of two RPC servers:

  1. A legacy JSON-RPC server mostly compatible with Bitcoin Core

     The JSON-RPC server exists to ease the migration of wallet applications
     from Core, but complete compatibility is not guaranteed.  Some portions of
     the API (and especially accounts) have to work differently due to other
     design decisions (mostly due to BIP0044).  However, if you find a
     compatibility issue and feel that it could be reasonably supported, please
     report an issue.  This server is enabled by default.

  2. An experimental gRPC server

     The gRPC server uses a new API built for czzwallet, but the API is not
     stabilized and the server is feature gated behind a config option
     (`--experimentalrpclisten`).  If you don't mind applications breaking due
     to API changes, don't want to deal with issues of the legacy API, or need
     notifications for changes to the wallet, this is the RPC server to use.
     The gRPC server is documented [here](./rpc/documentation/README.md).

## Installation and updating

### Windows - MSIs Available

Install the latest MSIs available here:

https://github.com/classzz/czzd/releases

https://github.com/classzz/czzwallet/releases

### Windows/Linux/BSD/POSIX - Build from source

Building or updating from source requires the following build dependencies:

- **Go 1.10.1 and greater**

  Installation instructions can be found here: http://golang.org/doc/install.
  It is recommended to add `$GOPATH/bin` to your `PATH` at this point.


**Getting the source**:

```
go get github.com/classzz/czzwallet
```

**Building/Installing**:

The `go` tool is used to build or install (to `GOPATH`) the project.  Some
example build instructions are provided below (all must run from the `czzwallet`
project directory).

To build and install `czzwallet` and all helper commands (in the `cmd`
directory) to `$GOPATH/bin/`, as well as installing all compiled packages to
`$GOPATH/pkg/` (**use this if you are unsure which command to run**):

```
go install . ./cmd/...
```

To build a `czzwallet` executable and install it to `$GOPATH/bin/`:

```
go install
```

To build a `czzwallet` executable and place it in the current directory:

```
go build
```

## Getting Started

The following instructions detail how to get started with czzwallet connecting
to a localhost czzd.  Commands should be run in `cmd.exe` or PowerShell on
Windows, or any terminal emulator on *nix.

- Run the following command to start czzd:

```
czzd -u rpcuser -P rpcpass
```

- Run the following command to create a wallet:

```
czzwallet -u rpcuser -P rpcpass --create
```

- Run the following command to start czzwallet:

```
czzwallet -u rpcuser -P rpcpass
```

Now you can run wallet commands through the `czzctl` command:

```bash
$ czzctl --listcommands

$ czzctl -u rpcuser -P rpcpass --wallet getnewaddress
```

If everything appears to be working, it is recommended at this point to
copy the sample czzd and czzwallet configurations and update with your
RPC username and password. Then you can use commands without providing
the username and password with every command.

PowerShell (Installed from MSI):
```
PS> cp "$env:ProgramFiles\classzz\czzd\sample-czzd.conf" $env:LOCALAPPDATA\Btcd\czzd.conf
PS> cp "$env:ProgramFiles\classzz\czzwallet\sample-czzwallet.conf" $env:LOCALAPPDATA\czzwallet\czzwallet.conf
PS> $editor $env:LOCALAPPDATA\czzd\czzd.conf
PS> $editor $env:LOCALAPPDATA\czzwallet\czzwallet.conf
```

PowerShell (Installed from source):
```
PS> cp $env:GOPATH\src\github.com\classzz\czzd\sample-czzd.conf $env:LOCALAPPDATA\czzd\czzd.conf
PS> cp $env:GOPATH\src\github.com\classzz\czzwallet\sample-czzwallet.conf $env:LOCALAPPDATA\czzwallet\czzwallet.conf
PS> $editor $env:LOCALAPPDATA\czzd\czzd.conf
PS> $editor $env:LOCALAPPDATA\czzwallet\czzwallet.conf
```

Linux/BSD/POSIX (Installed from source):
```bash
$ cp $GOPATH/src/github.com/classzz/czzd/sample-czzd.conf ~/.czzd/czzd.conf
$ cp $GOPATH/src/github.com/classzz/czzwallet/sample-czzwallet.conf ~/.czzwallet/czzwallet.conf
$ $EDITOR ~/.czzd/czzd.conf
$ $EDITOR ~/.czzwallet/czzwallet.conf
```

## Issue Tracker

The [integrated github issue tracker](https://github.com/classzz/czzwallet/issues)
is used for this project.


## License

czzwallet is licensed under the liberal ISC License.
