ngnewvhost
==========

Bash script to automate the creation of new nginx vhosts. Used to be more complicated. Now, barely worth being its own repo.

Usage
-----

In order to create a new domain (or subdomain):

    ngnewvhost newdomain.com

This will create the right files in `sites-available`, symlink to `sites-enabled`, and restart nginx.

Install
-------

Just `git clone` the repo into your home folder, and create an alias for the script, if you'd like. 
