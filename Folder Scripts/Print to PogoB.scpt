FasdUAS 1.101.10   ��   ��    k             l      ��  ��   qk
Print image to Pogo printer

This Folder Action handler is triggered whenever items are added to the attached folder.
The script will send an image to a Pogo printer

Hacked together by Brendan Dawes www.brendandawes.com from the original Image flip folder action written by Apple and this blog post: http://odelljamie.wordpress.com/2009/12/12/iphone-and-the-polaroid-pogo-printer/

Copyright � 2002�2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
     � 	 	� 
 P r i n t   i m a g e   t o   P o g o   p r i n t e r 
 
 T h i s   F o l d e r   A c t i o n   h a n d l e r   i s   t r i g g e r e d   w h e n e v e r   i t e m s   a r e   a d d e d   t o   t h e   a t t a c h e d   f o l d e r . 
 T h e   s c r i p t   w i l l   s e n d   a n   i m a g e   t o   a   P o g o   p r i n t e r 
 
 H a c k e d   t o g e t h e r   b y   B r e n d a n   D a w e s   w w w . b r e n d a n d a w e s . c o m   f r o m   t h e   o r i g i n a l   I m a g e   f l i p   f o l d e r   a c t i o n   w r i t t e n   b y   A p p l e   a n d   t h i s   b l o g   p o s t :   h t t p : / / o d e l l j a m i e . w o r d p r e s s . c o m / 2 0 0 9 / 1 2 / 1 2 / i p h o n e - a n d - t h e - p o l a r o i d - p o g o - p r i n t e r / 
 
 C o p y r i g h t   �   2 0 0 2  2 0 0 7   A p p l e   I n c . 
 
 Y o u   m a y   i n c o r p o r a t e   t h i s   A p p l e   s a m p l e   c o d e   i n t o   y o u r   p r o g r a m ( s )   w i t h o u t 
 r e s t r i c t i o n .     T h i s   A p p l e   s a m p l e   c o d e   h a s   b e e n   p r o v i d e d   " A S   I S "   a n d   t h e 
 r e s p o n s i b i l i t y   f o r   i t s   o p e r a t i o n   i s   y o u r s .     Y o u   a r e   n o t   p e r m i t t e d   t o 
 r e d i s t r i b u t e   t h i s   A p p l e   s a m p l e   c o d e   a s   " A p p l e   s a m p l e   c o d e "   a f t e r   h a v i n g 
 m a d e   c h a n g e s .     I f   y o u ' r e   g o i n g   t o   r e d i s t r i b u t e   t h e   c o d e ,   w e   r e q u i r e 
 t h a t   y o u   m a k e   i t   c l e a r   t h a t   t h e   c o d e   w a s   d e s c e n d e d   f r o m   A p p l e   s a m p l e 
 c o d e ,   b u t   t h a t   y o u ' v e   m a d e   c h a n g e s . 
   
  
 l     ��������  ��  ��        l     ��  ��    &   the address of your pogo device     �   @   t h e   a d d r e s s   o f   y o u r   p o g o   d e v i c e      j     �� �� 0 pogo_address    m        �   6 Y O U R _ B L U E T O O T H _ A D D R E S S _ H E R E      l     ��������  ��  ��        j    �� �� 0 done_foldername    m       �    P r i n t e d   I m a g e s      l     ��   ��    6 0 the list of file types which will be processed       � ! ! `   t h e   l i s t   o f   f i l e   t y p e s   w h i c h   w i l l   b e   p r o c e s s e d     " # " l     �� $ %��   $ , & eg: {"PICT", "JPEG", "TIFF", "GIFf"}     % � & & L   e g :   { " P I C T " ,   " J P E G " ,   " T I F F " ,   " G I F f " }   #  ' ( ' j    
�� )�� 0 	type_list   ) J    	 * *  +�� + m     , , � - -  J P E G��   (  . / . l     �� 0 1��   0 2 , since file types are optional in Mac OS X,     1 � 2 2 X   s i n c e   f i l e   t y p e s   a r e   o p t i o n a l   i n   M a c   O S   X ,   /  3 4 3 l     �� 5 6��   5 9 3 check the name extension if there is no file type     6 � 7 7 f   c h e c k   t h e   n a m e   e x t e n s i o n   i f   t h e r e   i s   n o   f i l e   t y p e   4  8 9 8 l     �� : ;��   : O I NOTE: do not use periods (.) with the items in the name extensions list     ; � < < �   N O T E :   d o   n o t   u s e   p e r i o d s   ( . )   w i t h   t h e   i t e m s   i n   t h e   n a m e   e x t e n s i o n s   l i s t   9  = > = l     �� ? @��   ? S M eg: {"txt", "text", "jpg", "jpeg"}, NOT: {".txt", ".text", ".jpg", ".jpeg"}     @ � A A �   e g :   { " t x t " ,   " t e x t " ,   " j p g " ,   " j p e g " } ,   N O T :   { " . t x t " ,   " . t e x t " ,   " . j p g " ,   " . j p e g " }   >  B C B j    �� D�� 0 extension_list   D J     E E  F G F m     H H � I I  j p g G  J�� J m     K K � L L  j p e g��   C  M N M l     ��������  ��  ��   N  O P O l     ��������  ��  ��   P  Q R Q i     S T S I     �� U V
�� .facofgetnull���     alis U o      ���� 0 this_folder   V �� W��
�� 
flst W o      ���� 0 these_items  ��   T k     � X X  Y Z Y l     �� [ \��   [ B < CHECK FOR THE DESTINATION FOLDER WITHIN THE ATTACHED FOLDER    \ � ] ] x   C H E C K   F O R   T H E   D E S T I N A T I O N   F O L D E R   W I T H I N   T H E   A T T A C H E D   F O L D E R Z  ^ _ ^ l     �� ` a��   ` * $ IF IT DOESN'T EXIST, THEN CREATE IT    a � b b H   I F   I T   D O E S N ' T   E X I S T ,   T H E N   C R E A T E   I T _  c d c O     > e f e k    = g g  h i h Z    2 j k���� j H     l l l    m���� m I   �� n��
�� .coredoexbool        obj  n n     o p o 4    �� q
�� 
cfol q o    ���� 0 done_foldername   p o    ���� 0 this_folder  ��  ��  ��   k k    . r r  s t s I   &���� u
�� .corecrel****      � null��   u �� v w
�� 
kocl v m    ��
�� 
cfol w �� x y
�� 
insh x o    ���� 0 this_folder   y �� z��
�� 
prdt z K    " { { �� |��
�� 
pnam | o     ���� 0 done_foldername  ��  ��   t  }�� } r   ' . ~  ~ m   ' (��
�� ecvwlsvw  n       � � � 1   + -��
�� 
pvew � n   ( + � � � 1   ) +��
�� 
cwnd � o   ( )���� 0 this_folder  ��  ��  ��   i  ��� � r   3 = � � � n   3 ; � � � 4   4 ;�� �
�� 
cfol � o   5 :���� 0 done_foldername   � o   3 4���� 0 this_folder   � l      ����� � o      ���� 0 target_folder  ��  ��  ��   f m      � ��                                                                                  MACS  alis    t  Macintosh HD               �@�|H+     <
Finder.app                                                       ���(JG        ����  	                CoreServices    �@��      �(��       <   /   .  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   d  � � � l  ? ?�� � ���   � = 7 PROCESS EACH OF THE ITEMS ADDED TO THE ATTACHED FOLDER    � � � � n   P R O C E S S   E A C H   O F   T H E   I T E M S   A D D E D   T O   T H E   A T T A C H E D   F O L D E R �  ��� � Q   ? � � � � � Y   B � ��� � ��� � k   Q � � �  � � � r   Q W � � � n   Q U � � � 4   R U�� �
�� 
cobj � o   S T���� 0 i   � o   Q R���� 0 these_items   � o      ���� 0 	this_item   �  � � � r   X _ � � � l  X ] ����� � I  X ]�� ���
�� .sysonfo4asfe        file � o   X Y���� 0 	this_item  ��  ��  ��   � l      ����� � o      ���� 0 	item_info  ��  ��   �  � � � l  ` `�� � ���   � J D CHECK TO SEE IF THE ITEM IS AN IMAGE FILE OF THE ACCEPTED FILE TYPE    � � � � �   C H E C K   T O   S E E   I F   T H E   I T E M   I S   A N   I M A G E   F I L E   O F   T H E   A C C E P T E D   F I L E   T Y P E �  ��� � Z   ` � � ����� � G   ` � � � � l  ` w ����� � F   ` w � � � =  ` e � � � n   ` c � � � m   a c��
�� 
alis � l  ` a ����� � o   ` a���� 0 	item_info  ��  ��   � m   c d��
�� boovfals � E  h s � � � l  h m ����� � o   h m���� 0 	type_list  ��  ��   � l  m r ����� � n   m r � � � 1   n r��
�� 
asty � l  m n ����� � o   m n���� 0 	item_info  ��  ��  ��  ��  ��  ��   � l  z � ����� � E  z � � � � l  z  ����� � o   z ���� 0 extension_list  ��  ��   � l   � ����� � n    � � � � 1   � ���
�� 
nmxt � l   � ����� � o    ����� 0 	item_info  ��  ��  ��  ��  ��  ��   � k   � � � �  � � � O   � � � � � k   � � � �  � � � l  � ��� � ���   � A ; LOOK FOR EXISTING MATCHING ITEMS IN THE DESTINATION FOLDER    � � � � v   L O O K   F O R   E X I S T I N G   M A T C H I N G   I T E M S   I N   T H E   D E S T I N A T I O N   F O L D E R �  � � � l  � ��� � ���   � L F IF THERE ARE MATCHES, THEN RENAME THE CONFLICTING FILES INCREMENTALLY    � � � � �   I F   T H E R E   A R E   M A T C H E S ,   T H E N   R E N A M E   T H E   C O N F L I C T I N G   F I L E S   I N C R E M E N T A L L Y �  � � � n  � � � � � I   � ��� ����� 0 resolve_conflicts   �  � � � o   � ����� 0 	this_item   �  ��� � o   � ����� 0 target_folder  ��  ��   �  f   � � �  � � � l  � ��� � ���   � . ( MOVE THE ITEM TO THE DESTINATION FOLDER    � � � � P   M O V E   T H E   I T E M   T O   T H E   D E S T I N A T I O N   F O L D E R �  ��� � r   � � � � � c   � � � � � l  � � ����� � I  � ��� � �
�� .coremoveobj        obj  � o   � ����� 0 	this_item   � �� � �
�� 
insh � l  � � ���� � o   � ��~�~ 0 target_folder  ��  �   � �} ��|
�} 
alrp � m   � ��{
�{ boovtrue�|  ��  ��   � m   � ��z
�z 
alis � l      ��y�x � o      �w�w 0 target_file  �y  �x  ��   � m   � � � ��                                                                                  MACS  alis    t  Macintosh HD               �@�|H+     <
Finder.app                                                       ���(JG        ����  	                CoreServices    �@��      �(��       <   /   .  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   �  � � � l  � ��v � ��v   �   PROCESS THE ITEM    � � � � "   P R O C E S S   T H E   I T E M �  ��u � I   � ��t ��s�t 0 process_item   �  ��r � o   � ��q�q 0 target_file  �r  �s  �u  ��  ��  ��  �� 0 i   � m   E F�p�p  � n   F L � � � m   I K�o
�o 
nmbr � n  F I � � � 2  G I�n
�n 
cobj � o   F G�m�m 0 these_items  ��   � R      �l � 
�l .ascrerr ****      � **** � o      �k�k 0 error_message    �j�i
�j 
errn o      �h�h 0 error_number  �i   � Z   � ��g�f >  � � l  � ��e�d o   � ��c�c 0 error_number  �e  �d   m   � ��b�b�� O   � � k   � �		 

 I  � ��a�`�_
