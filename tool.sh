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
�%�$btool.sh �Yms���,��3����$ ���TR��$�Gng2c{< p1 #�qfd7��Y�Xn#W����jZ����]۪~L����� i�N��⋈��޳�w��~v([��lYv*�ӧ�𨮂t}* �=P�X �j<���i�nؖ������Jkg�uy�u�r�;��?(�ɜ�&�R�j��knz�TJ���k ]:���tO��@�JVw�:.�]���64������@35T��_M�(�����ɏ
#��*���R��K�O��Ն���A����w_������7~]��n�w�^#aP�[I�SP�.(�.�k��@�n���)h
�~A��w}������C7���ٿ	}_��j�X'�j�r�	}_��j�X���˯�kB�+�
���4�ļ?ք�/VbՉu�2��ګ��e�e�v?~f��nΘ�l����jz*���+���,УԀkYFƩ L�n����&�J�R�����YD� }���;kX�l`����5��lvZw+�rF��٪>5ٖ+H�s�dم��U�YӰd��-���j��F�=ֻV]��"�lK��Q�(@����U#�aY,��#�hp0L�@7�,x�=�
&��L݁�$��3='�������y��xFR�\^�y^�XZ�,#s�D�����:�k�1���!z���WF�YN�e���<,�e���
��jB~\�"'���p9aR�%�r\QdK�*�4˰����\I�MjlN���;��;n^(Aar��R��JlN��kJN�s���xQf����B8�q�d9!/�y�ͩh6�y^%!�/�ZN�s����8X���8y1'�e����qf��S�Œ@�;�H�EF��!���`q���N����<+BI�X�g�
+��Ӣ�M��_�b��j�d胬Cp�X_d
?��ŉ	i27��
�q���E^�d�/��TD�c"���)}/Yo�y��s˻�pou��h�=k�ʒ��-"|��"�k9BGVRC!�`s9i�n��s@aѶ�U@e��B�Q�l��'�G�҆��[r��}�e����}����%����Mo���=�*1:�b ��*H���}	�A�o�QlM�6t�Q��27O��w���uoq+���m ��x��w{x����\"{���ѱ�k*څAz�-
;��m���ZbT�Qu;h*��P��9@��m�*���)@��X2�Q���������-d�z��}��Ф�in,�H2��C�'?
��#��G�0�s Q˄�Z�������	�H�nB�S -�j�!dn�ׂ�-��X����]��8��/�.ʲZ=B� +�րh���I۱iiA��uM��v����lx�jf_k�L֮��m|c�8��HǱc����L�	}�����@Ӽy�����}o�	@S¿z�{��+�
�/y��ykz�}b����|�����#D�Z3�D2�E�s��&�z���`�,o�`�-7H�#B��������u��r@W�Q��S����c�PV�|P($o����[���ڃ���y���ٗ/�P@3����$�Y+A��+#"s�®(P �i+)�'�O������s�|]w����sA��#O/��<u��ҟ�l�t�0��ц*���P���#�̜Jb�^T�c�񖞶��C}���'����\o�����1T/�Y�}���ʖg3���^�L�n_��Ve|<d }������X�I����~R���W�p"�(�>����w�RA?���m�&N1]��p���S>nI�ab\����;���i��?�	LfBw�qUm��z ����[!g���t?����?����H��=�^�6��j@L��ދ���ਔ�lN�s�^��&���j�
)�0ã$:PA�ci.0�	0<�:]tw>�9����Y�#�H�6��`h��i
?��g�c���� k�o!]�I���v��o>�oo���x�ߣ���l����T�H@�+�xA��\���^��wy��M�Ql��.u���ش�CA���R��L� ����P��\�E�Es�鰕��%E��O���&���z/��g�+ߐ��re�N,o�P���}�����=y�]~� `��p1<]�26�ឳ-�!����%ܖq�]Hّ�G2R�,؅�#�	H���}tp�7�䦿�$�{��G�&��Xە@ý)lO_ms)@xy���Ir��୓��G;����pտ���LZ�G�1*��Ou_އW��+^�7��I,��W�WHޟ���»�p;����ҪE"a,��m�Tb���T��"��U��K�׿,C����m���B  