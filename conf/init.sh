# Sites init
GPATH=/var/www/thflowgit

if [ ! -d "$GPATH/.git" ]; then
  git clone https://github.com/ilivanoff/uflow.git $GPATH
fi

cd $GPATH

git pull
git submodule update --init
git submodule foreach git checkout master
git submodule foreach git pull origin master

sudo chown -R www-data:www-data $GPATH/www
#sudo chmod -R 775 $GPATH/www