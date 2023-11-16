create Database r6s;
use r6s;

create table operator(
operatorID int not null primary key, operatorName varchar(45), operatorOrg varchar(45), operatorRole varchar(45));




create table maps(mapsID int not null primary key, mapName varchar(45), mapLocation varchar(45), mapDescription varchar(45));
create table primaryWeapon(pwID int not null primary key, pwName varchar(45), pwType varchar(45), pwFirerate int, pwDamage int, pwCapacity int);
create table secondaryWeapon(swID int not null primary key, swName varchar(45), swType varchar(45), swFirerate int, swDamage int, swCapacity int);
create table gadgets(gadgetID int not null primary key, gadgetName varchar(45), gadgetType varchar(45), gadgetRole varchar(45));
create table specialAbility(abilityID int not null primary key, operatorID int, abilityName varchar(45) not null, foreign key (operatorID) references operator 
(operatorID) on update cascade on delete restrict);
create table loadout(loadoutID int not null primary key,operatorID int not null , pwID int not null, swID int not null, abilityID int not null, foreign key(operatorID) references operator(operatorID) 
on update cascade on delete restrict, foreign key(pwID) references primaryWeapon (pwID) on update cascade on delete restrict, foreign key(swID) references secondaryWeapon(swID) 
on update cascade on delete restrict, foreign key(abilityID) references specialAbility(abilityID) on update cascade on delete restrict);
create table operator_has_sW(operatorID int not null, swID int not null, foreign key(operatorID) references operator(operatorID), foreign key(swID) references secondaryWeapon(swID));
create table operator_has_pW(operatorID int not null, pwID int not null, foreign key(operatorID) references operator(operatorID), foreign key(pwID) references primaryWeapon(pwID));
drop table operator_has_pW;
create table operator_has_pW(operatorID int not null, pwID int not null, primary key(operatorID,pwID), foreign key(operatorID) references operator(operatorID) on delete restrict on update cascade, foreign key(pwID)
 references primaryWeapon(pwID)on delete restrict on update cascade);
drop table operator_has_sW;
create table operator_has_sW(operatorID int not null, swID int not null, primary key(operatorID, swID), foreign key(operatorID) references operator(operatorID) on delete restrict on update cascade, foreign key(swID) references
 secondaryWeapon(swID) on delete restrict on update cascade);
create table used_in(mapID int not null, operatorID int not null, primary key(operatorID, mapID), foreign key(mapID) references maps(mapID) on delete restrict on update cascade, foreign key(operatorID) references
 operator (operatorID)on delete restrict on update cascade);
create table operator_has_gadgets(operatorID int not null, gadgetID int not null, primary key(operatorID, gadgetID), foreign key(operatorID) references operator(operatorID) on delete restrict on update cascade);
create table loadout_has_gadgets(loadoutID int not null, gadgetID int not null, primary key(loadoutID, gadgetID), foreign key(loadoutID) references loadout(loadoutID) on delete restrict on update cascade, foreign key(gadgetID)
 references gadgets(gadgetID) on delete restrict on update cascade);
show tables;



alter table maps rename column mapsID to mapID;




drop table used_in;