�a .miscactvnull��� ��� obj �`  �_   �^ I  � ��]
�] .sysodlogaskr        TEXT o   � ��\�\ 0 error_message   �[
�[ 
btns J   � � �Z m   � � �  C a n c e l�Z   �Y
�Y 
dflt m   � ��X�X  �W�V
�W 
givu m   � ��U�U x�V  �^   m   � ��                                                                                  MACS  alis    t  Macintosh HD               �@�|H+     <
Finder.app                                                       ���(JG        ����  	                CoreServices    �@��      �(��       <   /   .  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �g  �f  ��   R  l     �T�S�R�T  �S  �R    i     I      �Q�P�Q 0 resolve_conflicts    !  o      �O�O 0 	this_item  ! "�N" o      �M�M 0 target_folder  �N  �P   O     {#$# k    z%% &'& r    	()( l   *�L�K* n    +,+ 1    �J
�J 
pnam, o    �I�I 0 	this_item  �L  �K  ) l     -�H�G- o      �F�F 0 	file_name  �H  �G  ' .�E. Z   
 z/0�D�C/ l  
 1�B�A1 I  
 �@2�?
�@ .coredoexbool        obj 2 n   
 343 4    �>5
�> 
docf5 o    �=�= 0 	file_name  4 o   
 �<�< 0 target_folder  �?  �B  �A  0 k    v66 787 r    9:9 l   ;�;�:; n    <=< 1    �9
�9 
nmxt= o    �8�8 0 	this_item  �;  �:  : o      �7�7 0 file_extension  8 >?> Z    9@A�6B@ =   CDC l   E�5�4E o    �3�3 0 file_extension  �5  �4  D m    FF �GG  A r   ! $HIH l  ! "J�2�1J o   ! "�0�0 0 	file_name  �2  �1  I l     K�/�.K o      �-�- 0 trimmed_name  �/  �.  �6  B r   ' 9LML n   ' 7NON 7  ( 7�,PQ
�, 
ctxtP m   , .�+�+ Q d   / 6RR l  0 5S�*�)S [   0 5TUT l  0 3V�(�'V n   0 3WXW 1   1 3�&
�& 
lengX o   0 1�%�% 0 file_extension  �(  �'  U m   3 4�$�$ �*  �)  O l  ' (Y�#�"Y o   ' (�!�! 0 	file_name  �#  �"  M l     Z� �Z o      �� 0 trimmed_name  �   �  ? [\[ r   : =]^] m   : ;�� ^ l     _��_ o      �� 0 name_increment  �  �  \ `�` T   > vaa k   C qbb cdc r   C Refe c   C Pghg l  C Ni��i b   C Njkj b   C Llml b   C Jnon b   C Fpqp l  C Dr��r o   C D�� 0 trimmed_name  �  �  q m   D Ess �tt  .o l  F Iu��u c   F Ivwv o   F G�� 0 name_increment  w m   G H�
� 
TEXT�  �  m m   J Kxx �yy  .k o   L M�� 0 file_extension  �  �  h m   N O�
� 
TEXTf l     z��z o      �� 0 new_name  �  �  d {�
{ Z   S q|}�	~| H   S \ l  S [���� I  S [���
� .coredoexbool        obj � n   S W��� 4   T W��
� 
docf� o   U V�� 0 new_name  � l  S T���� o   S T� �  0 target_folder  �  �  �  �  �  } k   _ i�� ��� l  _ _������  � !  rename to conflicting file   � ��� 6   r e n a m e   t o   c o n f l i c t i n g   f i l e� ��� r   _ g��� l  _ `������ o   _ `���� 0 new_name  ��  ��  � l     ������ n      ��� 1   d f��
�� 
pnam� n   ` d��� 4   a d���
�� 
docf� o   b c���� 0 	file_name  � l  ` a������ o   ` a���� 0 target_folder  ��  ��  ��  ��  � ����  S   h i��  �	  ~ r   l q��� [   l o��� l  l m������ o   l m���� 0 name_increment  ��  ��  � m   m n���� � l     ������ o      ���� 0 name_increment  ��  ��  �
  �  �D  �C  �E  $ m     ���                                                                                  MACS  alis    t  Macintosh HD               �@�|H+     <
Finder.app                                                       ���(JG        ����  	                CoreServices    �@��      �(��       <   /   .  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   ��� l     ��������  ��  ��  � ��� l     ������  � ( " this sub-routine processes files    � ��� D   t h i s   s u b - r o u t i n e   p r o c e s s e s   f i l e s  � ���� i    ��� I      ������� 0 process_item  � ���� o      ���� 0 	this_item  ��  ��  � k     F�� ��� l     ������  � L F NOTE that the variable this_item is a file reference in alias format    � ��� �   N O T E   t h a t   t h e   v a r i a b l e   t h i s _ i t e m   i s   a   f i l e   r e f e r e n c e   i n   a l i a s   f o r m a t  � ��� l     ������  � , & FILE PROCESSING STATEMENTS GOES HERE    � ��� L   F I L E   P R O C E S S I N G   S T A T E M E N T S   G O E S   H E R E  � ���� Q     F���� k    "�� ��� l   ������  � ( " convert alias reference to string   � ��� D   c o n v e r t   a l i a s   r e f e r e n c e   t o   s t r i n g� ��� r    ��� c    ��� o    ���� 0 	this_item  � m    ��
�� 
TEXT� o      ���� 0 	this_item  � ���� t   	 "��� O    !��� k     �� ��� l   ������  � = 7 change the address of your Pogo printer to match below   � ��� n   c h a n g e   t h e   a d d r e s s   o f   y o u r   P o g o   p r i n t e r   t o   m a t c h   b e l o w� ��� I   �����
�� .aevtoOPPnull��� ��� null��  � ����
�� 
btFs� n    ��� 1    ��
�� 
psxp� o    ���� 0 	this_item  � �����
�� 
bdAd� o    ���� 0 pogo_address  ��  � ���� l   ��������  ��  ��  ��  � m    ��                                                                                      @ alis    �  Macintosh HD               �@�|H+     \Bluetooth File Exchange.app                                     ?�#��        ����  	                	Utilities     �@��      �$DC       \   [  AMacintosh HD:Applications: Utilities: Bluetooth File Exchange.app   8  B l u e t o o t h   F i l e   E x c h a n g e . a p p    M a c i n t o s h   H D  2Applications/Utilities/Bluetooth File Exchange.app  / ��  � m   	 
�������  � R      �����
�� .ascrerr ****      � ****� o      ���� 0 error_message  ��  � O   * F��� k   . E�� ��� I  . 3������
�� .miscactvnull��� ��� obj ��  ��  � ���� I  4 E����
�� .sysodlogaskr        TEXT� o   4 5���� 0 error_message  � ����
�� 
btns� J   6 9�� ���� m   6 7�� ���  C a n c e l��  � ����
�� 
dflt� m   : ;���� � �����
�� 
givu� m   < ?���� x��  ��  � m   * +���                                                                                  MACS  alis    t  Macintosh HD               �@�|H+     <
Finder.app                                                       ���(JG        ����  	                CoreServices    �@��      �(��       <   /   .  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��       	���  �������  � ���������������� 0 pogo_address  �� 0 done_foldername  �� 0 	type_list  �� 0 extension_list  
�� .facofgetnull���     alis�� 0 resolve_conflicts  �� 0 process_item  � ����� �   ,� ����� �   H K� �� T��������
�� .facofgetnull���     alis�� 0 this_folder  �� ������
�� 
flst�� 0 these_items  ��  � 	�������������������� 0 this_folder  �� 0 these_items  �� 0 target_folder  �� 0 i  �� 0 	this_item  �� 0 	item_info  �� 0 target_file  �� 0 error_message  �� 0 error_number  � " ����������������������������������������������������������������
�� 
cfol
�� .coredoexbool        obj 
�� 
kocl
�� 
insh
�� 
prdt
�� 
pnam�� 
�� .corecrel****      � null
�� ecvwlsvw
�� 
cwnd
�� 
pvew
�� 
cobj
�� 
nmbr
�� .sysonfo4asfe        file
�� 
alis
�� 
asty
�� 
bool
�� 
nmxt�� 0 resolve_conflicts  
�� 
alrp�� 
�� .coremoveobj        obj �� 0 process_item  �� 0 error_message  � ������
�� 
errn�� 0 error_number  ��  ����
�� .miscactvnull��� ��� obj 
�� 
btns
�� 
dflt
�� 
givu�� x
�� .sysodlogaskr        TEXT�� �� ;��b  /j  *�����b  l� O��,�,FY hO��b  /E�UO } wk��-�,Ekh ��/E�O�j E�O��,f 	 b  �a ,a &
 b  �a ,a & *� )��l+ O��a ea  �&E�UO*�k+ Y h[OY��W 5X  �a  '� *j O�a a kva ka a  � !UY h� ����~���}�� 0 resolve_conflicts  � �|��| �  �{�z�{ 0 	this_item  �z 0 target_folder  �~  � �y�x�w�v�u�t�s�y 0 	this_item  �x 0 target_folder  �w 0 	file_name  �v 0 file_extension  �u 0 trimmed_name  �t 0 name_increment  �s 0 new_name  � ��r�q�p�oF�n�ms�lx
�r 
pnam
�q 
docf
�p .coredoexbool        obj 
�o 
nmxt
�n 
ctxt
�m 
leng
�l 
TEXT�} |� x��,E�O��/j  f��,E�O��  �E�Y �[�\[Zk\Z��,l'2E�OkE�O 7hZ��%��&%�%�%�&E�O��/j  ���/�,FOY �kE�[OY��Y hU� �k��j�i���h�k 0 process_item  �j �g��g �  �f�f 0 	this_item  �i  � �e�d�e 0 	this_item  �d 0 error_message  � �c�b��a�`�_�^�]�\�[��Z�Y��X�W�V�U�T
�c 
TEXT�b�
�a 
btFs
�` 
psxp
�_ 
bdAd�^ 
�] .aevtoOPPnull��� ��� null�\ 0 error_message  �[  
�Z .miscactvnull��� ��� obj 
�Y 
btns
�X 
dflt
�W 
givu�V x�U 
�T .sysodlogaskr        TEXT�h G $��&E�O�n� *��,�b   � OPUoW #X  	� *j O���kv�k�a a  U ascr  ��ޭ