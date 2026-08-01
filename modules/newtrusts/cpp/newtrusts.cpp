#include "common/timer.h"
#include "common/utils.h"

#include <algorithm>
#include <cmath>
#include <cstring>
#include <vector>

#include "data/enums/ecosystem.h"
#include "map/entities/base_entity.h"
#include "map/utils/battleutils.h"
#include "map/utils/charutils.h"
#include "map/utils/itemutils.h"
#include "map/utils/mobutils.h"
#include "map/utils/moduleutils.h"
#include "map/utils/zoneutils.h"

#include "grades.h"
#include "mob_modifier.h"
#include "mob_spell_list.h"

#include "ai/ai_container.h"
#include "ai/controllers/trust_controller.h"
#include "ai/helpers/gambits_container.h"
#include "map/entities/mob_entity.h"
#include "map/entities/trust_entity.h"
#include "items/item_weapon.h"
#include "mobskill.h"
#include "packets/char_sync.h"
#include "packets/entity_update.h"
#include "status_effect_container.h"
#include "weapon_skill.h"
#include "zone_instance.h"

struct NtTrustData
{
    uint32          trustID{};
    uint32          pool{};
    look_t          look{};      // appearance data
    std::string     name{};      // script name string
    std::string     packet_name{}; // packet name string
    xi::Ecosystem   EcoSystem{};   // ecosystem

    uint8  name_prefix{};
    uint8  modelSize{0};
    float  modelHitboxSize{0.0f};
    uint16 species{};

    uint8 mJob{};
    uint8 sJob{};
    float HPscale{}; // HP boost percentage
    float MPscale{}; // MP boost percentage

    uint8  cmbSkill{};
    uint16 cmbDmgMult{};
    uint16 cmbDelay{};
    uint8  baseSpeed{};
    uint8  animationSpeed{};

    // stat ranks
    uint8 strRank{};
    uint8 dexRank{};
    uint8 vitRank{};
    uint8 agiRank{};
    uint8 intRank{};
    uint8 mndRank{};
    uint8 chrRank{};
    uint8 attRank{};
    uint8 defRank{};
    uint8 evaRank{};
    uint8 accRank{};

    uint16 m_MobSkillList{};

    // magic stuff
    uint16 spellList{};

    // resists
    int16 slash_sdt{};
    int16 pierce_sdt{};
    int16 hth_sdt{};
    int16 impact_sdt{};

    int16 magical_sdt{};

    int16 fire_sdt{};
    int16 ice_sdt{};
    int16 wind_sdt{};
    int16 earth_sdt{};
    int16 thunder_sdt{};
    int16 water_sdt{};
    int16 light_sdt{};
    int16 dark_sdt{};

    int8 fire_res_rank{};
    int8 ice_res_rank{};
    int8 wind_res_rank{};
    int8 earth_res_rank{};
    int8 thunder_res_rank{};
    int8 water_res_rank{};
    int8 light_res_rank{};
    int8 dark_res_rank{};

    int8 paralyze_res_rank{};
    int8 bind_res_rank{};
    int8 silence_res_rank{};
    int8 slow_res_rank{};
    int8 poison_res_rank{};
    int8 light_sleep_res_rank{};
    int8 dark_sleep_res_rank{};
    int8 blind_res_rank{};
};

std::vector<NtTrustData*> g_PntTrustList;

