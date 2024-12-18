PGDMP  *    	                |            my_project_db    16.3    16.3     a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            d           1262    16388    my_project_db    DATABASE     y   CREATE DATABASE my_project_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE my_project_db;
                postgres    false            �            1259    16390    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255),
    published_year integer,
    genre character varying(50)
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    16389    books_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public          postgres    false    216            e           0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;
          public          postgres    false    215            �            1259    16411 
   borrowings    TABLE     �   CREATE TABLE public.borrowings (
    borrowing_id integer NOT NULL,
    member_id integer,
    book_id integer,
    borrowed_date date DEFAULT CURRENT_DATE,
    return_date date
);
    DROP TABLE public.borrowings;
       public         heap    postgres    false            �            1259    16410    borrowings_borrowing_id_seq    SEQUENCE     �   CREATE SEQUENCE public.borrowings_borrowing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.borrowings_borrowing_id_seq;
       public          postgres    false    220            f           0    0    borrowings_borrowing_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.borrowings_borrowing_id_seq OWNED BY public.borrowings.borrowing_id;
          public          postgres    false    219            �            1259    16399    members    TABLE     �   CREATE TABLE public.members (
    member_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255),
    joined_date date DEFAULT CURRENT_DATE
);
    DROP TABLE public.members;
       public         heap    postgres    false            �            1259    16398    members_member_id_seq    SEQUENCE     �   CREATE SEQUENCE public.members_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.members_member_id_seq;
       public          postgres    false    218            g           0    0    members_member_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.members_member_id_seq OWNED BY public.members.member_id;
          public          postgres    false    217            �           2604    16393    books book_id    DEFAULT     n   ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books ALTER COLUMN book_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16414    borrowings borrowing_id    DEFAULT     �   ALTER TABLE ONLY public.borrowings ALTER COLUMN borrowing_id SET DEFAULT nextval('public.borrowings_borrowing_id_seq'::regclass);
 F   ALTER TABLE public.borrowings ALTER COLUMN borrowing_id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16402    members member_id    DEFAULT     v   ALTER TABLE ONLY public.members ALTER COLUMN member_id SET DEFAULT nextval('public.members_member_id_seq'::regclass);
 @   ALTER TABLE public.members ALTER COLUMN member_id DROP DEFAULT;
       public          postgres    false    217    218    218            Z          0    16390    books 
   TABLE DATA           N   COPY public.books (book_id, title, author, published_year, genre) FROM stdin;
    public          postgres    false    216   e       ^          0    16411 
   borrowings 
   TABLE DATA           b   COPY public.borrowings (borrowing_id, member_id, book_id, borrowed_date, return_date) FROM stdin;
    public          postgres    false    220   �       \          0    16399    members 
   TABLE DATA           F   COPY public.members (member_id, name, email, joined_date) FROM stdin;
    public          postgres    false    218   +        h           0    0    books_book_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.books_book_id_seq', 3, true);
          public          postgres    false    215            i           0    0    borrowings_borrowing_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.borrowings_borrowing_id_seq', 2, true);
          public          postgres    false    219            j           0    0    members_member_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.members_member_id_seq', 2, true);
          public          postgres    false    217            �           2606    16397    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    216            �           2606    16417    borrowings borrowings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_pkey PRIMARY KEY (borrowing_id);
 D   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_pkey;
       public            postgres    false    220            �           2606    16409    members members_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.members DROP CONSTRAINT members_email_key;
       public            postgres    false    218            �           2606    16407    members members_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (member_id);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public            postgres    false    218            �           2606    16423 "   borrowings borrowings_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 L   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_book_id_fkey;
       public          postgres    false    220    216    3265            �           2606    16418 $   borrowings borrowings_member_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(member_id);
 N   ALTER TABLE ONLY public.borrowings DROP CONSTRAINT borrowings_member_id_fkey;
       public          postgres    false    218    3269    220            Z   ~   x���
�0 ϻ_�_P�-j�R���KR��4d�6 �{Üf`jp_�AC���U �qNPw�z��_7�=�pa���i?������f]�'l�)�$F���q�4��6�3�㰃^�,��]!��S&}      ^   (   x�3�4B##c]C#]$��'��9c��b���� ���      \   I   x�3�t��LNU��,��L�R+srR���s9��Lt�t,��8����3���8��p)����� �U�     