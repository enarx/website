---
slug: 2024-03-28-europroofnet24
title: "Enarx & Steward Attestation"  
authors: [richard]
tags: [Event]
---

**Title**: Enarx & Steward Attestation
**Author**: Richard Zak  
**Date**: March 28, 2024

A discussion on how Enarx and [Steward](https://github.com/enarx/steward) use [Certificate Signing Requests](https://en.wikipedia.org/wiki/Certificate_signing_request) (CSRs) to provide remote attestation of a Keep. Steward is a Confidential Computing-aware [Certificate Authority](https://en.wikipedia.org/wiki/Certificate_authority) which signs CSRs if and only if all attestation checks are successfully validated. This way, the signed certificate, which is part of the Steward CA certificate chain, becomes a token for third parties to ensure that an application secured with Enarx *really* is secured.

**Source**: EuroProofNet 2024 Working Group 3

**Link**: https://europroofnet.github.io/wg3-dresden24/

**PDF**: [Enarx_Steward_Attestation_EuroProofNet24.pdf](/assets/docs/Enarx_Steward_Attestation_EuroProofNet24.pdf)