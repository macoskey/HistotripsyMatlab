
## Image-Guided Ultrasound Therapy Laboratory <br /> Useful Python Functions <br />
#### UNIVERSITY OF MICHIGAN <br /> DEPARTMENT OF BIOMEDICAL ENGINEERING 

#### Created by: Jonathan Macoskey <br /> First published: 2016

This library contains a set of useful functions that have
either been developed or acquired by the Image-Guided
Ultrasound Therapy Lab (a.k.a. Histotripsy Lab) at the 
University of Michigan Department of Biomedical 
Engineering. All functions in this repo are intended to be
used with Matlab.

#### Do these things to start using if you are new to the lab:
**Windows:** <br />
Start Powershell and enter the following commands
```
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
scoop install git
```
**Mac:** <br />
Start terminal and enter the following commands:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
```
**Linux:**<br />
Hopefully if you're using Linux then you already have the useful bits setup, but if not, start terminal and enter the following commands:
``` 
sudo apt-get update
sudo apt-get install git 
```

**After, installing git, do the following:**
1.  make a github account with your umich email
2.  go to powershell/terminal and type
```
git config --global.name "yourname"
git config --global user.email "uniqname@umich.edu
```
3.  Go to your MATLAB directory, e.g., ~/Documents/MATLAB
4.  Make new directory for shared files, e.g., type:
```
mkdir public
cd public
git clone https://github.com/macoskey/histotripsy_matlab.git
```
5.  make sure these things are in your MATLAB path (type "pathtool" in the Matlab command window)