namespace nttrustutils
{
    void BuildTrust(uint32 mobpoolId)
    {
        const auto rset = db::preparedStmt("SELECT "
                                           "mob_pools.poolid, "
                                           "mob_pools.name, "
                                           "mob_pools.packet_name, "
                                           "mob_pools.modelid, "
                                           "mob_pools.speciesid, "
                                           "mob_pools.mJob, "
                                           "mob_pools.sJob, "
                                           "mob_pools.spellList, "
                                           "mob_pools.cmbSkill, "
                                           "mob_pools.cmbDelay, "
                                           "mob_pools.cmbDmgMult, "
                                           "mob_pools.name_prefix, "
                                           "mob_pools.skill_list_id, "
                                           "mob_pools.modelSize, "
                                           "mob_pools.modelHitboxSize, "
                                           "spell_list.spellid, "
                                           "mob_species_system.ecosystemID, "
                                           "(mob_species_system.HP / 100) AS HP, "
                                           "(mob_species_system.MP / 100) AS MP, "
                                           "mob_species_system.speed, "
                                           "mob_species_system.STR, "
                                           "mob_species_system.DEX, "
                                           "mob_species_system.VIT, "
                                           "mob_species_system.AGI, "
                                           "mob_species_system.INT, "
                                           "mob_species_system.MND, "
                                           "mob_species_system.CHR, "
                                           "mob_species_system.DEF, "
                                           "mob_species_system.ATT, "
                                           "mob_species_system.ACC, "
                                           "mob_species_system.EVA, "
                                           "mob_resistances.slash_sdt, mob_resistances.pierce_sdt, "
                                           "mob_resistances.h2h_sdt, mob_resistances.impact_sdt, "
                                           "mob_resistances.magical_sdt, "
                                           "mob_resistances.fire_sdt, mob_resistances.ice_sdt, "
                                           "mob_resistances.wind_sdt, mob_resistances.earth_sdt, "
                                           "mob_resistances.lightning_sdt, mob_resistances.water_sdt, "
                                           "mob_resistances.light_sdt, mob_resistances.dark_sdt, "
                                           "mob_resistances.fire_res_rank, mob_resistances.ice_res_rank, "
                                           "mob_resistances.wind_res_rank, mob_resistances.earth_res_rank, "
                                           "mob_resistances.lightning_res_rank, mob_resistances.water_res_rank, "
                                           "mob_resistances.light_res_rank, mob_resistances.dark_res_rank, "
                                           "mob_resistances.paralyze_res_rank, mob_resistances.bind_res_rank, "
                                           "mob_resistances.silence_res_rank, mob_resistances.slow_res_rank, "
                                           "mob_resistances.poison_res_rank, mob_resistances.light_sleep_res_rank, "
                                           "mob_resistances.dark_sleep_res_rank, mob_resistances.blind_res_rank "
                                           "FROM spell_list, mob_pools, mob_species_system, mob_resistances "
                                           "WHERE spell_list.spellid = ? "
                                           "AND (spell_list.spellid + 5000) = mob_pools.poolid "
                                           "AND mob_pools.resist_id = mob_resistances.resist_id "
                                           "AND mob_pools.speciesid = mob_species_system.speciesID "
                                           "ORDER BY spell_list.spellid",
                                           mobpoolId);

        if (rset && rset->rowsCount())
        {
            while (rset->next())
            {
                NtTrustData* data = new NtTrustData();

                data->trustID = mobpoolId;

                data->pool = rset->get<uint32>("poolid");
                data->name = rset->get<std::string>("name");
                data->packet_name = rset->get<std::string>("packet_name");

                db::extractFromBlob(rset, "modelid", data->look);

                data->species = rset->get<uint16>("speciesid");
                data->mJob      = rset->get<uint8>("mJob");
                data->sJob      = rset->get<uint8>("sJob");
                data->spellList = rset->get<uint16>("spellList");

                data->cmbSkill   = rset->get<uint8>("cmbSkill");
                data->cmbDelay   = rset->get<uint16>("cmbDelay");
                data->cmbDmgMult = rset->get<uint16>("cmbDmgMult");

                data->name_prefix    = rset->get<uint8>("name_prefix");
                data->m_MobSkillList = rset->get<uint16>("skill_list_id");

                data->modelSize       = rset->getOrDefault<uint8>("modelSize", 0);
                data->modelHitboxSize = std::max<float>(0.0f, rset->getOrDefault<float>("modelHitboxSize", 0) / 10.f);
                data->EcoSystem       = rset->get<xi::Ecosystem>("ecosystemID");
                data->HPscale         = rset->get<float>("HP");
                data->MPscale         = rset->get<float>("MP");

                data->baseSpeed      = 62;
                data->animationSpeed = 50;

                data->strRank = rset->get<uint8>("STR");
                data->dexRank = rset->get<uint8>("DEX");
                data->vitRank = rset->get<uint8>("VIT");
                data->agiRank = rset->get<uint8>("AGI");
                data->intRank = rset->get<uint8>("INT");
                data->mndRank = rset->get<uint8>("MND");
                data->chrRank = rset->get<uint8>("CHR");
                data->defRank = rset->get<uint8>("DEF");
                data->attRank = rset->get<uint8>("ATT");
                data->accRank = rset->get<uint8>("ACC");
                data->evaRank = rset->get<uint8>("EVA");

                // resistances
                data->slash_sdt  = rset->get<int16>("slash_sdt");
                data->pierce_sdt = rset->get<int16>("pierce_sdt");
                data->hth_sdt    = rset->get<int16>("h2h_sdt");
                data->impact_sdt = rset->get<int16>("impact_sdt");

                data->magical_sdt = rset->get<int16>("magical_sdt"); // Modifier 389, base 10000 stored as signed integer. Positives signify less damage.

                data->fire_sdt    = rset->get<int16>("fire_sdt");      // Modifier 54, base 10000 stored as signed integer. Positives signify less damage.
                data->ice_sdt     = rset->get<int16>("ice_sdt");       // Modifier 55, base 10000 stored as signed integer. Positives signify less damage.
                data->wind_sdt    = rset->get<int16>("wind_sdt");      // Modifier 56, base 10000 stored as signed integer. Positives signify less damage.
                data->earth_sdt   = rset->get<int16>("earth_sdt");     // Modifier 57, base 10000 stored as signed integer. Positives signify less damage.
                data->thunder_sdt = rset->get<int16>("lightning_sdt"); // Modifier 58, base 10000 stored as signed integer. Positives signify less damage.
                data->water_sdt   = rset->get<int16>("water_sdt");     // Modifier 59, base 10000 stored as signed integer. Positives signify less damage.
                data->light_sdt   = rset->get<int16>("light_sdt");     // Modifier 60, base 10000 stored as signed integer. Positives signify less damage.
                data->dark_sdt    = rset->get<int16>("dark_sdt");      // Modifier 61, base 10000 stored as signed integer. Positives signify less damage.

                data->fire_res_rank    = rset->get<int8>("fire_res_rank");
                data->ice_res_rank     = rset->get<int8>("ice_res_rank");
                data->wind_res_rank    = rset->get<int8>("wind_res_rank");
                data->earth_res_rank   = rset->get<int8>("earth_res_rank");
                data->thunder_res_rank = rset->get<int8>("lightning_res_rank");
                data->water_res_rank   = rset->get<int8>("water_res_rank");
                data->light_res_rank   = rset->get<int8>("light_res_rank");
                data->dark_res_rank    = rset->get<int8>("dark_res_rank");

                data->paralyze_res_rank    = rset->get<int8>("paralyze_res_rank");
                data->bind_res_rank        = rset->get<int8>("bind_res_rank");
                data->silence_res_rank     = rset->get<int8>("silence_res_rank");
                data->slow_res_rank        = rset->get<int8>("slow_res_rank");
                data->poison_res_rank      = rset->get<int8>("poison_res_rank");
                data->light_sleep_res_rank = rset->get<int8>("light_sleep_res_rank");
                data->dark_sleep_res_rank  = rset->get<int8>("dark_sleep_res_rank");
                data->blind_res_rank       = rset->get<int8>("blind_res_rank");

                g_PntTrustList.emplace_back(data);
            }
        }
    }

    void FreeTrustList()
    {
        g_PntTrustList.clear();
    }

    void LoadTrustList()
    {
        FreeTrustList();

        const auto rset = db::preparedStmt( "SELECT"
                                            "mob_pools.poolid"
                                            "FROM mob_pools"
                                            "WHERE mob_pools.poolid >= 23000 AND mob_pools.poolid < 23100 ORDER BY mob_pools.poolid");

        std::list<uint32> trustIdList;
        if (rset && rset->rowsCount())
        {
            while (rset->next())
            {
                uint32 id = rset->get<uint32>("poolid");
                trustIdList.emplace_back(id);
            }
        }

        for (auto& trust : trustIdList)
        {
            BuildTrust(trust);
        }
    }

