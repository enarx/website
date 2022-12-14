# Document Properties Convention

###### tags: `Practices` 
| Author | Period | State |
| -------- | -------- | -------- |
| Dmitri Pal | December, 2022 | :thumbsup: **Active** | 

## Overview

This document describes a convention on tagging the documents used to govern the projects under Enarx and Profianinc GitHub organizational umbrella.

Each document must include:
* A **tag** which helps to identity a type of the document and used to manage documents within the HackMD portal. Supported tags include:
    * **Practices** - documents that describe how the teams operate. Those documents are synced to the Enarx Website repo
    * **Design** - design documents covering design aspects of the corresponding projects. These documents are synced to the corresponding design repo in each of the organizations.
    * **Instructions** - documents that hold instructions. These documents stay in the HackMD portal.
    * **Notes** - documents that contain notes, this type is usually used as a temporary storage for information that shapes other types of documents. These documents stay in the HackMD portal and can be retired once the main document is polished.
    * **Meeting** - documents that hold meeting notes, outcomes or plans and proposed agenda for different meetings. These documents stay in the HackMD portal.
    
* A table in the format:

    | Author | Period | State |
    | -------- | -------- | -------- |
    | &nbsp; | |  | 

    * **Author** - the name(s) of the author/owner of the document
    * **Period** - roughly a month and a year the document content is relevant to. One should read this as "at the mentioned time period the document reflected a reality". For example if the Period states: "May, 2023" and it is "June, 2023" one can assume that the document is recent and the related practices or implementation have not evolved or diverged. If the current date is "June, 2025" this means that the document and related practices might have not been reviewed and adjusted for a while and might require maintenance.
    * **State** - recommended states are:
        * **Draft** - document has not been reviewed and agreed to yet.
        * **Active** - document was reviewed and accepted.
        * **Declined** - document was reviewed and rejected.
        * **Retired** - document is not relevant any more and the team decided to retire it
    HTML style color coding is not supported by different systems. Instead we can use emoji to draw attention to the current status, for example:
            * :red_circle: **Draft**
            * :thumbsup: **Active**
            * :thumbsdown: **Declined**
            * :x: **Retired**

We expect further changes to the tagging. As a result documents might hold older and refined properties format. There is **no** requirement to update the properties of all existing documents if the properties format changes. However, if a document requires maintenance for other reasons, the document properties should be adjusted to match the latest format.