-- inserting into table operator
insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(1, 'Ash', 'FBI-SWAT', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(2, 'Thermite', 'FBI-SWAT', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(3, 'Pulse', 'FBI-SWAT', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(4, 'Castle', 'FBI-SWAT', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(5, 'Twitch', 'GIGN', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(6, 'Montagne', 'GIGN', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(7, 'Doc', 'GIGN', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(8, 'Rook', 'GIGN', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(9, 'Blitz', 'GSG9', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(10, 'Bandit', 'GSG9', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(11, 'Jager', 'GSG9', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(12, 'IQ', 'GSG9', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(13, 'Sledge', 'SAS', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(14, 'Thatcher', 'SAS', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(15, 'Mute', 'SAS', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(16, 'Smoke', 'SAS', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(17, 'Glaz', 'SPETSNAZ', 'Attacker');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(18, 'Kapkan', 'SPETSNAZ', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(19, 'Tachanka', 'SPETSNAZ', 'Defender');

insert into operator(operatorID, operatorName, operatorOrg, operatorRole)
values(20, 'Fuze', 'SPETSNAZ', 'Attacker');
 
 -- inserting into table primaryWeapon
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(21, 'R4-C', 'Assault Rifle', 860, 39, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(22, '556xi', 'Assault Rifle', 690, 46, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(23, 'UMP45', 'SubMachine Gun', 600, 38, 25);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(24, 'M1014', 'Shotgun', 1, 34, 8);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(25, 'F2', 'Assault Rifle', 980, 37, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(26, 'Extendable shield', 'null', null, null, null);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(27, 'MP5', 'SubMachine Gun', 800, 27, 30);
 
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(29, 'AK12', 'Assault Rifle', 850, 45, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(30, 'AUG A2', 'Assault Rifle', 720, 42, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(31, '416-C Carbine', 'Assault Rifle', 740, 43, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(32, 'OTs-03', 'Marksman Rifle', 1, 76, 10);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(33, 'MP5K', 'SubMachine Gun', 800, 30, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(34, 'AR33', 'Assault Rifle', 749, 41, 25);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(35, 'L85A2', 'Assault Rifle', 670, 47, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(37, 'Flash Shield', 'null', null, null, null);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(38, 'MP7', 'SubMachine Gun', 900, 32, 30);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(39, 'SASG-12', 'ShotGun', 1, 50, 10);
 
 insert into primaryWeapon(pwID, pwName, pwType, pwFirerate, pwDamage, pwCapacity)
 values(40, '9x19VSN', 'SubMachine Gun', 750, 34, 30);

-- inserting into operator_has_pW
insert into operator_has_pW(operatorID, pwID)
values(1,21);

insert into operator_has_pW(operatorID, pwID)
values(2,22);

insert into operator_has_pW(operatorID, pwID)
values(3,23);

insert into operator_has_pW(operatorID, pwID)
values(4,24);

insert into operator_has_pW(operatorID, pwID)
values(5,25);

insert into operator_has_pW(operatorID, pwID)
values(6,26);

insert into operator_has_pW(operatorID, pwID)
values(7,27);

insert into operator_has_pW(operatorID, pwID)
values(8,28);

insert into operator_has_pW(operatorID, pwID)
values(9,37);

insert into operator_has_pW(operatorID, pwID)
values(10,38);

insert into operator_has_pW(operatorID, pwID)
values(11,31);

insert into operator_has_pW(operatorID, pwID)
values(12,30);

insert into operator_has_pW(operatorID, pwID)
values(13,35);

insert into operator_has_pW(operatorID, pwID)
values(14,34);

insert into operator_has_pW(operatorID, pwID)
values(15,33);

 insert into operator_has_pW(operatorID, pwID)
values(16,33);

insert into operator_has_pW(operatorID, pwID)
values(17,32);

insert into operator_has_pW(operatorID, pwID)
values(18,40);

insert into operator_has_pW(operatorID, pwID)
values(19,39);

insert into operator_has_pW(operatorID, pwID)
values(20,29);

-- inserting into maps
alter table maps modify mapDescription varchar(200);

 insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(81, 'Bank', 'Los Angeles, California', "Team Rainbow has been called to raid a major bank. The focus is on providing a sense of progression for attackers as they make their way through progressively more fortified areas of the building");

alter table maps modify mapDescription varchar(400);

 insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(82, 'Border', 'Marrakech, Morrocco', "Team Rainbow has been called in to assist the local law enforcement and regain control of the border. A mix of old and new buildings with open air pathways make this the most destructible and open planned map to date.");

insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(83, 'Chalet', 'Courchlevel, France',"A shootout in an “après-ski” chalet in the French alps. This area contrasts the warm, cozy mood of its interiors with the cold, constrained visibility of its exteriors.");

insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(84, 'Clubhouse', 'Hanover, Germany', "This map depicts an assault on a biker gang clubhouse. Featuring a full bar, gaming tables and leather furniture, this mixed interior/exterior layout offers a host of interesting tactical possibilities for both attacker and defender.");
 
insert into maps(mapID, mapName, mapLocation, mapDescription)
values(85, 'Coastline', 'Ibiza, SPain', "Team Rainbow has been called to safeguard the seashore of Ibiza, Spain. Stationed on Ibiza’s rocky shore, course through Balearic ruins and navigate booming bars to neutralize the threat. Get ready for a surround flow of combat laced with chaotic rushes as you explore a paradise gone wrong.");
 
 insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(86, 'Consulate', 'Abidjan, Ivory Coast', "A high-risk, highly secured fortified location, this map depicts an assault on a French consulate in Ivory Coast.");
 
 insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(87, 'Kafe Dostoyevsky', 'Moscow, RUssia', "This high-class café in central Moscow is the pinnacle of glitz and glamour, and is a natural intervention ground for Spetsnaz forces. Destruction of the rich, chic, classic decor will be a key element of this map.");
 
insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(88, 'Kanal', 'Hamburg, Germany', "Taking place in the industrial area of Hamburg, Germany, ‘Kanal’ involves multiple buildings with strategic connecting points over canals. It features many interesting strategic possibilities created by the many bridges, buildings and related vantage points of its terrain.");

insert into maps(mapID, mapName, mapLocation, mapDescription)
 values(89, 'Oregon', 'Redmond, Oregon', "Oregon depicts an assault on a fortified survivalist compound. It feels rustic, eclectic and lived-in, and covers a vast, spread out layout requiring adapted tactics to sweep and hold effectively.");

-- inserting into table used_in

insert into used_in(operatorID, mapID)
values(1,82);

insert into used_in(operatorID, mapID)
values(2,86);

insert into used_in(operatorID, mapID)
values(3,88);

insert into used_in(operatorID, mapID)
values(4,89);

insert into used_in(operatorID, mapID)
values(5,83);

insert into used_in(operatorID, mapID)
values(6,85);

insert into used_in(operatorID, mapID)
values(7,82);

insert into used_in(operatorID, mapID)
values(8,82);

insert into used_in(operatorID, mapID)
values(9,89);

insert into used_in(operatorID, mapID)
values(10,88);

insert into used_in(operatorID, mapID)
values(11,84);

insert into used_in(operatorID, mapID)
values(12,89);

insert into used_in(operatorID, mapID)
values(13,82);

insert into used_in(operatorID, mapID)
values(14,88);

insert into used_in(operatorID, mapID)
values(15,81);

insert into used_in(operatorID, mapID)
values(16,83);

insert into used_in(operatorID, mapID)
values(17,87);

insert into used_in(operatorID, mapID)
values(18,81);

insert into used_in(operatorID, mapID)
values(19,84);

insert into used_in(operatorID, mapID)
values(20,82);

-- inserting into secondaryWeapon
insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(41, 'P226 MK 25', 'Handgun', 1, 50, 15);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(42, 'P9', 'Handgun', 1, 45, 16);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(43, 'SMG-11', 'Machine Pistol', 1270, 35, 16);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(44, 'LFP586', 'Handgun', 1, 78, 6);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(45, 'M45 MEUSOC', 'Handgun', 1, 58, 7);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(46, 'PMM', 'Handgun', 1, 61, 8);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(47, 'P12', 'Handgun', 1, 44, 15);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(48, 'P9', 'Handgun', 1, 45, 16);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(49, 'SMG-11', 'Machine Pistol', 1270, 35, 16);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(50, '5.7 USG', 'Handgun', 1, 42, 20);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(51, 'P12', 'Handgun', 1, 44, 15);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(52, 'LFP586', 'Handgun', 1, 45, 16);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(53, 'P226 MK 25', 'Handgun', 1, 50, 15);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(54, '5.7 USG', 'Handgun', 1, 42, 20);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(55, 'GSH-18', 'Handgun', 1, 61, 18);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(56, 'P12', 'Handgun', 1, 44, 15);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(57, 'M45 MEUSOC', 'Handgun', 1, 58, 7);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(58, 'PMM', 'Handgun', 1, 61, 18);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(59, 'P12', 'Handgun', 1, 44, 15);
 
 insert into secondaryWeapon(swID, swName, swType, swFirerate, swDamage, swCapacity)
 values(60, 'GSH-18', 'Handgun', 1, 61, 18);
 
 
 -- inserting into operator_has_sW

insert into operator_has_sW(operatorID, swID)
values(1, 45);

insert into operator_has_sW(operatorID, swID)
values(2, 45);

insert into operator_has_sW(operatorID, swID)
values(3, 50);

insert into operator_has_sW(operatorID, swID)
values(4, 50);

insert into operator_has_sW(operatorID, swID)
values(5, 42);

insert into operator_has_sW(operatorID, swID)
values(6, 44);

insert into operator_has_sW(operatorID, swID)
values(7, 42);

insert into operator_has_sW(operatorID, swID)
values(8, 44);

insert into operator_has_sW(operatorID, swID)
values(9, 47);

insert into operator_has_sW(operatorID, swID)
values(10, 47);

insert into operator_has_sW(operatorID, swID)
values(11, 47);

insert into operator_has_sW(operatorID, swID)
values(12, 47);

insert into operator_has_sW(operatorID, swID)
values(13, 43);

insert into operator_has_sW(operatorID, swID)
values(14, 41);

insert into operator_has_sW(operatorID, swID)
values(15, 41);

insert into operator_has_sW(operatorID, swID)
values(16, 43);

insert into operator_has_sW(operatorID, swID)
values(17, 55);

insert into operator_has_sW(operatorID, swID)
values(18, 46);

insert into operator_has_sW(operatorID, swID)
values(19, 46);

insert into operator_has_sW(operatorID, swID)
values(20, 55);

-- inserting into gadgets
insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(61, 'Barbed Wire', 'Area Securing', 'Defensive');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(62, 'Nitro Cell', 'Explosive', 'Defensive');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(63, 'Breach Charge', 'Area Breaching', 'Attacking');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(64, 'Smoke Grenade', 'Area Denial', 'Attacking');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(65, 'Claymore', 'Trap', 'Attacking');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(66, 'Deployable Shield', 'Area Securing', 'Defensive');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(67, 'Impact Grenade', 'Explosive', 'Defensive');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(68, 'Frag Grenade', 'Area Breaching', 'Attacking');

insert into gadgets(gadgetID, gadgetName, gadgetType, gadgetRole)
values(69, 'Stun Grenade', 'Area Denial', 'Attacking');

-- inserting into operator_has_gadgets

insert into operator_has_gadgets(operatorID, gadgetID)
values(1, 63);

insert into operator_has_gadgets(operatorID, gadgetID)
values(2, 69);

insert into operator_has_gadgets(operatorID, gadgetID)
values(3, 62);

insert into operator_has_gadgets(operatorID, gadgetID)
values(4, 67);

insert into operator_has_gadgets(operatorID, gadgetID)
values(5, 65);

insert into operator_has_gadgets(operatorID, gadgetID)
values(6, 69);

insert into operator_has_gadgets(operatorID, gadgetID)
values(7, 61);

insert into operator_has_gadgets(operatorID, gadgetID)
values(8, 67);

insert into operator_has_gadgets(operatorID, gadgetID)
values(9, 69);

insert into operator_has_gadgets(operatorID, gadgetID)
values(10, 62);

insert into operator_has_gadgets(operatorID, gadgetID)
values(11, 66);

insert into operator_has_gadgets(operatorID, gadgetID)
values(12, 68);

insert into operator_has_gadgets(operatorID, gadgetID)
values(13, 68);

insert into operator_has_gadgets(operatorID, gadgetID)
values(14, 63);

insert into operator_has_gadgets(operatorID, gadgetID)
values(15, 62);

insert into operator_has_gadgets(operatorID, gadgetID)
values(16, 66);

insert into operator_has_gadgets(operatorID, gadgetID)
values(17, 64);

insert into operator_has_gadgets(operatorID, gadgetID)
values(18, 62);

insert into operator_has_gadgets(operatorID, gadgetID)
values(19, 66);

insert into operator_has_gadgets(operatorID, gadgetID)
values(20, 63);


-- inserting into specialAbility

 insert into specialAbility(abilityID, operatorID, abilityName)
 values(101, 1, 'Breaching round');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(102, 2, 'Exothermic charges');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(103, 3, 'Cardiac Sensor');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(104, 4, 'Armored Panels');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(105, 5, 'Shock Drone');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(106, 6, 'Extendable Bulletproof Shield');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(107, 7, 'Stim Pistol');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(108, 8, 'Armor Pack');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(109, 9, 'Bulletproof Flash Shield');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(110, 10, 'Shock Wires');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(111, 11, 'Active Defense System');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(112, 12, 'Electronics Detector');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(113, 13, 'SledgeHammer');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(114, 14, 'Electro Magnetic Pulse Grenade');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(115, 15, 'Signal Disruptor');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(116, 16, 'Remote Gas Grenade');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(117, 17, 'Flip Sight');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(118, 18, 'Entry Denial Device');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(119, 19, 'Mounted LMG');
 
 insert into specialAbility(abilityID, operatorID, abilityName)
 values(120, 20, 'Cluster Charge');
 
 
 -- inserting into loadout
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1001, 1, 21, 45, 101);
 select * from loadout;
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1002, 2, 22, 45, 102);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1003, 3, 23, 50, 103);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1004, 4, 24, 50, 104);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1005, 5, 25, 42, 105);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1006, 6, 26, 44, 106);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1007, 7, 27, 42, 107);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1008, 8, 27, 44, 108);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1009, 9, 37, 47, 109);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1010, 10, 38, 47, 110);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1011, 11, 31, 47, 111);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1012, 12, 30, 47, 112);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1013, 13, 35, 43, 113);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1014, 14, 23, 41, 114);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1015, 15, 33, 41, 115);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1016, 16, 28, 43, 116);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1017, 17, 32, 55, 117);
 select * from loadout;
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1018, 18, 40, 46, 118);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1019, 19, 39, 46, 101);
 
 insert into loadout (loadoutID,operatorID, pwID, swID, abilityID)
 values (1020, 20, 29, 55, 120);
 
 -- inserting into loadout_has_gadgets
 
insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1001, 63);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1002, 69);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1003, 62);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1004, 67);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1005, 65);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1006, 69);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1007, 61);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1008, 67);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1009, 69);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1010, 62);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1011, 66);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1012, 68);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1013, 68);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1014, 63);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1015, 62);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1016, 66);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1017, 64);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1018, 62);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1019, 66);

