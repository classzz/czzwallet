module github.com/classzz/czzwallet

go 1.15

replace github.com/classzz/classzz => github.com/classzz/classzz v0.0.0-20210331073148-757c4acd164d

require (
	github.com/btcsuite/btcd v0.20.1-beta
	github.com/btcsuite/btcutil v0.0.0-20190425235716-9e5f4b9a998d
	github.com/btcsuite/btcutil/psbt v1.0.2
	github.com/btcsuite/websocket v0.0.0-20150119174127-31079b680792
	github.com/classzz/classzz v3.2.0-beta.1.0.20200714074618-c9795ecc9d13+incompatible
	github.com/classzz/czzlog v0.0.0-20190701134521-659346cb927a
	github.com/classzz/czzutil v0.0.0-20210331065242-323b27c6239d
	github.com/classzz/neutrino v0.0.0-20210331041634-300bc27b1f5e
	github.com/davecgh/go-spew v1.1.1
	github.com/golang/protobuf v1.5.2
	github.com/jessevdk/go-flags v1.4.0
	github.com/jrick/logrotate v1.0.0
	github.com/lightninglabs/gozmq v0.0.0-20191113021534-d20a764486bf
	github.com/lightningnetwork/lnd/clock v1.0.1
	go.etcd.io/bbolt v1.3.3
	golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
	golang.org/x/net v0.0.0-20200822124328-c89045814202
	google.golang.org/grpc v1.36.0
)
