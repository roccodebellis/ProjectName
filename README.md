# ProjectName

## Installation and Setup Guide

Welcome to the **ProjectName** project. This guide will provide you with the necessary instructions to install and set up the development environment for the project.

### System Requirements

Before getting started, make sure you meet the following system requirements:

- macOS operating system
- Installed Xcode (recommended version: Xcode 15.2)

### Installing Dependencies

To install all project dependencies, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/roccodebellis/ProjectName.git
    ```

2. Navigate to the project directory:

    ```bash
    cd project-name
    ```

3. Install project dependencies using the Makefile:

    ```bash
    make system_dependencies
    ```

> **Note:** Alternatively, you can run the provided installation script (see [Installation Script](#installation-script)).

This command will install all dependencies listed in the Brewfile, including tools like Mise and Twist required for the project.

### Configuration

After installing dependencies, you may need to perform additional configuration for your development environment. Refer to the project documentation for further information on configuration.

### Running the Project

Once installation and configuration are complete, you're ready to run the project. Follow the instructions provided in the project documentation to start the application.

### Installation Script

An installation script is available to automate the installation of project dependencies. Here are the available scripts:

- `install_dependencies.zsh`: Automates the installation of project dependencies using the Makefile.


To use the installation script, run the following command in your terminal:

```bash
./install_dependencies.zsh
