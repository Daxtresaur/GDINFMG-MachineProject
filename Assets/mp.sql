-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2024 at 12:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mp`
--

-- --------------------------------------------------------

--
-- Table structure for table `bosses`
--
drop table if exists `bosses`;
CREATE TABLE `bosses` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `notes` text NOT NULL,
  `weakness` text NOT NULL,
  `resistance` text NOT NULL,
  `group` varchar(1) NOT NULL,
  `affixes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bosses`
--

INSERT INTO `bosses` (`id`, `name`, `notes`, `weakness`, `resistance`, `group`, `affixes`) VALUES
(1, 'Musashi IX', 'Musashi IX fought alongside humans against the Punishing Virus until the end. Now it walks upon the abandoned ruins of civilization as a Corrupted, but for some reason it has kept the clumsy bandaging that a kind-hearted civilian once gave him.', 'Tank-type Characters', 'None', 'a', ''),
(2, 'Nozzle', 'Luna is an agent - a special member among the mysterious Ascendants. She eliminated all the enemies in the Ascension-Network with the overwhelming power of various Punishing Virus Heteromer weapons.', 'Fire', 'Ice', 'a', ''),
(3, 'Roland', 'One of the Ascendant, employing his gun and chain blade to cause chaos on the battlefield. Few have been able to get him to drop his nonchalant attitude in battle, and none have lived to tell the tale.', 'Physical', 'Dark', 'a', ''),
(4, 'Unknown Data Cluster', 'A data cluster born in Liv\'s contaminated M.I.N.D. with no clear data about it. The contaminated data formed a crimson light beam, corrupting everything it touches in the M.I.N.D.', 'Physical', 'None', 'a', ''),
(5, 'Luna', 'Luna is an agent - a special member among the mysterious Ascendants. She eliminated all the enemies in the Ascension-Network with the overwhelming power of various Punishing Virus Heteromer weapons.', 'Fire', 'None', 'a', ''),
(6, 'Qu', 'Empress of Kowloong Metropolis and one of the few granted the title of Transcendant. She wields the Dragon Glaive as a natural extension of her vigorous, elegant body, allowing her to unleash the full potential of its might. Such a blade kills all who are bold and treacherous.', 'Physical', 'None', 'a', ''),
(7, 'Shark-speare [Dark]', 'The bionic mascot of Venus Splash Park. Once it has entered the defense mode, Shark-speare will turn into a powerful special defense mechanoid.', 'None', 'None', 'a', ''),
(8, 'Moon Eater', 'Born on the moon, this Hetero-Creature devoured zero-point energy to grow into this abomination. Its blue light has the power to corrode everything nearby, and its large, inorganic eye only stares at its enemy with greed.', 'Fire', 'None', 'a', ''),
(9, 'Vassago', 'A restoration of the guardians of a lost desert cilivization, they are able to move swiftly in sand, tearing apart any creature who enters the desert without permission.', 'Lightning', 'Fire', 'b', ''),
(10, 'Unknown Construct α', 'A Construct of unknown origin, wielding a katana just like Lucia, but far more experienced and skilled at it. Every swing seems to tear apart the fabric of reality.', 'Rosetta', 'None', 'b', ''),
(11, 'Roseblade', '', 'Lightning', 'Ice', 'b', ''),
(12, 'Huaxu', 'A projection of the Ai systerm on the Nighter that summons various forms of hands to crush her enemies. Has multiple attack modes, such as Pain Hammer, and Lightning Storm.', 'Ice', 'Physical', 'b', ''),
(13, 'Siren', 'She.. was eroded by the Punishing Virus and because the mindless beast-\"Siren\". Her once beautiful voice turning into a shrill roar filled with nothing but despair and anger. It now viciously attacks all living creatures with the twisted limbs given to it by the Red Tide.', 'Lightning', 'None', 'b', ''),
(14, 'Machiavelli', 'A mechanoid manufactured by the mysterious \"Safein\" School for execution and containment. Compared with the other two Safein Constructs, the bionic design allows him to swing his scepter-like weapon with ease. The more advanced control units also enable him to control landscape', 'Ice', 'None', 'b', ''),
(15, 'Shark-speare', 'Every entertaining function of this bionic mascot of Venus Splash Park could easily be turned into a weapon with simple recoding. Once put into the defense mode, it will instantly turn into a special defense machine with power far beyond what its cute appearance suggests.', 'None', 'None', 'b', ''),
(16, 'Iron Maiden: Phantom', 'The spiked armor on this corrupted Construct is more than just a deadly weapon or solid protection, it also continues to spread the infection throughout the interior of the Construct.', 'Lightning', 'None', 'b', ''),
(17, 'Mutated Mechanoid: Madorea', '--', 'Ice', 'None', 'b', ''),
(18, 'Iron Maiden', 'The spiked armor on this corrupted Construct is more than just a deadly weapon or solid protection, it also continues to spread the infection throughout the interior of the Construct.', 'Dark', 'Physical', 'y', ''),
(19, 'Camu', 'The incarnation of a certain Construct\'s will, brutal and swift in battle. Its great sword is often the first and last thing that its enemies see.', 'Dark, any Kamui model', 'None', 'y', ''),
(20, 'Rosetta', '', 'Melee attacks (within 3 meters)', 'None', 'y', ''),
(21, 'Pterygota Queen', 'Born in the center of Polyphage, this humanoid Punishing Hetero-creature served as its terminal and could also be used to control it. It resembles an abomination crawling out of the abyss. Its shiny, red scythe and wings suggested its bloodthirsty nature, warning any living things not to approach.', 'Dark', 'None', 'y', ''),
(22, 'Voodoo', 'According to the battle report submitted by Cerberus, Voodoo seems to be mentally unstable but still has great combat capability. Thanks to the unparalleled mobility given by the wings on her back, Voodoo is just like a hunter who always launches a surprise attack and leaves immediately afterward.', 'Dark', 'None', 'y', ''),
(23, 'Lamia', 'An Ascendant with a huge fishtail and excellent camouflage capabilty and underwater battle performance. Her spear can deal damage to a large area, but the electric ghosts that disturb one\'s senses and the phantoms that show up at random spots are harder to deal with.', 'Basic Attacks, Signature Moves', 'None', 'y', ''),
(24, 'Hamlet', '\"Hamlet\" is a holographic AI theatrical machine owned by the WGAA that utilizes the latest theater play technologies. When a non-tragic ending becomes more reasonable, Hamlet will show up to put an end to the performance, bringing back perfection and melancholy.', '3-Pings', 'None', 'y', '');

-- --------------------------------------------------------

--
-- Table structure for table `character notes`
--

drop table if exists `character notes`;
CREATE TABLE `character notes` (
  `id` int(11) NOT NULL,
  `frame` varchar(15) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `character notes`
--

INSERT INTO `character notes` (`id`, `frame`, `notes`) VALUES
(1, 'Lotus', 'Duel - Has strong single attack ability;Dual Blades - Attack DMG boosting skill'),
(2, 'Eclipse', 'Melee - Has strong area attack ability.;Heal - Has ally healing skills.'),
(3, 'Storm', 'Damage Reduction - Reduces damage taken.;Shielding DMG - Shields all damages within the range of Signature Moves.'),
(4, 'Dawn', 'Duel - Has strong single attack ability;Mixed Damage - Able to deal Physical and Elemental DMG.'),
(5, 'Lux', 'Heal - Has ally healing skills.;Mixed Damage - Able to deal Physical and Elemental DMG.'),
(6, 'Palefire', 'Combo - Easy to deal high combo damage.;Mixed Damage - Able to deal Physical and Elemental DMG.'),
(7, 'Nightblade', 'Duel - Has strong single attack ability.;Backstab - Attacks at the back deal Extra Damage.'),
(8, 'Zero', 'Duel - Has strong single attack ability.;Energy Boost - Has shorter Cooldown of Signature Moves.'),
(9, 'Blast', 'Mixed Damage - Able to deal Physical and Elemental DMG.;Form Switch - Signature Move can switch attacking forms.'),
(10, 'Luminance', 'Heal - Has ally healing skills.;Members Damage reduction - Signature Move can reduce the damage taken by allies.'),
(11, 'Entropy', 'Combo - Easy to deal high combo damage.;Physical Damage - Skill combinations are powerful.'),
(12, 'Ember', 'Melee - Has strong area attack ability.;Mixed Damage - Able to deal Physical and Elemental DMG.'),
(13, 'Pulse', 'Mixed Damage - Able to deal Physical and Elemental DMG.;Resistance Reduction - Able to reduce Elemental Resistance of enemies.'),
(14, 'Tenebrion', 'Mixed Damage - Able to deal Physical and Elemental DMG.;Form Switch - Signature Move can switch attacking forms.'),
(15, 'Crimson Abyss', 'Duel - Has strong single attack ability.;Form Switch - Skills can switch attacking modes.'),
(16, 'Bastion', 'Block - Blocking Skill;Shield - Release a shield to defend.'),
(17, 'Astral', 'Agility - Able to transport across space instantly.;Mixed Damage - Able to deal Physical and Elemental DMG.'),
(18, 'Brilliance', 'Attraction - Able to attract the attention of enemies.;Shield - Releases a shield to defend.'),
(19, 'Veritas', 'Piercing - Deals great area damage.;Mixed Damage - Able to deal Physical and Elemental DMG.'),
(20, 'Silverfang', 'Attraction - Able to pull enemies in an area together.;Heal - Has ally healing skills.'),
(21, 'Arclight', 'Form Switch - Signature Move can switch attacking forms.;Shield - Releases a shield to defend.'),
(22, 'Plume', 'Continual Burst - Has sustained damage output;Form Switch - Skill can switch attacking modes'),
(23, 'Rozen', 'Energy Boost - Has shorter Cooldown of Signature Moves.;Heal - Has ally healing skills.'),
(24, 'Crocotta', 'Form Switch - Signature Move can switch attacking forms.;Burst - Switch forms for high burst.'),
(25, 'Rigor', 'Defense Down - Able to reduce Physical Defense of enemies.;Burst - Energy spheres provide great burst potential.'),
(26, 'Qilin', 'Melee - Uses follow-up skills to deal DMG and accumulate Energy;Tank - Deals continuous DMG after performing a Signature Move'),
(27, 'Pavo', 'Melee - Deals Extra DMG when Core Passive is activated;Summon - Summons a Pet to attack when using a Signature Move'),
(28, 'Laurel', 'Energy Amass - Use 3-Ping to trigger 3-Ping and amass energy;Burst - Her core form grants high burst and gains energy'),
(29, 'Hypnos', 'Heal ? Able to heal friendly force;Snipe ? Able to precisely snipe the enemy after dodge'),
(30, 'Tempest', 'Melee ? Able to affect the game through different orb ping.;Burst ? Able to switch to Signature Move status in a quick manner.'),
(31, 'Glory', 'Form Switch ? Able to switch to a burst form and launch powerful attacks;Resistance Reduction ? Able to reduce the Resistance of enemies'),
(32, 'XXI', 'Burst ? A signature move that can deal massive DMG;Forced Evasion ? Can remove abnormal status effects when in Haywire status'),
(33, 'Garnet', 'Burst ? Deals massive DMG in a short time.;Resistance Reduction ? Able to reduce the Resistance of enemies.'),
(34, 'Flambeau', 'Combo ? Can deal various combos;Form Switch ? Can switch Attack Modes for Signatures Moves'),
(35, 'Empyrea', 'Amplification ? Enhances teammates;Burst ? Deals massive DMG in a short time'),
(36, 'Capriccio', 'Amplification ? Enhances teammates;Burst ? Deals massive DMG in a short time'),
(37, 'Dragontoll', 'Summon ? Uses her Signature Move to summon her weapon;Burst ? Deals massive DMG with Core Passive Follow-Up'),
(38, 'Starfarer', 'Resistance Reduction ? Able to reduce the Resistance of enemies.;Form Switch ? Signature Move can switch attacking forms.'),
(39, 'Starveil', 'Control - Freezes enemies to restrain their actions.;Burst ? Deals massive DMG in a short time.'),
(40, 'Scire', 'Resistance Reduction ? Able to reduce Elemental Resistance of enemies.;Burst ? Can deal large amounts of damage quickly.'),
(41, 'Arca', 'Combo ? Continuously trigger core passive to deal high damage.;Burst ? Can deal large amounts of damage quickly.'),
(42, 'Stigmata', 'Form Switch ? Able to switch to a burst form and launch powerful attacks.;Burst ? Deals massive DMG in a short time.'),
(43, 'Vitrum', 'Combo ? Deals massive DMG by activating Core Passive repeatedly.;Burst ? Signature Move can deal massive DMG.'),
(44, 'Hyperreal', 'Combo ? Use three-pings in quick succession to deal high damage.;Burst ? Can deal large amounts of damage quickly.'),
(45, 'Kaleido', 'Amplification ? Enhances teammates.;Burst ? Deals massive DMG in a short time.'),
(46, 'Crimson Weave', 'Form Switch ? Skill can switch attack styles.;Burst ? Can deal large amounts of damage quickly.'),
(47, 'Zitherwoe', 'Heal - Has ally healing skills.;Physical Damage - Able to enhance herself, granting Pulao and Qu additional buffs.'),
(48, 'Ferel Scent', 'Amplification - Enhances teammates.;Burst - Deals massive DMG in a short time.'),
(49, 'Indomitus', 'Combo ? Repeatedly perform Core Passive to deal massive DMG.;Burst ? Signature Move can deal massive DMG.'),
(50, 'Echo', 'Amplification - Enhances teammates.;Burst - Deals massive DMG in a short time.'),
(51, 'Lost Lullaby', 'Burst - Deals massive DMG in a short time.;Form Switch - Signature Move can switch attacking forms.');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

drop table if exists `characters`;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `frame` varchar(15) NOT NULL,
  `rank` varchar(4) NOT NULL,
  `element` text NOT NULL,
  `class` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `name`, `frame`, `rank`, `element`, `class`) VALUES
(1, 'Lucia', 'Lotus', 'B', 'Physical', 'Attacker'),
(2, 'Liv', 'Eclipse', 'B', 'Physical', 'Support'),
(3, 'Nanami', 'Storm', 'B', 'Physical', 'Tank'),
(4, 'Lucia', 'Dawn', 'A', 'Lightning', 'Attacker'),
(5, 'Liv', 'Lux', 'A', 'Physical', 'Support'),
(6, 'Lee', 'Palefire', 'A', 'Physical;Fire', 'Attacker'),
(7, 'Watanabe', 'Nightblade', 'A', 'Physical', 'Attacker'),
(8, 'Bianca', 'Zero', 'A', 'Physical', 'Attacker'),
(9, 'Karenina', 'Blast', 'A', 'Physical;Fire', 'Attacker'),
(10, 'Liv', 'Luminance', 'S', 'Physical', 'Support'),
(11, 'Lee', 'Entropy', 'S', 'Fire;Physical', 'Attacker'),
(12, 'Karenina', 'Ember', 'S', 'Fire', 'Attacker'),
(13, 'Nanami', 'Pulse', 'S', 'Fire;Physical', 'Tank'),
(14, 'Kamui', 'Tenebrion', 'S', 'Dark;Physical', 'Tank'),
(15, 'Lucia', 'Crimson Abyss', 'S', 'Physical', 'Attacker'),
(16, 'Kamui', 'Bastion', 'A', 'Physical', 'Tank'),
(17, 'Watanabe', 'Astral', 'A', 'Dark;Physical', 'Attacker'),
(18, 'Ayla', 'Brilliance', 'A', 'Physical', 'Tank'),
(19, 'Bianca', 'Veritas', 'S', 'Lightning;Physical', 'Attacker'),
(20, 'Sophia', 'Silverfang', 'A', 'Fire;Physical', 'Support'),
(21, 'Chrome', 'Arclight', 'A', 'Lightning;Physical', 'Tank'),
(22, 'Lucia', 'Plume', 'S', 'Ice;Physical', 'Attacker'),
(23, 'Vera', 'Rozen', 'A', 'Dark;Physical', 'Support'),
(24, 'Camu', 'Crocotta', 'S', 'Dark;Physical', 'Vanguard'),
(25, 'Rosetta', 'Rigor', 'S', 'Physical', 'Tank'),
(26, 'Changyu', 'Qilin', 'A', 'Ice;Physical', 'Tank'),
(27, 'Qu', 'Pavo', 'S', 'Physical', 'Vanguard'),
(28, 'Luna', 'Laurel', 'S', 'Dark', 'Attacker'),
(29, 'Wanshi', 'Hypnos', 'A', 'Ice;Physical', 'Support'),
(30, 'Selena', 'Tempest', 'S', 'Lightning;Physical', 'Vanguard'),
(31, 'Chrome', 'Glory', 'S', 'Ice;Physical', 'Tank'),
(32, 'No.21', 'XXI', 'A', 'Dark;Physical', 'Tank'),
(33, 'Vera', 'Garnet', 'S', 'Lightning;Physical', 'Tank'),
(34, 'Roland', 'Flambeau', 'S', 'Fire;Physical', 'Vanguard'),
(35, 'Liv', 'Empyrea', 'S', 'Fire;Physical', 'Amplifier'),
(36, 'Selena', 'Capriccio', 'S', 'Dark;Physical', 'Amplifier'),
(37, 'Pulao', 'Dragontoll', 'S', 'Physical', 'Vanguard'),
(38, 'Nanami', 'Starfarer', 'S', 'Fire;Physical', 'Tank'),
(39, 'Haicma', 'Starveil', 'S', 'Ice;Physical', 'Vanguard'),
(40, 'Karenina', 'Scire', 'S', 'Dark;Physical', 'Tank'),
(41, 'Noan', 'Arca', 'S', 'Lightning;Physical', 'Vanguard'),
(42, 'Bianca', 'Stigmata', 'S', 'Physical', 'Attacker'),
(43, 'Bambinata', 'Vitrum', 'A', 'Ice;Physical', 'Attacker'),
(44, 'Lee', 'Hyperreal', 'S', 'Fire;Physical', 'Attacker'),
(45, 'Ayla', 'Kaleido', 'S', 'Ice;Physical', 'Amplifier'),
(46, 'Lucia', 'Crimson Weave', 'S', 'Lightning;Physical', 'Attacker'),
(47, 'Hanying', 'Zitherwoe', 'A', 'Physical', 'Support'),
(48, 'No.21', 'Feral Scent', 'S', 'Lightning;Physical', 'Amplifier'),
(49, 'Noctis', 'Indomitus', 'A', 'Lightning', 'Attacker'),
(50, 'Alisa', 'Echo', 'S', 'Physical', 'Amplifier'),
(51, 'Lamia', 'Lost Lullaby', 'S', 'Dark', 'Attacker');

-- --------------------------------------------------------

--
-- Table structure for table `memory set`
--
drop table if exists `memory set`;
CREATE TABLE `memory set` (
  `id` int(11) NOT NULL,
  `frame` varchar(20) NOT NULL,
  `memory1` text NOT NULL,
  `memory2` text NOT NULL,
  `memory3` text NOT NULL,
  `top` text NOT NULL,
  `bottom` text NOT NULL,
  `mUsage` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memory set`