insert into loadout_has_gadgets(loadoutID, gadgetID)
values(1020, 63);

create view OperatorLoadoutView as
select
    o.operatorName as Operator,
    o.operatorOrg as Organization,
    o.operatorRole as Role,
    pw.pwName as PrimaryWeapon,
    pw.pwType as PrimaryWeaponType,
    sw.swName as SecondaryWeapon,
    sw.swType as SecondaryWeaponType,
    a.abilityName as SpecialAbility
from
    loadout l
inner join operator o on l.operatorID = o.operatorID
inner join primaryWeapon pw on l.pwID = pw.pwID
inner join secondaryWeapon sw on l.swID = sw.swID
inner join specialAbility a on l.abilityID = a.abilityID;

create view pwComparison as 
select 
	pw1.pwName as weapon1,
    pw2.pwName as weapon2,
    case
		when pw1.pwFirerate is null and  pw2.pwFirerate is null then ' these are shields, not guns! '
        when pw1.pwFirerate is null then concat(pw1.pwName, ' is not a weapon and hence cannot be compared ')
        when pw2.pwFirerate is null then concat(pw2.pwName, ' is not a weapon and hence cannot be compared ')
		when pw1.pwFirerate > pw2.pwFirerate then concat(pw1.pwName, ' has a higher ROF than ', pw2.pwName)
        when pw2.pwFirerate > pw2.pwFirerate then concat(pw2.pwName, ' has a higher ROF than ', pw1.pwName)
        else 
        'both weapons have the same ROF'
	end as FirerateComparison,
	case
		when pw1.pwDamage is null and  pw2.pwDamage is null then ' these are shields, not guns! '
        when pw1.pwDamage is null then concat(pw1.pwName, ' is not a weapon and hence cannot be compared ')
        when pw2.pwDamage is null then concat(pw2.pwName, ' is not a weapon and hence cannot be compared ')
		when pw1.pwDamage > pw2.pwDamage then concat(pw1.pwName, ' has a higher damage than ', pw2.pwName)
		when pw2.pwDamage > pw1.pwDamage then concat(pw2.pwName, ' has a higher damage than ', pw1.pwName)
		else 
		'both weapons have the same damage'
	end as DamageComparison,
    case
		when pw1.pwCapacity is null and  pw2.pwCapacity is null then ' these are shields, not guns! '
        when pw1.pwCapacity is null then concat(pw1.pwName, ' is not a weapon and hence cannot be compared ')
        when pw2.pwCapacity is null then concat(pw2.pwName, ' is not a weapon and hence cannot be compared ')
		when pw1.pwCapacity > pw2.pwCapacity then concat(pw1.pwName, ' has a higher magazine capacity than ', pw2.pwName)
		when pw2.pwCapacity > pw1.pwCapacity then concat(pw2.pwName, ' has a higher magazine capacity than ', pw1.pwName)
		else 
		'both weapons have the same capacity'
	end as CapacityComparison
