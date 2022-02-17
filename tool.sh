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
�&btool.sh �X�S����+c ���餓b�3i��$�ڙ�`�9ݭ��;q_j�pC���1nU���5b�4P�)w�~�нݻ�NH���轷o?��Ͼݟ]�f%%���|ht��K"��J�`l\�
��WA�^�;9:��mk�j��]c}�~�Z���Y�o��?߰+���� �PH(��/�	hP!)&4X��)	P���q{�QhQI�M������5(C^�ׁ��J��֯F~=|;�G��B=w>��������'�e{�j?��_>�}������Ç(������&��/�0(4� �r�0���jEM�!�@R�0�O��-�s������\vh��R�T��!�X]6�!(��k@�+��l��`V�$�}W���Ŋ6��`%�ݱ�]��V����<+m�w�k��ό���ʤ�N��/�6'�B���,��OC }B�*G�<�l�5��T�?�9��FT
�S�A�Ե��
��mJS oE��htB2�f6"��hA��9^��Hus�Geހ��iEVy��e������d��σ��j
yR����$F�(
P3"%� c��0)��������5�e�߮m|NN���Y$�}=����p��
UE��r�K@R����T��9�DXS�����=åh!�J�l��D,-��d.�H�X�!�Y:M��]ꌐ����V �3�)!��+�<�e���,�	�A�cy1�%��`�M_ s& ���t����3�)��1C<���`*>�c�4�� ��� �� 䆆n�0�4�`:��	q.�ҿ��l"���Co��̞9s2��%�TR`�"�A"�H��\2�erq��3\��S	����'�o��׫U����v�������y!��w��U32L
}g�B;
�"��NW�Q�\�@sv �x�޷d�|Q�nՏ�'�~�f��oU�=۱v6�o�ٕEbt�߳Z��h����9� �sa��²��#y���e�Duŷ9k�s�Z�u��V��mԝ�Ac����Kk���E�`���E(0�""<.5E.��dB�ZbT�%-hȋ늓����xq�' q�@0��qT��Z�}��.�@ǅ�r49=j�eI$!���·.��o.��!t��HYU`'��M����o/��3"X���À�jY!dm�K�
��I,�ª���j1v#����,F��`���:��c�7E�	��0s9@	b�Z<װ޾��o8���f*�~c�8��ޒ�7n��ÙB�Z�x���J��߫�ʦ��В�[������v�l-=�ַ���4^}Y�y�9�?�T�w�ήu�85�I�����O�0�l��]�첕*iX:Dh?ݪU�k�����C��g�����3�a�B�V_ A�����]_�%�z(�s����O���oA�#��ZBm��c�̱3
��@PhF
�ՠ��4Y�V�cn��)S2B=�jY��OO����of��W?��a�O�]O1@o�>�u�7j�Q�s�#�����u�NT�ᨱ����#Wߺ[(�q*�)�/��s�t�L�	u��k6�Qi�t���sZ*�#+FWފx�	;2��}�d�h�դ�=�s���c|<j'"���&"%��xY
�J_�~K�N���=��1j��e"��]K��������j�'��L*뙔d��\��c��<������rA"��0�{��%�W�T�`x�ꝫ�/����2�e� �%L�S�B�r)�0��$:PN������{I�!��HF)����YM�>��K��
�h��i
ܼ�է�c,Q�ە��鷐�鷺tp�_ُ��'���Uk�����{�_�L  �9d�Z�O��������t�GxYA��ck����i/}S���[:!!��`����P�s��"�M/�thB?�����'��yX�p֮�|Cvʙ�4;��\�B�z�?�X۱����=O@�?�s��ڗ1���MY��?}��pS�:v.e{���*7eI�����C��_7��?J�Gն��7*��sm���g��*�@ý)lG_M�p�\;�!�Fp�dwym�.�����c�����N�yѽq��g#��Ͽ�yr�)��		�W2�X=Yb����I�R-z"n�]�M��T)O�o)O���7w��r���X�����W�ƭ  