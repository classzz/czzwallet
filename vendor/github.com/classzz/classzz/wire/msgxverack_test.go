// Copyright (c) 2019 The classzz developers
// Use of this source code is governed by an ISC
// license that can be found in the LICENSE file.

package wire

import (
	"bytes"
	"reflect"
	"testing"

	"github.com/davecgh/go-spew/spew"
)

// TestVerAck tests the MsgXVerAck API.
func TestXVerAck(t *testing.T) {
	pver := ProtocolVersion

	// Ensure the command is expected value.
	wantCmd := "xverack"
	msg := NewMsgXVerAck()
	if cmd := msg.Command(); cmd != wantCmd {
		t.Errorf("NewMsgXVerAck: wrong command - got %v want %v",
			cmd, wantCmd)
	}

	// Ensure max payload is expected value.
	wantPayload := uint32(0)
	maxPayload := msg.MaxPayloadLength(pver)
	if maxPayload != wantPayload {
		t.Errorf("MaxPayloadLength: wrong max payload length for "+
			"protocol version %d - got %v, want %v", pver,
			maxPayload, wantPayload)
	}
}

// TestXVerAckWire tests the MsgXVerAck wire encode and decode for various
// protocol versions.
func TestXVerAckWire(t *testing.T) {
	msgXVerAck := NewMsgXVerAck()
	msgXVerAckEncoded := []byte{}

	tests := []struct {
		in   *MsgXVerAck     // Message to encode
		out  *MsgXVerAck     // Expected decoded message
		buf  []byte          // Wire encoding
		pver uint32          // Protocol version for wire encoding
		enc  MessageEncoding // Message encoding format
	}{
		// Latest protocol version.
		{
			msgXVerAck,
			msgXVerAck,
			msgXVerAckEncoded,
			ProtocolVersion,
			BaseEncoding,
		},

		// Protocol version 0.
		{
			msgXVerAck,
			msgXVerAck,
			msgXVerAckEncoded,
			0,
			BaseEncoding,
		},

		// Protocol version 0.
		{
			msgXVerAck,
			msgXVerAck,
			msgXVerAckEncoded,
			0,
			BaseEncoding,
		},

		// Protocol version 0.
		{
			msgXVerAck,
			msgXVerAck,
			msgXVerAckEncoded,
			0,
			BaseEncoding,
		},

		// Protocol version 0.
		{
			msgXVerAck,
			msgXVerAck,
			msgXVerAckEncoded,
			0,
			BaseEncoding,
		},
	}

	t.Logf("Running %d tests", len(tests))
	for i, test := range tests {
		// Encode the message to wire format.
		var buf bytes.Buffer
		err := test.in.CzzEncode(&buf, test.pver, test.enc)
		if err != nil {
			t.Errorf("CzzEncode #%d error %v", i, err)
			continue
		}
		if !bytes.Equal(buf.Bytes(), test.buf) {
			t.Errorf("CzzEncode #%d\n got: %s want: %s", i,
				spew.Sdump(buf.Bytes()), spew.Sdump(test.buf))
			continue
		}

		// Decode the message from wire format.
		var msg MsgXVerAck
		rbuf := bytes.NewReader(test.buf)
		err = msg.CzzDecode(rbuf, test.pver, test.enc)
		if err != nil {
			t.Errorf("CzzDecode #%d error %v", i, err)
			continue
		}
		if !reflect.DeepEqual(&msg, test.out) {
			t.Errorf("CzzDecode #%d\n got: %s want: %s", i,
				spew.Sdump(msg), spew.Sdump(test.out))
			continue
		}
	}
}
