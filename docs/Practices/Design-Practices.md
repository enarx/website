# Design Practices

[![hackmd-github-sync-badge](https://hackmd.io/RwifznZpTjSetxwo0JOjeA/badge)](https://hackmd.io/RwifznZpTjSetxwo0JOjeA)


###### tags: `Practices`
| Author | Period | State |
| -------- | -------- | -------- |
| Dmitri Pal     | December, 2022 | :thumbsup: **Active**|

## Overview

Current document describes the common practices adopted in the projects that fall under Enarx and Profianinc organizational umbrella.

This specific document focuses on the design related activities.

## What do we mean by design?

Design is the process of creating an agreed to approach to implementing a specific feature. It can be, for example, an architectural diagram, a protocol definition, an interface specification, a schema of a database or something similar.

The goals of creating a design are: 
* Expressing or illustrating an idea of how something should be implemented
* Sharing a perspective for a team discussion.
* Agreeing as a team on how something should work and be implemented.
* Recording the intended behavior as a point of reference for future development iterations. Design documents usually answer questions like:
    * Why do things work this way?
    * What was the idea behind this capability?
    * How this feature is/was supposed to work?
* Giving team members a context and a reference point they can use during a PR review.
* Providing a foundation for end user documentation.
* Enabling future community contributors and team members to get up to speed faster.

## When a design document should be created?
Creating a design document is a pretty heavy-weight process and has a lot of cost for the team. It is not required to create a design document for every feature or bug. On the other side, when a design is missing, it might lead to disagreements during reviews and a more complicated review process.

The document must be created if any of the following situations applies:
- The feature has a direct user impact, for example a change or addition of a public API, changes to a CLI or a change to configuration file syntax.
- The feature has security implications. Any changes to security properties of the system or any of its components require a design document.
- If a submitted PR leads to a discussion that requires more in depth conversation and agreement. In this case the work on the PR should be paused and a design document should be created and reviewed by the team.

The owner of the feature should use the best judgment and decide whether to create the document or not. There is no silver bullet and there is a level of uncertainty that needs to be accepted. But it is a responsibility of the feature owner to recognize the need for a design as soon as possible and, if such need is identified, follow the described process.

## Design document life-cycle

Design documents adhere to the following life-cycle:
* Creation
* Collaboration and Review
* Acceptance
* Maintenance
* Retirement

## Creating a design document

To create a design document:
* Go to the Enarx team [HackMS site](https://hackmd.io/team/enarx?nav=overview) and click "new Team Note"
* After adding a title, add a document properties section similar to the one at the top of this document following the [Document Properties Convention](https://hackmd.io/@enarx/HyJSScAPj). Use tag **"Design"**.
* Write the design document
* Arrange the reviews.
* After the design document is accepted, change the status to **Accepted** and push the document to GitHub. HackMD is already connected to the proper repositories and organizations and can push the content to GitHub. Specific steps:
    * In the three-dot menu in the top right corner of the HackMd screen select "Versions and Github sync".
    * Click "Save as version" button on the right
    * Use the name that matches the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) rules. If not followed, the commit would be rejected by Commisery PR checker. Click Save. You can refine the name and description later by clicking the three dots in the same dialog and selecting the "Edit" option. But once the version is saved you can't change the content and refine it by adding more changes. You also can't squash two named versions together.
    * Select the named version on the left and click "Push to GitHub" button.
    * As suggested by the pop-up (if you get one) switch the way how the lines are handled.
    * In the dialog select the proper repo, create a new branch every time, select a new file for the new document in the location under Docs folder. If you have unsaved changes you can save a named version and push it right away. Use the Conventional Commits naming convention here too.
    * In the corresponding repository on GitHub create a PR request following the standard Enarx rules. Once the change is reviewed the PR will be auto-merged.

## Collaborating around a design document
The collaboration process around a design document might require several iterations. Create a draft, share the document in the chat with the context. You can also link it to PRs. Arrange time for people to review and provide feedback.The review might be done async or if the problem space is complex a meeting or even a series of meetings. Refrain from pushing the draft to GitHub before the document is accepted and agreed to.

## Maintaining a design document
From time to time the document might need refinement. The version in HackMD is expected to be the latest to work with. Pull the version from GitHub only if the HackMD version got messed up or destroyed.
Update the document, collaborate with reviewers and push the updated version in a similar fashion to the flow described above except that use the exiting file rather than creating a new one.
Do not forget to conduct maintenance of the document header as defined in the [Document Properties Convention](https://hackmd.io/cCeJHwjBSYyxlYx2PyWVFA).

## Archiving a design document
If the document is not relevant any more you can:
- Mark it :x: **Retired**
- Push the latest changes to GitHub
- Remove the document from HackMD

Later the document can be retired or archived in GitHub too. But it would probably be a responsibility of a bot.