    void LoadTrustStatsAndSkills(CTrustEntity* PTrust)
    {
        // add mob pool mods ahead of applying stats
        mobutils::AddSqlModifiers(PTrust);

        JOBTYPE mJob = PTrust->GetMJob();
        JOBTYPE sJob = PTrust->GetSJob();
        uint8   mLvl = PTrust->GetMLevel();
        uint8   sLvl = PTrust->GetSLevel();

        // Helpers to map HP/MPScale around 100 to 1-7 grades
        // std::clamp doesn't play nice with uint8, so -> unsigned int
        auto mapRanges = [](unsigned int inputStart, unsigned int inputEnd, unsigned int outputStart, unsigned int outputEnd,
                            unsigned int inputVal) -> unsigned int {
            unsigned int inputRange  = inputEnd - inputStart;
            unsigned int outputRange = outputEnd - outputStart;

            unsigned int output = (inputVal - inputStart) * outputRange / inputRange + outputStart;

            return std::clamp(output, outputStart, outputEnd);
        };

        auto scaleToGrade = [mapRanges](float input) -> unsigned int {
            unsigned int multipliedInput    = static_cast<unsigned int>(input * 100U);
            unsigned int reverseMappedGrade = mapRanges(70U, 140U, 1U, 7U, multipliedInput);
            unsigned int outputGrade        = std::clamp(7U - reverseMappedGrade, 1U, 7U);
            return outputGrade;
        };

        // HP/MP ========================
        // This is the same system as used in charutils.cpp, but modified
        // to use parts from mob_family_system instead of hardcoded player
        // race tables.

        // http://ffxi-stat-calc.sourceforge.net/cgi-bin/ffxistats.cgi?mode=document

        uint8 race = 0; // Hume
        switch (PTrust->look.race)
        {
            case 3:
            case 4:
                race = 1;
                break; // Elvaan
            case 5:
            case 6:
                race = 2;
                break; // Tarutaru
            case 7:
                race = 3;
                break; // Mithra
            case 8:
                race = 4;
                break; // Galka
        }

        // HP
        float raceStat  = 0;
        float jobStat   = 0;
        float sJobStat  = 0;
        int32 bonusStat = 0;

        int32 baseValueColumn   = 0;
        int32 scaleTo60Column   = 1;
        int32 scaleOver30Column = 2;
        int32 scaleOver60Column = 3;
        int32 scaleOver75Column = 4;
        int32 scaleOver60       = 2;
        int32 scaleOver75       = 3;

        uint8 grade = 0;

        int32 mainLevelOver30     = std::clamp(mLvl - 30, 0, 30);
        int32 mainLevelUpTo60     = (mLvl < 60 ? mLvl - 1 : 59);
        int32 mainLevelOver60To75 = std::clamp(mLvl - 60, 0, 15);
        int32 mainLevelOver75     = (mLvl < 75 ? 0 : mLvl - 75);

        int32 mainLevelOver10           = (mLvl < 10 ? 0 : mLvl - 10);
        int32 mainLevelOver50andUnder60 = std::clamp(mLvl - 50, 0, 10);
        int32 mainLevelOver60           = (mLvl < 60 ? 0 : mLvl - 60);

        int32 subLevelOver10 = std::clamp(sLvl - 10, 0, 20);
        int32 subLevelOver30 = (sLvl < 30 ? 0 : sLvl - 30);

        grade = grade::GetRaceGrades(race, 0);

        raceStat = grade::GetHPScale(grade, baseValueColumn) + (grade::GetHPScale(grade, scaleTo60Column) * mainLevelUpTo60) +
                   (grade::GetHPScale(grade, scaleOver30Column) * mainLevelOver30) + (grade::GetHPScale(grade, scaleOver60Column) * mainLevelOver60To75) +
                   (grade::GetHPScale(grade, scaleOver75Column) * mainLevelOver75);

        // Calculation on Main Job
        grade = grade::GetJobGrade(mJob, 0);

        jobStat = grade::GetHPScale(grade, baseValueColumn) + (grade::GetHPScale(grade, scaleTo60Column) * mainLevelUpTo60) +
                  (grade::GetHPScale(grade, scaleOver30Column) * mainLevelOver30) + (grade::GetHPScale(grade, scaleOver60Column) * mainLevelOver60To75) +
                  (grade::GetHPScale(grade, scaleOver75Column) * mainLevelOver75);

        // Calculation of bonus HP.
        bonusStat = (mainLevelOver10 + mainLevelOver50andUnder60) * 2;

        // Calculation on Support Job
        if (sLvl > 0)
        {
            grade = grade::GetJobGrade(sJob, 0);

            sJobStat = grade::GetHPScale(grade, baseValueColumn) + (grade::GetHPScale(grade, scaleTo60Column) * (sLvl - 1)) +
                       (grade::GetHPScale(grade, scaleOver30Column) * subLevelOver30) + subLevelOver30 + subLevelOver10;
            sJobStat = sJobStat / 2;
        }

        PTrust->health.maxhp = (int16)(settings::get<float>("map.ALTER_EGO_HP_MULTIPLIER") * (raceStat + jobStat + bonusStat + sJobStat));

        // The beginning of the MP

        raceStat = 0;
        jobStat  = 0;
        sJobStat = 0;

        // Calculation of the MP race.
        grade = grade::GetRaceGrades(race, 1);

        // If Main Job has no MP rating, we calculate a racial bonus based on the level of the subjob level (provided that he has a MP rating)
        if (grade::GetJobGrade(mJob, 1) == 0)
        {
            if (grade::GetJobGrade(sJob, 1) != 0 && sLvl > 0) // TODO: In this expression, an error
            {
                raceStat =
                    (grade::GetMPScale(grade, 0) + grade::GetMPScale(grade, scaleTo60Column) * (sLvl - 1)) / settings::get<float>("map.SJ_MP_DIVISOR"); // TODO: Here is a mistake
            }
        }
        else
        {
            // Calculation of a normal racial bonus
            raceStat = grade::GetMPScale(grade, 0) + grade::GetMPScale(grade, scaleTo60Column) * mainLevelUpTo60 +
                       grade::GetMPScale(grade, scaleOver60) * mainLevelOver60;
        }

        // Main Job
        grade = grade::GetJobGrade(mJob, 1);
        if (grade > 0)
        {
            jobStat = grade::GetMPScale(grade, 0) + grade::GetMPScale(grade, scaleTo60Column) * mainLevelUpTo60 +
                      grade::GetMPScale(grade, scaleOver60) * mainLevelOver60;
        }

        // Subjob
        if (sLvl > 0)
        {
            grade    = grade::GetJobGrade(sJob, 1);
            sJobStat = (grade::GetMPScale(grade, 0) + grade::GetMPScale(grade, scaleTo60Column) * (sLvl - 1)) / settings::get<float>("map.SJ_MP_DIVISOR");
        }

        PTrust->health.maxmp = (int16)(settings::get<float>("map.ALTER_EGO_MP_MULTIPLIER") * (raceStat + jobStat + sJobStat)); // MP calculation result

        // Start calculating Stats

        uint16 stats[7];
        uint8  i = 0;
        for (uint8 StatIndex = 2; StatIndex <= 8; ++StatIndex, ++i)
        {
            // Calculation of race
            grade    = grade::GetRaceGrades(race, StatIndex);
            raceStat = grade::GetStatScale(grade, 0) + grade::GetStatScale(grade, scaleTo60Column) * mainLevelUpTo60;

            if (mainLevelOver60 > 0)
            {
                raceStat += grade::GetStatScale(grade, scaleOver60) * mainLevelOver60;

                if (mainLevelOver75 > 0)
                {
                    raceStat += grade::GetStatScale(grade, scaleOver75) * mainLevelOver75 - (mLvl >= 75 ? 0.01f : 0);
                }
            }

            // Calculation by profession
            grade   = grade::GetJobGrade(mJob, StatIndex);
            jobStat = grade::GetStatScale(grade, 0) + grade::GetStatScale(grade, scaleTo60Column) * mainLevelUpTo60;

            if (mainLevelOver60 > 0)
            {
                jobStat += grade::GetStatScale(grade, scaleOver60) * mainLevelOver60;

                if (mainLevelOver75 > 0)
                {
                    jobStat += grade::GetStatScale(grade, scaleOver75) * mainLevelOver75 - (mLvl >= 75 ? 0.01f : 0);
                }
            }

            // Calculation for an additional profession
            if (sLvl > 0)
            {
                grade    = grade::GetJobGrade(sJob, StatIndex);
                sJobStat = (grade::GetStatScale(grade, 0) + grade::GetStatScale(grade, scaleTo60Column) * (sLvl - 1)) / 2;
            }
            else
            {
                sJobStat = 0;
            }

            // Value output
            stats[i] = (uint16)(settings::get<float>("map.ALTER_EGO_STAT_MULTIPLIER") * (raceStat + jobStat + sJobStat));
        }      

        PTrust->health.tp = 0;
        PTrust->UpdateHealth();
        PTrust->health.hp = PTrust->GetMaxHP();
        PTrust->health.mp = PTrust->GetMaxMP();

        PTrust->stats.STR = stats[0];
        PTrust->stats.DEX = stats[1];
        PTrust->stats.VIT = stats[2];
        PTrust->stats.AGI = stats[3];
        PTrust->stats.INT = stats[4];
        PTrust->stats.MND = stats[5];
        PTrust->stats.CHR = stats[6];

        // Skills =======================
        for (int i = static_cast<int>(xi::SkillType::Archery); i <= static_cast<int>(xi::SkillType::Handbell); i++)
        {
            uint16 maxMSkill = battleutils::GetMaxSkill((xi::SkillType)i, mJob, mLvl > 99 ? 99 : mLvl);
            uint16 maxSSkill = battleutils::GetMaxSkill((xi::SkillType)i, sJob, sLvl > 99 ? 99 : sLvl);

            uint16 maxSkill = std::max(maxMSkill, maxSSkill);

            if (maxSkill != 0)
            {
                PTrust->WorkingSkills.skill[i] = static_cast<uint16>(maxSkill * settings::get<float>("map.ALTER_EGO_SKILL_MULTIPLIER"));
            }
            
        }

        for (int i = static_cast<int>(xi::SkillType::HandToHand); i <= static_cast<int>(xi::SkillType::Staff); i++)
        {
            uint16 maxMSkill = battleutils::GetMaxSkill((xi::SkillType)i, mJob, mLvl > 99 ? 99 : mLvl);
            uint16 maxSSkill = battleutils::GetMaxSkill((xi::SkillType)i, sJob, sLvl > 99 ? 99 : sLvl);

            uint16 maxSkill = std::max(maxMSkill, maxSSkill);

            if (maxSkill != 0)
            {
                PTrust->WorkingSkills.skill[i] = static_cast<uint16>(maxSkill * settings::get<float>("map.ALTER_EGO_SKILL_MULTIPLIER"));
            }
        }

        /*PTrust->addModifier(Mod::DEF, mobutils::GetBase(PTrust, PTrust->defRank));
        PTrust->addModifier(Mod::EVA, mobutils::GetBase(PTrust, PTrust->evaRank));
        PTrust->addModifier(Mod::ATT, mobutils::GetBase(PTrust, PTrust->attRank));
        PTrust->addModifier(Mod::ACC, mobutils::GetBase(PTrust, PTrust->accRank));

        PTrust->addModifier(Mod::RATT, mobutils::GetBase(PTrust, PTrust->attRank));
        PTrust->addModifier(Mod::RACC, mobutils::GetBase(PTrust, PTrust->accRank));*/

        // Natural magic evasion
        PTrust->m_magicEvasion = battleutils::GetMaxSkill(12, mLvl); // Player MEVA is Rank G
        PTrust->addModifier(Mod::MEVA, PTrust->m_magicEvasion);

        // Add traits for sub and main
        battleutils::AddTraits(PTrust, traits::GetTraits(mJob), mLvl);
        battleutils::AddTraits(PTrust, traits::GetTraits(sJob), sLvl);

        mobutils::SetupJob(PTrust);

        // Skills
        using namespace gambits;
        auto* controller = dynamic_cast<CTrustController*>(PTrust->PAI->GetController());

        if (!controller)
        {
            ShowWarning("trustutils::LoadTrustStatsAndSkills() - Trust Controller was null.");
            return;
        }

        uint32 skillListId = 0;
        uint32 weaponSlot  = PTrust->GetMJob() == JOB_RNG || PTrust->GetMJob() == JOB_COR ? SLOT_RANGED : SLOT_MAIN;
        auto*  mainWeapon  = dynamic_cast<CItemWeapon*>(PTrust->m_Weapons[weaponSlot]);
        if (mainWeapon != nullptr)
        {
            // clang-format off
            switch (mainWeapon->getSkillType())
            {
                case xi::SkillType::HandToHand:    skillListId = 23001; break;
                case xi::SkillType::Dagger:        skillListId = 23002; break;
                case xi::SkillType::Sword:         skillListId = 23003; break;
                case xi::SkillType::GreatSword:    skillListId = 23004; break;  
                case xi::SkillType::Axe:           skillListId = 23005; break;
                case xi::SkillType::GreatAxe:      skillListId = 23006; break;
                case xi::SkillType::Scythe:        skillListId = 23007; break;
                case xi::SkillType::Polearm:       skillListId = 23008; break;
                case xi::SkillType::Katana:        skillListId = 23009; break;
                case xi::SkillType::GreatKatana:   skillListId = 23010; break;
                case xi::SkillType::Club:          skillListId = 23011; break;
                case xi::SkillType::Staff:         skillListId = 23012; break;
                case xi::SkillType::Archery:       skillListId = 23013; break;
                case xi::SkillType::Marksmanship:  skillListId = 23014; break;
            }
            // clang-format on
        }

        if (skillListId != 0)
        {
            // Default TP selectors
            controller->m_GambitsContainer->tp_trigger = G_TP_TRIGGER::ASAP;
            controller->m_GambitsContainer->tp_select  = G_SELECT::RANDOM;

            auto skillList = battleutils::GetMobSkillList(skillListId);
            for (uint16 skill_id : skillList)
            {
                TrustSkill_t skill;
                if (skill_id <= 255) // Player WSs
                {
                    CWeaponSkill* PWeaponSkill = battleutils::GetWeaponSkill(skill_id);
                    if (!PWeaponSkill)
                    {
                        ShowWarning("LoadTrustStatsAndSkills: Error loading WeaponSkill id %d for trust %s", skill_id, PTrust->name);
                        break;
                    }

                    if (PWeaponSkill->getSkillLevel() > PTrust->GetSkill(static_cast<xi::SkillType>(PWeaponSkill->getType()))) /// DON'T SUBMIT : need a way to apply this or not from data
                    {
                        continue;
                    }

                    if (PWeaponSkill->getJob(PTrust->GetMJob()) == 0 && (PWeaponSkill->mainOnly() || PWeaponSkill->getJob(PTrust->GetSJob()) == 0))
                    {
                        continue;
                    }

                    skill = TrustSkill_t{
                        G_REACTION::WS,
                        skill_id,
                        PWeaponSkill->getPrimarySkillchain(),
                        PWeaponSkill->getSecondarySkillchain(),
                        PWeaponSkill->getTertiarySkillchain(),
                        battleutils::isValidSelfTargetWeaponskill(skill_id) ? TARGET_SELF : TARGET_ENEMY,
                    };
                }
                else // MobSkills
                {
                    CMobSkill* PMobSkill = battleutils::GetMobSkill(skill_id);
                    if (!PMobSkill)
                    {
                        ShowWarning("LoadTrustStatsAndSkills: Error loading MobSkill id %d for trust %s", skill_id, PTrust->name);
                        break;
                    }
                    skill = {
                        G_REACTION::MS,
                        skill_id,
                        PMobSkill->getPrimarySkillchain(),
                        PMobSkill->getSecondarySkillchain(),
                        PMobSkill->getTertiarySkillchain(),
                        static_cast<TARGETTYPE>(PMobSkill->getValidTargets()),
                    };

                    controller->m_GambitsContainer->tp_skills.emplace_back(skill);
                }

                // Only get access to skills that produce Lv3 SCs after Lv60
                bool canFormLv3Skillchain = skill.primary >= SC_GRAVITATION || skill.secondary >= SC_GRAVITATION || skill.tertiary >= SC_GRAVITATION;

                // Special case for Zeid II and others who only have Lv3+ skills
                bool onlyHasLc3Skillchains = canFormLv3Skillchain && controller->m_GambitsContainer->tp_skills.empty();

                if (!canFormLv3Skillchain || PTrust->GetMLevel() >= 60 || onlyHasLc3Skillchains)
                {
                    controller->m_GambitsContainer->tp_skills.emplace_back(skill);
                }
            }
        }
    }

