# File-organizer-system
This project implements a file organization system that categorizes files in a directory based on predefined rules, such as file type or creation date. The solution is designed following software engineering principles like abstraction, encapsulation, modularity, cohesion, and coupling. The system is implemented using shell scripts and automated with cron for periodic execution.

# Features
File Organization: Automatically categorizes files into subdirectories (e.g., Documents/, Images/, Videos/) based on their type.

Duplicate Handling: Handles duplicate files by renaming or overwriting them.

Automation: Automates execution at regular intervals using cron.

Modular Design: Scripts are divided into logical modules for scanning, moving, and scheduling tasks.

Testing: Includes test scripts for validating each module.

# Key Files
modules/file_scanner.sh: Scans the specified directory and lists all files.

modules/file_mover.sh: Moves files into categorized subdirectories based on their extensions.

modules/setup_cron.sh: Sets up a cron job to automate the execution of the file organizer at regular intervals.

tests/test_file_scanner.sh: Verifies the functionality of the file scanner module.

tests/test_file_mover.sh: Verifies the functionality of the file mover module.

tests/test_setup_cron.sh: Verifies the functionality of the cron setup module.

# Installation
1.Clone this repository:
.git clone https://github.com/yourusername/file-organizer-system.git
.cd file-organizer-system

2.Make the scripts executable:
.chmod +x modules/*.sh tests/*.sh

3.Run the setup script to configure automation:
./modules/setup_cron.sh /path/to/directory

4.Test the installation:
./tests/test_file_scanner.sh
./tests/test_file_mover.sh
./tests/test_setup_cron.sh

# Usage
The File Organizer System runs automatically via a cron job after installation.
You can also run it manually:

./modules/file_scanner.sh /path/to/directory
./modules/file_mover.sh /path/to/directory

Command Line Options
--test: Run in test mode without making changes.

--verbose: Enable detailed console output.

--config=/path/to/config: Use an alternative configuration file.

# Configuration

TARGET_DIRECTORY: The directory to organize.

FILE_TYPES: Extensions to categorize (e.g., .docx, .jpg, .mp4).

DUPLICATE_HANDLING: How to handle duplicate files (rename or overwrite).

CRON_INTERVAL: How often to run checks (in minutes).

# Architecture

The system follows a modular design with the following components:

file_scanner.sh: Scans a directory and lists all files.

file_mover.sh: Moves files into categorized subdirectories based on their extensions.

setup_cron.sh: Automates execution using cron jobs.

tests/: Contains test scripts for validating each module.

# Contributors 
Thanks to these amazing people who contributed to this project:

Contributor	Profile
| Contributor | Profile |
|------------|---------|
| [Coolan](https://github.com/Coolaan) | <a href="https://github.com/Coolaan"><img src="https://github.com/Coolan.png" width="50" height="50"></a> |
| [diksha-45](https://github.com/diksha-45) | <a href="https://github.com/diksha-45"><img src="https://avatars.githubusercontent.com/u/190998987?v=4" width="50" height="50"></a> |

