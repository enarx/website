---
slug: 2022-05-16-wasi-networking
title: "WASI Networking: Towards a World Wide WebAssembly"  
authors: [nathaniel, harald]
tags: [Event, Profian's Blog]
---

**Title**: WASI Networking: Towards a World Wide WebAssembly    
**Author**: Nathaniel McCallum, Harald Hoyer  
**Date**: May 16, 2022   

The advancement of WASI, the WebAssembly System Interface, is key to pushing WebAssembly beyond the browser - from the Cloud to the Edge - allowing developers to build applications that are capable of running in a wide range of architectures and interfacing with an array of systems. One of the most exciting developments has been WASI’s networking support, which will unleash a whole new set of applications. In this session, we’ll explore the current state of WASI networking and cover the recent implementation of sock_accept(). Next, we’ll demonstrate a Wasm server using the Rust mio framework, along with some examples of networked applications. Finally, we’ll discuss the next steps towards building a full fledged networking API and the future of network-enabled WebAssembly applications, including some considerations with regards to deploying network identities and security implications.


**Source**: KubeCon / Wasm Day Europe 2022

**Link**: https://blog.profian.com/wasi-networking/