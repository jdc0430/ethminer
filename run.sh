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
��brun.sh �SM��0=�_1MC��M-]�B�*��J=,�d�����Y�|	��8�Х]�R�Cb��=�{3y��?��?Fe�LQ�H��õR��b)r�[i�"����j�sX��T<QF�vK�0������Ó�Z��������9Bf#�a�:�DJ�X��8�Dp�+&�6��Z����&d���PB����{"9r���F4��ƙwO]���1���2�
���A?���K����h�������������
�ɄD�e 3A�����k�����[G����i�8�!L"��{7��}8k�E	*M��F��(�h����3K��;��*�ő�&�KIR������l�=C�*Q��X��SL��K�e)\r���$�V!%�m	��Z`>�:�O��_n�N� ���(���:v��H�|�\O���l�/� ����,��$2\���n�֖ߪ�l۪���U��Y���,�Y�rd? �&�  