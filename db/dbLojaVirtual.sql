PGDMP          -        	        x            dbLojaVirtual "   10.12 (Ubuntu 10.12-2.pgdg18.04+1)     12.2 (Ubuntu 12.2-2.pgdg18.04+1)     z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            {           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            |           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            }           1262    36602    dbLojaVirtual    DATABASE     �   CREATE DATABASE "dbLojaVirtual" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE "dbLojaVirtual";
                postgres    false            �            1259    53011    produto    TABLE     �   CREATE TABLE public.produto (
    pk_produto integer NOT NULL,
    nome_produto character varying(100),
    descricao character varying(1000),
    preco double precision,
    imagem character varying(100)
);
    DROP TABLE public.produto;
       public            postgres    false            �            1259    53009    produto_pk_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_pk_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.produto_pk_produto_seq;
       public          postgres    false    201            ~           0    0    produto_pk_produto_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.produto_pk_produto_seq OWNED BY public.produto.pk_produto;
          public          postgres    false    200            �            1259    44796    tipo_usuario    TABLE     l   CREATE TABLE public.tipo_usuario (
    pk_tipo_usuario integer NOT NULL,
    descricao character varying
);
     DROP TABLE public.tipo_usuario;
       public            postgres    false            �            1259    44794     tipo_usuario_pk_tipo_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_usuario_pk_tipo_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.tipo_usuario_pk_tipo_usuario_seq;
       public          postgres    false    199                       0    0     tipo_usuario_pk_tipo_usuario_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.tipo_usuario_pk_tipo_usuario_seq OWNED BY public.tipo_usuario.pk_tipo_usuario;
          public          postgres    false    198            �            1259    36605    usuario    TABLE     �   CREATE TABLE public.usuario (
    pk_user integer NOT NULL,
    email character varying,
    password character varying,
    fk_tipo_usuario integer
);
    DROP TABLE public.usuario;
       public            postgres    false            �            1259    36603    users_pk_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_pk_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_pk_user_seq;
       public          postgres    false    197            �           0    0    users_pk_user_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_pk_user_seq OWNED BY public.usuario.pk_user;
          public          postgres    false    196            �
           2604    53014    produto pk_produto    DEFAULT     x   ALTER TABLE ONLY public.produto ALTER COLUMN pk_produto SET DEFAULT nextval('public.produto_pk_produto_seq'::regclass);
 A   ALTER TABLE public.produto ALTER COLUMN pk_produto DROP DEFAULT;
       public          postgres    false    201    200    201            �
           2604    44799    tipo_usuario pk_tipo_usuario    DEFAULT     �   ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN pk_tipo_usuario SET DEFAULT nextval('public.tipo_usuario_pk_tipo_usuario_seq'::regclass);
 K   ALTER TABLE public.tipo_usuario ALTER COLUMN pk_tipo_usuario DROP DEFAULT;
       public          postgres    false    199    198    199            �
           2604    36608    usuario pk_user    DEFAULT     p   ALTER TABLE ONLY public.usuario ALTER COLUMN pk_user SET DEFAULT nextval('public.users_pk_user_seq'::regclass);
 >   ALTER TABLE public.usuario ALTER COLUMN pk_user DROP DEFAULT;
       public          postgres    false    197    196    197            w          0    53011    produto 
   TABLE DATA           U   COPY public.produto (pk_produto, nome_produto, descricao, preco, imagem) FROM stdin;
    public          postgres    false    201   �       u          0    44796    tipo_usuario 
   TABLE DATA           B   COPY public.tipo_usuario (pk_tipo_usuario, descricao) FROM stdin;
    public          postgres    false    199   k       s          0    36605    usuario 
   TABLE DATA           L   COPY public.usuario (pk_user, email, password, fk_tipo_usuario) FROM stdin;
    public          postgres    false    197   �       �           0    0    produto_pk_produto_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.produto_pk_produto_seq', 9, true);
          public          postgres    false    200            �           0    0     tipo_usuario_pk_tipo_usuario_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tipo_usuario_pk_tipo_usuario_seq', 2, true);
          public          postgres    false    198            �           0    0    users_pk_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_pk_user_seq', 2, true);
          public          postgres    false    196            �
           2606    53016    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (pk_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    201            �
           2606    44804    tipo_usuario tipo_usuario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (pk_tipo_usuario);
 H   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_pkey;
       public            postgres    false    199            �
           2606    36613    usuario users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT users_pkey PRIMARY KEY (pk_user);
 <   ALTER TABLE ONLY public.usuario DROP CONSTRAINT users_pkey;
       public            postgres    false    197            �
           2606    44805 $   usuario usuario_fk_tipo_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_fk_tipo_usuario_fkey FOREIGN KEY (fk_tipo_usuario) REFERENCES public.tipo_usuario(pk_tipo_usuario);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_fk_tipo_usuario_fkey;
       public          postgres    false    197    199    2805            w   p  x��Mr�0F��)p �&N:M�L]u�ʲ��$�� ��#��X!�N�G����>B���a���H��~��9m~:٣.(�y�M�]Rpi)9�K����y-��.�n�jP��:��@�Y O��8V�T���˚�,ٺ�*
��f�.�!���r$F�=<Y��E<�:(��j��$ڈ�ǀ�,l�W�����������k,�f۔�[�2�����$�u8��j�����\���6��q�dɄN+c;��d�M}��x�=m�Ӭ���0|�#ȑ�;qmn��P����e���FG����tޞu�6�����W��%sws���K����3����1W�Z�0��'�w��߾�����      u   #   x�3�LL����2�L+�K���K,������� tN�      s   :   x�3���/NMI,��)KtH�M���K���4426�4�2J'�We楣HP2F��� ��     