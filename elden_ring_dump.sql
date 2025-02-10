--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapons (
    id integer NOT NULL,
    name text,
    image_url text,
    is_dlc boolean,
    physical_attack integer,
    physical_defense integer,
    magic_attack integer,
    magic_defense integer,
    fire_attack integer,
    fire_defense integer,
    lightning_attack integer,
    lightning_defense integer,
    holy_attack integer,
    holy_defense integer,
    critical_hit integer,
    guard_boost integer,
    strength_requirement integer,
    strength_scaling text,
    dexterity_requirement integer,
    dexterity_scaling text,
    intelligence_requirement integer,
    intelligence_scaling text,
    faith_requirement integer,
    faith_scaling text,
    arcane_requirement integer,
    arcane_scaling text,
    weight real,
    skill_fp integer,
    skill_name text,
    skill_url text,
    category text
);


ALTER TABLE public.weapons OWNER TO postgres;

--
-- Name: weapons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weapons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weapons_id_seq OWNER TO postgres;

--
-- Name: weapons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapons_id_seq OWNED BY public.weapons.id;


--
-- Name: weapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons ALTER COLUMN id SET DEFAULT nextval('public.weapons_id_seq'::regclass);


--
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapons (id, name, image_url, is_dlc, physical_attack, physical_defense, magic_attack, magic_defense, fire_attack, fire_defense, lightning_attack, lightning_defense, holy_attack, holy_defense, critical_hit, guard_boost, strength_requirement, strength_scaling, dexterity_requirement, dexterity_scaling, intelligence_requirement, intelligence_scaling, faith_requirement, faith_scaling, arcane_requirement, arcane_scaling, weight, skill_fp, skill_name, skill_url, category) FROM stdin;
444	Venomous Fang	/file/Elden-Ring/venomous_fang_claw_weapon_elden_ring_wiki_guide_200px.png	f	97	36	0	21	0	21	0	21	0	21	100	19	9	D	9	D	0	-	0	-	0	-	2.5	3	Quickstep	/Quickstep	claw_weapon
445	Raptor Talons	/file/Elden-Ring/raptor_talons_claw_weapon_elden_ring_wiki_guide_200px.png	f	86	33	0	19	0	19	0	19	0	19	110	19	6	E	14	C	0	-	0	-	0	-	1.5	3	Quickstep	/Quickstep	claw_weapon
446	Rabbath's Cannon	/file/Elden-Ring/rabbaths_cannon_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	135	0	135	0	0	0	0	0	0	0	100	0	28	-	16	-	0	-	0	-	0	-	15	0	Kick	/Kick	elden_ring
355	Fire Knight's Shortsword	/file/Elden-Ring/fire_knights_shortsword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	75	32	0	18	22	31	0	18	0	18	110	15	8	D	13	D	0	-	12	D	0	-	2	3	Quickstep	/Quickstep	daggers
352	Rellana's Twin Blades	/file/Elden-Ring/rellanas_twinblade_light_greatswords_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	103	66	66	47	66	29	0	47	0	26	100	35	13	D	16	D	16	D	16	D	0	-	8	0	Moon-and-Fire Stance	/Moon-and-Fire+Stance	light greatsword
375	Miquellan Knight's Sword	/file/Elden-Ring/miquellan_knights_sword_elden_ring_wiki_guide_200px.png	f	105	40	0	28	0	28	0	28	68	40	100	30	11	D	11	D	0	-	16	E	0	-	3.5	19	Sacred Blade	/Sacred+Blade	elden_ring
364	Celebrant's Sickle	/file/Elden-Ring/celebrants-sickle_dagger_weapon_elden_ring_wiki_guide_200px.png	f	79	35	0	20	0	20	0	20	0	20	100	15	6	E	11	C	0	-	0	-	0	-	1.5	3	Quickstep	/Quickstep	daggers
384	Moonrithyll's Knight Sword	/file/Elden-Ring/troll_knights_sword_colossal_swords_elden_ring_wiki_guide_200px.png	t	124	70	80	55	0	43	0	43	0	43	100	50	20	D	14	D	18	D	0	-	0	-	18	16	Tremendous Phalanx	/Tremendous+Phalanx	colossal swords
348	Red Bear's Claw	/file/Elden-Ring/red_bears_claw_beast_claws_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	104	38	0	22	0	22	0	22	0	22	100	22	20	C	10	E	0	-	0	-	0	-	4	8	Red Bear Hunt	/Red+Bear+Hunt	beast_claws_elden_ring
349	Beast Claw (Weapon)	/file/Elden-Ring/beast_claw_beast_claws_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	98	35	0	20	0	20	0	20	0	20	100	20	13	D	11	D	0	-	0	-	0	-	3	13	Savage Claws	/Savage+Claws	beast_claws_elden_ring
350	Milady	/file/Elden-Ring/milady_light_greatswords_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	116	63	0	31	0	31	0	31	0	31	100	36	12	D	17	D	0	-	0	-	0	-	6.5	9	Impaling Thrust	/Impaling+Thrust	light_greatswords_elden_ring
447	Hand Ballista	/file/Elden-Ring/hand_ballista_ballista_weapon_elden_ring_wiki_guide_200px.png	f	135	0	0	0	0	0	0	0	0	0	100	50	30	-	14	-	0	-	0	-	0	-	10	0	Kick	/Kick	ballista_weapon
351	Leda's Sword	/file/Elden-Ring/ledas_sword_light_greatswords_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	101	63	0	32	0	32	0	30	65	46	100	35	11	E	22	C	0	-	19	D	0	-	7.5	19	Needle Piercer	/Needle+Piercer	light_greatswords_elden_ring
353	Dragon-Hunter's Great Katana	/file/Elden-Ring/dragon-hunters_great_katana_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	152	69	0	32	0	32	0	32	0	32	100	37	15	D	20	D	0	-	0	-	0	-	10.5	18	Dragonwound Slash	/Dragonwound+Slash	elden_ring
354	Rakshasa's Great Katana	/file/Elden-Ring/rakshasas_great_katana_great_katana_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	155	53	0	24	0	24	0	24	0	24	100	35	12	E	27	C	0	-	0	-	0	-	9.5	8	Weed Cutter	/Weed+Cutter	great_katana_elden_ring
356	Main-gauche	/file/Elden-Ring/main-gauche_dagger_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	79	38	0	22	0	22	0	22	0	22	110	16	7	D	15	D	0	-	0	-	0	-	2.5	0	Parry	/Parry	dagger_elden_ring
357	Dagger	/file/Elden-Ring/dagger_dagger_weapon_elden_ring_wiki_guide_200px.png	f	74	35	0	20	0	20	0	20	0	20	130	15	5	D	9	C	0	-	0	-	0	-	1.5	3	Quickstep	/Quickstep	dagger_weapon
358	Parrying Dagger	/file/Elden-Ring/parrying_dagger_dagger_weapon_elden_ring_wiki_guide_200px.png	f	75	35	0	20	0	20	0	20	0	20	110	15	5	E	14	C	0	-	0	-	0	-	1.5	0	Parry	/Parry+Skill	dagger_weapon
359	Misericorde	/file/Elden-Ring/misericorde_dagger_weapon_elden_ring_wiki_guide_200px.png	f	92	36	0	21	0	21	0	21	0	21	140	15	7	E	12	D	0	-	0	-	0	-	2	3	Quickstep	/Quickstep	dagger_weapon
360	Great Knife	/file/Elden-Ring/great_knife_dagger_weapon_elden_ring_wiki_guide_200px.png	f	75	35	0	20	0	20	0	20	0	20	110	15	6	E	12	C	0	-	0	-	0	-	1.5	3	Quickstep	/Quickstep	dagger_weapon
361	Bloodstained Dagger	/file/Elden-Ring/bloodstained_dagger_dagger_weapon_elden_ring_wiki_guide_200px.png	f	81	36	0	21	0	21	0	21	0	21	110	15	9	C	12	E	0	-	0	-	0	-	2	3	Quickstep	/Quickstep	dagger_weapon
362	Erdsteel Dagger	/file/Elden-Ring/erdsteel_dagger_dagger_weapon_elden_ring_wiki_guide_200px.png	f	67	36	0	21	0	21	0	21	0	21	110	15	7	D	12	D	0	-	14	D	0	-	2	3	Quickstep	/Quickstep	dagger_weapon
363	Wakizashi	/file/Elden-Ring/wakizashi_dagger_weapon_elden_ring_wiki_guide_200px.png	f	94	42	0	24	0	24	0	24	0	24	100	18	9	D	13	D	0	-	0	-	0	-	3	3	Quickstep	/Quickstep	dagger_weapon
365	Ivory Sickle	/file/Elden-Ring/ivory_sickle_dagger_weapon_elden_ring_wiki_guide_200px.png	f	60	26	60	42	0	15	0	15	0	15	100	15	6	E	11	D	13	D	0	-	0	-	2	3	Quickstep	/Quickstep	dagger_weapon
366	Crystal Knife	/file/Elden-Ring/crystal_knife_dagger_weapon_elden_ring_wiki_guide_200px.png	f	82	32	53	31	0	18	0	18	0	18	100	15	8	D	12	D	9	D	0	-	0	-	2	3	Quickstep	/Quickstep	dagger_weapon
367	Scorpion's Stinger	/file/Elden-Ring/scorpions_stinger_dagger_weapon_elden_ring_wiki_guide_200px.png	f	79	38	0	22	0	22	0	22	0	22	110	16	6	D	12	C	0	-	0	-	0	-	2.5	7	Repeating Thrust	/Repeating+Thrust	dagger_weapon
368	Cinquedea	/file/Elden-Ring/cinquedea_dagger_weapon_elden_ring_wiki_guide_200px.png	f	98	43	0	25	0	25	0	25	0	25	100	18	10	D	10	E	0	-	0	-	0	-	3.5	3	Quickstep	/Quickstep	dagger_weapon
369	Blade of Calling	/file/Elden-Ring/blade_of_calling_dagger_weapon_elden_ring_wiki_guide_200px.png	f	71	31	0	18	0	18	0	18	43	30	110	15	6	D	13	D	0	-	15	C	0	-	1.5	20	Blade of Gold	/Blade+of+Gold	dagger_weapon
370	Black Knife	/file/Elden-Ring/black_knife_dagger_weapon_elden_ring_wiki_guide_200px.png	f	66	26	0	15	0	15	0	15	65	42	110	15	8	E	12	D	0	-	18	D	0	-	2	25	Blade of Death	/Blade+of+Death	dagger_weapon
371	Velvet Sword of St Trina	/file/Elden-Ring/velvet_sword_of_st_trina_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	95	37	61	37	0	25	0	25	0	25	110	27	10	E	12	D	14	E	0	-	0	-	2.5	23	Mists of Eternal Sleep	/Mists+of+Eternal+Sleep	elden_ring
372	Sword of Darkness	/file/Elden-Ring/sword_of_darkness_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	93	26	0	15	0	15	0	15	93	42	100	31	14	D	11	E	0	-	24	E	0	-	4	30	Darkness	/Darkness+(Skill)	elden_ring
373	Short Sword	/file/Elden-Ring/short_sword_straight_sword_weapon_elden_ring_wiki_guide_200px.png	f	102	42	0	28	0	28	0	28	0	28	100	28	8	D	10	D	0	-	0	-	0	-	3	0	Kick	/Kick	straight_sword_weapon
374	Carian Knight's Sword	/file/Elden-Ring/carian_knights_sword_straight_sword_weapon_elden_ring_wiki_guide_200px.png	f	88	36	88	52	0	26	0	26	0	26	100	31	10	D	10	D	18	D	0	-	0	-	4	26	Carian Grandeur	/Carian+Grandeur	straight_sword_weapon
376	Ornamental Straight Sword	/file/Elden-Ring/ornamental_straight_sword_straight_sword_weapon_elden_ring_wiki_guide_200px.png	f	101	42	0	28	0	28	0	28	0	28	110	28	10	E	14	D	0	-	0	-	0	-	3	30	Golden Tempering	/Golden+Tempering	straight_sword_weapon
377	Golden Epitaph	/file/Elden-Ring/golden_epitaph_straight_sword_weapon_elden_ring_wiki_guide_200px.png	f	85	25	0	15	0	15	0	15	85	40	100	30	12	D	10	D	0	-	14	D	0	-	3.5	25	Last Rites	/Last+Rites	straight_sword_weapon
378	Sword of St Trina	/file/Elden-Ring/sword_of_st_trina_straight_sword_weapon_elden_ring_wiki_guide_200px.png	f	107	39	32	33	0	27	0	27	0	27	100	28	10	D	12	D	14	E	0	-	0	-	3	20	Mists of Slumber	/Mists+of+Slumber	straight_sword_weapon
379	Regalia of Eochaid	/file/Elden-Ring/regalia_of_eochaid_straight_sword_weapon_elden_ring_wiki_guide_200px.png	f	89	48	57	40	0	31	0	31	0	31	100	33	12	E	18	D	0	-	0	-	15	D	5.5	15	Eochaid's Dancing Blade	/Eochaid's+Dancing+Blade	straight_sword_weapon
380	Coded Sword	/file/Elden-Ring/coded_sword_straight_sword_weapon_elden_ring_wiki_guide_200px.png	f	0	13	0	22	0	22	0	22	85	58	100	27	0	-	0	-	0	-	20	B	0	-	2.5	25	Unblockable Blade	/Unblockable+Blade	straight_sword_weapon
381	Fire Knight's Greatsword	/file/Elden-Ring/fire_knights_greatsword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	147	69	0	42	44	47	0	42	0	42	100	47	22	D	18	D	0	-	12	D	0	-	16	5	Stamp (Upward Cut)	/Stamp+(Upward+Cut)	elden_ring
382	Ancient Meteoric Ore Greatsword	/file/Elden-Ring/ancient_meteoric_ore_greatsword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	138	80	0	55	0	49	0	49	0	49	100	55	35	D	10	E	0	-	0	-	19	D	22	10	White Light Charge	/White+Light+Charge	elden_ring
448	Jar Cannon	/file/Elden-Ring/jar_cannon_ballista_weapon_elden_ring_wiki_guide_200px.png	f	192	0	0	0	0	0	0	0	0	0	100	50	34	-	12	-	0	-	0	-	0	-	15	0	Kick	/Kick	ballista_weapon
422	Forked-Tongue Hatchet	/file/Elden-Ring/forked-tongue_hatchet_unique_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_75px.png	t	125	45	0	30	0	30	0	30	0	30	100	30	10	D	13	D	0	-	0	-	0	-	4	14	Dragonform Flame	/Dragonform+Flame	unique_elden_ring
423	Messmer Soldier's Axe	/file/Elden-Ring/messmer_soldiers_axe_axes_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_75px.png	t	133	49	0	33	0	33	0	33	0	33	100	33	14	D	10	D	0	-	0	-	0	-	5.5	16	War Cry	/War+Cry	axes_elden_ring
441	Claws of Night	/file/Elden-Ring/claws_of_night_unique_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_75px.png	t	79	33	51	31	0	18	0	18	0	18	110	21	8	-	20	C	0	-	0	-	0	-	3	11	Scattershot Throw	/Scattershot+Throw	unique_elden_ring
383	Greatsword of Radahn (Lord)	/file/Elden-Ring/greatsword_of_radahn_(lord)_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	129	69	83	42	0	47	0	42	0	42	100	47	32	D	24	D	15	E	0	-	0	-	19	20	Promised Consort	/Promised+Consort	(lord)_elden_ring
385	Greatsword of Radahn (Light)	/file/Elden-Ring/greatsword_of_radahn_(light)_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	129	65	83	47	0	34	0	34	0	34	100	52	32	D	24	D	15	E	0	-	0	-	20	26	Lightspeed Slash	/Lightspeed+Slash	(light)_elden_ring
386	Troll's Golden Sword	/file/Elden-Ring/trolls_golden_sword_colossal_swords_elden_ring_wiki_guide_200px.png	f	155	76	0	46	0	46	0	46	0	46	100	51	29	D	10	D	0	-	0	-	0	-	19	22	Troll's Roar	/Troll's+Roar	colossal_swords
387	Troll Knight's Sword	/file/Elden-Ring/troll_knights_sword_colossal_swords_elden_ring_wiki_guide_200px.png	f	124	70	80	55	0	43	0	43	0	43	100	50	20	D	14	D	18	D	0	-	0	-	18	22	Troll's Roar	/Troll's+Roar	colossal_swords
388	Royal Greatsword	/file/Elden-Ring/royal_greatsword__colossal_swords_elden_ring_wiki_guide_200px.png	f	112	71	134	63	0	44	0	44	0	44	100	52	26	D	18	E	22	D	0	-	0	-	20	20	Wolf's Assault	/Wolf's+Assault	_colossal_swords
389	Grafted Blade Greatsword	/file/Elden-Ring/grafted_blade_greatsword_colossal_swords_elden_ring_wiki_guide_200px.png	f	162	80	0	48	0	48	0	48	0	48	100	53	40	C	14	E	0	-	0	-	0	-	21	20	Oath of Vengeance	/Oath+of+Vengeance	colossal_swords
390	Ruins Greatsword	/file/Elden-Ring/ruins_greatsword_colossal_swords_elden_ring_wiki_guide_200px.png	f	124	82	37	56	0	50	0	50	0	50	100	56	50	B	0	-	16	E	0	-	0	-	23	25	Wave of Destruction	/Wave+of+Destruction	colossal_swords
391	Maliketh's Black Blade	/file/Elden-Ring/malikeths_black_blade_colossal_swords_elden_ring_wiki_guide_200px.png	f	127	68	0	36	0	36	0	36	82	49	100	55	34	D	12	E	0	-	20	D	0	-	22	40	Destined Death	/Destined+Death	colossal_swords
392	Carian Sorcery Sword	/file/Elden-Ring/carian_sorcery_sword_thrusting_sword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	69	34	69	48	0	24	0	24	0	24	110	19	10	E	19	D	16	D	0	-	0	-	2.5	9	Impaling Thrust	/Impaling+Thrust	thrusting_sword_elden_ring
393	Rapier	/file/Elden-Ring/rapier_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	96	45	0	30	0	30	0	30	0	30	130	20	7	E	12	C	0	-	0	-	0	-	2.5	14	Impaling Thrust	/Impaling+Thrust	thrusting_sword_weapon
394	Estoc	/file/Elden-Ring/estoc_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	107	54	0	36	0	36	0	36	0	36	100	24	11	E	13	C	0	-	0	-	0	-	4.5	14	Impaling Thrust	/Impaling+Thrust	thrusting_sword_weapon
395	Noble's Estoc	/file/Elden-Ring/nobles_estoc_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	104	49	0	33	0	33	0	33	0	33	100	22	9	D	10	D	0	-	0	-	0	-	3.5	9	Impaling Thrust	/Impaling+Thrust	thrusting_sword_weapon
396	Cleanrot Knight's Sword	/file/Elden-Ring/cleanrot_knights_sword_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	109	51	0	34	0	34	0	34	0	34	100	23	11	D	13	D	0	-	0	-	0	-	4	13	Impaling Thrust	/Impaling+Thrust	thrusting_sword_weapon
397	Rogier's Rapier	/file/Elden-Ring/rogiers_rapier_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	93	49	0	33	0	33	0	33	0	33	110	22	8	E	17	C	0	-	0	-	0	-	3.5	7	Repeating Thrust	/Repeating+Thrust	thrusting_sword_weapon
398	Antspur Rapier	/file/Elden-Ring/antspur_rapier_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	98	47	0	31	0	31	0	31	0	31	100	25	10	D	20	D	0	-	0	-	0	-	3	14	Impaling Thrust	/Impaling+Thrust	thrusting_sword_weapon
399	Frozen Needle	/file/Elden-Ring/frozen_needle_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	99	40	0	40	0	28	0	28	0	28	100	20	11	E	18	D	0	-	0	-	0	-	2.5	14	Impaling Thrust	/Impaling+Thrust	thrusting_sword_weapon
400	Sword Lance	/file/Elden-Ring/sword_lance_heavy_thrusting_sword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	132	73	0	39	0	39	0	39	0	39	100	42	21	C	11	E	0	-	0	-	0	-	9	9	Impaling Thrust	/Impaling+Thrust	heavy_thrusting_sword_elden_ring
401	Queelign's Greatsword	/file/Elden-Ring/queeligns_greatsword_heavy_thrusting_sword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	117	50	0	34	35	45	0	34	0	34	100	33	14	D	18	D	0	-	12	D	0	-	7.5	9	Impaling Thrust	/Impaling+Thrust	heavy_thrusting_sword_elden_ring
402	Great Epee	/file/Elden-Ring/great_epee_heavy_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	124	52	0	36	0	36	0	36	0	36	100	31	15	D	16	D	0	-	0	-	0	-	6.5	9	Impaling Thrust	/Impaling+Thrust	heavy_thrusting_sword_weapon
403	Godskin Stitcher	/file/Elden-Ring/godskin_stitcher_heavy_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	127	55	0	38	0	38	0	38	0	38	100	33	14	D	17	D	0	-	0	-	0	-	7	9	Impaling Thrust	/Impaling+Thrust	heavy_thrusting_sword_weapon
404	Dragon King's Cragblade	/file/Elden-Ring/dragon_kings_cragblade_heavy_thrusting_sword_weapon_elden_ring_wiki_guide_200px.png	f	92	46	0	32	0	32	59	46	0	32	100	34	18	E	37	D	0	-	0	-	0	-	8	35	Thundercloud Form	/Thundercloud+Form	heavy_thrusting_sword_weapon
405	Spirit Sword	/file/Elden-Ring/spirit_sword_1_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	92	38	59	38	0	26	0	26	0	26	100	19	8	E	16	D	16	D	0	-	0	-	2.5	12	Rancor Slash	/Rancor+Slash	1_elden_ring
406	Falx	/file/Elden-Ring/falx_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	107	42	0	31	0	31	0	31	0	31	100	21	13	D	15	D	0	-	0	-	0	-	4	15	Revenger's Blade	/Revenger's+Blade	elden_ring
407	Dancing Blade of Ranah	/file/Elden-Ring/dancing_blade_of_ranah_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	88	37	0	28	0	29	0	29	0	27	100	20	9	-	20	D	0	-	0	-	0	-	3.5	2	Unending Dance	/Unending+Dance	elden_ring
408	Horned Warrior's Sword	/file/Elden-Ring/horned_warriors_sword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	108	48	0	36	0	36	0	36	0	36	100	30	11	D	14	D	0	-	0	-	0	-	5	17	Horn Calling	/Horn+Calling	elden_ring
409	Magma Blade	/file/Elden-Ring/magma_blade_curved_sword_weapon_elden_ring_wiki_guide_200px.png	f	96	44	0	30	62	44	0	30	0	30	100	27	9	D	15	D	0	-	16	D	0	-	4	12	Magma Shower	/Magma+Shower	curved_sword_weapon
410	Nox Flowing Sword	/file/Elden-Ring/nox_flowing_sword_curved_sword_elden_ring_wiki_guide_200px.png	f	112	40	0	30	0	30	0	30	0	30	100	25	8	E	15	D	0	-	0	-	0	-	3.5	9	Flowing Form	/Flowing+Form	curved_sword
411	Horned Warrior's Greatsword	/file/Elden-Ring/horned_warriors_greatsword_curved_greatsword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	130	73	0	39	0	39	0	39	0	39	100	47	19	D	16	D	0	-	13	D	0	-	13	22	Horn Calling: Storm	/Horn+Calling:+Storm	curved_greatsword_elden_ring
412	Onyx Lord's Greatsword	/file/Elden-Ring/onyx_lords_greatsword_curved_greatsword_weapon_elden_ring_wiki_guide_200px.png	f	118	57	76	42	0	29	0	29	0	29	100	44	20	D	16	E	16	D	0	-	0	-	11.5	27	Onyx Lord's Repulsion	/Onyx+Lord's+Repulsion	curved_greatsword_weapon
413	Zamor Curved Sword	/file/Elden-Ring/zamor_curved_sword_curved_greatsword_weapon_elden_ring_wiki_guide_200px.png	f	130	67	0	33	0	33	0	33	0	33	100	39	16	D	18	D	0	-	0	-	0	-	9	15	Zamor Ice Storm	/Zamor+Ice+Storm	curved_greatsword_weapon
414	Star-Lined Sword	/file/Elden-Ring/star-lined_sword_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	82	34	82	48	0	24	0	24	0	24	100	29	10	E	23	C	21	D	0	-	0	-	5	10	Onze's Line of Stars	/Onze's+Line+of+Stars	elden_ring
415	Sword of Night	/file/Elden-Ring/sword_of_night_katana_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	110	43	33	35	0	27	0	27	0	27	100	30	11	-	20	C	0	-	0	-	0	-	6.5	21	Witching Hour Slash	/Witching+Hour+Slash	katana_elden_ring
416	Uchigatana	/file/Elden-Ring/uchigatana_katana_elden_ring_wiki_guide_200px.png	f	115	45	0	30	0	30	0	30	0	30	100	30	11	D	15	D	0	-	0	-	0	-	5.5	10	Unsheathe	/Unsheathe	katana
417	Nagakiba	/file/Elden-Ring/nagakiba_katana_weapon_elden_ring_wiki_guide_200px.png	f	115	49	0	33	0	33	0	33	0	33	100	33	18	D	22	C	0	-	0	-	0	-	7	16	Piercing Fang	/Piercing+Fang	katana_weapon
418	Meteoric Ore Blade	/file/Elden-Ring/meteoric_ore_blade_katana_weapon_elden_ring_wiki_guide_200px.png	f	112	50	72	45	0	31	0	31	0	31	100	33	15	D	14	E	18	D	0	-	0	-	7.5	13	Gravitas	/Gravitas	katana_weapon
419	Dragonscale Blade	/file/Elden-Ring/dragonscale_blade_katana_weapon_elden_ring_wiki_guide_200px.png	f	110	35	0	25	0	25	0	50	0	25	100	30	12	D	20	C	0	-	0	-	0	-	5.5	25	Ice Lightning Sword	/Ice+Lightning+Sword	katana_weapon
420	Euporia	/file/Elden-Ring/euporia_twinblade_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	84	32	0	26	0	26	0	26	100	59	100	32	16	D	16	D	0	-	24	D	0	-	8.5	28	Euporia Vortex	/Euporia+Vortex	twinblade_elden_ring
421	Godskin Peeler	/file/Elden-Ring/godskin_peeler_twinblade_weapon_elden_ring_wiki_guide_200px.png	f	121	47	0	31	0	31	0	31	0	31	100	31	17	E	22	C	0	-	0	-	0	-	8	30	Black Flame Tornado	/Black+Flame+Tornado	twinblade_weapon
424	Hand Axe	/file/Elden-Ring/hand_axe_weapon_elden_ring_wiki_guide_200px.png	f	117	42	0	28	0	28	0	28	0	28	100	28	9	D	8	D	0	-	0	-	0	-	3.5	3	Quickstep	/Quickstep	weapon
425	Forked Hatchet	/file/Elden-Ring/forked_hatchet_weapon_elden_ring_wiki_guide_200px.png	f	113	40	0	27	0	27	0	27	0	27	100	27	9	D	14	D	0	-	0	-	0	-	2.5	3	Quickstep	/Quickstep	weapon
426	Warped Axe	/file/Elden-Ring/warped_axe_weapons_elden_ring_wiki_guide_200px.png	f	124	56	0	37	0	37	0	37	0	37	100	43	24	C	8	-	0	-	0	-	0	-	7.5	16	War Cry	/War+Cry	weapons
427	Highland Axe	/file/Elden-Ring/highland_axe_weapon_elden_ring_wiki_guide_200px.png	f	128	47	0	31	0	31	0	31	0	31	110	31	12	D	9	D	0	-	0	-	0	-	4.5	16	War Cry	/War+Cry	weapon
428	Icerind Hatchet	/file/Elden-Ring/icerind_hatchet_weapon_elden_ring_wiki_guide_200px.png	f	115	40	0	27	0	27	0	27	0	27	100	27	11	E	16	D	0	-	0	-	0	-	3	10	Hoarfrost Stomp	/Hoarfrost+Stomp	weapon
429	Rosus' Axe	/file/Elden-Ring/rosus_axe_weapon_elden_ring_wiki_guide_200px.png	f	112	44	68	44	0	30	0	30	0	30	100	33	18	D	10	E	18	D	0	-	0	-	5.5	15	Rosus's Summons	/Rosus's+Summons	weapon
430	Bloodfiend's Sacred Spear	/file/Elden-Ring/bloodfiends_sacred_spear_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	115	40	0	25	0	25	0	25	0	25	100	30	22	E	12	E	0	-	0	-	13	C	8	20	Bloodfiends' Bloodboon	/Bloodfiends'+Bloodboon	elden_ring
431	Messmer Soldier's Spear	/file/Elden-Ring/messmer_soldiers_spear_spears_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	122	56	0	35	0	35	0	35	0	35	100	43	19	D	16	D	0	-	0	-	0	-	8.5	9	Impaling Thrust	/Impaling+Thrust	spears_elden_ring
432	Spear of the Impaler	/file/Elden-Ring/spear_of_the_impaler_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	85	48	0	32	102	32	0	64	0	32	100	45	14	E	35	C	0	-	18	D	0	-	9.5	15	Messmer's Assault	/Messmer's+Assault	elden_ring
433	Barbed Staff-Spear	/file/Elden-Ring/barbed_staff-spear_spears_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	86	42	0	31	0	31	0	31	86	45	100	37	14	E	18	E	0	-	22	C	0	-	7.5	4	Jori's Inquisition	/Jori's+Inquisition	spears_elden_ring
434	Lance	/file/Elden-Ring/lance_greatspear_weapon_elden_ring_wiki_guide_200px.png	f	123	57	0	36	0	36	0	36	0	36	100	44	20	D	14	D	0	-	0	-	0	-	9	13	Charge Forth	/Charge+Forth	greatspear_weapon
435	Treespear	/file/Elden-Ring/treespear_greatspear_weapon_elden_ring_wiki_guide_200px.png	f	122	55	0	35	0	35	0	35	79	48	100	45	15	D	22	D	0	-	18	D	0	-	9.5	18	Sacred Order	/Sacred+Order	greatspear_weapon
436	Serpent-Hunter	/file/Elden-Ring/serpent-hunter_greatspear_weapon_elden_ring_wiki_guide_200px.png	f	111	72	0	42	0	42	0	42	0	42	100	50	0	B	0	E	0	-	0	-	0	-	12	15	Great-Serpent Hunt	/Great-Serpent+Hunt	greatspear_weapon
437	Siluria's Tree	/file/Elden-Ring/silurias_tree_greatspear_weapon_elden_ring_wiki_guide_200px.png	f	90	51	0	36	0	36	0	36	90	55	100	46	27	D	13	E	0	-	20	D	0	-	10	25	Siluria's Woe	/Siluria's+Woe	greatspear_weapon
438	Vyke's War Spear	/file/Elden-Ring/vykes_war_spear_greatspear_weapon_elden_ring_wiki_guide_200px.png	f	103	52	0	33	66	45	0	33	0	33	100	42	16	E	20	C	0	-	18	D	0	-	8	22	Frenzyflame Thrust	/Frenzyflame+Thrust	greatspear_weapon
439	Obsidian Lamina	/file/Elden-Ring/obsidian_lamina_reaper_elden_ring_shadow_of_the_erdtree_dlc_wiki_guide_200px.png	t	120	42	0	28	0	28	0	28	0	28	100	28	12	E	25	C	0	-	0	-	17	D	6.5	5	Dynastic Sickleplay	/Dynastic+Sickleplay	reaper_elden_ring
440	Winged Scythe	/file/Elden-Ring/winged_scythe_reaper_weapon_elden_ring_wiki_guide_200px.png	f	87	30	0	25	0	25	0	25	104	55	100	30	16	E	16	D	0	-	24	D	0	-	7.5	17	Angel's Wings	/Angel's+Wings	reaper_weapon
442	Hookclaws	/file/Elden-Ring/hookclaws_claw_weapon_elden_ring_wiki_guide_200px.png	f	93	35	0	20	0	20	0	20	0	20	110	20	8	E	14	C	0	-	0	-	0	-	2	3	Quickstep	/Quickstep	claw_weapon
443	Bloodhound Claws	/file/Elden-Ring/bloodhound_claws_claw_weapon_elden_ring_wiki_guide_200px.png	f	99	38	0	22	0	22	0	22	0	22	110	22	10	D	15	D	0	-	0	-	0	-	3	5	Bloodhound's Step	/Bloodhound's+Step	claw_weapon
\.


--
-- Name: weapons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapons_id_seq', 448, true);


--
-- Name: weapons weapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

