# Naeil Platform

- Cyber Aegis Training Platform

- [Sections](#sections)
  - [Title](#Title)
  - [What is Naeil Platform?](#What-is-Naeil-Platform?)
  - [How to Use?](#How-to-Use?)
  - [Web Images](#Web-Images)
  - [Utilization Technology](#Utilization-Technology)

## Sections

- ### Title
    **Cyber Aegis Training Platform**


- ### What is Naeil Platform?

![image](https://user-images.githubusercontent.com/55818230/129669660-2298e247-0c2e-4aaa-bc77-48fd9ec4f8b7.png)

    Note: This is a platform that many people who dream of becoming security experts can use to improve their skills.


- ### How to Use?
    - This platform is designed for the openstack train version.
    - You must enter the db password for each account in the /naeil-package/openrc directory.
    ```markdown
       # /naeil-package/openrc/* 
    ```


- ### WEb Images
    - #### Main Page
    ![image](https://user-images.githubusercontent.com/55818230/129669996-c5953314-0530-4fe7-b59e-b94253bacb04.png)

    - #### Login Page
    ![image](https://user-images.githubusercontent.com/55818230/129670241-507deca3-da69-4efb-9274-bed4e625d127.png)

    - #### Training List Page
    ![image](https://user-images.githubusercontent.com/55818230/129670422-fb7cf947-f8ae-4c54-85b0-61c01ce94564.png)

    - #### Training Page : training - usage
    ![image](https://user-images.githubusercontent.com/55818230/129670557-cab0954b-f417-497e-b8dc-58b2ed3c4ab8.png)

    - #### Training Page : training - Attacker VNC
    ![image](https://user-images.githubusercontent.com/55818230/129670734-0aab4f34-6095-40e9-878f-8ca10c462051.png)

    - #### MyPage
    ![image](https://user-images.githubusercontent.com/55818230/129670814-36e6c732-f459-4133-859f-e30fa201bfa9.png)

    - #### Monitoring Page
    ![image](https://user-images.githubusercontent.com/55818230/129670930-2782d143-437d-4dfc-96a0-d60c2bf6a2a4.png)














**Requirements:**
- Title must match repository, folder and package manager names - or it may have another, relevant title with the repository, folder, and package manager title next to it in italics and in parentheses. For instance:

  ```markdown
  # Standard Readme Style _(standard-readme)_
  ```

  If any of the folder, repository, or package manager names do not match, there must be a note in the [Long Description](#long-description) explaining why.

**Suggestions:**
- Should be self-evident.

### Banner
**Status:** Optional.

**Requirements:**
- Must not have its own title.
- Must link to local image in current repository.
- Must appear directly after the title.

### Badges
**Status:** Optional.

**Requirements:**
- Must not have its own title.
- Must be newline delimited.

**Suggestions:**
- Use http://shields.io or a similar service to create and host the images.
- Add the [Standard Readme badge](https://github.com/RichardLitt/standard-readme#badge).

### Short Description
**Status:** Required.

**Requirements:**
- Must not have its own title.
- Must be less than 120 characters.
- Must not start with `> `
- Must be on its own line.
- Must match the description in the packager manager's `description` field.
- Must match GitHub's description (if on GitHub).

**Suggestions:**
- Use [gh-description](https://github.com/RichardLitt/gh-description) to set and get GitHub description.
- Use `npm show . description` to show the description from a local [npm](https://npmjs.com) package.

### Long Description
**Status:** Optional.

**Requirements:**
- Must not have its own title.
- If any of the folder, repository, or package manager names do not match, there must be a note here as to why. See [Title section](#title).

**Suggestions:**
- If too long, consider moving to the [Background](#background) section.
- Cover the main reasons for building the repository.
- "This should describe your module in broad terms,
generally in just a few paragraphs; more detail of the module's
routines or methods, lengthy code examples, or other in-depth
material should be given in subsequent sections.

  Ideally, someone who's slightly familiar with your module should be
able to refresh their memory without hitting "page down". As your
reader continues through the document, they should receive a
progressively greater amount of knowledge."

  ~ [Kirrily "Skud" Robert, perlmodstyle](http://perldoc.perl.org/perlmodstyle.html)

### Table of Contents
**Status:** Required; optional for READMEs shorter than 100 lines.

**Requirements:**
- Must link to all Markdown sections in the file.
- Must start with the next section; do not include the title or Table of Contents headings.
- Must be at least one-depth: must capture all `##` headings.

**Suggestions:**
- May capture third and fourth depth headings. If it is a long ToC, these are optional.

### Security
**Status**: Optional.

**Requirements:**
- May go here if it is important to highlight security concerns. Otherwise, it should be in [Extra Sections](#extra-sections).

### Background
**Status:** Optional.

**Requirements:**
- Cover motivation.
- Cover abstract dependencies.
- Cover intellectual provenance: A `See Also` section is also fitting.

### Install
**Status:** Required by default, optional for [documentation repositories](#definitions).

**Requirements:**
- Code block illustrating how to install.

**Subsections:**
- `Dependencies`. Required if there are unusual dependencies or dependencies that must be manually installed.

**Suggestions:**
- Link to prerequisite sites for programming language: [npmjs](https://npmjs.com), [godocs](https://godoc.org), etc.
- Include any system-specific information needed for installation.
- An `Updating` section would be useful for most packages, if there are multiple versions which the user may interface with.

### Usage
**Status:** Required by default, optional for [documentation repositories](#definitions).

**Requirements:**
- Code block illustrating common usage.
- If CLI compatible, code block indicating common usage.
- If importable, code block indicating both import functionality and usage.

**Subsections:**
- `CLI`. Required if CLI functionality exists.

**Suggestions:**
- Cover basic choices that may affect usage: for instance, if JavaScript, cover promises/callbacks, ES6 here.
- If relevant, point to a runnable file for the usage code.

### Extra Sections
**Status**: Optional.

**Requirements:**
- None.

**Suggestions:**
- This should not be called `Extra Sections`. This is a space for 0 or more sections to be included, each of which must have their own titles.
- This should contain any other sections that are relevant, placed after [Usage](#usage) and before [API](#api).
- Specifically, the [Security](#security) section should be here if it wasn't important enough to be placed above.

### API
**Status:** Optional.

**Requirements:**
- Describe exported functions and objects.

**Suggestions:**
- Describe signatures, return types, callbacks, and events.
- Cover types covered where not obvious.
- Describe caveats.
- If using an external API generator (like go-doc, js-doc, or so on), point to an external `API.md` file. This can be the only item in the section, if present.

### Maintainer(s)
**Status**: Optional.

**Requirements:**
- Must be called `Maintainer` or `Maintainers`.
- List maintainer(s) for a repository, along with one way of contacting them (e.g. GitHub link or email).

**Suggestions:**
- This should be a small list of people in charge of the repo. This should not be everyone with access rights, such as an entire organization, but the people who should be pinged and who are in charge of the direction and maintenance of the repository.
- Listing past maintainers is good for attribution, and kind.

### Thanks
**Status**: Optional.

**Requirements:**
- Must be called `Thanks`, `Credits` or `Acknowledgements`.

**Suggestions:**
- State anyone or anything that significantly helped with the development of your project.
- State public contact hyper-links if applicable.

### Contributing
**Status**: Required.

**Requirements:**
- State where users can ask questions.
- State whether PRs are accepted.
- List any requirements for contributing; for instance, having a sign-off on commits.

**Suggestions:**
- Link to a CONTRIBUTING file -- if there is one.
- Be as friendly as possible.
- Link to the GitHub issues.
- Link to a Code of Conduct. A CoC is often in the Contributing section or document, or set elsewhere for an entire organization, so it may not be necessary to include the entire file in each repository. However, it is highly recommended to always link to the code, wherever it lives.
- A subsection for listing contributors is also welcome here.

### License
**Status:** Required.

**Requirements:**
- State license full name or identifier, as listed on the  [SPDX](https://spdx.org/licenses/) license list. For unlicensed repositories, add `UNLICENSED`. For more details, add `SEE LICENSE IN <filename>` and link to the license file. (These requirements were adapted from [npm](https://docs.npmjs.com/files/package.json#license)).
- State license owner.
- Must be last section.

**Suggestions:**
- Link to longer License file in local repository.

## Definitions

_These definitions are provided to clarify any terms used above._

- **Documentation repositories**: Repositories without any functional code. For instance, [RichardLitt/knowledge](https://github.com/RichardLitt/knowledge).

