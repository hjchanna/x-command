# ⚔️ - COMMAND
### Utility Script Management Platform for Command Line Interface

X-COMMAND is a tool for managing utility scripts and automations on any UNIX based platform. It provides a convenient command line interface for installing, executing, sharing, and removing utility scripts. x-command facilitates conventions and built-in functions to make your scripting life easier! 

## 🔥 Installation
Installation is simple as cloning the git repository and executing the install script.

```
# clone the git repository to home directory
git clone git@github.com:hjchanna/x-command.git ~/x-command

# execute the installation script
~/x-command/install.sh
```

## 💡 Built-in Commands
### `x install [file|url|git] [reference]`
Examples:
- `x install file ~/temp/my_command.sh` - Installs the x-command located at `~/temp/my_command.sh`
- `x install file ~/temp/my_command_pack.zip` - Installs the x-command package located at `~/temp/my_command_pack.zip`
- `x install url https://gist.githubusercontent.com/user/a820fc22f23b67a6f67d51b7c14fd66f/raw` - Installs a x-command from a GitHub gist
- `x install repo git@github.com:hjchanna/x-command.git` - Installs user managed x-commands from git repository

### `x delete [x-command]`
- `x delete my_command` - Deletes the x-command for `my_command`

## ⚙️ Creating your own x-command
### Simple Commands
1. Simply run the command: `x new simple [command_name]` where `[command_name]` is your desired x-command name.
2. It will create a new x-command from the blueprint.
3. Open the x-command file with your favorite script editor and modify.
4. You need to execute `x source` to apply your changes.
### Command Packages
1. x-command packages contains multiple file to support your x-command. 
2. Simply run `x new package [command_name]` where the `[command_name]` is your desired x-command name.
3. Not like simple x-command, it will create a folder instead of a file.
4. Open the folder with your favorite script editor and modify.
5. You need to execute `x source` to apply your changes.

## 🤝 License
X-COMMAND is under the [Apache License 2.0](https://github.com/hjchanna/x-command/blob/master/LICENSE). Apache License 2.0 is a permissive license whose main conditions require preservation of copyright and license notices. Contributors provide an express grant of patent rights. Licensed works, modifications, and larger works may be distributed under different terms and without source code.