module github.com/classzz/czzwallet/wallet/txauthor

go 1.12

require (
	github.com/classzz/czzwallet/wallet/txrules v1.0.0
	github.com/classzz/czzwallet/wallet/txsizes v1.0.0
	github.com/classzz/classzz v3.1.7+incompatible // indirect
	github.com/classzz/czzutil v0.0.0-20210304131042-488cf2183658 // indirect
)

replace github.com/classzz/czzwallet/wallet/txrules => ../txrules

replace github.com/classzz/czzwallet/wallet/txsizes => ../txsizes