    void CopyWeapon(CItemWeapon* to, const CItemWeapon* from)
    {
        to->setMaxHit(from->getHitCount());
        to->setSkillType(from->getSkillType());
        to->setDamage(from->getDamage());
        to->setDmgType(from->getDmgType());
        to->setDelay(from->getDelay());
        to->setBaseDelay(from->getBaseDelay());
        to->setDPS(from->getDPS());
        to->setAdditionalEffect(from->getAdditionalEffect());
    }

    CTrustEntity* LoadTrust(CCharEntity* PMaster, uint32 TrustID, uint16 race, std::map<uint32, uint32>& items)
    {
        // clang-format off
        auto* trustData = *std::find_if(g_PntTrustList.begin(), g_PntTrustList.end(), [TrustID](NtTrustData* t)
        {
            return t->trustID == TrustID;
        });
        // clang-format on
        if (trustData == nullptr)
        {
            ShowError(fmt::format("Could not look up trust data for id: {}", TrustID));
            return nullptr;
        }

        auto* PTrust = new CTrustEntity(PMaster, trustData->trustID, IsPassiveTrust{ false });

        PTrust->loc              = PMaster->loc;
        PTrust->m_OwnerID.id     = PMaster->id;
        PTrust->m_OwnerID.targid = PMaster->targid;

        // spawn me randomly around master
        PTrust->loc.p = nearPosition(PMaster->loc.p, CTrustController::SpawnDistance + (PMaster->PTrusts.size() * CTrustController::SpawnDistance), (float)M_PI);
        PTrust->look = trustData->look;
        PTrust->name = trustData->name;

        PTrust->m_Pool         = trustData->pool;
        PTrust->packetName     = trustData->packet_name;
        PTrust->m_name_prefix  = trustData->name_prefix;
        PTrust->m_Species      = trustData->species;
        PTrust->m_MobSkillList = trustData->m_MobSkillList;
        PTrust->HPscale        = trustData->HPscale;
        PTrust->MPscale        = trustData->MPscale;
        PTrust->baseSpeed      = trustData->baseSpeed;
        PTrust->animationSpeed = trustData->animationSpeed;

        PTrust->UpdateSpeed();

        PTrust->status         = xi::Status::Normal;
        PTrust->modelSize       = trustData->modelSize;
        PTrust->modelHitboxSize = trustData->modelHitboxSize;
        PTrust->m_EcoSystem     = trustData->EcoSystem;

        if (race >= 1 && race <= 8)
        {
            PTrust->look.race = race;
            switch (race)
            {
                case 1:
                case 2:
                    PTrust->m_Family = 149;
                    break;
                case 3:
                case 4:
                    PTrust->m_Family = 145;
                    break;
                case 5:
                case 6:
                    PTrust->m_Family = 153;
                    break;
                case 7:
                    PTrust->m_Family = 151;
                    break;
                case 8:
                    PTrust->m_Family = 147;
                    break;
            }
        }

        PTrust->SetMJob(trustData->mJob);
        PTrust->SetSJob(trustData->sJob);

        // assume level matches master
        PTrust->SetMLevel(PMaster->GetMLevel());
        PTrust->SetSLevel(std::floor(PMaster->GetMLevel() / 2));

        // Trust do not really have weapons, but they are modelled internally as
        // if they do.
        bool dualWieldMHValid = false;
        bool isH2H            = false;
        if (auto* mainWeapon = dynamic_cast<CItemWeapon*>(PTrust->m_Weapons[SLOT_MAIN]))
        {
            uint32 itemId = items[SLOT_MAIN];
            if (itemId != 0)
            {
                const CItem*       item   = xi::items::lookup(itemId);
                const CItemWeapon* weapon = dynamic_cast<const CItemWeapon*>(item);
                if (weapon != nullptr)
                {
                    CopyWeapon(mainWeapon, weapon);
                    dualWieldMHValid = true;
                    isH2H            = weapon->getSkillType() == xi::SkillType::HandToHand;
                }
            }
        }

        bool dualWieldOHValid = false;
        if (auto* subWeapon = dynamic_cast<CItemWeapon*>(PTrust->m_Weapons[SLOT_SUB]))
        {
            uint32 itemId = items[SLOT_SUB];
            if (itemId != 0)
            {
                const CItem*       item   = xi::items::lookup(itemId);
                const CItemWeapon* weapon = dynamic_cast<const CItemWeapon*>(item);
                if (weapon != nullptr)
                {
                    CopyWeapon(subWeapon, weapon);
                    dualWieldOHValid = weapon->getSkillType() != xi::SkillType::None;
                }
                else
                {
                    const CItemEquipment* equip = dynamic_cast<const CItemEquipment*>(item);
                    if (equip != nullptr)
                    {
                        subWeapon->setShieldSize(equip->getShieldSize());
                        subWeapon->setShieldAbsorption(equip->getShieldAbsorption());
                    }
                }
            }
        }

        if (auto* rangedWeapon = dynamic_cast<CItemWeapon*>(PTrust->m_Weapons[SLOT_RANGED]))
        {
            uint32 itemId = items[SLOT_RANGED];
            if (itemId != 0)
            {
                const CItem*       item   = xi::items::lookup(itemId);
                const CItemWeapon* weapon = dynamic_cast<const CItemWeapon*>(item);
                if (weapon != nullptr)
                {
                    CopyWeapon(rangedWeapon, weapon);
                }
            }
        }

        if (auto* ammoWeapon = dynamic_cast<CItemWeapon*>(PTrust->m_Weapons[SLOT_AMMO]))
        {
            uint32 itemId = items[SLOT_AMMO];
            if (itemId != 0)
            {
                const CItem*       item   = xi::items::lookup(itemId);
                const CItemWeapon* weapon = dynamic_cast<const CItemWeapon*>(item);
                if (weapon != nullptr)
                {
                    CopyWeapon(ammoWeapon, weapon);
                }
            }
        }

        for (uint8 i = 0; i < 16; ++i)
        {
            uint32 itemId = items[i];
            if (itemId == 0)
                continue;

            const CItem*          item      = xi::items::lookup(itemId);
            const CItemEquipment* equipment = dynamic_cast<const CItemEquipment*>(item);
            if (equipment != nullptr)
            {
                switch (i)
                {
                    case SLOT_MAIN:
                    {
                        PTrust->look.main   = equipment->getModelId();
                        const CItemWeapon* weapon = dynamic_cast<const CItemWeapon*>(item);
                        if (weapon->getSkillType() == xi::SkillType::HandToHand)
                        {
                            PTrust->look.sub = equipment->getModelId() + 0x1000;
                        }

                        break;
                    }
                    case SLOT_SUB:
                        PTrust->look.sub = equipment->getModelId();
                        break;
                    case SLOT_RANGED:
                        PTrust->look.ranged = equipment->getModelId();
                        break;
                    case SLOT_HEAD:
                        PTrust->look.head = equipment->getModelId();
                        break;
                    case SLOT_HANDS:
                        PTrust->look.hands = equipment->getModelId();
                        break;
                    case SLOT_BODY:
                        PTrust->look.body = equipment->getModelId();
                        break;
                    case SLOT_LEGS:
                        PTrust->look.legs = equipment->getModelId();
                        break;
                    case SLOT_FEET:
                        PTrust->look.feet = equipment->getModelId();
                        break;
                }

                PTrust->addModifiers(&equipment->modList);
                PTrust->addPetModifiers(&equipment->petModList);
            }
        }

        LoadTrustStatsAndSkills(PTrust);

        if (isH2H || (dualWieldMHValid && dualWieldOHValid)) // TODO : add check for trait
        {
            PTrust->m_dualWield = true;
        }

        if (auto* spellList = mobSpellList::GetMobSpellList(trustData->spellList);
            spellList != nullptr)
        {
            mobutils::SetSpellList(PTrust, trustData->spellList);
        }

        return PTrust;
    }

