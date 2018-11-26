I recorded a video on how to install the project

https://youtu.be/sgbJxjB_-u8

I also recorded a video explaining the main functionalities

https://youtu.be/vTP6vdUoVC0

1. install the project

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

2. install ruby version 2.2.5 
more information are available at rbenv 
https://github.com/rbenv/rbenv

the steps once rbenv is installed should be:

```terminal
cd /path/to/your/files/directory
rbenv install 2.2.5
rbenv local 2.2.5
```
3. run setup

```terminal
cd /to/your/project/folder
bin/setup
```

4. if you want to use 2 factor you need to add 3 environment variables,[details are included at](https://docs.developer.betfair.com/display/1smk3cen4v3lu3yomq5qye0ni/Non-Interactive+%28bot%29+login)

```
ENV['two-factor'] ='true'
ENV['cert_key_file_path']
ENV['cert_file_path']
```
