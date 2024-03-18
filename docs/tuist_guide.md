# Tuist Guide

[Official Tuist Documentation](https://docs.tuist.io/documentation/tuist)

## Table of Contents
- [Tuist Guide](#tuist-guide)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Section 1: Exploring Project Files](#section-1-exploring-project-files)
    - [Examining Project Files](#examining-project-files)
  - [Section 2: Generating the Xcode project](#section-2-generating-the-xcode-project)

## Introduction

Welcome to the Tuist guide! This guide will walk you through the process of using Tuist to manage your iOS project. Tuist is a command-line tool that helps you generate, maintain, and interact with Xcode projects programmatically using a declarative DSL.

## Section 1: Exploring Project Files

Before diving into working with Tuist in your project, it's helpful to explore the generated files and see if any modifications are needed to tailor them to your specific needs.

### Examining Project Files

When you generate the project with Tuist, several files are created that define the structure of your project. It's important to understand what each file does and how they can be modified to meet your requirements.

<details>
  <summary>Step 1</summary>
  
  If you open the `Project.swift` file, you can see something like this. By default, Tuist provides you a template with which you can have a modular app.

  ℹ️ **Tip:**
  You can run `tuist edit` to generate a temporary Xcode project with all the project manifests and the project description helpers, so you will be able to edit the whole project configuration.

</details>
<details>
  <summary>Step 2</summary>
  
  If you are curious, you can explore the generated files. The `Project+Templates.swift` file looks very much like the options you usually see in an Xcodeproj file. Many of these properties might be familiar to you; feel free to change things, and if you would like to add something that’s missing, you can check the reference for ProjectDescription.

  ℹ️ **Tip:**
  You can build the manifest project before ending your edits, to make sure you have not done any mistakes in project setup. Once you are happy with the project settings, you can close this window and press ^+C to terminate the edit command.

</details>

## Section 2: Generating the Xcode project

If you noticed from the previous section, we were missing one crucial file, the Xcode project. Without which Xcode cannot open our project, so let’s see what we can do to fix that.

<details>
  <summary>Step 1</summary>
  
  Tuist comes with a command to generate projects and workspaces from your manifest files. We can run this command in terminal, and we’ll get our `MyApp.xcodeproj` and `MyApp.xcworkspace` files.

  ```console
  % tuist generate
  ```
</details>
<details>
  <summary>Step 2</summary>
Once the project files have been generated, Xcode would open automatically, and you should be able to run your project in the simulator successfully. You would get success messages like this in the console.

</details>
<details>
  <summary>Step 3</summary>
Last but not least, you might want to include a badge in your project’s README to indicate that the project is defined using Tuist.

</details>