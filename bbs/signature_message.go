/*
Copyright SecureKey Technologies Inc. All Rights Reserved.

SPDX-License-Identifier: Apache-2.0
*/

package bbs

import (
	ml "github.com/IBM/mathlib"
)

// SignatureMessage defines a message to be used for a signature check.
type SignatureMessage struct {
	FR *ml.Zr
}

// ParseSignatureMessage parses SignatureMessage from bytes.
func ParseSignatureMessage(message []byte) *SignatureMessage {
	elm := FrFromOKM(message)

	return &SignatureMessage{
		FR: elm,
	}
}
