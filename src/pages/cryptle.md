# Cryptle Hack Challenge

![Cryptle Hack Challenge](/img/cryptle.png?raw=true)

## Introduction

The [Enarx](https://enarx.dev/) project, which is part of the [Confidential Computing Consortium](https://confidentialcomputing.io/) from the Linux Foundation, welcomes participants to the [Cryptle Hack Challenge](https://enarx.dev/cryptle).

We’ve created an open source clone of [Wordle](https://www.nytimes.com/games/wordle/index.html) called Cryptle, available at:

https://github.com/enarx/cryptle

The goal of Cryptle is to demonstrate [data encryption in use](https://enarx.dev/docs/Start/Introduction), where the processing of the data is done in a Trusted Execution Environment (TEE), and only accessible to the Cryptle application.

There are three ways to play Cryptle: Single Player, Multi Player, and Hack Challenge.

**Single Player** is similar to Wordle. A player has to guess a five-letter secret word (selected by the application), with yellow/green colored titles shown as hints in each round, indicating letters that match with the secret word.

In the **Multi Player** mode, the secret word is not selected by the application itself, but instead is (or rather are) suggested by the players themselves. Each player proposes words that are most likely to match those sent by others. The words are sent to the Cryptle application running in an Enarx Keep (a specific TEE instance) and are only revealed to the players when there’s a match between the secret words.

The **Hack Challenge** provides a more elaborate way to engage with the game: players may write an open source application to run on the host side with root privileges with the goal of deriving or otherwise guessing the secret words. Further information is provided below:

## Participation

The mechanism chosen to “hack” Enarx and derive the secret words is up to the implementer, but the application must be available as open source (under an [OSI-approved license](https://opensource.org/licenses/)) in a public repository in [GitHub](https://github.com/) or [GitLab](https://gitlab.com/users/sign_in).

It may be written in any programming language, but should not be intentionally obfuscated.

Documentation should be provided to show how the application is able to “guess” or derive the secret words.

Once you have published your application, please open an issue at:

https://github.com/enarx/cryptle 

Your application code will be reviewed within 72 hours.

After it has been reviewed, it will be executed with root privileges on the same server where Enarx and Cryptle are running.

The application will be run for a total of 15 minutes.

Real players and/or bots will be submitting a list of secret words to the Cryptle application during this period.

The host will be running a modern Linux kernel.

The application will be run as an ELF binary.

No physical access to the host will be allowed or provided.

The Hack Challenge judges will evaluate the results and contact the player within 72h after the application was executed.

Observation: anyone who does not follow the rules from this challenge or does not follow [responsible vulnerability disclosure](https://github.com/enarx/enarx/blob/main/SECURITY.md) will be automatically disqualified.


## Scope

The goal of the Cryptle Hack Challenge is to uncover vulnerabilities in the Enarx project. The following vulnerabilities are considered part of the scope:
- Enarx runtime (including TLS implementation, and memory contents),
- Speculative execution attacks (with no hardware mitigation required),
- Timing, side-channel attacks,
- Breaking out of the Wasm sandbox.

The following are out of scope vulnerabilities:
- In the hardware itself or firmware,
- Attestation process,
- Keys for TLS,
- Client side (the browser or the Cryptle Web application itself),
- Server side (the Cryptle Rust application itself),
- DoS (abusing APIs),
- Proxy attack,
- External components / supply-chain attack,
- Introducing vulnerabilities to the supply-chain,
- Modifying the executable,
- Social engineering.

# Prizes

Prizes will be awarded to players who have successfully “hacked” Enarx within the scope described above.

The prizes will vary according to the vulnerability found.

Prizes will range from electronics (such as Raspberry Pis, drones, and laptops), conference tickets (including travel expenses), to cash prizes.

Cash prizes will be awarded in partnership with the Linux Foundation’s [LFX Crowdfunding platform](https://crowdfunding.lfx.linuxfoundation.org/).

## Timeline

The Cryptle Hack Challenge will be promoted at the following conferences attended by the Enarx team:

May 16, 2022: [KubeCon / CloudNativeCon Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/)  
**Cryptle Hack Challenge launched**  

June 6, 2022: [RSA Conference](https://www.rsaconference.com/)  

June 21, 2022: [Open Source Summit North America](https://events.linuxfoundation.org/open-source-summit-north-america/)  
**Cryptle Hack Challenge booth**  

July 28, 2022: [SCALE 19x](https://www.socallinuxexpo.org/scale/19x)  

August 6, 2022: [Black Hat](https://www.blackhat.com/)  
**Winners of the first round of the Cryptle Hack Challenge announced**  

August 11, 2022: [DEF CON](https://defcon.org/)  
**Launch of the second round of the Cryptle Hack Challenge**  

September 13, 2022: [Open Source Summit Europe](https://events.linuxfoundation.org/open-source-summit-europe/)  
**Cryptle Hack Challenge booth**  

October 24, 2022: [KubeCon / CloudNativeCon North America](https://www.allthingsopen.org/call-for-papers-2022/)  

November 30, 2022: [All Things Open](https://www.allthingsopen.org/call-for-papers-2022/)  
**Winners of the second round announced**  
**Closing ceremony of the Cryptle Hack Challenge**
