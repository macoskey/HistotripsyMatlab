===========================================================

Image-Guided Ultrasound Therapy Laboratory Python Functions
		 UNIVERSITY OF MICHIGAN

===========================================================

Created by: Jonathan Macoskey
First published: 2016

This library contains a set of useful functions that have
either been developed or acquired by the Image-Guided
Ultrasound Therapy Lab (a.k.a. Histotripsy Lab) at the 
University of Michigan Department of Biomedical 
Engineering. All functions in this repo are intended to be
used with Matlab.

Do these things to start using if you are new to the lab:
Windows:
1.  Start Powershell
2.  enter: iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
3.  type: scoop install git

Mac:
1.  Start terminal
2.  enter: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
3.  type: brew install git

After, do this on either Windows or Mac:
1.  make a github account with your umich email
2.  go to powershell/terminal and type "git config --global.name "yourname""
and "git config --global user.email "uniqname@umich.edu"
3.  Go to your MATLAB directory, e.g., ~/Documents/MATLAB
4.  Make new directory for shared files, e.g., type "mkdir public"
5.  cd ~/public
6.  type "git clone https://github.com/macoskey/histotripsy_matlab.git"
7.  make sure these things are in your MATLAB path (type "pathtool" in Matlab)