--

INSERT INTO `memory set` (`id`, `frame`, `memory1`, `memory2`, `memory3`, `top`, `bottom`, `mUsage`, `notes`) VALUES
(1, 'Stigmata', 'Charlotte', 'Leeuwenhoek', '', 'Attack Crit', 'Signature', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SS0 and under\nGeneral DPS set. \nStill ok at SS3 and above as an easier to use set, but suboptimal for competitive scenarios'),
(2, 'Stigmata', 'Charlotte', 'Cottie', '', 'Attack Crit', 'Signature', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nSS0: Just for some Pain Cage stages\nSS3 or higher: Main set for Warzone and general content. Some Pain Cage stages. \nPain Cage set for quicker second ultimate kills. Can be used as a Warzone set for solo DPS / multiple ult Stigmata (SS3 can do, but SSS0 much more effective)'),
(3, 'Stigmata', 'Charlotte', 'Cottie', '', 'Attack Crit', 'Core4 Passive', 'Secondary', '[Pain Cage]\nRecommended SSS0 or higher\nPain Cage set for quick boss kills on first ult phase. Used on a lot of stages.'),
(4, 'Stigmata', 'Charlotte', 'Darwin', '', 'Attack Crit', 'Core Passive', 'Secondary', '[Pain Cage]\nRecommended SSS0 or higher\nPain Cage set for strats where Cottie can\'t kill. Can be either first or second ult (second ult kill prefers Signature resonances).'),
(5, 'Rigor', 'Leeuwenhoek', 'Catherine', '', 'Attack Crit', 'Class Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nSet gives maximum defense shred, allowing Rosetta to both support the main DPS and also come on field to sub DPS. Great performance in all possible content.\nLeap Set'),
(6, 'Rigor', 'Da Vinci', 'Catherine', '', 'Attack Crit', 'Class Passive', 'Niche', '[Pain Cage]\nSet for after Arisa - Echo\'s release\nUltimate Pain Cage support set for Bianca - Stigmata when paired with Echo. Provides a higher boost in damage than Leeuwenhoek due to the low defenses on bosses.'),
(7, 'Crimson Abyss', 'Fredrick', 'Darwin', '', 'Attack Crit', 'Core Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nStrong performance in all content. This set allows the highest burst possible, which perfectly suits her swordwave kit.\nLeap set'),
(8, 'Entropy', 'Hanna', 'Darwin', '', 'Yellow', 'Attack Crit', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral DPS set \nUsed with Leaped Liv - Luminance'),
(9, 'Entropy', 'Darwin', 'Leeuwenhoek', '', 'Attack Crit', 'Attack Crit', 'Secondary', '[Pain Cage, Warzone, Norman, High Difficulty]\nAlternative dps set. Offers slighty higher damage, but needs good orb management (and thus orb rng). \n2 set can also be Frederick, up to preference. '),
(10, 'Entropy', 'Patton', 'Darwin', '', 'Attack Crit', 'Core Passive', 'Secondary', '[Pain Cage, Warzone, Norman, High Difficulty]\nGeneral build if no Leaped Liv - Luminance'),
(11, 'Luminance', 'Da Vinci', 'Philip II', '', 'Attack Crit', 'Signature', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral set that allows her to debuff for the other DPS on the team and dish out damage at the same time'),
(12, 'Luminance', 'Hanna', 'Cottie', '', 'Attack Crit', 'Attack Crit', 'Niche', '[Awakening Set | Warzone, Norman, High Difficulty]\nRecommended for budget nier (SSS A2, and both 2B/9S at SS or lower)\nDPS set for if you don\'t plan to swap off of A2 at all (Solo DPS). \nCan keep any Signature/Attack Crit if not going for perfection, difference is minimal.'),
(13, 'Luminance', 'Patton', 'Darwin', '', 'Attack Crit', 'Signature', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral QTE Support Set.\n9S deals good damage even with Da Vinci on him when invested'),
(14, 'Zitherwoe', 'Da Vinci', 'Philip II', '', 'Attack Crit', 'Attack Crit', 'Main', '[Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SSS or higher\nDPS set '),
(15, 'Zitherwoe', 'Hanna', 'Darwin', '', 'Attack Crit', 'Core Passive', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SSS\nGeneral DPS set.'),
(16, 'Bastion', 'Hanna', 'Cottie', '', 'Attack Crit', 'Class Passive', 'Main', '[High Difficulty]\nRecommended SS or lower\nDPS set'),
(17, 'Bastion', 'Da Vinci', 'Catherine', '', 'Attack Crit', 'Class Passive', 'Secondary', '[Pain Cage, Warzone, Norman, High Difficulty]\nRequires Leap\nQTE support set, best Physical support option'),
(18, 'Brilliance', 'Da Vinci', 'Catherine', '', 'Attack Crit', 'Class Passive', 'Main', '[Awakening Set | High Difficulty]\nHanna matrixes and Cottie for frequent ults gives her very high survivability.'),
(19, 'Brilliance', 'Chen Jiyuan', 'Gloria', '', 'Attack Crit', 'Class Passive', 'Niche', '[Pain Cage, Warzone, Norman, High Difficulty]\nDPS Set for Leap'),
(20, 'Blast', 'Hanna', 'Darwin', '', 'Attack Crit', 'Core Passive', 'Main', '[Pain Cage, Warzone, Norman, High Difficulty]\nGeneral QTE Support set. Use Catherine instead of Philip if using on Kowloong Team.'),
(21, 'Blast', 'Da Vinci', 'Voltaire', '', 'Attack Crit', 'Attack Crit', 'Niche', '[High Difficulty]\nDPS set'),
(22, 'Zero', 'Patton', 'Cottie', '', 'Attack Crit', 'Signature', 'Main', '[Awakening Set | High Difficulty]\nDPS set'),
(23, 'Nightblade', 'Patton', 'Darwin', '', 'Attack Crit', 'Core Passive', 'Main', '[Pain Cage, Norman, High Difficulty]\nQTE Physical Debuff Set. Use Voltaire/Lantern if someone else is already carrying Catherine.'),
(24, 'Nightblade', 'Patton', 'Leeuwenhoek', 'Lantern Festival: Reunion', 'Attack Crit', 'QTE', 'Nice', '[Pain Cage, Norman, High Difficulty]\nQTE Physical Debuff Set. Use Voltaire/Lantern if someone else is already carrying Catherine.'),
(25, 'Eclipse', 'Da Vinci', 'Philip II', '', 'Attack Crit', 'Attack Crit', 'Main', '[Pain Cage, Norman]\nUse if don\'t own Glory or Qilin 6* Weapon\nQTE support set for Plume '),
(26, 'Eclipse', 'Darwin', 'Leeuwenhoek', '', 'Attack Crit', 'Core Passive', 'Niche', '[Awakening Set | Warzone, High Difficulty]\nPrimary DPS set'),
(27, 'Storm', 'Da Vinci', 'Catherine', '', 'Blue', 'Class Passive', 'Main', '[Warzone]\nCan just be borrowed. QTE support for Alpha/Rosetta or Lee/Rosetta Warzone teams. Lantern viable alternative as well.\nIf you are killing waves fast, replace Voltaire with Catherine to have better debuff coverage. Catherine does not stack, but Catherine on Rosetta has cooldown. When double QTE triggering, Rosetta\'s Catherine will not apply on the next wave; and having another set on Blast bypasses this problem.'),
(28, 'Lotus', 'Patton', 'Fredrick', '', 'Attack Crit', 'Core Passive', 'Main', '[Awakening Set | Pain Cage, Norman, High Difficulty]\nPrimary DPS Set'),
(29, 'Empyrea', 'Elizabeth', 'Cottie', '', 'Attack Hp', '3x Core Passive;3x Signature', 'Main', '[Awakening Set | High Difficulty]\nPrimary DPS set '),
(30, 'Empyrea', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Class Passive', 'Secondary', '[Pain Cage]\nQTE set for quick lower level Pain Cage kills. Voltaire if you don\'t have Lantern.'),
(31, 'Empyrea', 'Elizabeth', 'Darwin', '', 'Attack Hp', '3x Core Passive;3x Signature', 'Secondary', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nQTE Support Set, usually paired with Rosetta.'),
(32, 'Empyrea', 'Elizabeth', 'Cottie', '', 'Attack Hp', 'Signature', 'Niche', '[High Difficulty]\nDPS set'),
(33, 'Empyrea', 'Guinevere', 'Gloria', '', 'Attack Hp', 'Class Passive', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nPhysical QTE support Set. Not worth investing in unless you don\'t have Rosetta.'),
(34, 'Starfarer', 'Ultimate', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Main', '[Awakening Set | High Difficulty]\nPrimary DPS Set\nCan substitute Frederick for Condelina, cheap alternative. Condelina boosts her core passive'),
(35, 'Starfarer', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SSS or under\nGeneral DPS set, allows smoother rotations. Can keep any core passives instead of Signatures. \nCore passive level must be level 22 minimum.'),
(36, 'Starfarer', 'Ultimate', 'Condelina', '', 'Attack Hp', 'Core Passive', 'Niche', '[Pain Cage, Warzone]\nQTE support set for elemental teams.'),
(37, 'Ember', 'Shakespeare', 'Darwin', '', '3x Red;3x Yellow', 'Attack Hp', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nSSS+: General DPS set\nSSS and lower: Mainly used for some pain cage strategies'),
(38, 'Ember', 'Hanna', 'Darwin', '', 'Yellow', 'Attack Hp', 'High', '[Pain Cage]\nSSS+ only.\nPain Cage set for instant ult nuke.'),
(39, 'Ember', 'Da Vinci', 'Einsteina', '', 'Yellow', 'Attack Hp', 'Niche', '[Pain Cage]\nQTE support for single DPS strategies, where the other QTE support carries Da Vinci. Empyrea can proc Guinevere drone in a single QTE.\nUsed for slower Pain Cage one shots, where the kill extends past Da Vinci\'s 4 piece window. Lantern sometimes substitutes Gloria'),
(40, 'Pulse', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral sub DPS set'),
(41, 'Pulse', 'Shakespeare', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Pain Cage, Warzone]\nOnly for high invest Empyrea oneshots for now. Later on general Pain Cage set if you have a complete fire team (Empyrea and Hyperreal). Sometimes a Warzone set depending on invest.\nQTE Support set.\nUse Blue Orb to trigger res down, then swap to DPS. Signature weapon is required to use this build.'),
(42, 'Hyperreal', 'Turing', 'Cottie', '', 'Attack Hp', 'Signature', 'Main', '[Warzone, Norman, High Difficulty]\nMust be SS or higher\nSolo DPS Set. Only recommended if you don\'t have Empyrea / any fire DPS.\nStay in core and never press the second ult button. Core attacks are considered basic attacks.'),
(43, 'Hyperreal', 'Turing', 'Darwin', '', 'Attack Hp', 'Signature', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral DPS set for lower invest Embers. Any mixture of red / yellow is fine.'),
(44, 'Silverfang', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Core Passive', 'Main', '[Pain Cage, Warzone, Norman, High Difficulty]\nGeneral DPS set for higher invest Embers (around SS + Signature or better)\nIf Pain Cage is not a priority for you, any mixture of red / yellow is fine.'),
(45, 'Silverfang', 'Guinevere', 'Gloria', '', 'Attack Hp', 'Core Passive', 'Secondary', '[Warzone, Norman, High Difficulty]\nSet for Empyrea/Starfarer/Ember team composition\nCan just borrow. Offers QTE support, and fills the gap during Empyrea/Starfarer\'s downtime'),
(46, 'Palefire', 'Shakespeare', 'Darwin', '', 'Attack Hp', 'Attack Hp', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral QTE support set \nLeap set'),
(47, 'Palefire', 'Da Vinci', 'Darwin', '', 'Attack Hp', 'Attack Hp', 'Secondary', '[Pain Cage]\nQTE Support for single DPS strategies, where the other QTE support carries Da Vinci. \nFor example Ember quick kills\nLeap set'),
(48, 'Palefire', 'Hanna', 'Darwin', '', 'Blue', 'Attack Crit', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nSS0 and lower: General DPS set for SS0 and lower\nSS3: Only for lower Pain Cage strats for faster ults'),
(49, 'Plume', 'Hanna', 'Darwin', '', 'Red', 'Signature', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nSS0: Only for lower Pain Cage.\nSS3 and higher: General DPS set '),
(50, 'Plume', 'Hanna', 'Darwin', '', 'Red', 'Core Passive;Attack Hp', 'High', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nQTE support set, typically used when Pulse is holding Shakespeare and Ember using Hanna. \nGuinevere is replaced by Gloria in some Paincage strats'),
(51, 'Plume', 'Fredrick', 'Darwin', '', 'Red', 'Signature', 'Niche', '[Pain Cage, Norman, High Difficulty]\nQTE Support. Boosts her low heals and offers more buffs. Sophia orbs allow quick Guinevere drone activation. Paired with a Da Vinci tank for supporting a Solo DPS'),
(52, 'Plume', 'Hanna', 'Darwin', '', 'Yellow', 'Core Passive', 'Niche', '[Pain Cage, Warzone, Norman, High Difficulty]\nGeneral DPS set. Recommended with Leap. \nCan keep any red orb/core passives, they are better in situations where you don\'t use ult.'),
(53, 'Glory', 'Chen Jiyuan', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Main', '[Warzone, Norman, High Difficulty]\nCan just borrow. Leap set for Empyrea/Starfarer/Palefire team composition. \nOffers QTE support, and fills the gap during Empyrea/Starfarer\'s downtime'),
(54, 'Glory', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Pain Cage]\nSet for quick advanced Pain Cage kills.'),
(55, 'Kaleido', 'Eileen', 'Darwin', '', 'Attack Hp', 'Core Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nWorks in all content. Hanna helps with Plume\'s heavy orb usage and boosts her already high orb damage. Signature resonance scales well across modes.'),
(56, 'Kaleido', 'Eileen', 'Cottie', '', 'Attack Hp', 'Core Passive', 'High', '[Pain Cage, Warzone, Norman, High Difficulty]\nThis set also works in all content, but performance is slightly worse than Signature resonances in general content.\nAllows orb kills on Pain Cage, so choosing this set is a tradeoff for better Pain Cage performance.\nAny mixture of Attack/Core Passive is fine.'),
(57, 'Kaleido', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Core Passive', 'Niche', '[Pain Cage]\nFred offers extremely high burst damage, allowing Pain Cage kills that aren\'t possible with Hanna. \nRequires high mechanical skill to use.'),
(58, 'Hypnos', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Attack Hp;Signature', 'Main', '[Pain Cage]\nSet for low difficulty boss kills, can work in high difficulty Advanced given enough investment.'),
(59, 'Hypnos', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Attack Hp', 'Secondary', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral content set, allows Glory to sub DPS and shred resistance on QTE for Plume.\nNot usually optimal in Pain Cage due to proc RNG, but still functional and lets him sub DPS with lower invest ice teams.'),
(60, 'Hypnos', 'Guinevere', 'Gloria', 'Lantern Festival: Reunion', 'Attack Hp', 'Attack Hp', 'Niche', '[Pain Cage]\nQTE Support. Da Vinci\'s buff paired with 2/2/2 on Wanshi allows a more powerful burst from Plume compared to using Chen Jiyuan on Glory in most cases.\nWhen paired with Plume and Kaleido becomes his Main set'),
(61, 'Hypnos', 'Chen Jiyuan', 'Cottie', '', 'Attack Hp', 'Signature', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SS0 or higher\nAll purpose DPS set'),
(62, 'Vitrum', 'Hanna', 'Darwin', '', 'Red', 'Attack Hp', 'Main', '[Pain Cage, Warzone, Norman, High Difficulty]\nS0-S5: Main DPS Set \nSS0 or higher: For Pain Cage strats for faster ult. Can also be used to ult multiple times per rotation.'),
(63, 'Vitrum', 'Chen Jiyuan', 'Hanna', '', 'Red', 'Attack Hp', 'Niche', '[Pain Cage]\nOff element QTE support or for quick Plume / Bambi kills (mainly for lower difficulties). Not very good for off element support, Ayla has short QTE time.'),
(64, 'Qilin', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Main', '[Pain Cage, Warzone, Norman, High Difficulty]\nGeneral use set, works for all content. QTE support for Ice teams.\nGuinevere is replaced by Gloria in some Paincage strats.\nBottom slot Attack for more heals, Signature for more damage on rotations.'),
(65, 'Qilin', 'Chen Jiyuan', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Pain Cage, Norman, High Difficulty]\nQTE support set for Plume if no Qilin 6* weapon or Glory, paired with Chen Jiyuan Ayla.'),
(66, 'Garnet', 'Tifa', 'Einsteina', '', 'Attack Hp', 'Core Passive', 'Main', '[Pain Cage]\nMaximized Plume Pain Cage buff set up. Paired with Qilin/Glory Da Vinci, this provides the higher damage for Plume\'s burst cycle. '),
(67, 'Garnet', 'Tifa', 'Heisen', '', 'Attack Hp', 'Core Passive', 'Secondary', '[Awakening Set | High Difficulty]\nDPS set'),
(68, 'Garnet', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral DPS set'),
(69, 'Garnet', 'Tifa', 'Cottie', '', 'Attack Hp', 'Core Passive', 'Niche', '[Pain Cage]\nSet for extremely fast lower stage kills'),
(70, 'Veritas', 'Heisen', 'Fredrick', '', 'Attack Hp', 'Core Passive', 'Main', '[Awakening Set | Pain Cage, Norman, High Difficulty]\nQTE support for ice teams. General use set'),
(71, 'Veritas', 'Heisen', 'Condelina', '', 'Attack Hp', 'Core Passive', 'Secondary', '[High Difficulty]\nDPS set. \nChangyu procs Chen Jiyuan slow so not very good as a QTE set.'),
(72, 'Lux', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Attack Hp', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nAll purpose DPS set, lets Garnet deal damage while still providing debuff support. Used when there is a sub DPS on the team like Tempest/Dawn/Veritas.\nOnce Lucia - Crimson Weave releases, optimal resonances become Class Passive'),
(73, 'Lux', 'Guinevere', 'Latern Festival: Reunion', '', 'Attack Hp', 'Attack Hp', 'Secondary', '[Pain Cage]\nMain DPS set, Ideal for Pain Cage strats where Garnet is the only DPS utilizes this set, and can be used in general if you don\'t have an invested Lightning sub dps.'),
(74, 'Dawn', 'Heisen', 'Darwin', '', 'Attack Hp', 'Core Passive', 'Main', '[Pain Cage]\nFor some one shot strats with Lucia - Crimson Weave. Use Lightning Fall to apply res down then swap.'),
(75, 'Dawn', 'Heisen', 'Gloria', '', 'Attack Crit', 'QTE', 'Niche', '[Pain Cage, High Difficulty]\nCan be used for more ultimates for stages with high survival pressure. \nIf SSS, used in extremely rare Pain Cage strats.'),
(76, 'Arclight', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nAll purpose DPS set'),
(77, 'Arclight', 'Heisen', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'High', '[Pain Cage, Warzone, Norman, High Difficulty]\nAlternative DPS set. Condelina boosts core shots.\nOverall damage is slightly worse, but don\'t need to manage dodges like Frederick and can be better in cases like Pain Cage situations where you don\'t have the time to build up Frederick stacks.'),
(78, 'Crimson Weave', 'Diesel', 'Cottie', '', 'Basic Attack', 'Attack Hp', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nQTE Support Set, used whenever there is a DPS and sub DPS. \ni.e. Lux / Veritas / Garnet Lux'),
(79, 'Crimson Weave', 'Diesel', 'Cottie', '', 'Basic Attack', 'Signature', 'Main', '[Pain Cage,  Norman, High Difficulty]\nQTE Support, used for supporting a solo DPS. Better heals and higher buffs, paired with Davinci Arclight. Lux can activate Guinevere Drone in a single QTE.\nUse Samantha if no Lantern.'),
(80, 'Crimson Weave', 'Diesel', 'Fredrick', '', 'Basic Attack', 'Attack Hp', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral DPS set.\nNeeds Leap. Use Cottie 2 piece if not Leaped.'),
(81, 'Crimson Weave', 'Diesel', 'Cottie', '', 'Attack Hp', 'Signature', 'Niche', '[Pain Cage]\nQTE support for quick lightning team kills.\nPaired with Hanna Veritas or Garnet solo DPS\nDawn procs Einsteina slow so for quick kills she won\'t apply it in time, hence Gloria.'),
(82, 'Crimson Weave', 'Diesel', 'Fredrick', '', 'Basic Attack', 'Signature', 'Niche', '[Pain Cage,  Norman, High Difficulty]\nQTE support for Veritas, used whenever solo DPS Veritas.'),
(83, 'Feral Scent', 'Fran', 'Guinevere', '', 'Attack Hp', 'Core Passive;Class Passive;Signature', 'Main', '[Awakening Set | High Difficulty]\nRecommend SSS or above.\nSub DPS set.'),
(84, 'Feral Scent', 'Guinevere', 'Da Vinci', '', 'Attack Hp', 'Class Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SS3 or lower\nGeneral DPS set'),
(85, 'Feral Scent', 'Fran', 'Cottie', '', 'Attack Hp', 'Core Passive;Class Passive;Signature', 'High', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SSS0 or higher\nGeneral DPS set'),
(86, 'Feral Scent', 'Fran', 'Tifa', '', 'Attack Hp', 'Core Passive;Signature', 'Secondary', '[Pain Cage]\nRecommended SS3 or lower\nFor pain cage one shots that Cottie can\'t kill.'),
(87, 'Feral Scent', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Class Passive', 'Niche', '[Pain Cage]\nRecommended SSS0 or higher\nFor fast pain cage one shots using ult only.'),
(88, 'Laurel', 'Flamel', 'Darwin', '', 'Attack Hp', 'Core Passive', 'Main', '[Pain Cage]\nRecommended SSS0 or higher\nFor fast pain cage one shots that Cottie can\'t kill.'),
(89, 'Laurel', 'Flamel', 'Cottie', '', 'Attack Hp', 'Core Passive', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nSub DPS set when paired with Crimson Weave\nSS3 or lower: 6 Signature\nSSS0 or higher: 6 Core / 6 Class'),
(90, 'Laurel', 'Hanna', 'Darwin', '', 'Yellow', 'Attack Hp', 'Niche', '[Pain Cage, Warzone, Norman, High Difficulty]\nGeneral QTE Support when paired with solo DPS Crimson Weave.\nReplace Da Vinci with Gloria if other QTE Support is running Da Vinci.'),
(91, 'Tenebrion', 'Bathlon', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Main', '[Awakening Set | Warzone, Norman, High Difficulty]\nSub DPS set when paired with Crimson Weave. Allows multiple ults per rotation\nStronger than Guinevere, but requires better mechanical skills.\nSS3 or lower: 6 Signature\nSSS0 or higher: 6 Core / 6 Class'),
(92, 'Tenebrion', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Secondary', '[Pain Cage, Warzone, Norman, High Difficulty]\nMain DPS set\nSS3 or lower: 6 Signature\nSSS0 or higher: 6 Core'),
(93, 'Tenebrion', 'Hanna', 'Einsteina', '', 'Red', 'Class Passive', 'Niche', '[Pain Cage]\nQTE support for some Pain Cage strategies.'),
(94, 'Capriccio', 'Seraphine', 'Cottie', '', 'Attack Hp', 'Class Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral DPS set for all content.'),
(95, 'Capriccio', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Class Passive', 'Secondary', '[Pain Cage, High Difficulty]\nCan be used for more ultimates for stages with high survival pressure. Used in a select few Pain Cage strats for faster ultimate kills'),
(96, 'Capriccio', 'Seraphine', 'Guinevere', '', 'Attack Hp', 'Class Passive', 'Niche', '[Pain Cage]\nSet for quick Pain Cage kills against low difficulty bosses'),
(97, 'Capriccio', 'Seraphine', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nQTE Support and Sub DPS set when paired with solo DPS Luna.'),
(98, 'Capriccio', 'Seraphine', 'Darwin', '', 'Attack Hp', 'Core Passive', 'Niche', '[Pain Cage]\nQTE Support set. Stronger buff than Bathlon when paired with SSS Capriccio.'),
(99, 'Capriccio', 'Guinevere', 'Gloria', '', 'Attack Hp', 'Class Passive', 'Niche', '[Warzone, Norman, High Difficulty]\nMain DPS set, or Sub DPS set when paired with Astral.\nHanna matrixes help survivability for hard stages.\nNot recommended to invest much in.'),
(100, 'Scire', 'Boone', 'Condelina', '', 'Attack Hp', 'Core Passive', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SSS and lower\nClass passive is more versatile for the team, resonate 6 Core Passive instead if you want her to deal more damage.\nGeneral DPS set. Capriccio needs to ult as soon as possible, before the amplifier class passive runs out.'),
(101, 'Scire', 'Bathlon', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Secondary', '[Pain Cage, Warzone, Norman]\nQTE support for elemental teams. '),
(102, 'Scire', 'Boone', 'Einsteina', '', 'Attack Hp', 'Core Passive', 'Secondary', '[Pain Cage]\nRecommended SSS\nQTE support. Buff orientated set, paired with a Davinci tank for supporting a solo DPS.'),
(103, 'Scire', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Warzone, Norman, High Difficulty]\nAllows high rank Scire to carry Condelina\nRecommended SSS+ or SSS with Orb Resonance (Awkward to play)\nGeneral set, both supports and can sub DPS'),
(104, 'Scire', 'Boone', 'Cottie', '', 'Attack Hp', 'Core Passive', 'Niche', '[Pain Cage]\nDPS set for Pain Cage strats where Cottie damage isn\'t enough'),
(105, 'Rozen', 'Da Vinci', 'Guinevere', '', 'Attack Hp', 'Attack Hp', 'Main', '[Pain Cage]\nOnly for Empyrea one shot strategies, paired with Da Vinci'),
(106, 'Rozen', 'Guinevere', 'Gloria', 'Lantern Festival: Reunion', 'Attack Hp', 'Attack Hp', 'Niche', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nRecommended SS3 or higher\nMain DPS set\nCondelina boosts her leap and spin damage.'),
(107, 'Rozen', 'Bathlon', 'Cottie', '', 'Attack Hp', 'Core Passive', 'Niche', '[Pain Cage, Warzone, Norman]\nRecommended SS0 and lower\nJust borrow.\nQTE Support set. Paired with a support carrying Da Vinci. Allows Radiant to apply tank class off field via Bathlon field.'),
(108, 'Astral', 'Bathlon', 'Cottie', '', 'Attack Crit', 'Signature;Core Passive', 'Main', '[Warzone, Norman, High Difficulty]\nRecommeded SS0/SS3\nSub DPS set. Karenina has issues activating Einsteina for herself on field, but her damage at SS0 isn\'t significant enough to warrant another member to carry Einsteina. SS3 can also use if no other member is available to carry Einsteina.'),
(109, 'Astral', 'Bathlon', 'Darwin', '', 'Attack Crit', 'Core Passive', 'High', '[Pain Cage, Norman]\nRecommended SS0 and lower\nQTE Support when paired with SSS Capriccio and another DPS.'),
(110, 'XXI', 'Bathlon', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Main', '[Pain Cage]\nRecommended SS3 or higher\nAllows ult after 1 spin and a dodge. Used in Pain Cage for quicker ultimate kills.'),
(111, 'XXI', 'Da Vinci', 'Einsteina', '', 'Attack Hp', 'Class Passive', 'Niche', '[Pain Cage, Warzone, Norman, High Difficulty]\nGeneral QTE Support set for all content.'),
(112, 'Crocotta', 'Koya', '', '', '2 Red;2 Yellow;2 Blue', '', 'Main', '[Pain Cage]\nQTE Support for elemental teams\nPaired with a Da Vinci tank.'),
(113, 'Pavo', 'Wu\'an', '', '', 'Attack Crit', 'Signature', 'Main', '[Awakening Set | High Difficulty]\nDPS set\nCN Leap Set'),
(114, 'Tempest', 'Lucrezia', '', '', 'Attack Hp', 'Signature', 'Main', '[Awakening Set | Warzone, Norman, High Difficulty]\nDPS set with more frequent ultimates. Any mix of Signature/Core Passive works. \nLeap set'),
(115, 'Tempest', 'Lucrezia', '', '', 'Red;Blue', 'Attack Hp', 'Niche', '[Pain Cage, Warzone, Norman]\nDPS set, alternate option to Cottie. Better in shorter fights.\nLeap set'),
(116, 'Flambeau', 'Jack', '', '', 'Yellow', 'Signature', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral use QTE Support set, allows XXI to debuff on QTE.\nCan also be used for DPS on high difficulty stages.'),
(117, 'Dragontoll', 'Marco', '', '', 'Attack Crit', 'Signature', 'Main', '[Pain Cage, Warzone, Norman, High Difficulty]\nQTE support set, only use this if there is already someone carrying Bathlon on the team such as Astral or Tenebrion, and you don\'t plan on fielding her often.'),
(118, 'Starveil', 'Aisha', '', '', 'Attack Hp', 'Signature', 'Main', '[Awakening Set | Pain Cage, Warzone, Norman, High Difficulty]\nGeneral set. 12 Attack also fine.\nFor a more detailed comparison, read this.'),
(119, 'Arca', 'Shelly', '', '', 'Attack Hp', 'Core Passive', 'Main', '[Awakening Set | Norman, High Difficulty]');

-- --------------------------------------------------------

--
-- Table structure for table `team builder`
--

drop table if exists `team builder`;
CREATE TABLE `team builder` (
  `id` int(11) NOT NULL,
  `blue` text NOT NULL,
  `red` text NOT NULL,
  `yellow` text NOT NULL,
  `leader` text NOT NULL,
  `score` int(11) NOT NULL,
  `element` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `team builder`
  ADD PRIMARY KEY (`id`),
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  MODIFY `score` int(11) DEFAULT 0;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--
drop table if exists `teams`;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `blue` text NOT NULL,
  `red` text NOT NULL,
  `yellow` text NOT NULL,
  `leader` text NOT NULL,
  `competitive` char(1) NOT NULL,
  `score` int(11) NOT NULL,
  `element` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `blue`, `red`, `yellow`, `leader`, `competitive`, `score`, `element`) VALUES
(1, 'Echo', 'Stigmata', 'Rigor', 'Stigmata', 'Y', 0, 'Physical'),
(2, 'Echo', 'Crimson Abyss', 'Rigor', 'Crimson Abyss', 'Y', 0, 'Physical'),
(3, 'Luminance', 'Stigmata', 'Rigor', 'Stigmata', 'Y', 0, 'Physical'),
(4, 'Luminance', 'Crimson Abyss', 'Rigor', 'Crimson Abyss', 'Y', 0, 'Physical'),
(5, 'Luminance', 'Entropy', 'Rigor', 'Entropy', 'N', 0, 'Physical'),
(6, 'Eclipse', 'Blast', 'Storm', 'Blast', 'N', 0, 'Physical'),
(7, 'Empyrea', 'Hyperreal', 'Starfarer', 'Hyperreal', 'Y', 0, 'Fire'),
(8, 'Hyperreal', 'Empyrea', 'Starfarer', 'Hyperrreal', 'N', 0, 'Fire'),
(9, 'Pulse', 'Ember', 'Silverfang', 'Ember', 'N', 0, 'Fire'),
(10, 'Palefire', 'Silverfang', 'Brilliance', 'Palefire', 'N', 0, 'Fire'),
(11, 'Plume', 'Glory', 'Kaleido', 'Kaleido', 'Y', 0, 'Ice'),
(12, 'Vitrum', 'Hypnos', 'Qilin', 'Vitrum', 'N', 0, 'Ice'),
(13, 'Crimson Weave', 'Feral Scent', 'Garnet', 'Crimson Weave', 'Y', 0, 'Lightning'),
(14, 'Crimson Weave', 'Lux', 'Garnet', 'Crimson Weave', 'N', 0, 'Lightning'),
(15, 'Veritas', 'Lux', 'Garnet', 'Veritas', 'N', 0, 'Lightning'),
(16, 'Lux', 'Dawn', 'Arclight', 'Dawn', 'N', 0, 'Lightning'),
(17, 'Scire', 'Lost Lullaby', 'Capriccio', 'Lost Lullaby', 'Y', 0, 'Dark'),
(18, 'Scire', 'Laurel', 'Capriccio', 'Lauriel', 'Y', 0, 'Dark'),
(19, 'Rozen', 'Laurel', 'Scire', 'Lauriel', 'N', 0, 'Dark'),
(20, 'Rozen', 'Laurel', 'Tenebrion', 'Tenebrion', 'N', 0, 'Dark'),
(21, 'Rozen', 'Astral', 'XXI', 'Astral', 'N', 0, 'Dark');

-- --------------------------------------------------------

--
-- Table structure for table `weapon`
--
drop table if exists `weapon`;
CREATE TABLE `weapon` (
  `id` int(11) NOT NULL,
  `frame` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weapon`
--

INSERT INTO `weapon` (`id`, `frame`, `name`, `notes`) VALUES
(1, 'Lotus', 'Lotus Berserker', 'Basic Attack\'s Extra DMG Bonus increases by 10%. Physical DMG increases by 5% for 2s after each Basic Attack. Can be stacked up to 5 times. Duration resets every time it is triggered.'),
(2, 'Eclipse', 'Type Zero', 'Laser Shot\'s Extra DMG Bonus increases by 50%. Gains 15% ATK after a 3-Ping for 5s. Duration resets every time it is triggered.'),
(3, 'Storm', 'Inverse - Chimera', 'Attacks have a 20% chance to inflict Breach, dealing 2% Physical DMG per second for 3s. The chance is doubled if the enemy\'s DEF has been reduced. Can be stacked up to 10 times. Duration resets every time it is triggered. Physical DMG increases by 10% when attacking a Breached enemy.'),
(4, 'Dawn', 'Inverse - Shadow', 'Lightning DMG Bonus increases by 5% for 4s when dealing Lightning DMG. Can be stacked up to 4 times. Signature Move increases own Extra DMG Bonus by 10% for 10s. Both duration will reset every time it is triggered.'),
(5, 'Lux', 'Benediction', 'For every 12 orbs pinged, increases Extra DMG Bonus of the allies within 5m by 10% for 5s. Duration resets every time it is triggered. When attacking Imprisoned enemies, Extra DMG Bonus increases by 10%.'),
(6, 'Palefire', 'Wolf Fang', 'Extra DMG Bonus increases by 20% when attacking enemies in a burning area.'),
(7, 'Nightblade', 'Soul Ripper', 'Dealing a Critical Hit from behind inflicts Breach, dealing 50% Physical DMG per second for 3s. Duration resets every time it is triggered. Physical DMG increases by 20% when attacking a Breached enemy.'),
(8, 'Zero', 'Ramiel', 'Signature Move\'s Extra DMG Bonus increases by 15%. Signature Move reduces its target\'s Physical Resistance by 2% for 5s per hit. Can be stacked up to 8 times. Duration resets every time it is triggered.'),
(9, 'Blast', 'Berserk Fusion', 'Physical DMG increases by 10%. After a 3-Ping, Basic Attack\'s Extra DMG Bonus is increased by 30% for 5s. Duration resets every time it is triggered.'),
(10, 'Luminance', 'Dragon Wind', 'Basic Attacks have a 10% chance to inflict Frail, reducing the target\'s ATK by 10% for 5s. Duration resets every time it is triggered. Attacking a Frail enemy has a 10% chance to restore 1 Signal Orb. 6s cooldown.'),
(11, 'Entropy', 'Zero Scale', 'Increases Skill - Space Lord\'s Extra DMG Bonus by 10%. Physical DMG is increased by 15% for 5s after a 3-Ping. Duration resets every time it is triggered.'),
(12, 'Ember', 'Fusion Dragon', 'Fire DMG increases by 10%. Pinging Red Orbs increases Fire DMG by 10% for 5s. Duration resets every time it is triggered.'),
(13, 'Pulse', 'Hydro Heat', 'Attacks have a 10% chance to reduce the target\'s Fire Resistance by 5% for 5s. 8s cooldown against the same target. A Signature Move increases Fire DMG by 20% and doubles the chance of reducing the target\'s Resistance.'),
(14, 'Tenebrion', 'Darkness', 'After a 3-Ping, Physical DMG and Dark DMG dealt increase by 20% for 5s. Duration resets every time it is triggered.'),
(15, 'Crimson Abyss', 'Sakura', 'Each Ping increases Physical DMG by 2% for 5s, stacking up to a max of 10 times and repeated trigger refreshes duration. One Sword Orb can be additionally obtained when entering Sword State. 10s cooldown.'),
(16, 'Bastion', 'Big Kamui', 'Physical DMG increases by 15%. Upon a successful parry, Extra DMG Bonus of the next skill increases by 30%.'),
(17, 'Astral', 'Peacemaker', 'Extra DMG Bonus increases by 10%. Dark DMG increases by 10% while under Cosmic Wave state.'),
(18, 'Brilliance', 'Purple Peony', 'Extra DMG Bonus increases by 2% for 5s when dealing DMG to enemies with Super Armor. Can be stacked up to 3 times. Duration resets every time it is triggered. Stuns an enemy for 2s when breaking its Super Armor. 10s cooldown for the same target. Physical DMG increases by 15% for 7s when releasing Vector Cube. Duration resets every time it is triggered.'),
(19, 'Veritas', 'Tonitrus', 'Lightning DMG is increased by 15%. When dealing Lightning DMG caused by skills to the same target 5 times, calls down a lightning strike that deals 150% Lightning DMG. 2s cooldown.'),
(20, 'Silverfang', 'Scion', 'When picking up an Energy Ball, increases Extra DMG Bonus by 3% for 5s. Can be stacked up to 5 times. For every 5 Energy Balls picked up, gains an additional random Signal Orb and 10 Energy. 10s cooldown.'),
(21, 'Arclight', 'St. Elmo', 'Lightning DMG increases by 10%. No. of Lightning Strikes required to trigger Core Passive reduced to 3 under Signature - Lightning Charge.'),
(22, 'Plume', 'Crimson Birch', 'Ice DMG increases by 15%. DMG increases by 10% for 5s after 3-Ping.'),
(23, 'Rozen', 'Sariel', 'Dark DMG increases by 15%. Attacks have a 15% chance to unleash a shadow wave, dealing 75% Dark DMG. 0.5s cooldown.'),
(24, 'Crocotta', 'Thanatos', 'Extra DMG Bonus increases by 15%. When Camu: Crocotta enters Berserk, Thanatos will continuously increase Dark DMG for characters on the battlefield by 10%.'),
(25, 'Rigor', 'Gungnir', 'Damaging a target will reduce their Physical DEF by 20% for 8s. The duration is refreshed each time this effect is triggered. Dealing damage with small/medium/wide-area electromagnetic beam also applies a damage over time effect for 8s, dealing Physical DMG equal to 25% / 50% / 100% of ATK every second.'),
(26, 'Qilin', 'Baji', 'Ice DMG increases by 15%. Creates Mirror Crystals for 8s after casting Flowing Whirlpool or QTE skill.'),
(27, 'Pavo', 'Qinghe', 'Increases Physical DMG by 20% and Huiyu\'s attack frequency by 50%. Huiyu gains a new skill: Curse Incarnate. Curse Incarnate: Huiyu becomes a curse attached to the target, dealing up to 210% Physical DMG. It explodes after a short while to deal 240% Physical DMG. The DMG varies based on Qu\'s Signature Move level.'),
(28, 'Laurel', 'Ozma', 'The dark DMG increases by 15%, and the 4th spine of annihilation orb will produce additional 100% of ranged dark DMG.'),
(29, 'Hypnos', 'Scale', 'Ice DMG increases by 15%. Gain Frost Crystal for 8s when the backstep of Blooming Shot successfully dodges an attack.'),
(30, 'Tempest', 'Waldmeister', 'Lightning DMG increases by 20%. Roaring Thunder and Sonic Vortex can now be cast during the action of other Signal Orb skills, but cannot be cast consecutively. Leaving Chaotic M.I.N.D. will return Orbs based on the number of Orbs before entering Chaotic M.I.N.D. and rearrange them for 3-Ping.'),
(31, 'Glory', 'Apollo', 'Ice DMG increases by 15%, QTE and any 3-Ping skill can trigger Frost Corrosion (Reduces target\'s Ice Resistance).'),
(32, 'XXI', 'Snore', 'Wide-Energy Pressure Core: Whenever No. 21: XXI performs Shadow Prism attacks, a QTE, or disrupts incoming enemy attacks, the Co-Bot unleashes a Force Wave that deals 50% AOE Dark DMG to enemies (only triggers once per second).\nEnergy Suppression Unit: Hitting allies with Force Wave will grant them Energy Suppression for 3s. Energy Suppression: Dark DMG reduces the enemy\'s healing received by 100% for 3s.\n\nImpulse Fort Module: When the Force Wave detonates 6 Twilight Matrices at once, the Co-Bot enters Fortification mode, unleashing a hyper-pulse that deals Dark DMG equal to 411.76% of No. 21: XXI\'s ATK (DMG scales with Core Passive level).\n\nInver-Resonance Unit 2.0: Increases the Extra DMG Bonus of No. 21: XXI\'s Twilight Matrix and Resonance Pulse by 15%.'),
(33, 'Garnet', 'Phoenix', 'Lightning DMG increases by 15%. Victorious War Flag and Signature Move Shining Piercer can create another stack of Electric Charge. When Victorious War Flag is on the field, deploying Vera: Garnet will consume all of Electric Charge to cast Lightning Fall. Create another stack of Electric Charge afterward.'),
(34, 'Flambeau', 'Durendal', 'Fire DMG increases by 10%. The cooldown of consecutive dodge is removed. After dodging a damage, accumulates 1 Combo 2 - Dazzling Blade, which can be cast directly toward the direction of the joystick by tapping the White Orb. Also increases Extra DMG Bonus by 10% for 8s. During Apex of Trickery, the Deception Points generated from this combo are converted into 10 Trickery Points instead.'),
(35, 'Empyrea', 'Hestia', 'Liv: Empyrea gains 10% more ATK. Every time she enters the battlefield, she gains 50% Prayer. Fire DMG Bonus of Purity Oath against enemies affected by White Oracle increases by 20% (up to 100%).'),
(36, 'Capriccio', 'Sarastro', 'Each phantom unleashed by Selena: Capriccio on the field will make Selena: Capriccio deal 5% more Extra DMG. This effect can be stacked up to 6 times. Upon casting a Reprise: Echo, Selena: Capriccio gains 12 additional Signature Energy.'),
(37, 'Dragontoll', 'Infinity', 'Increases Physical DMG dealt by 15% and Base DMG of Signature - Spirit Blade Dance by 25%. CRIT Rate of Spirit Blade: Falling Stars increases by 30% for every Dragon Force Combo cast. (Can be stacked up to 2 times)'),
(38, 'Starfarer', 'Implosion', 'Fire DMG increases by 15%. When Nanami: Starfarer is on standby, her teammates\' every 3-Ping will restore 12 Signature Energy for her. Missiles will inflict Scorching Invasion upon hitting the target: reduces 15% Fire Resistance for 8s. When Nanami: Starfarer triggers the QTE, if there is Missile Support on the field, the duration of Missile Support will be refreshed.'),
(39, 'Starveil', 'Galatea', 'Bitter Frost deals 20% more Base DMG. Bitterfrost Level\'s Energy acquisition speed increases by 100%.'),
(40, 'Scire', 'Illuminare', 'The Chain Fusion effect applied by Karenina: Scire increases by 10%. Each time Karenina casts Radiant Whirlwind, she recovers 1 Energy. The Extra DMG Bonus of Leap Attack increases by 20%.'),
(41, 'Arca', 'Prometheus', 'ATK increases by 10%. Triggering Gear-Break Combo or Assault-Rising Combo restores 10 Signature Energy. Dodge Gauge restores 100% faster.'),
(42, 'Stigmata', 'Hecate', 'CRIT DMG increases by 30%. Upon entering the Sword Form, immediately gains 20 stacks of Stigmata Will and activate the Resolution status.'),
(43, 'Vitrum', 'Sound of Silence', 'ATK increases by 10%. Bambinata: Vitrum\'s Pas De Chat deals 15% more Ice DMG. Every time Bambinata: Vitrum is deployed, she will forget a random color of Signal Orbs for 1 Pact of Memory.'),
(44, 'Hyperreal', 'Key of Tempus Gate - Stokes', 'ATK increases by 10%. Casting Realm Travel will trigger Matrix if its not on cooldown. The first Hypermatrix Strike launched upon entering battle will generate 1 extra Sight Point.'),
(45, 'Kaleido', 'Star Voyager', 'ATK increases by 10%. Doubles the Base DMG buff towards The Final Touch granted by Vivid Brushwork. Frost Crystal now increases Ice DMG by 20%.'),
(46, 'Crimson Weave', 'Blazing Night', 'Increases ATK by 10%. When Lucia: Crimson Weave is in Odachi Stance, increase Extra DMG Bonus by 15%. The obtain rate of Aphotic Gauge increases by 40%.'),
(47, 'Zitherwoe', 'Perpetuity', 'Increases ATK by 10%. Hanying: Zitherwoe can immediately ping another set of Signal Orbs while using any Orb Skill. This effect cannot be triggered consecutively. The DMG bonus of each Glimmer stack increases to 40%.'),
(48, 'Ferel Scent', 'M?nagarmr', 'Increases ATK by 10%. No.21: Feral Scent gains 3 Signal Orbs of the same color upon entry or swapping in. Lightning Surge now increases Lightning DMG by 20%.'),
(49, 'Indomitus', 'Crimson Roar', 'ATK increases by 10%. Upon entry or swapping in, Noctis: Indomitus gains 120 Energy. Immediately gains one Explosive Orb upon activating Magnetic Pole Explosion.'),
(50, 'Echo', 'Astraea', 'Increases ATK by 10%. Base DMG of Heavenlight Edge increases by 15%. Every time Might reaches the maximum value, gain a Signal Orb and a Mantra Orb of the same color. Ultralimit Torque now increases Physical DMG by 20%.'),
(51, 'Lost Lullaby', 'Metis', 'ATK increases by 10%. The rate in which Lamia accumulates Abussos Points increases by 100%. When pinging a Tidal Orb, trigger Matrix if available.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bosses`
--
ALTER TABLE `bosses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Indexes for table `character notes`
--
ALTER TABLE `character notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frame` (`frame`) USING HASH;

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frame` (`frame`) USING HASH;

--
-- Indexes for table `memory set`
--
ALTER TABLE `memory set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weapon`
--
ALTER TABLE `weapon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frame` (`frame`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bosses`
--
ALTER TABLE `bosses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
