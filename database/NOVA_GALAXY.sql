PGDMP                  
    |            NOVA_GALAXY    16.4    16.4 %               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24729    NOVA_GALAXY    DATABASE     �   CREATE DATABASE "NOVA_GALAXY" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "NOVA_GALAXY";
                postgres    false            �            1259    24779    carts    TABLE     �   CREATE TABLE public.carts (
    "bookId" character varying(20) NOT NULL,
    username character varying(100) NOT NULL,
    "bookCreateDate" date NOT NULL
);
    DROP TABLE public.carts;
       public         heap    postgres    false                       0    0    TABLE carts    ACL     @   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.carts TO dev;
          public          postgres    false    215            �            1259    24782    members    TABLE     Z  CREATE TABLE public.members (
    username character varying(100) NOT NULL,
    "passwordHash" character varying(100) NOT NULL,
    "memName" character varying(255) NOT NULL,
    gender character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(12) NOT NULL,
    "roleId" integer DEFAULT 2 NOT NULL
);
    DROP TABLE public.members;
       public         heap    postgres    false                       0    0    TABLE members    ACL     B   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.members TO dev;
          public          postgres    false    216            �            1259    24788    reservations    TABLE     ?  CREATE TABLE public.reservations (
    "bookId" character varying(20) NOT NULL,
    "roomId" character varying(5) NOT NULL,
    "checkInDate" date NOT NULL,
    "checkOutDate" date NOT NULL,
    "roomStatus" character varying(20) NOT NULL,
    "totalDay" integer NOT NULL,
    "totalPrice" double precision NOT NULL
);
     DROP TABLE public.reservations;
       public         heap    postgres    false                       0    0    TABLE reservations    ACL     G   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reservations TO dev;
          public          postgres    false    217            �            1259    24791    reviews    TABLE     �   CREATE TABLE public.reviews (
    "reviewId" integer NOT NULL,
    username character varying(100) NOT NULL,
    score double precision NOT NULL,
    comment text,
    "reviewDate" date NOT NULL,
    "reviewUpdateDate" date
);
    DROP TABLE public.reviews;
       public         heap    postgres    false                       0    0    TABLE reviews    ACL     B   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reviews TO dev;
          public          postgres    false    218            �            1259    24796    reviews_reviewId_seq    SEQUENCE     �   ALTER TABLE public.reviews ALTER COLUMN "reviewId" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."reviews_reviewId_seq"
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    24797    roles    TABLE     f   CREATE TABLE public.roles (
    "roleId" integer NOT NULL,
    role character varying(10) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false                       0    0    TABLE roles    ACL     @   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.roles TO dev;
          public          postgres    false    220            �            1259    24800 	   roomTypes    TABLE     t   CREATE TABLE public."roomTypes" (
    "roomType" integer NOT NULL,
    "roomName" character varying(20) NOT NULL
);
    DROP TABLE public."roomTypes";
       public         heap    postgres    false                       0    0    TABLE "roomTypes"    ACL     F   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."roomTypes" TO dev;
          public          postgres    false    221            �            1259    24803    roomTypes_roomType_seq    SEQUENCE     �   ALTER TABLE public."roomTypes" ALTER COLUMN "roomType" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."roomTypes_roomType_seq"
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    24804    rooms    TABLE     $  CREATE TABLE public.rooms (
    "roomId" character varying(5) NOT NULL,
    floor integer NOT NULL,
    "roomType" integer NOT NULL,
    "roomSize" integer NOT NULL,
    "roomPrice" double precision NOT NULL,
    "roomDetail" text NOT NULL,
    "roomStatus" character varying(20) NOT NULL
);
    DROP TABLE public.rooms;
       public         heap    postgres    false                       0    0    TABLE rooms    ACL     @   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rooms TO dev;
          public          postgres    false    223                      0    24779    carts 
   TABLE DATA           E   COPY public.carts ("bookId", username, "bookCreateDate") FROM stdin;
    public          postgres    false    215   A(       	          0    24782    members 
   TABLE DATA           f   COPY public.members (username, "passwordHash", "memName", gender, email, phone, "roleId") FROM stdin;
    public          postgres    false    216   �(       
          0    24788    reservations 
   TABLE DATA           �   COPY public.reservations ("bookId", "roomId", "checkInDate", "checkOutDate", "roomStatus", "totalDay", "totalPrice") FROM stdin;
    public          postgres    false    217   ;+                 0    24791    reviews 
   TABLE DATA           i   COPY public.reviews ("reviewId", username, score, comment, "reviewDate", "reviewUpdateDate") FROM stdin;
    public          postgres    false    218   �+                 0    24797    roles 
   TABLE DATA           /   COPY public.roles ("roleId", role) FROM stdin;
    public          postgres    false    220   ~,                 0    24800 	   roomTypes 
   TABLE DATA           =   COPY public."roomTypes" ("roomType", "roomName") FROM stdin;
    public          postgres    false    221   �,                 0    24804    rooms 
   TABLE DATA           q   COPY public.rooms ("roomId", floor, "roomType", "roomSize", "roomPrice", "roomDetail", "roomStatus") FROM stdin;
    public          postgres    false    223   �,                  0    0    reviews_reviewId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."reviews_reviewId_seq"', 69, true);
          public          postgres    false    219                       0    0    roomTypes_roomType_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."roomTypes_roomType_seq"', 4, true);
          public          postgres    false    222            k           2606    24810    carts carts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("bookId");
 :   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
       public            postgres    false    215            m           2606    24812    members members_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public            postgres    false    216            o           2606    24814    reservations reservations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY ("bookId");
 H   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_pkey;
       public            postgres    false    217            q           2606    24816    reviews reviews_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY ("reviewId");
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    218            s           2606    24818    roles roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY ("roleId");
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    220            u           2606    24820    roomTypes roomTypes_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."roomTypes"
    ADD CONSTRAINT "roomTypes_pkey" PRIMARY KEY ("roomType");
 F   ALTER TABLE ONLY public."roomTypes" DROP CONSTRAINT "roomTypes_pkey";
       public            postgres    false    221            w           2606    24822    rooms rooms_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY ("roomId");
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            postgres    false    223            x           2606    24823    reservations fk_bookId    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT "fk_bookId" FOREIGN KEY ("bookId") REFERENCES public.carts("bookId") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public.reservations DROP CONSTRAINT "fk_bookId";
       public          postgres    false    4715    217    215               =   x�uɱ  �:�%�v(��� B�{�	�� ��4O��+I��#�-2�(������      	   �  x�M�Ɏ�@�5>G��y�"��"���a�����J%U���'u ���)39X(8��\yK�{D�E��]�jv��E5At���g�0�8!�
 �����;�F��d�W���>B��?j���&/�S�}��jF��D�+j��A�֖}����!RG�1����F�7��qj����<�W_���7��Y�+e�KH�jo�zm�s�����6c�)C��%)�vmb�å��esoj8�;#���涶����˧�]��͛!�1c�)C�z��T��k���;�`�W�g�"t	X����T\� G��o��2�!���ϓ�HIj�����Zwz�P��3*�p
�	�玥k�EodR^��}���3�s�-���F�����S/	Uz�w��c�/Zy������E޶|�u�c��i��4�L����#�^IC/B�b�*W[9*��������٧�E	��E�&fQP����_��1���a���S^�$���ZKײbl���5E�����ܽ���c���o��7��A̔bG�p%ֽcJUm�<DJ�4 ��f�ڰY�[�g��vx��"�-������v�_s���AocZ v�o�^0�J�vbs�Ie��H�{�i�ny���C?>�7��g�k�^,��UP�      
   q   x�����0kg����CL1 ��h���r��Q�h"$:����)ka��B"B��J�b_b�8��#e&����}kJl	v�vXBZ�f��`쀭Ϻ|9}v���qv�s���P�         �   x�}��
