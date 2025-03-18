---
title: Git Attributes File
hide_title: True
sidebar_position: 1
---
## Introduction

A `.gitattributes` file is used to define specific attributes for files and paths within a Git repository. It 
helps control:

- **Line endings** (ensuring consistency across OSes)  
- **Binary file handling** (preventing corruption)  
- **Diffing and merging** (customizing how Git treats specific file types)  
- **Git Large File Storage (LFS)** (managing large files efficiently)  

By using `.gitattributes`, you can maintain consistent file handling across different environments, reduce merge 
conflicts, improve collaboration, and optimize repository size.
**It's best practice to always include a `.gitattributes` file in your repository.**

## Common Attributes

### Line Endings

Different operating systems use different newline characters:

- **Windows:** Carriage Return + Line Feed (**CRLF**)  
- **Linux/macOS:** Line Feed (**LF**)  

This inconsistency can cause "phantom" changes in Git, leading to unnecessary merge conflicts and breaking scripts.  
The `.gitattributes` file ensures uniform line endings regardless of individual developers' settings and *overrides* 
the `core.autocrlf` Git configuration setting.

**Attributes:**  
-   `text=auto`: Automatically detects text files and normalizes line endings.  Git uses internal heuristics (usually 
    very reliable) to determine if a file is text or binary.
-   `eol=lf`: Converts line endings to **LF** (recommended for most projects, ensuring consistency).
-   `eol=crlf`: Converts line endings to **CRLF** (only for files that *require* it, like Windows batch scripts).
-   `-text`: Marks a file as **binary**, preventing line ending conversion.  Git will *still* try to diff these files 
    unless you also use `-diff`.

:::tip
Use `text=auto eol=lf` as your baseline.  This, combined with a developer's `core.autocrlf` setting (often `true` on 
Windows, or `input` for cross-platform), provides the most robust and flexible solution.  The repository *always* stores 
files with LF line endings, while developers can work with their preferred line endings locally.
:::

**Example `.gitattributes` Configuration:**

```txt
####################################################################################################
# Git Line Endings                                                                                 #
####################################################################################################

# Auto detect text files and perform LF normalization
* text=auto eol=lf

# Force batch scripts to always use CRLF line endings so that if a repo is accessed in Windows via a 
# file share from Linux, the scripts will work.
*.{cmd,[cC][mM][dD]} text eol=crlf
*.{bat,[bB][aA][tT]} text eol=crlf

# Force bash scripts to always use LF line endings so that if a repo is accessed in Unix via a file 
# share from Windows, the scripts will work.
*.sh text eol=lf

```

### Large File System (LFS)

Storing large files directly in Git bloats the repository, making clones and fetches slow. Git LFS stores 
large files separately (on a dedicated LFS server), keeping only small pointer files in the Git repository.  
This drastically improves performance for repositories with large assets.

**Attributes**
-   `filter=lfs`: Marks files for Git LFS tracking.
-   `diff=lfs`: Uses Git LFS for diffs (shows changes to the pointer file, not the large file content).
-   `merge=lfs`: Uses Git LFS for merging (handles merging of the pointer files).

**Example `.gitattributes` Configuration:**

```
####################################################################################################
# Git Large File Storage (LFS)                                                                    #
####################################################################################################

 # Archives
*.7z filter=lfs diff=lfs merge=lfs -text
*.br filter=lfs diff=lfs merge=lfs -text
*.gz filter=lfs diff=lfs merge=lfs -text
*.tar filter=lfs diff=lfs merge=lfs -text
*.zip filter=lfs diff=lfs merge=lfs -text

# Documents
*.pdf filter=lfs diff=lfs merge=lfs -text

# Images
*.gif filter=lfs diff=lfs merge=lfs -text
*.ico filter=lfs diff=lfs merge=lfs -text
*.jpg filter=lfs diff=lfs merge=lfs -text
*.png filter=lfs diff=lfs merge=lfs -text
*.psd filter=lfs diff=lfs merge=lfs -text
*.webp filter=lfs diff=lfs merge=lfs -text

# Fonts
*.woff2 filter=lfs diff=lfs merge=lfs -text

# Other
*.exe filter=lfs diff=lfs merge=lfs -text
```


### Binary Files (Without LFS)

If you aren't using LFS, it's crucial to explicitly tell Git which files are binary. Git might misinterpret 
binary files as text, leading to corruption during line ending normalization or generating very large, 
unreadable diffs.  

**Attributes:**  
-   `-text`: Prevents line ending conversion.
-   `binary`: Equivalent to `-text -diff` (prevents both line ending normalization *and* diffing).  This is 
    the recommended way to mark binary files if you're not using LFS.
-   `-diff`:  Specifically disables diffing (useful even without `-text`).

**Example `.gitattributes` Configuration:**

```txt
####################################################################################################
# Binary Files                                                                                     #
####################################################################################################

# Treat common binary formats as binary files (disable text conversion and diffing)
*.png binary
*.jpg binary
*.gif binary
*.zip binary
*.pdf binary
*.exe binary
*.dll binary
*.mp3 binary
*.mp4 binary
```


## Best Practices Summary

-   **Always use a `.gitattributes` file in your repository.**
-   **Use `text=auto eol=lf` as your baseline for most files.**
-   **Explicitly mark binary files with `binary` or `-text -diff`.**
-   **Use Git LFS for large files.**
-   **Use `git check-attr` to verify your settings.**
-   **Commit and push your `.gitattributes` file!**  It's a critical part of your repository's configuration.
-   **Use subdirectory `.gitattributes` files for granular control within large projects.**
