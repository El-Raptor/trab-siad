PGDMP         2        	        x         
   dw_covid19    12.1    12.0 M    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            l           1262    16786 
   dw_covid19    DATABASE     �   CREATE DATABASE dw_covid19 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE dw_covid19;
                postgres    false                        2615    16787    coronavirus    SCHEMA        CREATE SCHEMA coronavirus;
    DROP SCHEMA coronavirus;
                postgres    false            �            1259    17027    casos_por_cidade    TABLE     �   CREATE TABLE coronavirus.casos_por_cidade (
    id integer NOT NULL,
    id_data integer NOT NULL,
    cidade integer NOT NULL,
    pais character(3) NOT NULL,
    casos integer
);
 )   DROP TABLE coronavirus.casos_por_cidade;
       coronavirus         heap    postgres    false    7            �            1259    17025    casos_por_cidade_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.casos_por_cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE coronavirus.casos_por_cidade_id_seq;
       coronavirus          postgres    false    215    7            m           0    0    casos_por_cidade_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE coronavirus.casos_por_cidade_id_seq OWNED BY coronavirus.casos_por_cidade.id;
          coronavirus          postgres    false    214            �            1259    16887    cidade    TABLE     U   CREATE TABLE coronavirus.cidade (
    id integer NOT NULL,
    nome text NOT NULL
);
    DROP TABLE coronavirus.cidade;
       coronavirus         heap    postgres    false    7            �            1259    16885    cidade_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE coronavirus.cidade_id_seq;
       coronavirus          postgres    false    7    206            n           0    0    cidade_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE coronavirus.cidade_id_seq OWNED BY coronavirus.cidade.id;
          coronavirus          postgres    false    205            �            1259    16927    covid19_mundo    TABLE     �   CREATE TABLE coronavirus.covid19_mundo (
    id integer NOT NULL,
    data_reg integer NOT NULL,
    casos integer NOT NULL,
    mortes integer NOT NULL,
    pais_cod character(3) NOT NULL,
    total_leitos integer NOT NULL
);
 &   DROP TABLE coronavirus.covid19_mundo;
       coronavirus         heap    postgres    false    7            �            1259    16925    covid19_mundo_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.covid19_mundo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE coronavirus.covid19_mundo_id_seq;
       coronavirus          postgres    false    7    213            o           0    0    covid19_mundo_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE coronavirus.covid19_mundo_id_seq OWNED BY coronavirus.covid19_mundo.id;
          coronavirus          postgres    false    212            �            1259    17086    indice_isolamento_social    TABLE     �   CREATE TABLE coronavirus.indice_isolamento_social (
    id integer NOT NULL,
    data_reg integer NOT NULL,
    taxa_isolamento numeric NOT NULL
);
 1   DROP TABLE coronavirus.indice_isolamento_social;
       coronavirus         heap    postgres    false    7            �            1259    17084    indice_isolamento_social_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.indice_isolamento_social_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE coronavirus.indice_isolamento_social_id_seq;
       coronavirus          postgres    false    7    219            p           0    0    indice_isolamento_social_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE coronavirus.indice_isolamento_social_id_seq OWNED BY coronavirus.indice_isolamento_social.id;
          coronavirus          postgres    false    218            �            1259    16906    leitos    TABLE     �   CREATE TABLE coronavirus.leitos (
    id integer NOT NULL,
    total_leitos integer NOT NULL,
    pais_iso character(3) NOT NULL
);
    DROP TABLE coronavirus.leitos;
       coronavirus         heap    postgres    false    7            �            1259    16904    leitos_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.leitos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE coronavirus.leitos_id_seq;
       coronavirus          postgres    false    7    209            q           0    0    leitos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE coronavirus.leitos_id_seq OWNED BY coronavirus.leitos.id;
          coronavirus          postgres    false    208            �            1259    16896    pais    TABLE     �   CREATE TABLE coronavirus.pais (
    codigo_iso character(3) NOT NULL,
    nome text NOT NULL,
    pop integer NOT NULL,
    continente character varying(20) NOT NULL
);
    DROP TABLE coronavirus.pais;
       coronavirus         heap    postgres    false    7            �            1259    16879    temperatura    TABLE     e   CREATE TABLE coronavirus.temperatura (
    id integer NOT NULL,
    temp_celsius integer NOT NULL
);
 $   DROP TABLE coronavirus.temperatura;
       coronavirus         heap    postgres    false    7            �            1259    17048    temperatura_cidade    TABLE     �   CREATE TABLE coronavirus.temperatura_cidade (
    id_data integer NOT NULL,
    temp_max integer NOT NULL,
    temp_min integer NOT NULL,
    cidade integer NOT NULL,
    pais character(3) NOT NULL,
    id integer NOT NULL
);
 +   DROP TABLE coronavirus.temperatura_cidade;
       coronavirus         heap    postgres    false    7            �            1259    17076    temperatura_cidade_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.temperatura_cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE coronavirus.temperatura_cidade_id_seq;
       coronavirus          postgres    false    216    7            r           0    0    temperatura_cidade_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE coronavirus.temperatura_cidade_id_seq OWNED BY coronavirus.temperatura_cidade.id;
          coronavirus          postgres    false    217            �            1259    16877    temperatura_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.temperatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE coronavirus.temperatura_id_seq;
       coronavirus          postgres    false    7    204            s           0    0    temperatura_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE coronavirus.temperatura_id_seq OWNED BY coronavirus.temperatura.id;
          coronavirus          postgres    false    203            �            1259    16919    tempo    TABLE     �   CREATE TABLE coronavirus.tempo (
    id integer NOT NULL,
    dia smallint NOT NULL,
    mes smallint NOT NULL,
    ano smallint NOT NULL
);
    DROP TABLE coronavirus.tempo;
       coronavirus         heap    postgres    false    7            �            1259    16917    tempo_id_seq    SEQUENCE     �   CREATE SEQUENCE coronavirus.tempo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE coronavirus.tempo_id_seq;
       coronavirus          postgres    false    211    7            t           0    0    tempo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE coronavirus.tempo_id_seq OWNED BY coronavirus.tempo.id;
          coronavirus          postgres    false    210            �
           2604    17030    casos_por_cidade id    DEFAULT     �   ALTER TABLE ONLY coronavirus.casos_por_cidade ALTER COLUMN id SET DEFAULT nextval('coronavirus.casos_por_cidade_id_seq'::regclass);
 G   ALTER TABLE coronavirus.casos_por_cidade ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    215    214    215            �
           2604    16890 	   cidade id    DEFAULT     p   ALTER TABLE ONLY coronavirus.cidade ALTER COLUMN id SET DEFAULT nextval('coronavirus.cidade_id_seq'::regclass);
 =   ALTER TABLE coronavirus.cidade ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    206    205    206            �
           2604    16930    covid19_mundo id    DEFAULT     ~   ALTER TABLE ONLY coronavirus.covid19_mundo ALTER COLUMN id SET DEFAULT nextval('coronavirus.covid19_mundo_id_seq'::regclass);
 D   ALTER TABLE coronavirus.covid19_mundo ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    213    212    213            �
           2604    17089    indice_isolamento_social id    DEFAULT     �   ALTER TABLE ONLY coronavirus.indice_isolamento_social ALTER COLUMN id SET DEFAULT nextval('coronavirus.indice_isolamento_social_id_seq'::regclass);
 O   ALTER TABLE coronavirus.indice_isolamento_social ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    218    219    219            �
           2604    16909 	   leitos id    DEFAULT     p   ALTER TABLE ONLY coronavirus.leitos ALTER COLUMN id SET DEFAULT nextval('coronavirus.leitos_id_seq'::regclass);
 =   ALTER TABLE coronavirus.leitos ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    209    208    209            �
           2604    16882    temperatura id    DEFAULT     z   ALTER TABLE ONLY coronavirus.temperatura ALTER COLUMN id SET DEFAULT nextval('coronavirus.temperatura_id_seq'::regclass);
 B   ALTER TABLE coronavirus.temperatura ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    203    204    204            �
           2604    17078    temperatura_cidade id    DEFAULT     �   ALTER TABLE ONLY coronavirus.temperatura_cidade ALTER COLUMN id SET DEFAULT nextval('coronavirus.temperatura_cidade_id_seq'::regclass);
 I   ALTER TABLE coronavirus.temperatura_cidade ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    217    216            �
           2604    16922    tempo id    DEFAULT     n   ALTER TABLE ONLY coronavirus.tempo ALTER COLUMN id SET DEFAULT nextval('coronavirus.tempo_id_seq'::regclass);
 <   ALTER TABLE coronavirus.tempo ALTER COLUMN id DROP DEFAULT;
       coronavirus          postgres    false    211    210    211            b          0    17027    casos_por_cidade 
   TABLE DATA           Q   COPY coronavirus.casos_por_cidade (id, id_data, cidade, pais, casos) FROM stdin;
    coronavirus          postgres    false    215   �]       Y          0    16887    cidade 
   TABLE DATA           /   COPY coronavirus.cidade (id, nome) FROM stdin;
    coronavirus          postgres    false    206   ;l       `          0    16927    covid19_mundo 
   TABLE DATA           a   COPY coronavirus.covid19_mundo (id, data_reg, casos, mortes, pais_cod, total_leitos) FROM stdin;
    coronavirus          postgres    false    213   �l       f          0    17086    indice_isolamento_social 
   TABLE DATA           V   COPY coronavirus.indice_isolamento_social (id, data_reg, taxa_isolamento) FROM stdin;
    coronavirus          postgres    false    219   �       \          0    16906    leitos 
   TABLE DATA           A   COPY coronavirus.leitos (id, total_leitos, pais_iso) FROM stdin;
    coronavirus          postgres    false    209   ��       Z          0    16896    pais 
   TABLE DATA           F   COPY coronavirus.pais (codigo_iso, nome, pop, continente) FROM stdin;
    coronavirus          postgres    false    207   ڂ       W          0    16879    temperatura 
   TABLE DATA           <   COPY coronavirus.temperatura (id, temp_celsius) FROM stdin;
    coronavirus          postgres    false    204   ��       c          0    17048    temperatura_cidade 
   TABLE DATA           `   COPY coronavirus.temperatura_cidade (id_data, temp_max, temp_min, cidade, pais, id) FROM stdin;
    coronavirus          postgres    false    216   s�       ^          0    16919    tempo 
   TABLE DATA           7   COPY coronavirus.tempo (id, dia, mes, ano) FROM stdin;
    coronavirus          postgres    false    211   /�       u           0    0    casos_por_cidade_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('coronavirus.casos_por_cidade_id_seq', 582, true);
          coronavirus          postgres    false    214            v           0    0    cidade_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('coronavirus.cidade_id_seq', 9, true);
          coronavirus          postgres    false    205            w           0    0    covid19_mundo_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('coronavirus.covid19_mundo_id_seq', 1156, true);
          coronavirus          postgres    false    212            x           0    0    indice_isolamento_social_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('coronavirus.indice_isolamento_social_id_seq', 123, true);
          coronavirus          postgres    false    218            y           0    0    leitos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('coronavirus.leitos_id_seq', 14, true);
          coronavirus          postgres    false    208            z           0    0    temperatura_cidade_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('coronavirus.temperatura_cidade_id_seq', 654, true);
          coronavirus          postgres    false    217            {           0    0    temperatura_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('coronavirus.temperatura_id_seq', 66, true);
          coronavirus          postgres    false    203            |           0    0    tempo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('coronavirus.tempo_id_seq', 182, true);
          coronavirus          postgres    false    210            �
           2606    17032 &   casos_por_cidade casos_por_cidade_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY coronavirus.casos_por_cidade
    ADD CONSTRAINT casos_por_cidade_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY coronavirus.casos_por_cidade DROP CONSTRAINT casos_por_cidade_pkey;
       coronavirus            postgres    false    215            �
           2606    16895    cidade cidade_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY coronavirus.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY coronavirus.cidade DROP CONSTRAINT cidade_pkey;
       coronavirus            postgres    false    206            �
           2606    16932     covid19_mundo covid19_mundo_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY coronavirus.covid19_mundo
    ADD CONSTRAINT covid19_mundo_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY coronavirus.covid19_mundo DROP CONSTRAINT covid19_mundo_pkey;
       coronavirus            postgres    false    213            �
           2606    17094 6   indice_isolamento_social indice_isolamento_social_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY coronavirus.indice_isolamento_social
    ADD CONSTRAINT indice_isolamento_social_pkey PRIMARY KEY (id);
 e   ALTER TABLE ONLY coronavirus.indice_isolamento_social DROP CONSTRAINT indice_isolamento_social_pkey;
       coronavirus            postgres    false    219            �
           2606    16911    leitos leitos_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY coronavirus.leitos
    ADD CONSTRAINT leitos_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY coronavirus.leitos DROP CONSTRAINT leitos_pkey;
       coronavirus            postgres    false    209            �
           2606    16903    pais pais_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY coronavirus.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (codigo_iso);
 =   ALTER TABLE ONLY coronavirus.pais DROP CONSTRAINT pais_pkey;
       coronavirus            postgres    false    207            �
           2606    17083 *   temperatura_cidade temperatura_cidade_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY coronavirus.temperatura_cidade
    ADD CONSTRAINT temperatura_cidade_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY coronavirus.temperatura_cidade DROP CONSTRAINT temperatura_cidade_pkey;
       coronavirus            postgres    false    216            �
           2606    16884    temperatura temperatura_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY coronavirus.temperatura
    ADD CONSTRAINT temperatura_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY coronavirus.temperatura DROP CONSTRAINT temperatura_pkey;
       coronavirus            postgres    false    204            �
           2606    16924    tempo tempo_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY coronavirus.tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY coronavirus.tempo DROP CONSTRAINT tempo_pkey;
       coronavirus            postgres    false    211            �
           2606    17033 '   casos_por_cidade cidade_casos_cidade_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.casos_por_cidade
    ADD CONSTRAINT cidade_casos_cidade_fk FOREIGN KEY (cidade) REFERENCES coronavirus.cidade(id);
 V   ALTER TABLE ONLY coronavirus.casos_por_cidade DROP CONSTRAINT cidade_casos_cidade_fk;
       coronavirus          postgres    false    215    2748    206            �
           2606    17051 (   temperatura_cidade cidade_temp_cidade_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.temperatura_cidade
    ADD CONSTRAINT cidade_temp_cidade_fk FOREIGN KEY (cidade) REFERENCES coronavirus.cidade(id);
 W   ALTER TABLE ONLY coronavirus.temperatura_cidade DROP CONSTRAINT cidade_temp_cidade_fk;
       coronavirus          postgres    false    216    2748    206            �
           2606    17043 (   casos_por_cidade data_id_casos_cidade_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.casos_por_cidade
    ADD CONSTRAINT data_id_casos_cidade_fk FOREIGN KEY (id_data) REFERENCES coronavirus.tempo(id);
 W   ALTER TABLE ONLY coronavirus.casos_por_cidade DROP CONSTRAINT data_id_casos_cidade_fk;
       coronavirus          postgres    false    211    2754    215            �
           2606    17061 )   temperatura_cidade data_id_temp_cidade_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.temperatura_cidade
    ADD CONSTRAINT data_id_temp_cidade_fk FOREIGN KEY (id_data) REFERENCES coronavirus.tempo(id);
 X   ALTER TABLE ONLY coronavirus.temperatura_cidade DROP CONSTRAINT data_id_temp_cidade_fk;
       coronavirus          postgres    false    2754    211    216            �
           2606    17095 '   indice_isolamento_social data_indice_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.indice_isolamento_social
    ADD CONSTRAINT data_indice_fk FOREIGN KEY (data_reg) REFERENCES coronavirus.tempo(id);
 V   ALTER TABLE ONLY coronavirus.indice_isolamento_social DROP CONSTRAINT data_indice_fk;
       coronavirus          postgres    false    2754    211    219            �
           2606    16943    covid19_mundo leitos_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.covid19_mundo
    ADD CONSTRAINT leitos_fk FOREIGN KEY (total_leitos) REFERENCES coronavirus.leitos(id);
 F   ALTER TABLE ONLY coronavirus.covid19_mundo DROP CONSTRAINT leitos_fk;
       coronavirus          postgres    false    209    2752    213            �
           2606    17038 %   casos_por_cidade pais_casos_cidade_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.casos_por_cidade
    ADD CONSTRAINT pais_casos_cidade_fk FOREIGN KEY (pais) REFERENCES coronavirus.pais(codigo_iso);
 T   ALTER TABLE ONLY coronavirus.casos_por_cidade DROP CONSTRAINT pais_casos_cidade_fk;
       coronavirus          postgres    false    2750    215    207            �
           2606    16912    leitos pais_codfk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.leitos
    ADD CONSTRAINT pais_codfk FOREIGN KEY (pais_iso) REFERENCES coronavirus.pais(codigo_iso);
 @   ALTER TABLE ONLY coronavirus.leitos DROP CONSTRAINT pais_codfk;
       coronavirus          postgres    false    209    207    2750            �
           2606    16938    covid19_mundo pais_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.covid19_mundo
    ADD CONSTRAINT pais_fk FOREIGN KEY (pais_cod) REFERENCES coronavirus.pais(codigo_iso);
 D   ALTER TABLE ONLY coronavirus.covid19_mundo DROP CONSTRAINT pais_fk;
       coronavirus          postgres    false    207    2750    213            �
           2606    17056 &   temperatura_cidade pais_temp_cidade_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.temperatura_cidade
    ADD CONSTRAINT pais_temp_cidade_fk FOREIGN KEY (pais) REFERENCES coronavirus.pais(codigo_iso);
 U   ALTER TABLE ONLY coronavirus.temperatura_cidade DROP CONSTRAINT pais_temp_cidade_fk;
       coronavirus          postgres    false    2750    207    216            �
           2606    17066    temperatura_cidade temp_max_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.temperatura_cidade
    ADD CONSTRAINT temp_max_fk FOREIGN KEY (temp_max) REFERENCES coronavirus.temperatura(id);
 M   ALTER TABLE ONLY coronavirus.temperatura_cidade DROP CONSTRAINT temp_max_fk;
       coronavirus          postgres    false    204    216    2746            �
           2606    17071    temperatura_cidade temp_min_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.temperatura_cidade
    ADD CONSTRAINT temp_min_fk FOREIGN KEY (temp_min) REFERENCES coronavirus.temperatura(id);
 M   ALTER TABLE ONLY coronavirus.temperatura_cidade DROP CONSTRAINT temp_min_fk;
       coronavirus          postgres    false    2746    204    216            �
           2606    16933    covid19_mundo tempo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY coronavirus.covid19_mundo
    ADD CONSTRAINT tempo_fk FOREIGN KEY (data_reg) REFERENCES coronavirus.tempo(id);
 E   ALTER TABLE ONLY coronavirus.covid19_mundo DROP CONSTRAINT tempo_fk;
       coronavirus          postgres    false    211    213    2754            b   T  x�UZ;��6���zP"Un� Hd�.�?Gf(Rv�����G|e��3�iϯ�xZ���v�Q��_�=������j�5��_K�5^k>K�e�gͰV���O�eس.�r?벙E���l�&�fE����.2MF"E�Ѥ4���hrZ��z4I�1�裗��r{���~4��&e�G�Y�^f{,��ie�ǒ�ث���K��c�NT˜�%=1�=��������7�,����ޏ��F�l����7�(��nw��
·�]p���q�^���b��q'Ǯ� "���X'b����)��IS��s_�eD�ej��&�5tƵ&�5m��&�e��p�0��&�ᚄ�v)�qM�f�g�]M�{L-�s�YY[z�fff��n��u��x�>naa���r6
���B��*pl7[{��0��M��0����؄@��z8�0�[S���D@�����Q����Z��{�^�X� ����� ���vA��K-:"&�Y�a�#�a��p�e������Wa�5Y�^X�a����=��� kr��0Ě��7Vﱍ�oVo��\�p��.Ci����6�°��\���E�5Bjɲ#�PK����* E�`�$:<�P�d:�ze�7��:_����P��u��BX�,��u ���:v�CY��0���1o���#_*���8�Ѽ�!�ѽ�����:�h�	C��a4��:d!�cy� �:�����y��g{�֤zgfW<L�qB«�qB7��E�9�n"^�	-���E�@�l���j������C�~��
�&������5���E|LP�N�i_SXƯ9YƯ�X��Qh���i,�cb�P(�ׄ@i��O�>fg��`�gx	����'��c/�o�H�В�K��֑�X�%���HKr�UZ����LKz��uZ�cec���X�\i�[H+.�}me��r.6��t������b�����&?����ǒ�b�˗�M~���ׁ`Lɩׅl_T�z��#��z�n�^���(7�f��}8vԛ�l8wԤ�^��p��<�9G�v9o^��X�5���f�q�h7�,/�M.��s�h�H�BMd�^�� �:ǏvK#b���n�4���y���7{�~LԽ}L������X:��k6���Ћ�9���̨s"�?悆~L��|L��|L���
�#V�����ȇtG>��:�a͑+��Ê~����>��������
~�V��������6?���a��+�m~X�o�Ê��+nn>���a��+�m%+$��.+�y���=`/v������ƾ6ҙۛ��	�s{��� ;ܧIW��4�	�l��ƀ��AM~hp��6�O�x�Pv�$�;[|0��޹ùQ�[��8�Y:�iIR:��6����>��!l��VLK�Jr�R ���*f�N5�\sZ��\�͟�����N�t+�F����f���VlC;4˄�t�hR�[�NuI�s3ԗ��"�T��5&9�D��@z���{�dm«�שI�Lm�uj���ŝ{�*7��)�u�M�Z!�݅���
v�ݥ�z�����s}���s��I��Ll�($6�/8��B�1��v�m6:�2�n�-X?���n�Sk�����u�"�Q4\��:�d� �: ��>��~��`�
R����~L���4���'����؁c`dۈ����c+��l�޴G�[��#�@��}%=J��W���5)*�z������w����c0�xZ�(4T�g��!2�E2��>�}$������bʗV�V\\DJ��R�̀N٥���TYr��\P+K�[�r�]�u*&�(Ax�dO	H����J:�) e[����2��p��r2K�@R������ h;��`>���ћ���\�����d�Za\ p��|u�Dn'����N��vb���&Q=1 x�f
4
$�}�I_�S������E�p7n�j.@�L܎;�z�{M�o��L`�lz�ɜ�؎n���#�So4�)uA���7�����hCjⷳz�	L�N��Mf�ƶ	�&0H8��&0�K�m�7��QP�u�M`�t��M`�e��os�^�k�h���e�<��6<w���3�r�?&Ry��N\���"?s��E>~L�E��|�r�?6�\����Ow��mC]�`�R��x�P�� xSu�?�`a�K|����%� ��PW�X�V]�㱍�@]�vu����&�>�p�4�>i c.���q���)c.����0�X�Ns�d�3���:�q�D�9�1���Fg*�#���UG�#tա#��B�� c���{�����#�2�G�2�nq?��;�����**R������eϬ�|�_���LC��z�=16�G�۝�=ʞɀ��Q����eO��(�+�K(��5�ԊZ����B}L<�QN��A�P��V�zR�W���Fj��y^��5l(�P#��A�Lj��0����~t!�Q/;����`����H�&��#�^� � �*�G:�w��{@܆/R��x�rJ�\�.�������G�C�� ��\�����ˠ+�������<X���֪�b�&ھ�WR�&^[eBQ�;q���$�}���"��ƮB�m!� ���ĝ�Q�$�p'{�fk��d�
�PÝ�[���a�7�;X��a�����Tm{w�CD1������"���	�a�U�����a]�=�
b}S|Pم�Xo
as�%S�yE�z�H~����E��[qU�e����_x����#��-#�i,����Yyx'<mwEsR̄G���hZg��d��A��o���s�}-�����?5HB5K94�b�$<0�dPG��y_�qNǮ�gL�<��UÝT�)����Nw~@u���7��t��I+��W�= LZ��'G@�D�ʅ:�`��@��p{;�bB�u�&{d8����d�})�I���@�`#��n ��IaM�Xo�Y���	��&m[���S�(��}@�8����"bn<q�� �vx�%����~^�Š �7��Zl�H�=0 \1��Fo��O�@C���A�60ؑc����^����$���cW�~Ԟ!�mT���<?(����͵�c�����3��=�A�{M?�xM����dq/��q�k������N"�cy7�\h$O�ٸ���m�kn�	A��ꚓ��1��dpL~k Q�*��ɟ�ĕ��-q%1$��d�Yu�;���o�%Gr����,��o����~�>��i�� P�, #�A��O����#�
��Ie�1m0�����#i.�M�wvy2��v�D�bB��2���ή/�����:Z�o,��w�6�&���}Fei�P��O>�/D��GI�m&([�p���bB�v{]�u#�vr�<�Ȳ}��>8�h��w�Ӎ-'����Ͷ�2o�q[/��m�3�q��6y���;_N�WM��bP�t�d�1����s�7_ޙ��L�VM�-iR��\/e���Z����Uou)#�_��
3f���1��Q	����d/<�����/��9)[-�cV�յ3��fC�j���_�]���X&e���FK�\�b0���~�������4Ho�      Y   u   x��K
�P�q�*��ou���iG���l_ ���q)n��Ϝ����"C�X�a��=�-�ǒ*Ia	+:M���{M�Ig��Y�|�xri�
��9)%��cK�w����!�� �#"�      `      x�]�K帍E�ʽ�C���v�=밻g��:|����*g^JH����^�U�����������?��g�'����:؞�����`VzJ.����x�����|����dsDl=s>�դmc�}�L�z�?<�3�����g����I>�(ϬO��ӡ����4��P{�=� �g�'��#�x���.��5�zR��T���r�%�Z���kfͯ'�	��:Hy$iN�x�vH{�h�� �6=q��hO�!�O��G���I�#��tE��s�C����D}�{=ў�.��]߶@�د'��Z ��>�^@zZ����|:�t����S�ti�H�H��H�/I����Tz[/IuF��4��P1�H�/IS�%i��]�JY�%��\����%�t�\��\�%���\�ʒ�%��6_�fY�%i��$�p�$���T�ȗ�"_��7(�I��U" E�$�v�KRmh�$Ֆ�KRJ�$ձ�KRl�$�ѧKҊ�� \���Tx�)�Ĕ_RJ�/!e��2�KD�����\�e�r�r�����_�Up�8�*��t�w����ej���`9�&���TQkҟ^PH[��y���a���%w�p�Hz�'{P�LnSs��ɣ:\������
�h9�o���*�O�z�#?�uw�5V�{�.m�=x�0�Z\A�d�5��9���4S*�,^���}o8�9=�h�8��|"�m�3W�4(��nF@]���*�j)t�Swx��RbH9����:���R�J*G�ɉ�.$G9k�4��La��eɡY�9��ΥMs-����G ���;ɄRx��zP��qHnGv�	�e������=�ch��̎��u4�ħ���-L�x��͡
�uL�!{���C}��#cӟ#s�#k��ҥ:�6:�7:R6	:R7:�6:�7:26:27:�6nD�\n��O�-�\n�e��[�T7:�6!:�7#:2����9ё�Iq#��|�,�ʷ�r��9�M���͌��M���͍��M���͎��M�Ѣ�-��n���o����Y��n���[f���2�e��o����f���[`i�-o-�-����V�~+k�e��E�MɎ�s�Y������?��,~m���ڰ��oXY�6���	��"E��3^���S[�p�1'�{��4*�y�0w�1'^�?;�a̱��#�ͣzP�X��i�I,Z{�$���Me���ny���~�Y���P� �|����.�W�KkJ�H"�������;
�H���R��X���1S�o;� L�0�ж\�h8-���@�,C�xY��Ř�R)�*4i��C�Tb��ot(�:Ѐ �"g�u���Cr�C0s��ܡ����c�i}V�UZD�X#�Y�%�ة�#s炎��n�b�I�ɛ)���i�����Y�Ȁ{�$�0E$o>t�l>t�n>t�m>t�o>tdl>tdn>tdm>�ܛ/	��t?�7:R6:R7:�6:�7:26:27:�6n���e�y�#e�#u�#m�#}�#c�#s�#k��Fʻ�Б��Б��Б��"�<o��]@ny�xnq-������JCoYJ��9��K���O�?�_TݤV��W�*��m����9C�wKuf�[*:%����"ϒCr|B�i�y�0ς��Ȥ�&�8Y���,�KG��8Is����:�L\�����2W�P��@z�6�%���y�N�^���V�u�KJF��z�+N[���7*�h�y_Lj��O��'"+�
|X�Ã��G���5�0���:t�)��WݔC<��7јCV���9ٴY���Ё2lH��@�K�'Ǘ��q�fl��p�0N8".��Yp�*���Ci��#y��#Ų��
��ü�~�o6tdl6tdn6tdm6܈��ǆ�$�0~�zP����Б��^ϴ�:�7:26:27:�`�0�r�<ż��HFaJD
lx�S7:B��F�fCG�fCG�fCGl�.�ʷ̲�|�3YB��3e��#u��#6������Y�7���2�{�	�o��A��0�-3O7�7:2�[d��-������-��W�}K+���57s��E�p��TD9��:M+@c�x���:{ /���8�DAj���d	:�}7�&�i����A��߀�;�?Y+���g+��3�K�y^�$�̹�3�0�����7.�3ޚ�|�3@h�U�E=1˵����ûX�8����Œ�l\����:с�����)+������E�7��y�TOf�K8J�{�"�+gh}@��G�sYŢ���������I�1[�t������6b5?iə$�N�01��C|@��y���������y�l�B�mEX�<6=�l�6�+�6���S��Xi���ۇ.V�,�·7� �)h�BB5� �x&#p
8!1ťj/�����K�����3���s���a6؊��Z�o�T������ӵ��R�?�V��j2,��)BSJ��;�U��0���B:�U��/��-��7NP��C�i�ӛ��Z���c,�A�|v�ω�>i�w7��Q(��r�!L�Uj�y�Ip3b�5HR�((���Q���G(���BV���NNF�}6��<���־����A�J��p�*���>��N�T`U\_��d�'��f/�L���_���H:z��W`�O���0&��� �a46a�>��eQ���x�'_�H�s�&;F�RI?��,�K����]��i��Z(�cN��b���-G���u>H4M��Jg
�,qE�5C�0�욫e����X=�ۻ�Dch���lm碶hA�Ɣ�f(ԙ'�lko���%����r��_���&���"�����ǟ(�A��'�*ެY�@#��&�M4��g�i�9�A��4���c�aU-G���Kbx�n\���q��BR��x�:?��3�]�$��6ʹR��~�N��KAT�.49*戒YݿY������a�4G��bу#<ۍ+�����+��߇頍0���f��yغ�:9�D8��k�wG�� Wڙ6���9)�ͬj�n���͆n��`*pW������i�Wi�/.#>���aBm�T8l"j��'���횖�S�������Fz&�e9���դ��D<��}6ewx�X"Z�RxоB�*� �N6��^p�G����ϖ~>�-v�]RV?�N��͟�kU;�X����՘/�k�-�ވ�ns�[�#�?��2W���~�yv�Y��k�U�� ."ԁZ`���w	u`���I�s虶w���wj963�G�'[���:�Y�\[��Y��~��ƃ$"�:�>"�Y^�h�J�(r��Qa�Oӂ��2���U��6���P�\M9VH�C_�@&>-E���WC���WK��Ɖ�,��A�/̸�G1�P� v�AkW��%�	�PhrgM�-�p�+�FX*QϠ^N�iA�� L��:ލ	��=����v��� ӊ����z�Zl����&�D��F�\�h1�y\h�R�T/�󫹮��{��� ���e�V�9���D����@������ {�l4��%/�A񗼩�7��6cA:�5��X�Nl|v&Ky<����e,H~IT�8ю\�_e��7��y�fk��8vK�ia5�Lȓ�"��3P����q�5Y ��8x�ؐ�mx�Z���!�<G��+�\��8n���AK���I�S��бW�)ƈ�)�O�%�����A�-�q�)���|��"a/�v���,�lŉ��"9d�AR��*f����E��Z�/d�E�.�[���z�5���b��E%8B�r%��Mx$��T[X��*0��]��+Պx�7��>��D�#H��ɽ_�K���lD��~(� �T��A�d�U.���V��@��7ڗ&�#�t�xI��װk���1�1I�ߘER�m����H)�����?�_Un�G��e��}i��L�`��(Ɠ��Eq	�hWsݔ�_g�}L���=�U?E9t��`���؍p�*_��e�a���:�N��Q�I�3.�q9�����c�C~���
�� ��~[��Ҽ�y)����f   �5�R|����mVz|g��e�S��a�J���F#�#��b
8gd}�F�A��G���F�M�yږIf�9S�q6|��܏[)�t~�I�$0��_�vR�'�;#��7�byl#�#`��bc�m	�F�����iD����q�Ɽ�E"��D���.Z�8�>Z6i���H�ʶ��(7 �H��dn��pBP>�[����aI]o�5R҈o�����Hk"���M**=!nq�1�admk��K�9
,��_S�=��d�
��&�Fz��1S����{���k'�'3կ��,}A�3Ԍȵ��[)�X!-�n����b0tC
��Q���5&�ah��� #�n�*tbU�0!\��^�ns��K�:�]�?C�>�T�G�1����:Fu�����I��p"�"2�]�34��uX���(�4�υ���ZF�J�,ia����EZ-wD�ϐ��<�e�!��(�]f\q�-0gi���e�<�eA������W��w#�($�����ݰZ,?(��
�3d����(��"��׌�}�X��d�l!C:C_=S��n`�g�~,��"Sj�g2g�|�4"D�3T���r�:�(�u(LZ)qF]3�]���#l��� �-�����WJ��(��3����\�噟�A,�g��P�AA
���xd8�^<�,����~���2�L�֪�3�+1#Iu)V��a����ft������/�ͺ�t|g/�Q[�>Z?7t)�f�E�n�檵��8�%]k�~u�?�z#V�<ȿ���ϟ� ⢨k      f   �  x�-�K�%!ǰ�:�������с��(KI C�i-����C�-���t\�5�����i��3�|Ȣ�1]��|�+����������յ�>�n[�ї�cK�d��f��>���y}�VZ�o������F��s�u����2�N�\F����6��;t�b9>�u��ǰ�P�����vQ�F�^�7�����(�����}]{l;�rPU;�z��*���N�jz�3
R�S�0��v�U(������\��ᶋZ7�Ǯ���v���v�o�d7-7�j�E������B����m(�̰zuٽ���H%=b��eg����q�Ԡ�t��@l�35���K��i�c����r����N���؍СA��q�����TA\�� �����s�=����*�{��W�\v+�#K:�
��N�
y�Έ*�e#����L�]�^�\A^vn��{5S�_���,��� �wMLTP������x,|�b��U�?Ml>��Y`XF�C4��I4���:������0���G����ʇk�A$��l����7���Hgm� ��z/HP@���7���@�1�����j5�~������/5Z9Cj0�r:��s޶~�x�Z�_��������3ԗ�a�f_��Ap����>w�`��T      \   @   x�3�46263�t
r�24�444200�t�24�42140�ʙpXy�!�\1z\\\ ?�
�      Z   �   x�e̱
�0����yisgj��tQi��r�(���4��]���;u�WA��AD�����:I���v{���c���m�w����c`Pd�Bm�8x��E�,�1d�.s���n�C ���!���)e/w7s�@�RX��fM�̢=[h3�O�a�v�-���L/>�      W   �   x���q Acl/�9М�E��!*�����TPJZ�Vs��:<]����Gk�r���\xˍ���~�%��+�&&�)�R$ъ"������U�).���r���#S�ܙd+���&�r�Wyȧ��R>ʪE��T�fb����EmUSG���:�S]z�m��C��]��Q���g0ʫo\O�e/}�m}�=	͞�y���=�`����� �x7�      c   �  x�]Zˮd'\7�4��HQ�]4��������i�n�.c8�2�ҧ�Oٟ�����OIu~���y������-Z�_��=�����H�|x��@��7�c��ڇ�j;�Jl� t��� �Ͱ��ZRR�nvG)5����o��چ-w�=u5׬+#��5��R���2So��ZY�wY�#;��٭WͩkSK��YW��/�s{��_�kO#�M6d����|S.2�h2j1�ԕF��o��Ɛݽ������4�H�P�X8ii�w��(?�i#Qy��(QŖ�=m&j������N�6ۺzND/RM��HM����[��lr�i�i���4�l�]i�i�w��f�a�mv��c�n�4I��HIs� ��4z��GKs��ZO+?��i�gw�U_d���<VZ�EvZ+����HIkb�֋jZ���ii��#��v�8��H�<��(��"�i#b��K+��qv���5s��x~����kִ�Y������ő�J���4C�گE���&���۴��X���f\�!="*!.8TZ�h{5����֗��Zl})O \l}Q�oG��h����ҟ����2���l}Q�m���ˏ ���b�š�����_��\� ���~ �23G�p�u� �"إ�)KbJQ�77�#
�5/"��3�����B�����[�؋��A��.�ּ;,t��[�
���3���[��̍rV�����z!������x��C�n|m\h$�Rs�3��h
v1E�W��:nb��*���wd����<)
���B&J+<|�V]��Я�*�;O"7�-��у̖l6�Yh�Eq�o+�˦���΄��TEt|�5Q���3;�*��I�k0�V$£�p��6�x�ü�ң ��E{<�����q�������0w��Я٠&����	fϡA����94^��$���j�)#���*D6�g�"C�1��)%�$�B$��I�4��	�E	��Gge)�L�<�ZDV}��DJ���F
4�AK���T�RB���X2�� �@jPE"�:TE�h�6��&)5B]D��j�*)9lS*�`M�%#ϜʺdE��LgNe]��ԩ�ߡ�TW~�$�*+��dV]2Qi�2)-O&���S�I��qRJ��I���3�*��Hy�d�ԭ��ʜ��b�P��ǜ���_2��F)���"RJ���"[��o�)2��s*�D�RE��بB�<�N�j���*�e{�V�A�Dc��V���Z%n�ުU�o[�b%.����"TU��B+hV�P�Z��*4��X"U+q�	��A�����Z�3
͖���4�W�G����PE
�e[j`8��:�h8Ƞ�DzȞDH�w�&���ZIs� m0ܒ3u ��U4/R�p�|C��gH~�5ԑS�`s���
kf�=Y���H�{��j|Gm�[�l��r#�d;�v	�ju��]��B��u��@��{�$;4�����Rl�
�6r�<�$;�k��w_�d�J��M���0��,���b��|����5����*�,!	tO0�b���$K�*ȷ[��\�jBp�Uԑr�`��̯�e5��1�N��Me��H�Ap�b������e'�ʠ*�gH��F�x	��~�w�����b�]�̲K���H����g�x�g�]��%D���;+D��C(L�O�k�@w��v��ݵ���&�-���H��`������k�Z�P�ŝ�]ﲅk�|/�k�yiF�(l�r����:�5)�{"Ilo_�b3��8w�������')6l(��؎47���y�s,�ΣC�wE�vMxW�5�a�װE�Up^/̫�}�b�[Ta����oF�ĥB!�n���#�YPݚ�hCuf��0�~շ�.��r�Bt�ЯAswV�tHnq�!�;Ɍ���.�	w�-O���%`��o�� 1�N=P�#3�	GU��Jf܉\ᮄ	w���&��	��8�� oДXT��̷1���Gp_0�.d9ލ�V�����V��6�Iھf�a�.2��g�D�VwJ��&dv�oCe�md���.��L�{<31�nܤ���_7�r-d~��\�4$��xH;i�yzN�����[/��5���wdĞǸQ{SFE쑭�Mu�
?������'G�{��D��z��ڈ<�I��R�������{5�XC�y�B��P��$Z"�\SH�d���D���˅ ��b�B�v:Є\x!�-d� P��^����� �wx�wx�wx�������@zᅠ^z��A/<3�n��w�������kB+�wx�+�~�^�����zᅠ��c��c׆^h=B�ڈ=U/4��T/<+ߪ�f�0�z��XϪd�y1�2��S��pa��8GϪ�p�zV��ֳ�6��޾�Z�����q�r�E��hs�z�~h��^�����3;�?DlCP�S�1�?6n]�?d�����21 �?D%C�}G��'�bJ~B�J����1��_u+jO/��Js�[>wl@�S��߃�s�或��W�P�+;L��_�
������X����Q��d5D�~p�A(��j�P���_\CG�[n
�ֆ�s���s��#���:��'�pD9������6)�,��VZ��$3Hk����_�|L�3��c�4�:|h��z ����S�)�����6H��JZ�+aCIk�##yo�ſgx-��/����#]S��J����?�譴�W��5O�枟�
�5� �3l���FF*5Vl7U�@�v��0���j��RՊ]��&k+�E�v����&��]l(9��#%��^$����SR��mKvC���k����U��!e�,f���o�@�}�Vd\|�JA�81h�!�5�T7�@���Tf�W�
��c��j�[�8�Sy�vt0��� f�V����ph��><S�B�ݍ`&؂�L�smb�����N��)H� ��}�	�["�z�~�=���|AE������_tS,�/h�Ý�/y�dY�����@�@D
����7�q%!	�A�%��K
C
�$D�Rq%15#V�A��`��e�}q���C�):2q%A��:u@�iC�HP<��f::���̆T�<9�jvCz'��LMYŐqĉ��ӹ��F�܏���\�^o�{��yD�3��5�`H=���4|09�鸎�zyτ[�k�sqσ�g"eTCj���L��yдU5�������C�U(�t��]d@�,?�D�:�n�<h"=��,(�f�G�\Ƀ����Ş&9T5�Я)5��~<jҷI���F#�'��T�6Ϛ�s*�i�@>�5i���h>4�*���5���*R�7��Mvaؑ5,���Ԛ[�J)�ϛ֩?����7L_J������O%��@�V�D�%���Ax-Y[��3�.��4���4����Ť�"@��ɤ�~���$4���JS��3R�4o\#(#yj%����B+�O��)#jz��PA��P b��r��c�;��e�/({0��J
�}C9��EQR�W�W����������URFGW�S*Rꦄ��"SU!�R�i�:w2����)Q�8P�G�����;��4�j'p��Σʮ�\�ar5`������J7d]��ؾ5���~�V��ܮ�ճ�W�y���t�<�|����ז~XR�{^X>�ybR?o,��8�M�;�,�<���ɽq�_����o)��J��      ^   R  x�E��m$ACϚ`]�o����X�(�a�w�Ə*�h��O>��T��G�Sq�RܱO�7^��~/�8Ol5�3[���VC=��XOn5س[���V�=��xo�O}�������A�Ho�#����"�A�Ho�'�������t���#�<�;ϒ��ʂ�.ʧ<(�%���	���	A�	��	��	��	��	��	��|kC�Ä`��``��`Ä�������	���fTF�Qze�^�WF�Q|e4�����|�/`�l�����6_��������6_���|�/`�l�����^6_����q3l+c�2����+���h�2�?���v����~�ob�M< /��0�D�G`��x&ށ��`�%�x
&ނ��`�5���`j�c��)��0� /�1��jjTc�՘��D5&�1Q��jLT#Tc�՘��D5&�1Q��jLTc�Ѥ՘�c�?�%��h��P	�N��؆z.��D�L�L�L�L�L�L�L/D��~~���v�x�?�ee�eZe�e:ez#�]�~��)�v���{�����?�a�     