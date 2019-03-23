---
title: Introduction to Protobufs
description: ""
tags:
    - protobufs
categories:
    - development
series: Protobufs and gRPC
date: 2019-03-19
draft: true
---

Protobufs (formally known as Protocol Buffers) is very simlilar to JSON and XML, as all three of these are **serialization formats**.

Protobuf payloads are serialized into a binary format, and are sent over the wire in binary. This has a advantage of making requests and responses much more efficent, but doing this has a few tradeoffs.

* Payloads are not human-readable like JSON or XML
* Payloads will need to be described ahead-of-time (by using `.proto` files)
* Payloads can only be serialized and deserialized by using `.proto` files (with one notable exception).

Some may view creating `.proto` files as a disadvantage or a burden, as adding a new field usually requires a bit more ceremony than in JSON and XML. But it ensures what your clients can expect, enables powerful code-generation tools, and ensures a consistant forward-and-backwards compatable format.

### Protobuf Compiler

To use Protobufs, we have to install the Protobuf Compiler, known as `protoc`. 

This tool will generate our code for us to use later on.

Luckily, this tool is extendable, and has lots of plugins available. In fact, this compiler is also used to generate gRPC code stubs as you'll see later.

### Common Issues

Protobuf syntax is 
