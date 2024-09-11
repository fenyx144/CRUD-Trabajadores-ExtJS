PGDMP      *        
        |            postgres    16.4    16.4      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Peru.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4809                        2615    24576    prueba    SCHEMA        CREATE SCHEMA prueba;
    DROP SCHEMA prueba;
                postgres    false                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1255    32813    actualizar_total_detalle()    FUNCTION     �   CREATE FUNCTION prueba.actualizar_total_detalle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.v_d_tot := NEW.v_d_can * NEW.v_d_uni;
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION prueba.actualizar_total_detalle();
       prueba          postgres    false    7            �            1259    24578 
   trabajador    TABLE     E  CREATE TABLE prueba.trabajador (
    tra_ide integer NOT NULL,
    tra_cod integer DEFAULT 0,
    tra_nom character varying(200) DEFAULT ''::character varying,
    tra_pat character varying(200) DEFAULT ''::character varying,
    tra_mat character varying(200) DEFAULT ''::character varying,
    est_ado integer DEFAULT 1
);
    DROP TABLE prueba.trabajador;
       prueba         heap    postgres    false    7            �            1259    24577    trabajador_tra_ide_seq    SEQUENCE     �   CREATE SEQUENCE prueba.trabajador_tra_ide_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE prueba.trabajador_tra_ide_seq;
       prueba          postgres    false    7    218            �           0    0    trabajador_tra_ide_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE prueba.trabajador_tra_ide_seq OWNED BY prueba.trabajador.tra_ide;
          prueba          postgres    false    217            �            1259    32783    venta    TABLE     �   CREATE TABLE prueba.venta (
    ven_ide integer NOT NULL,
    ven_ser character varying(5) DEFAULT ''::character varying,
    ven_num character varying(100) DEFAULT ''::character varying,
    ven_cli text DEFAULT ''::text,
    ven_mon numeric(14,2)
);
    DROP TABLE prueba.venta;
       prueba         heap    postgres    false    7            �            1259    32795    venta_detalle    TABLE       CREATE TABLE prueba.venta_detalle (
    v_d_ide integer NOT NULL,
    ven_ide integer,
    v_d_pro text DEFAULT ''::text,
    v_d_uni numeric(14,2) DEFAULT 0.00,
    v_d_can numeric(14,2) DEFAULT 0.00,
    v_d_tot numeric(14,2) DEFAULT 0.00,
    est_ado integer DEFAULT 1
);
 !   DROP TABLE prueba.venta_detalle;
       prueba         heap    postgres    false    7            �            1259    32794    venta_detalle_v_d_ide_seq    SEQUENCE     �   CREATE SEQUENCE prueba.venta_detalle_v_d_ide_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE prueba.venta_detalle_v_d_ide_seq;
       prueba          postgres    false    7    222            �           0    0    venta_detalle_v_d_ide_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE prueba.venta_detalle_v_d_ide_seq OWNED BY prueba.venta_detalle.v_d_ide;
          prueba          postgres    false    221            �            1259    32782    venta_ven_ide_seq    SEQUENCE     �   CREATE SEQUENCE prueba.venta_ven_ide_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE prueba.venta_ven_ide_seq;
       prueba          postgres    false    220    7            �           0    0    venta_ven_ide_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE prueba.venta_ven_ide_seq OWNED BY prueba.venta.ven_ide;
          prueba          postgres    false    219                       2604    24581    trabajador tra_ide    DEFAULT     x   ALTER TABLE ONLY prueba.trabajador ALTER COLUMN tra_ide SET DEFAULT nextval('prueba.trabajador_tra_ide_seq'::regclass);
 A   ALTER TABLE prueba.trabajador ALTER COLUMN tra_ide DROP DEFAULT;
       prueba          postgres    false    218    217    218                       2604    32786    venta ven_ide    DEFAULT     n   ALTER TABLE ONLY prueba.venta ALTER COLUMN ven_ide SET DEFAULT nextval('prueba.venta_ven_ide_seq'::regclass);
 <   ALTER TABLE prueba.venta ALTER COLUMN ven_ide DROP DEFAULT;
       prueba          postgres    false    220    219    220            !           2604    32798    venta_detalle v_d_ide    DEFAULT     ~   ALTER TABLE ONLY prueba.venta_detalle ALTER COLUMN v_d_ide SET DEFAULT nextval('prueba.venta_detalle_v_d_ide_seq'::regclass);
 D   ALTER TABLE prueba.venta_detalle ALTER COLUMN v_d_ide DROP DEFAULT;
       prueba          postgres    false    221    222    222            �          0    24578 
   trabajador 
   TABLE DATA           Z   COPY prueba.trabajador (tra_ide, tra_cod, tra_nom, tra_pat, tra_mat, est_ado) FROM stdin;
    prueba          postgres    false    218   N$       �          0    32783    venta 
   TABLE DATA           L   COPY prueba.venta (ven_ide, ven_ser, ven_num, ven_cli, ven_mon) FROM stdin;
    prueba          postgres    false    220   J%       �          0    32795    venta_detalle 
   TABLE DATA           f   COPY prueba.venta_detalle (v_d_ide, ven_ide, v_d_pro, v_d_uni, v_d_can, v_d_tot, est_ado) FROM stdin;
    prueba          postgres    false    222   ;'       �           0    0    trabajador_tra_ide_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('prueba.trabajador_tra_ide_seq', 51, true);
          prueba          postgres    false    217            �           0    0    venta_detalle_v_d_ide_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('prueba.venta_detalle_v_d_ide_seq', 27, true);
          prueba          postgres    false    221            �           0    0    venta_ven_ide_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('prueba.venta_ven_ide_seq', 38, true);
          prueba          postgres    false    219            (           2606    24590    trabajador trabajador_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY prueba.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (tra_ide);
 D   ALTER TABLE ONLY prueba.trabajador DROP CONSTRAINT trabajador_pkey;
       prueba            postgres    false    218            ,           2606    32807     venta_detalle venta_detalle_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY prueba.venta_detalle
    ADD CONSTRAINT venta_detalle_pkey PRIMARY KEY (v_d_ide);
 J   ALTER TABLE ONLY prueba.venta_detalle DROP CONSTRAINT venta_detalle_pkey;
       prueba            postgres    false    222            *           2606    32793    venta venta_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY prueba.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (ven_ide);
 :   ALTER TABLE ONLY prueba.venta DROP CONSTRAINT venta_pkey;
       prueba            postgres    false    220            .           2620    32814 .   venta_detalle trigger_actualizar_total_detalle    TRIGGER     �   CREATE TRIGGER trigger_actualizar_total_detalle BEFORE INSERT OR UPDATE ON prueba.venta_detalle FOR EACH ROW EXECUTE FUNCTION prueba.actualizar_total_detalle();
 G   DROP TRIGGER trigger_actualizar_total_detalle ON prueba.venta_detalle;
       prueba          postgres    false    222    223            -           2606    32808 (   venta_detalle venta_detalle_ven_ide_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY prueba.venta_detalle
    ADD CONSTRAINT venta_detalle_ven_ide_fkey FOREIGN KEY (ven_ide) REFERENCES prueba.venta(ven_ide);
 R   ALTER TABLE ONLY prueba.venta_detalle DROP CONSTRAINT venta_detalle_ven_ide_fkey;
       prueba          postgres    false    4650    220    222            �   �   x�%�Mj�0��χ)vb�gY�bh��U7C"bEc��P�&�.��t���!��'͛r�"��z�xM?���s'g��se3�ҝ��~$g"��0�sl(8���?�Hxr�^)/��	�t��Vb/=]�x��¾�Q���aC�X�Z�
u���H��p��9)��Ta!	�ƛ<�l�t�ǫr�kl�93;H�1�u�4�R�Į�h:4�%���4zU-r˲V�~�����C�eD\�      �   �  x�u��n�0E����(��-��H�vQ��e$*����4���!��À�3❙{ِ5BЧ0�i!-���)`E
�nK��������4���8�9-k
#�z�|X��2��Ö��E�A-YG�y��:�R\�ԑ���q��ZWF�������)�#�3�p���	�9{�ׄ܌�n��D�Ej	]��~���xvE�c+��|��I<I�1�f�)�m\h����ol)\B_�h-�K�I���[6GH���ʓ���f9����#S���榟�AŚ|��}궘�R��̂��
�v��n�=�
��=����9�n:窠b�"H���.�}+�7����~L9��۩�?�����.�)Ś0	�v}ƳD��e�H���?[Z��}����N�Sn��2�N��'(�<�4^=�fd�k���q�!�G޽=vo���J�M	��9-q��,M����yWGJ�V������l~^�v�Pp��      �   �  x�}R�n�0<O��/@�n��1����B*=T�b
A!�������TU��dg�ٙ5��z�?��!������/�"�*���5��~���ةROKJ���x��pv�p�`٠ݎ�H��t�N����Ʌ^�$�	Dx��n��	u�:��
�@���������C9Y�>�)<O��F$
�@�Ml�?�o�X�k��tA-��rn���[�X��_<TN�ixuW?��lA%�E#Ȅ�4�>L�c5vQ���q�#t��%��%����?��Yp��ݭ6���_}7��Ĳ�P�c���ͺ�D��1W#$��4�`܍]��蔛��h�������Kj��ѯǏ���rB�H׋d��ź�l}��0����yUU���>     