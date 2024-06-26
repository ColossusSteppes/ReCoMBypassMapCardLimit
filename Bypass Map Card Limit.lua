LUAGUI_NAME = "Bypass Map Card Limit"
LUAGUI_AUTH = "ColossusSteppes"
LUAGUI_DESC = "Gives you 99 of Moment's Reprieve #1 and #2, bypassing the 99 map card limit. Original 'All Map Cards' mod by KSX."

IsEpicGLVersion = 0x4E6C80
IsSteamGLVersion = 0x4E7040
IsSteamJPVersion = 0x4E6DC0


-------------------------------------------------------------------------
function _OnInit()
	if ENGINE_TYPE == "BACKEND" then
	end
	
	if ReadByte(IsEpicGLVersion) == 0xFF then
		epicgames = 1
		ConsolePrint("All Map Cards (EPIC GL) - installed")
	end
	
	if ReadByte(IsSteamGLVersion) == 0xFF then
		stmgames = 1
		ConsolePrint("All Map Cards (Steam GL) - installed")
	end
	
	if ReadByte(IsSteamJPVersion) == 0xFF then
		stmjpgames = 1
		ConsolePrint("All Map Cards (Steam JP) - installed")
	end

end
-------------------------------------------------------------------------
function _OnFrame()

---------- Epic Games Version
if epicgames == 1 then
IngameCheck = 0xAC3E00
MapCards = ReadLong(0x87A0E8)+0x396, true
Key = ReadLong(0x87A0F0)+0x2, true
JournalMapCardFlags = ReadLong(0x87A0E8)+0xF53, true
DReportMapCardFlags = ReadLong(0x87A0E8)+0xF9A, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+211, 99, true) -- Moment´s Reprieve #1
WriteByte(MapCards+212, 99, true) -- Moment´s Reprieve #2

if ReadByte(JournalMapCardFlags+21, true) <= 1 then -- Moment´s Reprieve
	WriteByte(JournalMapCardFlags+21, 4, true)
end
end
end

---------- Steam Version
if stmgames == 1 then
IngameCheck = 0xAC4474
MapCards = ReadLong(0x87A7E8)+0x396, true
Key = ReadLong(0x87A7F0)+0x2, true
JournalMapCardFlags = ReadLong(0x87A7E8)+0xF53, true
DReportMapCardFlags = ReadLong(0x87A7E8)+0xF9A, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+211, 99, true) -- Moment´s Reprieve #1
WriteByte(MapCards+212, 99, true) -- Moment´s Reprieve #2


if ReadByte(JournalMapCardFlags+21, true) <= 1 then -- Moment´s Reprieve
	WriteByte(JournalMapCardFlags+21, 4, true)
end
end

end

---------- Steam JP Version
if stmjpgames == 1 then

IngameCheck = 0xAC4474
MapCards = ReadLong(0x87A7E8)+0x396, true
Key = ReadLong(0x87A7F0)+0x2, true
JournalMapCardFlags = ReadLong(0x87A7E8)+0xF53, true
DReportMapCardFlags = ReadLong(0x87A7E8)+0xF9A, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+211, 99, true) -- Moment´s Reprieve #1
WriteByte(MapCards+212, 99, true) -- Moment´s Reprieve #2

if ReadByte(JournalMapCardFlags+21, true) <= 1 then -- Moment´s Reprieve
	WriteByte(JournalMapCardFlags+21, 4, true)
end
end

end
end