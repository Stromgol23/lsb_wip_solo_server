/*
  `skill_list_name` varchar(40) DEFAULT NULL,
  `skill_list_id` smallint(5) unsigned NOT NULL,
  `mob_skill_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`skill_list_id`,`mob_skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;


case SKILL_HAND_TO_HAND:    skillListId = 23001; break;
case SKILL_DAGGER:          skillListId = 23002; break;
case SKILL_SWORD:           skillListId = 23003; break;
case SKILL_GREAT_SWORD:     skillListId = 23004; break;  
case SKILL_AXE:             skillListId = 23005; break;
case SKILL_GREAT_AXE:       skillListId = 23006; break;
case SKILL_SCYTHE:          skillListId = 23007; break;
case SKILL_POLEARM:         skillListId = 23008; break;
case SKILL_KATANA:          skillListId = 23009; break;
case SKILL_GREAT_KATANA:    skillListId = 23010; break;
case SKILL_CLUB:            skillListId = 23011; break;
case SKILL_STAFF:           skillListId = 23012; break;
case SKILL_ARCHERY:         skillListId = 23013; break;
case SKILL_MARKSMANSHIP:    skillListId = 23014; break;

*/

/* this is not working */

LOCK TABLES `mob_skill_lists` WRITE;

/* h2h */
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,1);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,2);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,3);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,4);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,5);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,6);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,7);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,8);
INSERT INTO `mob_skill_lists` VALUES ('nt_h2h',23001,9);

/* dagger */
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,16);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,17);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,18);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,19);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,20);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,21);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,22);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,23);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,24);
INSERT INTO `mob_skill_lists` VALUES ('nt_dagger',23002,25);

/* sword */
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,32);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,33);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,34);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,35);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,36);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,37);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,38);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,39);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,40);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,41);
INSERT INTO `mob_skill_lists` VALUES ('nt_sword',23003,42);

/* great sword */
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,48);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,49);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,50);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,51);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,52);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,53);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,54);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,55);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatsword',23004,56);

/* axe */
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,64);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,65);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,66);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,67);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,68);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,69);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,70);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,71);
INSERT INTO `mob_skill_lists` VALUES ('nt_axe',23005,72);

/* great axe */
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,80);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,81);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,82);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,83);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,84);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,85);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,86);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,87);
INSERT INTO `mob_skill_lists` VALUES ('nt_greataxe',23006,88);

/* scythe */
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,96);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,97);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,98);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,99);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,100);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,101);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,102);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,103);
INSERT INTO `mob_skill_lists` VALUES ('nt_scythe',23007,104);

/* polearm */
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,112);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,113);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,114);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,115);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,116);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,117);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,118);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,119);
INSERT INTO `mob_skill_lists` VALUES ('nt_polearm',23008,120);

/* katana */
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,128);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,129);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,130);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,131);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,132);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,133);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,134);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,135);
INSERT INTO `mob_skill_lists` VALUES ('nt_katana',23009,136);

/* great katana */
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,144);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,145);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,146);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,147);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,148);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,149);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,150);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,151);
INSERT INTO `mob_skill_lists` VALUES ('nt_greatkatana',23010,152);

/* club */
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,160);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,161);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,162);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,163);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,164);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,165);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,166);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,167);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,168);
INSERT INTO `mob_skill_lists` VALUES ('nt_club',23011,169);

/* staff */
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,176);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,177);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,178);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,179);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,180);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,181);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,182);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,183);
INSERT INTO `mob_skill_lists` VALUES ('nt_staff',23012,184);

/* archery */
INSERT INTO `mob_skill_lists` VALUES ('nt_archery',23013,192);
INSERT INTO `mob_skill_lists` VALUES ('nt_archery',23013,193);
INSERT INTO `mob_skill_lists` VALUES ('nt_archery',23013,194);
INSERT INTO `mob_skill_lists` VALUES ('nt_archery',23013,196); /* missing 195, that's normal apparently */
INSERT INTO `mob_skill_lists` VALUES ('nt_archery',23013,197);
INSERT INTO `mob_skill_lists` VALUES ('nt_archery',23013,198);
INSERT INTO `mob_skill_lists` VALUES ('nt_archery',23013,199);

/* marksmanship */
INSERT INTO `mob_skill_lists` VALUES ('nt_marksmanship',23014,208);
INSERT INTO `mob_skill_lists` VALUES ('nt_marksmanship',23014,209);
INSERT INTO `mob_skill_lists` VALUES ('nt_marksmanship',23014,210);
INSERT INTO `mob_skill_lists` VALUES ('nt_marksmanship',23014,212); /* missing 211, that's normal apparently */
INSERT INTO `mob_skill_lists` VALUES ('nt_marksmanship',23014,213);
INSERT INTO `mob_skill_lists` VALUES ('nt_marksmanship',23014,214);
INSERT INTO `mob_skill_lists` VALUES ('nt_marksmanship',23014,215);

UNLOCK TABLES;