# Sites init
GPATH=/var/www/thflowgit

if [ ! -d "$GPATH/.git" ]; then
  git clone https://github.com/ilivanoff/uflow.git $GPATH
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $GPATH
git reset --hard HEAD
git pull
git submodule update --init
git submodule foreach git checkout master
git submodule foreach git reset --hard HEAD
git submodule foreach git pull origin master

git config core.filemode false
cd $GPATH/www/ps-content
git config core.filemode false
cd $GPATH/www/ps-includes
git config core.filemode false

sudo chown -R www-data:www-data $GPATH/www
sudo chmod -R 775 $GPATH/www

#Back to script dir
cd $DIR
./minify.sh
