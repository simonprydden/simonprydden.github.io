# Personal Handbook  

## About  

This repository contains the documentation for my personal website, built using [Docusaurus](https://docusaurus.io/). 
The site is deployed via GitHub Pages and can be accessed at [simonprydden.github.io](https://simonprydden.github.io/).  

## Features  
- **Built with Docusaurus**: A modern, React-based static site generator.  
- **GitHub Pages Deployment**: Automatic deployment after changes are merged into the repository.  
- **Customizable Content**: Easily add or edit `.md` files for documentation and blogs.  

---

## Installation  

### Prerequisites  

Before starting, ensure the following tools are installed:  
- **Docker Compose**: Follow the [official installation guide](https://docs.docker.com/compose/install/).  
- **Docker Engine**: Install it using the [official installation guide](https://docs.docker.com/engine/install/).  

### Getting Started  

1. Clone the repository:  
   ```bash  
   git clone https://github.com/simonprydden/simonprydden.github.io.git  
   ```  
2. Navigate to the project directory:  
   ```bash  
   cd simonprydden.github.io  
   ```  

---

## Local Development  

To preview and develop the site locally:  

1. Start the development server:  
   ```bash  
   make start  
   ```  
   This command will spin up a local Docusaurus server, typically accessible at `http://localhost:3000`.  

2. Add or edit content:  
   - Add documentation in the `docs` directory.  
   - Write blog posts in the `blog` directory.  

3. Preview your changes in real time.  

---

## Deployment  

To publish your changes:  

1. Test your changes locally to ensure everything works as expected.  
2. Open a Pull Request (PR) to submit your updates for review.  
3. After the PR is reviewed and merged, your changes will be automatically deployed to [simonprydden.github.io](https://simonprydden.github.io/).  

