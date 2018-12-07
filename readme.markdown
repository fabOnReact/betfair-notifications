# Betfair API Notifications
## Description

Command Line Application to interact with the Betfair api. Watch [a video explaining the main functionalities](https://youtu.be/vTP6vdUoVC0). The Betfair CLI allows you to retrieve information via command line from the Betfair API and monitor price fluctuations of matches. It uses the [ruby-betfair gem](https://github.com/mikecmpbll/betfair) and the [betfair api](https://docs.developer.betfair.com/display/1smk3cen4v3lu3yomq5qye0ni/Getting+Started).

[Video instruction on installation here](https://youtu.be/sgbJxjB_-u8).

## Installation

### Clone the Project
clone the project 

```
git clone https://github.com/fabriziobertoglio1987/betfair-notifications.git
```

[The following post explains how to configure the symlink of a ruby script.](https://commandercoriander.net/blog/2013/02/16/making-a-ruby-script-executable/)

The project needs to be copied in your home directory, then a symlink to the project bin/betfair needs to be created. The above page includes more details. 

The following environment variable needs to be saved in `~/.bash_profile`. It will include:

Your Email
Your password
Your App code
The path to the directory including all the files. 

```terminal
# Betfair
export BETFAIR_EMAIL="your-email"
export BETFAIR_PW="your-password"
export BETFAIR_APPLICATION_CODE="your-app-code"
export PROJECT_ROOT='root/to/your/folder'
```

### Ruby Version Installation

Install ruby version 2.2.5 
more information are available at rbenv 
https://github.com/rbenv/rbenv

the steps once rbenv is installed should be:

```terminal
cd /path/to/your/files/directory
rbenv install 2.2.5
rbenv local 2.2.5
```

### Install the project
1. run setup

```terminal
cd /to/your/project/folder
bin/setup
```

2. if you want to use 2 factor you need to add 3 environment variables,[details are included at the following link](https://docs.developer.betfair.com/display/1smk3cen4v3lu3yomq5qye0ni/Non-Interactive+%28bot%29+login)
This environment variables are actually written downcase ('two_factor'). I should update this in a later commit.

```
ENV['two_factor'] ='true'
ENV['cert_key_file_path']
ENV['cert_file_path']
```
