.. _how-to-git_seagl_2016:

How To Git
==========

*Elijah C. Voigt*

.. code:: Text

    NAME
        git - the stupid content tracker

    SYNOPSIS
        git <command> [<args>]

    DESCRIPTION
        Git is a fast, scalable, distributed revision control system
        with an unusually rich command set that provides both
        high-level operations and full access to internals.


``git init`` ------------

.. code::

    NAME
        git-init - Create an empty Git repository or reinitialize
        an existing one

    SYNOPSIS
        git init [-q | --quiet] [--bare]
                 [--template= <template_directory>]
                 [--separate-git-dir <git dir>]
                 [--shared[=<permissions>]] [directory]

    DESCRIPTION
        This command creates an empty Git repository - basically a
        .git directory with subdirectories for objects, refs/heads,
        refs/tags, and template files. An initial HEAD file that
        references the HEAD of the master branch is also created.


``git status``
--------------

.. code::

    NAME
        git-status - Show the working tree status

    SYNOPSIS
        git status [<options>...] [--] [<pathspec>...]

    DESCRIPTION
        Displays paths that have differences between the index file
        and the current HEAD commit, paths that have differences
        between the working tree and the index file, and paths in the
        working tree that are not tracked by Git (and are not ignored
        by gitignore(5)).  The first are what you would commit by
        running git commit; the second and third are what you could
        commit by running git add before running git commit.


``git add``
-----------

.. code::

    NAME
       git-add - Add file contents to the index

    SYNOPSIS
        git add [--verbose | -v] [--dry-run | -n] [--force | -f]
                [--interactive | -i] [--patch | -p] [--edit | -e]
                [--[no-]all | --[no-]ignore-removal | [--update | -u]]
                [--intent-to-add | -N] [--refresh] [--ignore-errors]
                [--ignore-missing] [--] [<pathspec>...]

    DESCRIPTION
        This command updates the index using the current content
        found in the working tree, to prepare the content staged for
        the next commit. It typically adds the current content of
        existing paths as a whole, but with some options it can also
        be used to add content with only part of the changes made to
        the working tree files applied, or remove paths that do not
        exist in the working tree anymore.


``git commit``
--------------

.. code::

    NAME
        git-commit - Record changes to the repository

    SYNOPSIS
        git commit [-a | --interactive | --patch] [-s] [-v] [-u<mode>]
                   [--amend] [--dry-run] [(-c | -C | --fixup |
                   --squash) <commit>] [-F <file> | -m <msg>]
                   [--reset-author] [--allow-empty]
                   [--allow-empty-message] [--no-verify] [-e]
                   [--author=<author>] [--date=<date>]
                   [--cleanup=<mode>] [--[no-]status] [-i | -o]
                   [-S[<keyid>]] [--] [<file>...]

    DESCRIPTION
        Stores the current contents of the index in a new commit along
        with a log message from the user describing the changes.

        The content to be added can be specified in several ways:


``git log``
-----------

.. code::

    NAME
        git-log - Show commit logs

    SYNOPSIS
        git log [<options>] [<revision range>] [[--] <path>...]

    DESCRIPTION
        Shows the commit logs.

        The command takes options applicable to the git rev-list
        command to control what is shown and how, and options
        applicable to the git diff-* commands to control how the
        changes each commit introduces are shown.


``git push``
------------

.. code::

    NAME
        git-push - Update remote refs along with associated objects

    SYNOPSIS
        git push [--all | --mirror | --tags] [--follow-tags]
                 [--atomic] [-n | --dry-run]
                 [--receive-pack=<git-receive-pack>]
                 [--repo=<repository>] [-f | --force] [-d | --delete]
                 [--prune] [-v | --verbose] [-u | --set-upstream]
                 [--[no-]signed|--sign=(true|false|if-asked)]
                 [--force-with-lease[=<refname>[:<expect>]]]
                 [--no-verify] [<repository> [<refspec>...]]

    DESCRIPTION
        Updates remote refs using local refs, while sending objects
        necessary to complete the given refs.


``git remote``
--------------

.. code::

    NAME
           git-remote - Manage set of tracked repositories

    SYNOPSIS
           git remote [-v | --verbose]
           git remote add [-t <branch>] [-m <master>] [-f] [--[no-]tags]
                          [--mirror=<fetch|push>] <name> <url>
           git remote rename <old> <new>
           git remote remove <name>
           git remote set-url [--push] <name> <newurl> [<oldurl>]
           [...]

    DESCRIPTION
           Manage the set of repositories ("remotes") whose branches
           you track.


``git fetch``
-------------

.. code::

    NAME
        git-fetch - Download objects and refs from another repository

    SYNOPSIS
        git fetch [<options>] [<repository> [<refspec>...]]
        git fetch [<options>] <group>
        git fetch --multiple [<options>] [(<repository> | <group>)...]
        git fetch --all [<options>]

    DESCRIPTION
        Fetch branches and/or tags (collectively, "refs") from one or
        more other repositories, along with the objects necessary to
        complete their histories. Remote-tracking branches are updated
        (see the description of <refspec> below for ways to control
        this behavior).


``git rebase``
--------------