from 
	primaryWeapon pw1
inner join primaryWeapon pw2
on pw1.pwID < pw2.pwID; -- this is to ensure that the weapons don't compare themselves with each other

drop view pWComparison;
select * from pWComparison;

drop trigger operators_delete;

alter table operator
add constraint check_role check(operatorRole in ('Attacker', 'Defender'));

create role all_hail_supreme_lord;
grant insert on operator to all_hail_supreme_lord;
grant insert on loadout to all_hail_supreme_lord;

drop role all_hail_supreme_lord;

create role creator;
grant select, insert, update on r6s.* to creator;	

drop role creator;

select * from pwComparison;


DELIMITER //
create trigger delete_operators
after delete on operator
for each row 
begin
	delete from loadout where operatorID = old.operatorID;
    delete from operator_has_pW where operatorID = old.operatorID;
    delete from operator_has_sW where operatorID = old.operatorID;
    delete from operator_has_gadgets where operatorID = old.operatorID;
    delete from used_in where operatorID = old.operatorID;
    delete from specialAbility where operatorID = old.operatorID;
end //
	
DELIMITER //
create trigger valid_gadget
before insert on gadgets
for each row
begin
	declare valid_gadget_type int;
    
    select count(*)
    into valid_gadget_type
    from gadgets
    where gadgetType = new.gadgetType;
    
    if valid_gadget_type = 0
    then
    signal sqlstate '45000'
    set message_text = 'Invalid Gadget type. Please use valid Gadget Type';
    end if;
end
//


	




    
    





            
 
 
























 


