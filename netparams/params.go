// Copyright (c) 2013-2015 The btcsuite developers
// Use of this source code is governed by an ISC
// license that can be found in the LICENSE file.

package netparams

import "github.com/classzz/classzz/chaincfg"

// Params is used to group parameters for various networks such as the main
// network and test networks.
type Params struct {
	*chaincfg.Params
	RPCClientPort string
	RPCServerPort string
}

// MainNetParams contains parameters specific running bchwallet and
// bchd on the main network (wire.MainNet).
var MainNetParams = Params{
	Params:        &chaincfg.MainNetParams,
	RPCClientPort: "8334",
	RPCServerPort: "8332",
}

// TestNetParams contains parameters specific running bchwallet and
// bchd on the test network (version 3) (wire.TestNet3).
var TestNetParams = Params{
	Params:        &chaincfg.TestNetParams,
	RPCClientPort: "8334",
	RPCServerPort: "8332",
}

// RegtestParams contains parameters specific running bchwallet and
// bchd on the regression test network (wire.TestNet).
var RegtestParams = Params{
	Params:        &chaincfg.RegressionNetParams,
	RPCClientPort: "8334",
	RPCServerPort: "8332",
}

// SimNetParams contains parameters specific to the simulation test network
// (wire.SimNet).
var SimNetParams = Params{
	Params:        &chaincfg.SimNetParams,
	RPCClientPort: "18556",
	RPCServerPort: "18554",
}