    CTrustEntity* SpawnTrust(CCharEntity* PMaster, uint32 TrustID, uint16 race, std::map<uint32, uint32>& items)
    {
        if (PMaster->PParty == nullptr)
        {
            PMaster->PParty = new CParty(PMaster);
        }

        CTrustEntity* PTrust = LoadTrust(PMaster, TrustID, race, items);
        PMaster->PTrusts.insert(PMaster->PTrusts.end(), PTrust);
        PMaster->StatusEffectContainer->CopyConfrontationEffect(PTrust);
        PTrust->setBattleID(PMaster->getBattleID());

        if (PMaster->PBattlefield)
        {
            PTrust->PBattlefield = PMaster->PBattlefield;
        }

        if (PMaster->PInstance)
        {
            PTrust->PInstance = PMaster->PInstance;
        }

        PMaster->loc.zone->InsertTRUST(PTrust);
        PTrust->Spawn();

        PMaster->PParty->ReloadParty();

        return PTrust;
    }

    std::optional<CLuaBaseEntity> spawnNTTrust(CLuaBaseEntity* player, uint16 trustId, uint16 race, std::map<uint32, uint32> items)
    {
        CBaseEntity* playerBase = player->GetBaseEntity();
        if (playerBase->objtype != TYPE_PC)
        {
            ShowWarning("Invalid entity type calling function (%s).", playerBase->getName());
            return std::nullopt;
        }

        return CLuaBaseEntity(SpawnTrust(static_cast<CCharEntity*>(playerBase), trustId, race, items));
    }