.. code::

    NAME
       git-rebase - Reapply commits on top of another base tip

    SYNOPSIS
        git rebase [-i | --interactive] [options] [--exec <cmd>]
                   [--onto <newbase>] [<upstream> [<branch>]]
        git rebase [-i | --interactive] [options] [--exec <cmd>]
                   [--onto <newbase>] --root [<branch>]
        git rebase --continue | --skip | --abort | --edit-todo

    DESCRIPTION
        If <branch> is specified, git rebase will perform an automatic
        git checkout <branch> before doing anything else. Otherwise it
        remains on the current branch.


``git branch``
--------------

.. code::

    NAME
        git-branch - List, create, or delete branches

    SYNOPSIS
        git branch [--color[=<when>] | --no-color] [-r | -a] [--list]
                   [-v [--abbrev=<length> | --no-abbrev]]
                   [--column[=<options>] | --no-column] [(--merged |
                   --no-merged | --contains) [<commit>]]
                   [--sort=<key>] [--points-at <object>]
                   [<pattern>...]
        git branch [--set-upstream | --track | --no-track] [-l] [-f]
                   <branchname> [<start-point>]
        git branch (--set-upstream-to=<upstream> | -u <upstream>)
                   [<branchname>]
        git branch --edit-description [<branchname>]

    DESCRIPTION
       If --list is given, or if there are no non-option arguments,
       existing branches are listed; the current branch will be
       highlighted with an asterisk. Option -r causes the
       remote-tracking branches to be listed, and option -a shows both
       local and remote branches. If a <pattern> is given, it is used
       as a shell wildcard to restrict the output to matching
       branches. If multiple patterns are given, a branch is shown if
       it matches any of the patterns. Note that when providing a
       <pattern>, you must use --list; otherwise the command is
       interpreted as branch creation.


``git checkout``
----------------

.. code::

    NAME
        git-checkout - Switch branches or restore working tree files

    SYNOPSIS
        git checkout [-q] [-f] [-m] [<branch>]
        git checkout [-q] [-f] [-m] --detach [<branch>]
        git checkout [-q] [-f] [-m] [--detach] <commit>
        git checkout [-q] [-f] [-m] [[-b|-B|--orphan] <new_branch>]
                     [<start_point>]
        git checkout [-f|--ours|--theirs|-m|--conflict=<style>]
                     [<tree-ish>] [--] <paths>...
        git checkout [-p|--patch] [<tree-ish>] [--] [<paths>...]

    DESCRIPTION
        Updates files in the working tree to match the version in the
        index or the specified tree. If no paths are given, git
        checkout will also update HEAD to set the specified branch as
        the current branch.


``git reset``
-------------

.. code::

    NAME
        git-reset - Reset current HEAD to the specified state

    SYNOPSIS
        git reset [-q] [<tree-ish>] [--] <paths>...
        git reset (--patch | -p) [<tree-ish>] [--] [<paths>...]
        git reset [--soft | --mixed [-N] | --hard | --merge | --keep]
                  [-q] [<commit>]

    DESCRIPTION
        In the first and second form, copy entries from <tree-ish> to
        the index. In the third form, set the current branch head
        (HEAD) to <commit>, optionally modifying index and working
        tree to match. The <tree-ish>/<commit> defaults to HEAD in all
        forms.


``git rm``
----------

.. code::

    NAME
        git-rm - Remove files from the working tree and from the index

    SYNOPSIS
        git rm [-f | --force] [-n] [-r] [--cached] [--ignore-unmatch] [--quiet]
               [--] <file>...

    DESCRIPTION
        Remove files from the index, or from the working tree and the index.
        git rm will not remove a file from just your working directory.  (There
        is no option to remove a file only from the working tree and yet keep
        it in the index; use /bin/rm if you want to do that.) The files being
        removed have to be identical to the tip of the branch, and no updates
        to their contents can be staged in the index, though that default
        behavior can be overridden with the -f option. When --cached is given,
        the staged content has to match either the tip of the branch or the
        file on disk, allowing the file to be removed from just the index.


``git grep``
------------

.. code::

    NAME
        git-grep - Print lines matching a pattern

    SYNOPSIS
        git grep [-a | --text] [-I] [--textconv] [-i | --ignore-case] [-w | --word-regexp]
                 [-v | --invert-match] [-h|-H] [--full-name]
                 [-f <file>] [-e] <pattern>
                 [ [--[no-]exclude-standard] [--cached | --no-index | --untracked] | <tree>...]
                 [--] [<pathspec>...]

    DESCRIPTION
        Look for specified patterns in the tracked files in the work tree,
        blobs registered in the index file, or blobs in given tree objects.
        Patterns are lists of one or more search expressions separated by
        newline characters. An empty string as search expression matches all
        lines.


``git mv``
----------

.. code::

    NAME
           git-mv - Move or rename a file, a directory, or a symlink

    SYNOPSIS
           git mv <options>... <args>...

    DESCRIPTION
           Move or rename a file, directory or symlink.

               git mv [-v] [-f] [-n] [-k] <source> <destination>
               git mv [-v] [-f] [-n] [-k] <source> ... <destination directory>


``.gitginore``
--------------

.. code::

    NAME
        gitignore - Specifies intentionally untracked files to ignore

    SYNOPSIS
        $HOME/.config/git/ignore, $GIT_DIR/info/exclude, .gitignore

    DESCRIPTION
        A gitignore file specifies intentionally untracked files that Git
        should ignore. Files already tracked by Git are not affected; see
        the NOTES below for details.

``HEAD``
--------

.. code::

     HEAD
        indicates the head of the current branch.
