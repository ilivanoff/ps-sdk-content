# Sites init
GPATH=/var/www/thflowgit/www/

echo MINIFY JS
for D in ps-content/js ps-content/folded ps-addon/js ps-addon/folded
do
    if [ -d "$GPATH$D" ]; then
		echo "+ " $GPATH$D
		for i in `find $GPATH$D -name "*.js" -type f`; do
			yui-compressor --charset utf-8 --type js -o "$i" "$i"
			echo  "|-" $i
		done
    fi
done

echo MINIFY CSS
for D in ps-content/css ps-content/folded ps-addon/css ps-addon/folded
do
    if [ -d "$GPATH$D" ]; then
		echo "+ " $GPATH$D
		for i in `find $GPATH$D -name "*.css" -type f`; do
			yui-compressor --charset utf-8 --type css -o "$i" "$i"
			echo  "|-" $i
		done
    fi
done