    /* auto SenseWeather(CLuaBaseEntity* player) -> sol::table
    {
        CBaseEntity* entity = player->GetBaseEntity();

        // Find the timestamp since the start of vanadiel
        uint32 currentTime = CVanaTime::getInstance()->getVanaTime();
        uint32 WeatherDay = currentTime;

        // Calculate what day we are on since the start of vanadiel time
        // 1 Vana'diel Day = 57 minutes 36 seconds or 3456 seconds
        WeatherDay = WeatherDay / 3456;

        // The weather starts over again every 2160 days
        WeatherDay = WeatherDay % WEATHER_CYCLE;

        zoneWeather_t&& weatherType = zoneWeather_t(0, 0, 0);

        for (auto& weather : entity->loc.zone->m_WeatherVector)
        {
            if (weather.first > WeatherDay)
            {
                break;
            }
            weatherType = weather.second;
        }

        auto w = lua.create_table();

        w["common"] = weatherType.common;
        w["normal"] = weatherType.normal;
        w["rare"] = weatherType.rare;
        uint32 minutes = (entity->loc.zone->GetNextWeatherUpdateTime() - currentTime) / 60;
        w["change"] = minutes;

        return w;
    }

    auto SenseFutureWeather(CLuaBaseEntity* player, uint32 weatherType) -> sol::table
    {
        CBaseEntity* entity = player->GetBaseEntity();

        // Find the timestamp since the start of vanadiel
        uint32 WeatherDay = CVanaTime::getInstance()->getVanaTime();

        // Calculate what day we are on since the start of vanadiel time
        // 1 Vana'diel Day = 57 minutes 36 seconds or 3456 seconds
        WeatherDay = WeatherDay / 3456;

        // The weather starts over again every 2160 days
        WeatherDay = WeatherDay % WEATHER_CYCLE;

        uint16 result[3] = { 3000, 3000, 3000 };

        for (uint16 i=WeatherDay; i < WeatherDay + 30; ++i)
        {
            uint16        index = i % WEATHER_CYCLE;
            auto          weather = entity->loc.zone->m_WeatherVector.find(index);
            if (weather == entity->loc.zone->m_WeatherVector.end())
                continue;

            if (weather->second.normal == weatherType && i < result[0])
            {
                result[0] = i;
            }

            if (weather->second.common == weatherType && i < result[1])
            {
                result[1] = i;
            }

            if (weather->second.rare == weatherType && i < result[2])
            {
                result[2] = i;
            }
        }

        auto w = lua.create_table();

        w["normal"] = result[0] != 3000 ? result[0] - WeatherDay : 3000;
        w["common"] = result[1] != 3000 ? result[1] - WeatherDay : 3000;
        w["rare"]   = result[2] != 3000 ? result[2] - WeatherDay : 3000;

        return w;
    }*/
}; // namespace trustutils


