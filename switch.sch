<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.3.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ESP8266">
<packages>
<package name="ESP-01">
<pad name="P$1" x="0" y="0" drill="0.8" diameter="1.4224"/>
<pad name="P$2" x="2.54" y="0" drill="0.8" diameter="1.4224"/>
<pad name="P$3" x="5.08" y="0" drill="0.8" diameter="1.4224"/>
<pad name="P$4" x="7.62" y="0" drill="0.8" diameter="1.4224"/>
<pad name="P$5" x="7.62" y="2.54" drill="0.8" diameter="1.4224"/>
<pad name="P$6" x="5.08" y="2.54" drill="0.8" diameter="1.4224"/>
<pad name="P$7" x="2.54" y="2.54" drill="0.8" diameter="1.4224"/>
<pad name="P$8" x="0" y="2.54" drill="0.8" diameter="1.4224"/>
<wire x1="-3.175" y1="-1.905" x2="10.795" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-3.175" y1="-1.905" x2="-3.175" y2="22.86" width="0.127" layer="21"/>
<wire x1="-3.175" y1="22.86" x2="10.795" y2="22.86" width="0.127" layer="21"/>
<wire x1="10.795" y1="22.86" x2="10.795" y2="-1.905" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="ESP8266-01">
<description>ESP8266 - ESP-01 Module</description>
<pin name="GPIO0" x="0" y="0" length="middle"/>
<pin name="GPIO2" x="0" y="5.08" length="middle"/>
<pin name="VCC" x="0" y="15.24" length="middle"/>
<pin name="GND" x="33.02" y="0" length="middle" rot="R180"/>
<pin name="UTXD" x="33.02" y="5.08" length="middle" rot="R180"/>
<pin name="URXD" x="33.02" y="10.16" length="middle" rot="R180"/>
<pin name="RST" x="33.02" y="15.24" length="middle" rot="R180"/>
<pin name="CH_PD" x="0" y="10.16" length="middle"/>
<wire x1="5.08" y1="-2.54" x2="27.94" y2="-2.54" width="0.254" layer="94"/>
<wire x1="27.94" y1="-2.54" x2="27.94" y2="20.32" width="0.254" layer="94"/>
<wire x1="27.94" y1="20.32" x2="5.08" y2="20.32" width="0.254" layer="94"/>
<wire x1="5.08" y1="20.32" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<text x="7.62" y="17.78" size="1.27" layer="94">ESP8266</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ESP8266-01">
<description>ESP8266 - ESP-01 Module</description>
<gates>
<gate name="G$1" symbol="ESP8266-01" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ESP-01">
<connects>
<connect gate="G$1" pin="CH_PD" pad="P$2"/>
<connect gate="G$1" pin="GND" pad="P$8"/>
<connect gate="G$1" pin="GPIO0" pad="P$6"/>
<connect gate="G$1" pin="GPIO2" pad="P$7"/>
<connect gate="G$1" pin="RST" pad="P$3"/>
<connect gate="G$1" pin="URXD" pad="P$5"/>
<connect gate="G$1" pin="UTXD" pad="P$1"/>
<connect gate="G$1" pin="VCC" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="+3V3" prefix="+3V3">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-wago-508">
<description>&lt;b&gt;Wago Screw Clamps&lt;/b&gt;&lt;p&gt;
Grid 5.08 mm&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="W237-3E">
<description>&lt;b&gt;WAGO SREW CLAMP&lt;/b&gt;</description>
<wire x1="-6.0706" y1="-1.651" x2="-4.064" y2="0.3556" width="0.254" layer="51"/>
<wire x1="-0.9144" y1="-1.6764" x2="0.9906" y2="0.3556" width="0.254" layer="51"/>
<wire x1="4.0894" y1="-1.651" x2="6.096" y2="0.3556" width="0.254" layer="51"/>
<wire x1="-7.62" y1="-4.826" x2="7.62" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-4.826" x2="-7.62" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-2.413" x2="-7.62" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-2.413" x2="-6.096" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="-2.413" x2="-4.064" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="-4.064" y1="-2.413" x2="-1.016" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-2.413" x2="4.064" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-2.413" x2="7.62" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="4.191" x2="7.62" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="4.191" x2="-7.62" y2="4.445" width="0.1524" layer="21"/>
<wire x1="7.62" y1="4.445" x2="7.62" y2="4.191" width="0.1524" layer="21"/>
<wire x1="7.62" y1="4.445" x2="-7.62" y2="4.445" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-2.413" x2="7.62" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="7.62" y1="4.191" x2="7.62" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-2.413" x2="6.096" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="-1.016" y1="-2.413" x2="1.016" y2="-2.413" width="0.1524" layer="51"/>
<circle x="-5.08" y="-0.635" radius="1.4986" width="0.1524" layer="51"/>
<circle x="-5.08" y="2.8448" radius="0.508" width="0.1524" layer="21"/>
<circle x="0" y="-0.635" radius="1.4986" width="0.1524" layer="51"/>
<circle x="0" y="2.8448" radius="0.508" width="0.1524" layer="21"/>
<circle x="5.08" y="-0.635" radius="1.4986" width="0.1524" layer="51"/>
<circle x="5.08" y="2.8448" radius="0.508" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="-0.635" drill="1.1938" shape="long" rot="R90"/>
<pad name="2" x="0" y="-0.635" drill="1.1938" shape="long" rot="R90"/>
<pad name="3" x="5.08" y="-0.635" drill="1.1938" shape="long" rot="R90"/>
<text x="-6.985" y="1.27" size="1.27" layer="51" ratio="10">1</text>
<text x="-1.8542" y="1.2192" size="1.27" layer="51" ratio="10">2</text>
<text x="-6.35" y="-4.318" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.35" y="-6.858" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.175" y="1.27" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="W237-132">
<description>&lt;b&gt;WAGO SREW CLAMP&lt;/b&gt;</description>
<wire x1="-3.5306" y1="-1.651" x2="-1.524" y2="0.3556" width="0.254" layer="51"/>
<wire x1="1.6256" y1="-1.6764" x2="3.5306" y2="0.3556" width="0.254" layer="51"/>
<wire x1="-5.08" y1="4.191" x2="5.08" y2="4.191" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-4.826" x2="5.08" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-4.826" x2="-5.08" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.191" x2="-5.08" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.413" x2="-3.429" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.413" x2="-1.651" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="-2.413" x2="1.651" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-2.413" x2="5.08" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.413" x2="-5.08" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-2.413" x2="5.08" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.191" x2="-5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="4.445" x2="5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="5.08" y1="4.191" x2="5.08" y2="4.445" width="0.1524" layer="21"/>
<wire x1="1.651" y1="-2.413" x2="3.429" y2="-2.413" width="0.1524" layer="51"/>
<circle x="-2.54" y="-0.635" radius="1.4986" width="0.1524" layer="51"/>
<circle x="-2.54" y="2.8448" radius="0.508" width="0.1524" layer="21"/>
<circle x="2.54" y="-0.635" radius="1.4986" width="0.1524" layer="51"/>
<circle x="2.54" y="2.8448" radius="0.508" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="-0.635" drill="1.1938" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="-0.635" drill="1.1938" shape="long" rot="R90"/>
<text x="-4.445" y="1.27" size="1.27" layer="51" ratio="10">1</text>
<text x="0.6858" y="1.2192" size="1.27" layer="51" ratio="10">2</text>
<text x="-3.81" y="-6.985" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.81" y="-4.318" size="1.27" layer="25" ratio="10">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="KL">
<wire x1="1.778" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<circle x="0.889" y="0" radius="0.898" width="0.254" layer="94"/>
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="KL+V">
<wire x1="1.778" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<circle x="0.889" y="0" radius="0.898" width="0.254" layer="94"/>
<text x="0" y="2.54" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.27" y="0.889" size="1.778" layer="95" rot="R180">&gt;NAME</text>
<pin name="KL" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="W237-3E" prefix="X" uservalue="yes">
<description>&lt;b&gt;WAGO SREW CLAMP&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="KL" x="0" y="7.62" addlevel="always"/>
<gate name="-2" symbol="KL" x="0" y="2.54" addlevel="always"/>
<gate name="-3" symbol="KL+V" x="0" y="-2.54" addlevel="always"/>
</gates>
<devices>
<device name="" package="W237-3E">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-2" pin="KL" pad="2"/>
<connect gate="-3" pin="KL" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="W237-02P" prefix="X" uservalue="yes">
<description>&lt;b&gt;WAGO SREW CLAMP&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="KL" x="0" y="0" addlevel="always"/>
<gate name="-2" symbol="KL+V" x="0" y="-5.08" addlevel="always"/>
</gates>
<devices>
<device name="" package="W237-132">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-2" pin="KL" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="ESP8266" deviceset="ESP8266-01" device=""/>
<part name="+3V1" library="supply1" deviceset="+3V3" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="X1" library="con-wago-508" deviceset="W237-3E" device=""/>
<part name="X2" library="con-wago-508" deviceset="W237-02P" device=""/>
<part name="X4" library="con-wago-508" deviceset="W237-3E" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="12.7" y="60.96"/>
<instance part="+3V1" gate="G$1" x="5.08" y="78.74"/>
<instance part="GND1" gate="1" x="45.72" y="50.8"/>
<instance part="X1" gate="-1" x="73.66" y="63.5" rot="R180"/>
<instance part="X1" gate="-2" x="73.66" y="68.58" rot="R180"/>
<instance part="X1" gate="-3" x="73.66" y="73.66" rot="R180"/>
<instance part="X2" gate="-1" x="-27.94" y="73.66"/>
<instance part="X2" gate="-2" x="-27.94" y="68.58"/>
<instance part="X4" gate="-1" x="-27.94" y="58.42"/>
<instance part="X4" gate="-2" x="-27.94" y="48.26"/>
<instance part="X4" gate="-3" x="-27.94" y="43.18"/>
</instances>
<busses>
</busses>
<nets>
<net name="+3V3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="VCC"/>
<pinref part="U$1" gate="G$1" pin="CH_PD"/>
<wire x1="12.7" y1="76.2" x2="12.7" y2="71.12" width="0.1524" layer="91"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<wire x1="5.08" y1="76.2" x2="12.7" y2="76.2" width="0.1524" layer="91"/>
<wire x1="5.08" y1="76.2" x2="5.08" y2="73.66" width="0.1524" layer="91"/>
<wire x1="5.08" y1="73.66" x2="-2.54" y2="73.66" width="0.1524" layer="91"/>
<pinref part="X2" gate="-1" pin="KL"/>
<wire x1="-2.54" y1="73.66" x2="-22.86" y2="73.66" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="73.66" x2="-2.54" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="43.18" x2="-22.86" y2="43.18" width="0.1524" layer="91"/>
<pinref part="X4" gate="-3" pin="KL"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="45.72" y1="60.96" x2="55.88" y2="60.96" width="0.1524" layer="91"/>
<wire x1="45.72" y1="60.96" x2="45.72" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="53.34" x2="45.72" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="58.42" x2="-5.08" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="58.42" x2="-5.08" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="58.42" x2="-5.08" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X2" gate="-2" pin="KL"/>
<wire x1="-22.86" y1="68.58" x2="-5.08" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X1" gate="-3" pin="KL"/>
<wire x1="68.58" y1="73.66" x2="55.88" y2="73.66" width="0.1524" layer="91"/>
<wire x1="55.88" y1="60.96" x2="55.88" y2="73.66" width="0.1524" layer="91"/>
<pinref part="X4" gate="-1" pin="KL"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="UTXD"/>
<pinref part="X1" gate="-1" pin="KL"/>
<wire x1="45.72" y1="66.04" x2="68.58" y2="66.04" width="0.1524" layer="91"/>
<wire x1="68.58" y1="66.04" x2="68.58" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="48.26" y1="68.58" x2="48.26" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="URXD"/>
<wire x1="48.26" y1="71.12" x2="45.72" y2="71.12" width="0.1524" layer="91"/>
<pinref part="X1" gate="-2" pin="KL"/>
<wire x1="48.26" y1="68.58" x2="68.58" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO0"/>
<wire x1="12.7" y1="48.26" x2="12.7" y2="60.96" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="48.26" x2="12.7" y2="48.26" width="0.1524" layer="91"/>
<pinref part="X4" gate="-2" pin="KL"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
