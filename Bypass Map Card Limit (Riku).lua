LUAGUI_NAME = "Bypass Map Card Limit (Riku)"
LUAGUI_AUTH = "ColossusSteppes"
LUAGUI_DESC = "Gives Riku  95 of Moment's Reprieve 2, 3, and 4, bypassing the 99 map card limit. Original 'All Map Cards' mod by KSX."

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
		ConsolePrint("Bypass Map Card Limit (Riku) (EPIC GL) - installed")
	end
	
	if ReadLong(IsSteamGLVersion) == 0x7265737563697065 and stmgames == 0 then
		stmgames = 1
		ConsolePrint("Bypass Map Card Limit (Riku) (Steam GL) - installed")
	end
	
	if ReadLong(IsSteamJPVersion) == 0x7265737563697065 and stmjpgames == 0 then
		stmjpgames = 1
		ConsolePrint("Bypass Map Card Limit (Riku) (Steam JP) - installed")
	end

---------- Epic Games Version
if epicgames == 1 then

IngameCheck = 0xAC3F00
MapCards = ReadLong(0x87A1E8)+0x396, true
Key = ReadLong(0x87A1E8+0x8)+0x2, true
DReportMapCardFlags = ReadLong(0x87C608)+0x1CE, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+212, 95, true) -- Moment´s Reprieve #2
WriteByte(MapCards+213, 95, true) -- Moment´s Reprieve #3
WriteByte(MapCards+214, 95, true) -- Moment´s Reprieve #4

end
end

---------- Steam Version
if stmgames == 1 then
IngameCheck = 0xAC4474
MapCards = ReadLong(0x87A7E8)+0x396, true
Key = ReadLong(0x87A7E8+0x8)+0x2, true
DReportMapCardFlags = ReadLong(0x87CC08)+0x1CE, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+212, 95, true) -- Moment´s Reprieve #2
WriteByte(MapCards+213, 95, true) -- Moment´s Reprieve #3
WriteByte(MapCards+214, 95, true) -- Moment´s Reprieve #4

end
end

---------- Steam JP Version
if stmjpgames == 1 then
IngameCheck = 0xAC4474
MapCards = ReadLong(0x87A7E8)+0x396, true
Key = ReadLong(0x87A7E8+0x8)+0x2, true
DReportMapCardFlags = ReadLong(0x87CC08)+0x1CE, true

if ReadByte(IngameCheck) >= 1 then
WriteByte(MapCards+212, 95, true) -- Moment´s Reprieve #2
WriteByte(MapCards+213, 95, true) -- Moment´s Reprieve #3
WriteByte(MapCards+214, 95, true) -- Moment´s Reprieve #4

end
end
end