class NewTrustsModule : public CPPModule
{
    void OnInit() override
    {
        TracyZoneScoped;

        ShowInfo("Renamer: Loading new trusts...");

        //SOL_REGISTER("spawnNTTrust", nttrustutils::spawnNTTrust);

        lua.set_function("SpawnNtTrust", &nttrustutils::spawnNTTrust);
        //lua.set_function("SenseWeather", &nttrustutils::SenseWeather);
        //lua.set_function("SenseFutureWeather", &nttrustutils::SenseFutureWeather);

        //LoadNewTrustList();
        nttrustutils::LoadTrustList();
    }

    /*void LoadNewTrustList()
    {
        const char* Query = "SELECT \
                 mob_pools.poolid \
                 FROM mob_pools \
                 WHERE mob_pools.poolid >= 23000 AND mob_pools.poolid < 23100 ORDER BY mob_pools.poolid";

        std::vector<uint32> idToBuild;
        if (sql->Query(Query) != SQL_ERROR && sql->NumRows() != 0)
        {
            while (sql->NextRow() == SQL_SUCCESS)
            {
                Trust_ID* trustID = new Trust_ID();

                trustID->trustID = (uint32)sql->GetIntData(0);

                g_PTrustIDList.emplace_back(trustID);

                idToBuild.emplace_back(trustID->trustID);
            }
        }

        for (uint32 index : idToBuild)
        {
            BuildNewTrust(index);
        }
    }

    void BuildNewTrust(uint32 mobpoolId)
    {
        const char* Query = "SELECT \
                mob_pools.poolid,\
                mob_pools.name,\
                mob_pools.packet_name,\
                mob_pools.modelid,\
                mob_pools.familyid,\
                mob_pools.mJob,\
                mob_pools.sJob,\
                mob_pools.hasSpellScript,\
                mob_pools.spellList,\
                mob_pools.cmbSkill, \
                mob_pools.cmbDelay,\
                mob_pools.cmbDmgMult,\
                mob_pools.name_prefix,\
                mob_pools.skill_list_id,\
                mob_family_system.mobradius,\
                mob_family_system.ecosystemID,\
                (mob_family_system.HP / 100), \
                (mob_family_system.MP / 100), \
                mob_family_system.speed, \
                mob_family_system.STR, \
                mob_family_system.DEX, \
                mob_family_system.VIT, \
                mob_family_system.AGI, \
                mob_family_system.INT, \
                mob_family_system.MND, \
                mob_family_system.CHR, \
                mob_family_system.DEF, \
                mob_family_system.ATT, \
                mob_family_system.ACC, \
                mob_family_system.EVA, \
                mob_resistances.slash_sdt, mob_resistances.pierce_sdt, \
                mob_resistances.h2h_sdt, mob_resistances.impact_sdt, \
                mob_resistances.magical_sdt, \
                mob_resistances.fire_sdt, mob_resistances.ice_sdt, \
                mob_resistances.wind_sdt, mob_resistances.earth_sdt, \
                mob_resistances.lightning_sdt, mob_resistances.water_sdt, \
                mob_resistances.light_sdt, mob_resistances.dark_sdt, \
                mob_resistances.fire_res_rank, mob_resistances.ice_res_rank, \
                mob_resistances.wind_res_rank, mob_resistances.earth_res_rank, \
                mob_resistances.lightning_res_rank, mob_resistances.water_res_rank, \
                mob_resistances.light_res_rank, mob_resistances.dark_res_rank \
                FROM mob_pools, mob_family_system, mob_resistances \
                WHERE mob_pools.poolid = %u \
                AND mob_pools.resist_id = mob_resistances.resist_id \
                AND mob_pools.familyid = mob_family_system.familyID \
                ORDER BY mob_pools.poolid";

        auto ret = sql->Query(Query, mobpoolId);

        if (ret != SQL_ERROR && sql->NumRows() != 0)
        {
            while (sql->NextRow() == SQL_SUCCESS)
            {
                Trust_t* trust = new Trust_t();

                trust->trustID = mobpoolId;

                trust->pool = (uint32)sql->GetIntData(0);
                trust->name.insert(0, (const char*)sql->GetData(1));
                trust->packet_name.insert(0, (const char*)sql->GetData(2));

                uint16 sqlModelID[10];
                memcpy(&sqlModelID, sql->GetData(3), 20);
                trust->look = look_t(sqlModelID);

                trust->m_Family       = (uint16)sql->GetIntData(4);
                trust->mJob           = (uint8)sql->GetIntData(5);
                trust->sJob           = (uint8)sql->GetIntData(6);
                trust->hasSpellScript = (bool)sql->GetIntData(7);
                trust->spellList      = (uint16)sql->GetIntData(8);

                trust->cmbSkill   = (uint8)sql->GetIntData(9);
                trust->cmbDelay   = (uint16)sql->GetIntData(10);
                trust->cmbDmgMult = (uint16)sql->GetIntData(11);

                trust->name_prefix    = (uint8)sql->GetUIntData(12);
                trust->m_MobSkillList = (uint16)sql->GetUIntData(13);

                trust->radius    = sql->GetUIntData(14);
                trust->EcoSystem = (ECOSYSTEM)sql->GetIntData(15);
                trust->HPscale   = sql->GetFloatData(16);
                trust->MPscale   = sql->GetFloatData(17);

                // retail seems to have a static *155* for all Trusts in client memory
                // TODO: trust->speed = 155;
                trust->speed = (uint8)sql->GetIntData(18);

                // similarly speedSub is always 50
                trust->subSpeed = 50;

                trust->strRank = (uint8)sql->GetIntData(19);
                trust->dexRank = (uint8)sql->GetIntData(20);
                trust->vitRank = (uint8)sql->GetIntData(21);
                trust->agiRank = (uint8)sql->GetIntData(22);
                trust->intRank = (uint8)sql->GetIntData(23);
                trust->mndRank = (uint8)sql->GetIntData(24);
                trust->chrRank = (uint8)sql->GetIntData(25);
                trust->defRank = (uint8)sql->GetIntData(26);
                trust->attRank = (uint8)sql->GetIntData(27);
                trust->accRank = (uint8)sql->GetIntData(28);
                trust->evaRank = (uint8)sql->GetIntData(29);

                // resistances
                trust->slash_sdt  = (uint16)(sql->GetFloatData(30) * 1000);
                trust->pierce_sdt = (uint16)(sql->GetFloatData(31) * 1000);
                trust->hth_sdt    = (uint16)(sql->GetFloatData(32) * 1000);
                trust->impact_sdt = (uint16)(sql->GetFloatData(33) * 1000);

                trust->magical_sdt = (int16)sql->GetIntData(34); // Modifier 389, base 10000 stored as signed integer. Positives signify less damage.

                trust->fire_sdt    = (int16)sql->GetIntData(35); // Modifier 54, base 10000 stored as signed integer. Positives signify less damage.
                trust->ice_sdt     = (int16)sql->GetIntData(36); // Modifier 55, base 10000 stored as signed integer. Positives signify less damage.
                trust->wind_sdt    = (int16)sql->GetIntData(37); // Modifier 56, base 10000 stored as signed integer. Positives signify less damage.
                trust->earth_sdt   = (int16)sql->GetIntData(38); // Modifier 57, base 10000 stored as signed integer. Positives signify less damage.
                trust->thunder_sdt = (int16)sql->GetIntData(39); // Modifier 58, base 10000 stored as signed integer. Positives signify less damage.
                trust->water_sdt   = (int16)sql->GetIntData(40); // Modifier 59, base 10000 stored as signed integer. Positives signify less damage.
                trust->light_sdt   = (int16)sql->GetIntData(41); // Modifier 60, base 10000 stored as signed integer. Positives signify less damage.
                trust->dark_sdt    = (int16)sql->GetIntData(42); // Modifier 61, base 10000 stored as signed integer. Positives signify less damage.

                trust->fire_res_rank    = (int8)sql->GetIntData(43);
                trust->ice_res_rank     = (int8)sql->GetIntData(44);
                trust->wind_res_rank    = (int8)sql->GetIntData(45);
                trust->earth_res_rank   = (int8)sql->GetIntData(46);
                trust->thunder_res_rank = (int8)sql->GetIntData(47);
                trust->water_res_rank   = (int8)sql->GetIntData(48);
                trust->light_res_rank   = (int8)sql->GetIntData(49);
                trust->dark_res_rank    = (int8)sql->GetIntData(50);

                g_PntTrustList.emplace_back(trust);
            }
        }
    }*/
};

REGISTER_CPP_MODULE(NewTrustsModule);
