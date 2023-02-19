# Conclusion

Enarx is a leading open source framework for running applications in TEEs (Trusted Execution Environments). It manages the creation of these TEEs – referred to as "Keeps" – providing cryptographic confidence that they are using valid CPU hardware. It encrypts and provisions applications and data using one-time cryptographic keys. The applications run without any of the layers in the stack (e.g. hypervisor, kernel, user-space, middleware) being able to look into or alter the Keep or its contents.

Here's a summary of some of the commonly used terms in this doc:

![An Enarx Dictionary](/static/assets/images/enarx-dictionary.png)