�0Dϓ�H?�����^E�MEOB/��QPƋoR�JP'�,�ٰ;�!Ah��x�e|��J�2�2
�Q�"s���K��-aoQ)��(�R��k�%��jܺK=�X;w��-RX�ps�Q<�a�O�T2MP!�{�Q̈�&R�����NW�.C=���w�5���X�c�	�9\~            x�3�LL����2��M�MJ-����� G��         /   x�3�.I�KI,JQ����2��)�(-����9�K3KR!�=... x��         �  x��XQkA~����"^S�<
��*��K
�����M^�V̵$�襄J$`�V����w���ۻ\c���M�cwowg�of6E� 
6����=�	��.��s)bj�S)2n,e�/�'��WC)Z4B�'R̤H����c).e֥6=���v�U?���U��R;���M��ʝ��«�V�j,��VL�'!:�0O�kC�TT������s�?��[����3o�f��[!��":]�x�&�EP�бgd�}C։�/ltBj醞Fj�`�9ó�H���ϥUY��\:3F2aY0g���mP[re�����k3�u e*��h��C�p�ͦ�;�{v�������R/���j�.�+���8DL��
Ac��v���Т������OCH�;Je�ƾ%���vk3"Viw�FZ��jP��5ˇ�~�pO|�x&��,x�������ۮE���"1��O����#�k�*.SNN����)�dm�%��衃�	IQ��k C > �)�A���M����51=����F ��*f-��冐���I ��,��q1X��m�n���CIMJ�!��b�ĉ�u�rvOY�#Lph�ޕٽ�<ԕ�ޅW�4���<{�t�Z'��B��2_�|!�݅�ɋ������ZT�}ƭ�B���/du�T�U�"���K$1+��ͫJ�,�x��D�U
�!�H%E�"�Q��#�ʕ�um���_�<dx@��y6K�q^� ��H��P(���
�uf�zu�p�2�R�
蛀��]��-�΄#����0ʙ�T�)'�WW��4mM�(�7OR\/���9<�jeJ��w�u:�G��k��;!��Ms�ذ66�e g�+�0�c&�福O�>>oZ|FQ��?��/罈��p�����_OnD=q�(6�b�X���b�v_,��F����͠A�`g���g��Z�7�Ko     