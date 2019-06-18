<?xml version="1.0" encoding="UTF-8"?>
<monster name="undead dragon" nameDescription="a undead dragon" race="undead" experience="7200" speed="300" manacost="0">
  <health now="8350" max="8350"/>
  <look type="231" corpse="6306"/>
  <targetchange interval="5000" chance="8"/>
  <strategy attack="100" defense="0"/>
  <flags>
    <flag summonable="0"/>
    <flag attackable="1"/>
    <flag hostile="1"/>
    <flag illusionable="1"/>
    <flag convinceable="0"/>
    <flag pushable="0"/>
    <flag canpushitems="1"/>
    <flag canpushcreatures="1"/>
    <flag targetdistance="1"/>
    <flag staticattack="90"/>
    <flag runonhealth="0"/>
  </flags>
  <attacks>
    <attack name="melee" interval="2000" skill="125" attack="115"/>

    <attack name="fire" interval="2000" chance="20" range="7" radius="4" target="1" min="-400" max="-595">
      <attribute key="shootEffect" value="fire"/>
      <attribute key="areaEffect" value="redspark"/>
    </attack>

    <attack name="death" interval="3000" chance="20" range="7" min="-100" max="-600">
      <attribute key="shootEffect" value="suddendeath"/>
    </attack>

    <attack name="poison" interval="2000" chance="20" range="7" radius="4" target="1" min="-220" max="-490">
      <attribute key="shootEffect" value="poison"/>
      <attribute key="areaEffect" value="poison"/>
    </attack>

    <attack name="poison" interval="1000" chance="10" range="7" min="-80" max="-280">
      <attribute key="shootEffect" value="poison"/>
      <attribute key="areaEffect" value="poison"/>
    </attack>

    <attack name="fire" interval="4000" chance="25" length="8" spread="3" min="-500" max="-600">
      <attribute key="areaEffect" value="firearea"/>
    </attack>

    <attack name="poison" interval="2000" chance="23" length="8" spread="3" min="-200" max="-685">
      <attribute key="areaEffect" value="poison"/>
    </attack>

    <attack name="lifedrain" interval="3000" chance="25" length="8" spread="3" min="-300" max="-600">
      <attribute key="areaEffect" value="greenshimmer"/>
    </attack>

  </attacks>
  <defenses armor="35" defense="30">
  </defenses>
	<elements>
		<element physicalPercent="10"/>
		<element icePercent="10"/>
		<element holyPercent="-10"/>
	</elements>
  <immunities>
    <immunity death="1"/>
    <immunity earth="1"/>
    <immunity fire="1"/>
    <immunity drown="1"/>
    <immunity lifedrain="1"/>
    <immunity paralyze="1"/>
    <immunity invisible="1"/>
  </immunities>
  <voices interval="5000" chance="10">
    <voice sentence="FEEEED MY ETERNAL HUNGER!"/>

  </voices>
	<loot>
		<item id="2148" chance="100000" countmax="100" /> -- gold coin
		<item id="2152" chance="49000" countmax="5" /> -- platinum coin
		<item id="2236" chance="6667" /> -- torn book
		<item id="2413" chance="4000" /> -- broad sword
		<item id="1987" chance="100000" > -- bag
		<item id="2498" chance="3333"/> --Royal Helmet
		<item id="2492" chance="1400"/> --DSM
			<inside>
				<item id="6500" chance="1818" countmax="1" /> -- demonic essence
				<item id="5944" chance="1538" countmax="1" /> -- soul orb
				<item id="2547" chance="4000" countmax="15" /> -- power bolt
				<item id="2466" chance="2888"/> --Golden armor
				<item id="2454" chance="2400"/> --War Axe
				<item id="2476" chance="5400"/> --Knight armor
				<item id="8910" chance="4444"/> --Underworld rod
			</inside>
		</item>
	</loot>
</monster>
