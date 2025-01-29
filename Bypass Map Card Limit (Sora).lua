LUAGUI_NAME = "Bypass Map Card Limit (Sora)"
LUAGUI_AUTH = "ColossusSteppes"
LUAGUI_DESC = "Gives Sora 99 of Moment's Reprieve #1, #2, and #3, bypassing the 99 map card limit. Original 'All Map Cards' mod by KSX."

IsEpicGLVersion = 0x616149
IsSteamGLVersion = 0x6116C1
IsSteamJPVersion = 0x611671


-------------------------------------------------------------------------
function _OnInit()
	if ENGINE_TYPE == "BACKEND" then
	epicgames = 0
	stmgames = 0
	stmjpgames = 0
	end

end
-------------------------------------------------------------------------
function _OnFrame()

	if ReadLong(IsEpicGLVersion) == 0x7265737563697065 and epicgames == 0 then
		epicgames = 1
		ConsolePrint("Bypass Map Card Limit (Sora) (EPIC GL) - installed")
	end
	
	if ReadLong(IsSteamGLVersion) == 0x7265737563697065 and stmgames == 0 then
		stmgames = 1
		ConsolePrint("Bypass Map Card Limit (Sora) (Steam GL) - installed")
	end
	
	if ReadLong(IsSteamJPVersion) == 0x7265737563697065 and stmjpgames == 0 then
		stmjpgames = 1
		ConsolePrint("Bypass Map Card Limit (Sora) (Steam JP) - installed")
	end

---------- Epic Games Version
if epicgames == 1 then

IngameCheck = 0xAC3F00
MapCards = ReadLong(0x87A1E8)+0x396, true
Key = ReadLong(0x87A1E8+0x8)+0x2, true
JournalMapCardFlags = ReadLong(0x87C608)+0x187, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+211, 99, true) -- Moment´s Reprieve #1
WriteByte(MapCards+212, 99, true) -- Moment´s Reprieve #2
WriteByte(MapCards+213, 99, true) -- Moment´s Reprieve #3

if ReadByte(JournalMapCardFlags+21, true) <= 1 then -- Moment´s Reprieve
	WriteByte(JournalMapCardFlags+21, 4, true)
end

end
end

---------- Steam Version
if stmgames == 1 then
IngameCheck = 0xAC4474
MapCards = ReadLong(0x87A7E8)+0x396, true
Key = ReadLong(0x87A7E8+0x8)+0x2, true
JournalMapCardFlags = ReadLong(0x87CC08)+0x187, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+211, 99, true) -- Moment´s Reprieve #1
WriteByte(MapCards+212, 99, true) -- Moment´s Reprieve #2
WriteByte(MapCards+213, 99, true) -- Moment´s Reprieve #3

if ReadByte(JournalMapCardFlags+21, true) <= 1 then -- Moment´s Reprieve
	WriteByte(JournalMapCardFlags+21, 4, true)
end

end
end

---------- Steam JP Version
if stmjpgames == 1 then
IngameCheck = 0xAC4474
MapCards = ReadLong(0x87A7E8)+0x396, true
Key = ReadLong(0x87A7E8+0x8)+0x2, true
JournalMapCardFlags = ReadLong(0x87CC08)+0x187, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+211, 99, true) -- Moment´s Reprieve #1
WriteByte(MapCards+212, 99, true) -- Moment´s Reprieve #2
WriteByte(MapCards+213, 99, true) -- Moment´s Reprieve #3

if ReadByte(JournalMapCardFlags+21, true) <= 1 then -- Moment´s Reprieve
	WriteByte(JournalMapCardFlags+21, 4, true)
end

end
end
end