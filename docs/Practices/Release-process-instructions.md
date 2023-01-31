# Release process instructions


###### tags: `Practices`
| Author | Period | State |
| -------- | -------- | -------- |
| Dmitri Pal     | January 2023 | :red_circle: **Draft**|

## Step-by-step release process instructions

### Preparation
**NOTE: Start several days ahead if you are doing it the first time!**

* Before you start a release, you need to make sure you have:
    * A GitHub account and can make PRs to the enarx organization
    * You installed all the prerequisites that are needed for the installation [script](https://github.com/enarx/enarx/blob/main/helper/release_enarx.sh)  The prerequisites for a successful install can be found inside the [script](https://github.com/enarx/enarx/blob/main/helper/release_enarx.sh) in the "install_prereqs" section.
    * If you do not have a GPG key, generate one and upload to GitHub following the instructions. This key will be used to sign the release.
        * [Generating a new GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
        * [Adding a GPG key to your GitHub account](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)
    * You have access to a Windows machine to upload enarx to Windows Package Manager
    * Become familiar with the Windows Package Manager update process
        * Useful links:
            * [Submit packages to Windows Package Manager](https://learn.microsoft.com/en-us/windows/package-manager/package/?WT.mc_id=modinfra-30991-salean)
            * [Create your package manifest](https://learn.microsoft.com/en-us/windows/package-manager/package/manifest?tabs=minschema%2Cversion-example)
            * [wingetcreate upstream release page](https://github.com/microsoft/winget-create/releases/tag/v1.1.2.0) - can be used to download exe
    * You have access to the [blog platform](https://blog.enarx.dev/), if you do not, ask Nick or Jen for access (**for minor and major releases only**).
    * You have determined the name of the release (**for minor and major releases only**).
        * Every release where the X or Y component of the version is bumped counts as a "named" release.
        * Identify the name of the castle that will be used as the name of the release (we use the castle theme) and have the link to the picture ready. It is best to use Wikipedia pictures. See [example](https://blog.enarx.dev/enarx-0-6-0-fushimi-castle/).
    * Once all the preparations are complete, proceed to the next step.

### Declare a release freeze

From that point on, only the changes related to the release process are allowed.

### Run the release script
* Make sure the script prerequisites are installed.
* Checkout the enarx repository and run script [release_enarx.sh](https://github.com/enarx/enarx/blob/main/helper/release_enarx.sh) without setting any environment variables. By default, it will perform a dry run and build all images. Make sure it succeeds.
* After the dry run is successful, set `DRYRUN=false` and run the script again. This will launch the process for real.
* The script will create a PR request that bumps the version numbers in different Cargo.lock files. It should be the last PR of the release, but in practice, if the workflows fail and need to be fixed, other PRs might happen later. The script is paused until the PR is approved, so leave it sitting. Once the PR is approved, return to the script and proceed.
* The script will generate and push a release tag. If you stopped the script, you could do the procedure manually. For more details, see the script.
```
git fetch --all --tags
git checkout upstream/main
git tag --sign -m "chore(release): release v${NEW_VERSION}" "v${NEW_VERSION}"
git push upstream "v${NEW_VERSION}"
```
* Creation of the tag triggers an action [release.yml](https://github.com/enarx/enarx/blob/main/.github/workflows/release.yml). This action will rebuild all the artifacts, create a draft release text inside a draft tag and attach the binaries to the release draft.
    * Review and massage the release's content
        * Dmitri has some half-baked scripts to help sort and list PRs in a convenient order. The plan is to finalize and submit them into the repository at some point.

### Finalize the release

* Make sure that the text of the release announcement ([example](https://github.com/enarx/enarx/releases/tag/v0.7.0)) is correct. The team can review and edit it, so there is no need to create a copy elsewhere. Creating a copy in HackMD might be useful if you drop and re-create the tag if something goes wrong.
* (**Minor/Major release only**) Create a blog draft using the text from the release announcement. Use the castle name and pictures you prepared ahead of time. Here is an [example](https://blog.enarx.dev/enarx-0-6-0-fushimi-castle/).
    * Note: if there are edits to the release notes, you might want to ensure that the blog is updated
* (**Minor/Major release only**)Prepare a PR to link the blog to the website. See [example](https://github.com/enarx/website/pull/112) here. You do not need to merge it until the release is out, so you might want to turn the auto-merge off. But you can have the PR ready pending review. If you have never committed a blog to the website, you need to add your name and details about yourself to the [authors](https://github.com/enarx/website/blob/main/resources/authors.yml) file. See the PR for an example. Ask people for review and be ready to approve but ask them to hold off with approval until later.
* Prepare a PR for homebrew. Here is an [example](https://github.com/enarx/homebrew-enarx/pull/18). Have it handy but do not rush to submit it until the release is out because it will merge automatically if approved.
* Log into your windows machine and generate a new tag for a new release for the package manager.
* Use `wingencreate update` to create a new tag for windows downloads. The tool will guide you. You can submit a PR via the wingencreate tool or generate files and create a PR in a standard way. See the [example](https://github.com/microsoft/winget-pkgs/pull/93900) of the PR. The PR requires the actual link to the actual .msi file. So to submit this PR, you need the actual release. The tool will fail if the URL for the .msi is not live. So at this stage, prepare everything but not generate a PR yet.
    * The command would look like this:
`> wingetcreate update --urls https://github.com/enarx/enarx/releases/download/v0.7.1/enarx-x86_64-windows.msi --version 0.7.1 EnarxProject.enarx`
* Check that all the right binaries are attached to the release tag draft. Download and test them on different platforms. This is a farmed-out team effort.
* Check that the Quick Install instructions/guide are updated with the latest version. For that, you want to build a website locally on the same system where you prepared the PR for the website. See the instructions about how to do it [here](https://github.com/enarx/website#enarx-website--documentation).
* At this point, you are ready to release.

### Release
* Go to the release tag, open it in edit mode, do final visual checks, and click **Publish** at the bottom. This makes a release. You are now live.
* (**Minor/Major release only**) Make sure that blog matches the latest edits. You might need to copy and paste content from the release tag page (not from the editor but from the actual one). **Push the blog out** (Nick to provide instructions).
* (**Minor/Major release only**)Ask to approve the PR for the website ([example](https://github.com/enarx/website/pull/112)) and make sure it is merged.
* Deploy website using [netlify](https://app.netlify.com/sites/enarx/) (Nick to provide instructions)
* Submit the PR ([example](https://github.com/microsoft/winget-pkgs/pull/93900)) for Microsoft Package Manager (takes a couple of hours to get approved by Microsoft).
* Ask to approve the PR for homebrew - will auto-merge.

### Announce
This section is usually done by Nick, but it includes:
- Sending a Tweet with the link to the release
- Creating a quick LinkedIn post with the link to the release
- Sending an announcement to the announce channel on the Rocket Chat
