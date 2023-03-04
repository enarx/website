# Project Management Practices


###### tags: `Practices`
| Author | Period | State |
| -------- | -------- | -------- |
| Dmitri Pal     | January, 2023 | :red_circle: **Draft**|

## Overview

Current document describes our intended project management practices for the Enarx, Steward, Drawbridge and related projects and components under Enarx and Profianinc organizations on GitHub.

## Project Management

We use [Enarx Board](https://github.com/orgs/enarx/projects/10) for project management.
The main view that we will utilize as a team is the [Board view](https://github.com/orgs/enarx/projects/10/views/2). Individuals might create their own views or use filtering with the current view.

**Team members agreed that the board will be the main tool or project management and will be used by the team members as the main tool for handling work. Team member will have it on all the time during the day and consult it and update it multiple times a day.**

### Statuses and Their Meaning

Project has several statuses:
* **New** - for new issues that need to be reviewed and triaged
* **Priority (Epic)** - these are the big Features or Epics we have identified as a priority that a team should focus on. These epics can be worked on for a period of time and span several releases. As long as it is a:
    * Feature/Epic, i.e. big chunk of work
    * It is a Priority, identified by the team
    * It is actually being worked on in the current sprint or being planned for the next sprint
* **For Review** - issues and PRs that require team review. This state is mostly used for the PRs that require reviews.
* **Regular PRs** - the PRs open by bots daily that do not need to be merged daily. The project automation scripts will place the open PRs into the **For Review** state. The PRs that fall into this category are identified during the standup and pulled into the **Regular PRs** state and sit there until merged by the appointed person once a week.
* **In Progress** - tickets that are actively being worked on and are a part of the sprint. Draft PRs can show up in this bucket.
*
* **For Review** - PRs (and other tickts) that need to be reviewed by the team.
* **Scheduled (this sprint)** - tickets that are scheduled/planned to be addressed in a sprint go into this bucket. This status is assigned during sprint planning meeting or during a follow-up replenishment activity. The intent is to have not more than 3 tickets per person in this bucket at the beginning of the sprint, 1-2 is better. Tickets can be added later (replenished)if the person runs out of work.
* **Standby (next sprint)** - ticket that are high priority but did not fit into the sprint. This bucket is a backlog for the next sprint.
* **Backlog** - deferred tickets. The team should strive to keep the backlog size capped at 100 tickets and periodically clean older tickets that are not relevant anymore. Long backlogs are hard to maintain and a source of overhead.
* **Done** - Completed or closed tickets and PRs.

### Ticket creation

Tickets can be created in different ways and come in different types.
But the main division is bigger features vs. a bug/chore/small feature, vs. a task as a part of the bigger feature. Bigger features are aggregations of smaller tasks.

#### Logic for scheduling bigger features
 1. Team decides that the big feature is a priority based on the current goals. Team makes this decision during a sprint planning meeting.
 2. Sprint coordinator (or manager/project manager) puts the big feature ticket into "Priority (Epic)" bucket. The feature must be assigned to a person who owns and coordinates the feature. That person should create an ordered list of subtasks (by sequence of execution) inside the feature and turn the first couple of tasks into the subtask tickets using a checklist "convert to ticket" GitHub feature.
 3. The created subtasks are should be placed into the scheduled bucket manually (or when automation is available, via automation) and reviewed at the sprint planning meeting.

#### Scheduling smaller features
If a smaller feature, a bug or a chore is important and should be worked on, it should be proposed at the sprint planning meeting, discussed and agreed to be planned. It is placed in the scheduled bucket directly during a sprint planning meeting or during a follow-up replenishment conversation.

#### Triage
We will conduct triage of the incoming issues during the daily "Status call" if time permits.

## Sprints and Releases
 * We run sprints
 * Sprints are 2 week long
 * First week is feature work the second is stabilization
 * The release is made every two weeks
 * The second week of the sprint is "feature freeze" - no new major features come in that week.
 * We will create release branches foe every release where we bump major or minor version.
 * Sprint starts on **Wednesday**

## Meetings
* Daily Status Meetings - daily 10Am EST

| Day | First week | Second week |
|-------- | -------- | -------- |
|Wednesday|Sprint kickoff|(Feature Freeze) Normal triage/status|
|Thursday|Normal triage/status|Normal triage/status|
|Friday|Normal triage/status|Normal triage/status|
|Monday|Demo + triage/status|Demo + triage/status + release prep|
|Tuesday|Normal triage/status|Sprint wrap up/Release party|

* Design meeting - Thursdays 9am EST

| First week | Second week |
|-------- | -------- |
| Retrospective of the previous sprint | Actual design session |

## Roles

* **Project coordinator** - this is the role similar to scrum master/project manager. It can be a rotating role. The person is responsible for making sure all the rituals are followed as described and the team knows what needs to be done and when.
* **Owner** - of a ticket. Each team member can be an owner of the ticket, it being a PR, bug or a major feature. It is the responsibility of the owner to make sure the tickets and PRs the work on are in the correct state and have all the right details.

## Automation

 * We will use automation to help with project management and reduce manual burden
 * The details about the automation scripts can be found [here](https://github.com/enarx/.github/tree/main/management/projects).

