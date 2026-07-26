# Data Folder Selector Demo

The **Data Folder Selector Utility** allows users to select a Data folder (Client Company) when starting a program.

## Setup after cloning

The libraries this workspace uses are **not** stored in this repository (they are gitignored).
Run **`setup.bat`** once from the repository root and it provides them, behaving differently by
machine so one arrangement serves both maintainer and user:

- On a machine with the shared RDC library pool next door (a sibling `..\Libraries` carrying the
  marker file `.rdc-library-pool`), it makes `Libraries\` a **junction** to that pool — one shared,
  editable copy of every library. A fix made in a library here is a fix in the pool.
- Otherwise it **clones** the libraries this workspace needs — DataFolderSelector, DFAbout,
  RDCToolsLib and vwin32fh — into this workspace's own `Libraries\` folder: isolated,
  self-contained, and it never writes anywhere outside this workspace.

Either way `Libraries\` is local-only and never committed. Re-run `setup.bat` any time it looks
missing or out of date. (Because `Libraries\` may be a junction, do not run `git clean -x` here.)

## Components

This utility includes two main components:

1. **SetupDataFolder.exe**: An administrator program used to add Data folders, which can later be selected by end-users.
2. **DataFolderSelector.dg**: A dialog file that should be integrated into your program's Client Area. It automatically appears when the program starts, enabling the user to choose which Data folder/Company to use.

## Usage

The DataFlex Order Entry sample application's `Order.src` program has been modified to demonstrate how to incorporate the DataFolderSelector library logic into an application.

To use the Data Folder Selector Utility in your application:

1. Add the `DataFolderSelector.dg` file to your program's Client Area.
2. Compile the `SetupDataFolders.src` program once.

That's all it takes to integrate the logic!

## Example

Below is a sample image showcasing how it looks when the `Order.src` program is started:

![Sample image of the SetupDataFolders.src program](Bitmaps/PleaseSelectDataFolder.png)
