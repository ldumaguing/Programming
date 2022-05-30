drop table if exists WeaponSkillGroup;
create table WeaponSkillGroup (
	Id            int unsigned primary key,
	Skills        varchar(128),
	SkillDefaults varchar(128)
);

insert into WeaponSkillGroup (Id, Skills, SkillDefaults) values
(0, 'AXE/MACE',
'DX-5, Flail-4, Two-Handed Axe/Mace-3'),
(1, 'BOXING, BRAWLING, KARATE, DX',
null),
(2, 'BRAWLING-2, KARATE-2, or DX-2',
null),
(3, 'BRAWLING or DX',
null),
(4, 'BROADSWORD',
'DX-5, Force Sword-4, Rapier-4, Saber-4, Shortsword-2, or Two-Handed Sword-4'),
(5, 'FLAIL',
'DX-6, Axe/Mace-4, or Two-Handed Flail-3'),
(6, 'FORCE SWORD',
'DX-5 or any sword skill at -3'),
(7, 'GARROTE',
'DX-4'),
(8, 'KNIFE',
'DX-4, Force Sword-3, Main-Gauche-3, or Shortsword-3'),
(9, 'KUSARI',
'DX-6, Monowire Whip-3, Two-Handed Flail-4, or Whip-3'),
(10, 'LANCE',
'DX-5 or Spear-3'),
(11, 'MONOWIRE WHIP',
'DX-6, Kusari-3, or Whip-3'),
(12, 'POLEARM',
'DX-5, Spear-4, Staff-4, or Two-Handed Axe/Mace-4'),
(13, 'RAPIER',
'DX-5, Broadsword-4, Main-Gauche-3, Saber-3, or Smallsword-3'),
(14, 'SABER',
'DX-5, Broadsword-4, Main-Gauche-3, Rapier-3, Shortsword-4, or Smallsword-3'),
(15, 'SHIELD',
'DX-4'),
(16, 'SHORTSWORD',
'DX-5, Broadsword-2, Force Sword-4, Jitte/Sai-3, Knife-4, Saber-4, Smallsword-4, or Tonfa-3'),
(17, 'SMALLSWORD',
'DX-5, Main-Gauche-3, Rapier-3, Saber-3, or Shortsword-4'),
(18, 'SPEAR',
'DX-5, Polearm-4, or Staff-2'),
(19, 'STAFF',
'DX-5, Polearm-4, or Spear-2'),
(20, 'TWO-HANDED AXE/MACE',
'DX-5, Axe/Mace-3, Polearm-4, or Two-Handed Flail-4'),
(21, 'TWO-HANDED FLAIL',
'DX-6, Flail-3, Kusari-4, or Two-Handed Axe/Mace-4'),
(22, 'TWO-HANDED SWORD',
'DX-5, Broadsword-4, or Force Sword-4'),
(23, 'WHIP',
'DX-5, Kusari-3, or Monowire Whip-3'),
(24, 'BLOWPIPE',
'DX-6'),
(25, 'BOLAS',
null),
(26, 'BOW',
'DX-5'),
(27, 'CLOAK',
'DX-5, Net-4, or Shield-4'),
(28, 'CROSSBOW',
'DX-4'),
(29, 'LASSO',
null),
(30, 'NET',
'Cloak-5'),
(31, 'SLING',
'DX-6'),
(32, 'SPEAR THROWER',
'DX-5 or Thrown Weapon (Spear)-4'),
(33, 'THROWN WEAPON (AXE/MACE)',
'DX-4'),
(34, 'THROWN WEAPON (HARPOON)',
'DX-4 or Thrown Weapon (Spear)-2'),
(35, 'THROWN WEAPON (KNIFE)',
'DX-4'),
(36, 'THROWN WEAPON (SHURIKEN)',
'DX-4 or Throwing-2'),
(37, 'THROWN WEAPON (SPEAR)',
'DX-4, Spear Thrower-4, or Thrown Weapon (Harpoon)-2'),
(38, 'THROWING',
'DX-3 or Dropping-4'),
(39, 'GUNS (PISTOL)',
'DX-4, or most other Guns at -2'),
(40, 'GUNS (GYROC)',
'DX-4, or most other Guns at -4'),
(41, 'GUNS (SMG)',
'DX-4, or most other Guns at -2'),
(42, 'GUNS (MUSKET)',
'DX-4, or most other Guns at -2'),
(43, 'GUNS (RIFLE)',
'DX-4, or most other Guns at -2'),
(44, 'GUNS (SHOTGUN)',
'DX-4, or most other Guns at -2'),
(45, 'BEAM WEAPONS (PISTOL)',
'DX-4, other Beam Weapons-4, or Guns (Pistol)-4'),
(46, 'BEAM WEAPONS (RIFLE)',
'DX-4, other Beam Weapons-4, or Guns (Rifle)-4'),
(47, 'ARTILLERY (GUIDED MISSILE)',
'IQ-5'),
(48, 'GUNNER (CATAPULT)',
'DX-4, or other Gunner at -4'),
(49, 'GUNNER (MACHINE GUN)',
'DX-4, or other Gunner at -4'),
(50, 'GUNS (GRENADE LAUNCHER)',
'DX-4, or most other Guns at -4'),
(51, 'GUNS (LAW)',
'DX-4, or most other Guns at -4'),
(52, 'GUNS (LMG)',
'DX-4, or most other Guns at -2'),
(53, 'LIQUID PROJECTOR (FLAMETHROWER)',
'DX-4, or other Liquid Projector at -4'),
(54, 'BLOWPIPE',
'DX-6'),
(55, 'BOLAS',
null),
(56, 'BOW',
'DX-5'),
(57, 'CLOAK',
'DX-5, Net-5, Shield-4'),
(58, 'CROSSBOW',
'DX-4'),
(59, 'LASSO',
null),
(60, 'NET',
'Cloak-5'),
(61, 'SLING',
'DX-6'),
(62, 'SPEAR THROWER',
'DX-5, Thrown Weapon (Spear)-4'),
(63, 'THROWN WEAPON (AXE/MACE)',
'DX-4'),
(64, 'THROWN WEAPON (HARPOON)',
'DX-4, Thrown Weapon (Spear)-2'),
(65, 'THROWN WEAPON (KNIFE)',
'DX-4'),
(66, 'THROWN WEAPON (SHURIKEN)',
'DX-4, Throwing-2'),
(67, 'THROWN WEAPON (SPEAR)',
'DX-4, Spear Thrower-4, Thrown Weapon (Harpoon)-2')














;

select * from WeaponSkillGroup;














