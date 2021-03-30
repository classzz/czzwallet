module github.com/btcsuite/btcwallet

require (
	github.com/boltdb/bolt v1.3.1 // indirect
	github.com/btcsuite/btcd v0.20.1-beta.0.20200513120220-b470eee47728
	github.com/btcsuite/btclog v0.0.0-20170628155309-84c8d2346e9f
	github.com/btcsuite/btcutil v1.0.3-0.20201208143702-a53e38424cce
	github.com/btcsuite/btcutil/psbt v1.0.3-0.20201208143702-a53e38424cce
	github.com/btcsuite/btcwallet/wallet/txauthor v1.0.0
	github.com/btcsuite/btcwallet/wallet/txrules v1.0.0
	github.com/btcsuite/btcwallet/wallet/txsizes v1.0.0
	github.com/btcsuite/btcwallet/walletdb v1.3.4
	github.com/btcsuite/btcwallet/wtxmgr v1.2.0
	github.com/btcsuite/golangcrypto v0.0.0-20150304025918-53f62d9b43e8 // indirect
	github.com/btcsuite/websocket v0.0.0-20150119174127-31079b680792
	github.com/classzz/classzz v3.1.7+incompatible
	github.com/classzz/czzlog v0.0.0-20190701134521-659346cb927a
	github.com/classzz/czzutil v0.0.0-20210304131042-488cf2183658
	github.com/classzz/czzwallet v1.0.5
	github.com/classzz/neutrino v0.0.0-20200714085523-aee3913e602c // indirect
	github.com/davecgh/go-spew v1.1.1
	github.com/dchest/siphash v1.2.2 // indirect
	github.com/golang/lint v0.0.0-20180702182130-06c8688daad7 // indirect
	github.com/golang/protobuf v1.4.3
	github.com/jessevdk/go-flags v1.4.0
	github.com/jrick/logrotate v1.0.0
	github.com/kisielk/gotool v1.0.0 // indirect
	github.com/lightninglabs/gozmq v0.0.0-20191113021534-d20a764486bf
	github.com/lightninglabs/neutrino v0.11.0
	github.com/stretchr/testify v1.5.1
	github.com/tyler-smith/go-bip39 v1.0.1-0.20181017060643-dbb3b84ba2ef
	golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
	golang.org/x/net v0.0.0-20200822124328-c89045814202
	google.golang.org/grpc v1.36.0
)

replace github.com/btcsuite/btcwallet/walletdb => ./walletdb

replace github.com/btcsuite/btcwallet/wtxmgr => ./wtxmgr

replace github.com/btcsuite/btcwallet/wallet/txauthor => ./wallet/txauthor

replace github.com/btcsuite/btcwallet/wallet/txrules => ./wallet/txrules

replace github.com/btcsuite/btcwallet/wallet/txsizes => ./wallet/txsizes

go 1.13
