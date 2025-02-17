#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��Tbrun.sh �S]o�0}ƿ�6-ٖ6ViB<M�3�*�� H���S�|	��q��U���!��}��9>yw�E��2e�(M����Z)�M����Z��q�.�Zo�<O���L:L$� n�(��d����ꂿ��[E�K����I1g�R"m�X��pf�`L��p�-�����͌���g�8m���%�=�5^ jD#��`�*p�D����C�')����t���ש�b=����O��F��E�xZ��D�U*$�-=�� bŀ��e^�o|�� �u�ј�`�sfqh>���о�MjQ�Jr?��0
4ھ� p�����G(%�w�� GU�%$)�y�݄�$�6�,J��<�"��m𤆶Rc���o<�AY
�.�ip��Fs!%i�j���F�1��ާ��/�c�t�n���ֳ&�ڮ:�"��rs<~p�?��_f~V|#�QhR����l��?4��C#�%%߬V���
�߇"�2Qe�b(�g��X��~%���  