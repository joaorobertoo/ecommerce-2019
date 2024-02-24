CREATE TABLE public.artista
(
  codigo character varying(20) NOT NULL,
  nome character varying(50),
  data_nascimento date,
  data_falecimento date,
  pais_origem character varying(50),
  text_sobre_a_vida text,
  estilo character varying(20),
  CONSTRAINT artista_pkey PRIMARY KEY (codigo)
  );

 CREATE TABLE public.cliente
(
  cpf character varying(15) NOT NULL,
  nome character varying(50),
  idade integer,
  rua character varying(30),
  numero integer,
  bairro character varying(30),
  cidade character varying(30),
  CONSTRAINT cliente_pkey PRIMARY KEY (cpf)
);

CREATE TABLE public.cliente_telefone
(
  cpf character varying(15),
  telefone character varying(20),
  CONSTRAINT cliente_telefone_cpf_fkey FOREIGN KEY (cpf)
      REFERENCES public.cliente (cpf) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE public.compra_obra
(
  data text NOT NULL,
  cpf character varying(15),
  valor_leiloado money,
  numero_id character varying(50),
  CONSTRAINT compra_obra_cpf_fkey FOREIGN KEY (cpf)
      REFERENCES public.cliente (cpf) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT compra_obra_data_fkey FOREIGN KEY (data)
      REFERENCES public.leilao (data) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT compra_obra_numero_id_fkey FOREIGN KEY (numero_id)
      REFERENCES public.obra (numero_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE public.escultura
(
  material character varying(20),
  numero_id character varying(50),
  CONSTRAINT escultura_numero_id_fkey FOREIGN KEY (numero_id)
      REFERENCES public.obra (numero_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE public.leilao
(
  data text NOT NULL,
  local text,
  CONSTRAINT leilao_pkey PRIMARY KEY (data)
);

CREATE TABLE public.leilao_nome_leiloeiros
(
  nome_leiloeiros character varying(50),
  data text NOT NULL,
  CONSTRAINT leilao_nome_leiloeiros_data_fkey FOREIGN KEY (data)
      REFERENCES public.leilao (data) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE public.obra
(
  numero_id character varying(50) NOT NULL,
  ano integer,
  largura numeric(2,2),
  altura numeric(2,2),
  descricao text,
  valor money,
  artista_codigo character varying(20),
  CONSTRAINT obra_pkey PRIMARY KEY (numero_id),
  CONSTRAINT obra_artista_codigo_fkey FOREIGN KEY (artista_codigo)
      REFERENCES public.artista (codigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE public.outro
(
  numero_id character varying(50),
  CONSTRAINT outro_numero_id_fkey FOREIGN KEY (numero_id)
      REFERENCES public.obra (numero_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE public.pintura
(
  tecnica character varying(20),
  estado_de_conservacao character varying(20),
  numero_id character varying(50),
  CONSTRAINT pintura_numero_id_fkey FOREIGN KEY (numero_id)
      REFERENCES public.obra (numero_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);