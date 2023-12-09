---
slug: 2022-08-13-defcon-cryptle
title: "Cryptle: a secure multi-party Wordle clone with Enarx"  
authors: [richard, nick, tom]
tags: [Event]
---

**Title**: Cryptle: a secure multi-party Wordle clone with Enarx    
**Author**: Richard Zak, Nick Vidal, Tom Dohrmann   
**Date**: August 13, 2022   

Wordle is a popular web-based game, where a single player has to guess a five-letter word in six attempts, with yellow/green colored titles shown as hints in each round, indicating letters that match with the secret word.

We’ve created an open source clone of Wordle called Cryptle, with the goal of demonstrating data encryption in use, where the processing of the data is done in a Trusted Execution Environment (TEE), and only accessible to the Cryptle application.
Cryptle is similar to Wordle but one important difference is that it is multi-party and the secret words are suggested by the players themselves. Each player proposes words that are most likely to match those sent by others. The words are sent to the Cryptle application deployed and running in an Enarx Keep (a specific TEE instance) and are only revealed to the players when there’s a match between the secret words.

The standard way to engage with the game is for players to guess the secret words by playing Cryptle from the client side. However, we will also be allowing an alternative: players may write an open source application which runs with root privileges on the host side and attempts to derive or otherwise guess the secret words. Since Cryptle makes use of Confidential Computing, players shouldn't be able to read what's in memory, even with root access.
We'll provide an overview of an exploit of Enarx and we'll explain how we were able to fix it. Attendees will be invited to find new vulnerabilities as part of the Cryptle Hack Challenge.


**Source**: DEF CON 30

**Link**: https://defcon.org

**PDF**: [DEFCON30_Cryptle.pdf](/assets/docs/DEFCON30_Cryptle.pdf)