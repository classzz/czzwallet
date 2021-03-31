module github.com/classzz/czzwallet

require (
	github.com/boltdb/bolt v1.3.1 // indirect
	github.com/btcsuite/btcd v0.20.1-beta // indirect
	github.com/btcsuite/btcutil v0.0.0-20190425235716-9e5f4b9a998d
	github.com/btcsuite/btcutil/psbt v1.0.2
	github.com/btcsuite/golangcrypto v0.0.0-20150304025918-53f62d9b43e8 // indirect
	github.com/btcsuite/websocket v0.0.0-20150119174127-31079b680792
	github.com/classzz/classzz v3.1.7+incompatible
	github.com/classzz/czzlog v0.0.0-20190701134521-659346cb927a
	github.com/classzz/czzutil v0.0.0-20210330135345-58d00e1c1c1a
	github.com/classzz/czzwallet/wallet/txauthor v0.0.0-00010101000000-000000000000
	github.com/classzz/czzwallet/wallet/txrules v1.0.0
	github.com/classzz/czzwallet/wallet/txsizes v1.0.0
	github.com/classzz/czzwallet/walletdb v1.3.4
	github.com/classzz/czzwallet/wtxmgr v0.0.0-00010101000000-000000000000
	github.com/classzz/neutrino v0.0.0-20200714085523-aee3913e602c
	github.com/davecgh/go-spew v1.1.1
	github.com/dchest/siphash v1.2.2 // indirect
	github.com/golang/protobuf v1.4.3
	github.com/jessevdk/go-flags v1.4.0
	github.com/jrick/logrotate v1.0.0
	github.com/lightninglabs/gozmq v0.0.0-20191113021534-d20a764486bf
	github.com/lightninglabs/neutrino v0.11.0
	github.com/stretchr/testify v1.5.1 // indirect
	golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
	golang.org/x/net v0.0.0-20210226172049-e18ecbb05110
	google.golang.org/grpc v1.36.0
)

replace github.com/classzz/czzwallet/walletdb => ./walletdb
replace github.com/classzz/czzwallet/wtxmgr => ./wtxmgr
replace github.com/classzz/czzwallet/wallet/txauthor => ./wallet/txauthor
replace github.com/classzz/czzwallet/wallet/txrules => ./wallet/txrules
replace github.com/classzz/czzwallet/wallet/txsizes => ./wallet/txsizes

go 1.13
