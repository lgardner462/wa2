# READ THIS FIRST: 
`
The account approval process is a human process. This process usually takes between two and three school days but may take longer. You will not be able to login with these keys until the account approval and creation process is finished. Once this is finished you will receive a welcome email and you should then be able to login to the cluster. Also, you will be added to the c3ddb users mailing list. This is how you will be notified about things such as maintenance, outages, and anything else that affects the cluster as a whole.

## WHAT IS IN INCLUDED THIS ZIP

* This README
* A public key associated with your account (c3ddb-key.pub)
* A PuTTY format private key for Windows SSH login (c3ddb-key.ppk) in "windows"
* An OpenSSH format private key for Linux/Mac SSH login (c3ddb-key) in "linux"
* An OpenSSH config file to make SSH login simpler.a

## Getting started 

* To access the cluster you will need to log into the following login node.  

 - c3ddb01.mit.edu


## LOGGING IN WITH SSH ON WINDOWS

1. Download PuTTY [https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html] and run the executable.
2. In the Session tab, enter the remote host (one of the login nodes listed above) and select SSH as the connection type.
3. In the Auth tab (located in SSH), browse for and select your private key
4. Click Open and enter your login credentials (username and passphrase generated at account request.)


## LOGGING IN WITH SSH ON LINUX/MAC

We have included a config file to streamline the process of logging into the cluster, simply move your c3ddb-key directory to your home (~) directory. 


You can then log in to the cluster by using the following command.

    ssh -F ~/c3ddb-key/linux/config c3ddb01.mit.edu


## Troubleshooting 

1. Login to the cluster is via SSH key only, if you forget your SSH key passphrase or lose your keys then you will need to generate a new set of SSH keys and send the public portion (id_rsa.pub) to c3ddb-admin@techsquare.com

2. If you are logging in from a different computer you will need to either copy your private key (c3ddb-key) generated at account creation to the other computer, or you will need to generate another set of keys and send them to c3ddb-admin@techsquare.com
 
