#!/bin/bash

TOKEN=$1
USERNAME=`curl "https://api.github.com/user?access_token="$TOKEN | jq '.login'`
USERNAME=${USERNAME:1:-1}
git config --global user.email "goodguy@benevolent.com"
git config --global user.name "G G"
mkdir repo
cd repo

curl -X POST https://api.github.com/repos/goodguydo/alpha/forks?access_token=$TOKEN
curl -X POST https://api.github.com/repos/goodguydo/beta/forks?access_token=$TOKEN 
curl -X POST https://api.github.com/repos/goodguydo/gamma/forks?access_token=$TOKEN 
curl -X POST https://api.github.com/repos/goodguydo/delta/forks?access_token=$TOKEN 

git clone https://github.com/$USERNAME/alpha.git
git clone https://github.com/$USERNAME/beta.git
git clone https://github.com/$USERNAME/gamma.git
git clone https://github.com/$USERNAME/delta.git

echo $RANDOM >> alpha/notes.txt
echo $RANDOM >> beta/notes.txt
echo $RANDOM >> gamma/notes.txt
echo $RANDOM >> delta/notes.txt

cd alpha
git add notes.txt 
git commit -m "My commit for alpha"  
git push https://$USERNAME:$TOKEN@github.com/$USERNAME/alpha.git 
curl -X POST https://api.github.com/repos/goodguydo/alpha/pulls?access_token=$TOKEN --data '{"title":"Hacktoberfest. Need Shirt bro :P", "body":"Yo Pull", "head":"'"$USERNAME"':master", "base":"master"}'
cd ..

cd beta
git add notes.txt 
git commit -m "My commit for beta" 
git push https://$USERNAME:$TOKEN@github.com/$USERNAME/beta.git 
curl -X POST https://api.github.com/repos/goodguydo/beta/pulls?access_token=$TOKEN --data '{"title":"Hacktoberfest. Need Shirt bro :P", "body":"Yo Pull", "head":"'"$USERNAME"':master", "base":"master"}'
cd ..

cd gamma
git add notes.txt 
git commit -m "My commit for gamma" 
git push https://$USERNAME:$TOKEN@github.com/$USERNAME/gamma.git 
curl -X POST https://api.github.com/repos/goodguydo/gamma/pulls?access_token=$TOKEN --data '{"title":"Hacktoberfest. Need Shirt bro :P", "body":"Yo Pull", "head":"'"$USERNAME"':master", "base":"master"}'
cd ..

cd delta
git add notes.txt 
git commit -m "My commit for delta" 
git push https://$USERNAME:$TOKEN@github.com/$USERNAME/delta.git 
curl -X POST https://api.github.com/repos/goodguydo/delta/pulls?access_token=$TOKEN --data '{"title":"Hacktoberfest. Need Shirt bro :P", "body":"Yo Pull", "head":"'"$USERNAME"':master", "base":"master"}'
cd ..





