local component = require("component")
local fs = require("filesystem")
local term = require("term")
local shell = require("shell")
local args = shell.parse(...)

local td = component.tape_drive
local dt = component.data
local limit = dt.getLimit()
local prgVer = 'V2.5 alpha' -- 


if not component.isAvailable("tape_drive") then
  io.stderr:write("This program requires a tape drive to run.")
  return
end

if not component.isAvailable("data") then
  io.stderr:write("This program requires a data card to run.")
  return
end

--some settings
local datalvl = 2 --data card level. (1, 2, 3) WIP
local bytespeed = 1 
local fstyp = "MTFS-1###"
local fblock = true -- use fixed blocks or not 
local blocksz = 4096 -- block size (4k)


-- system constants
local tape_end = "Ђ"
local tape_begin = "Ѓ"
local blockdata = ""
local KB = 1024
-- system constants end

local function help() --help
print('help v.1.1')
print('read - reads the entire contents, file, or folder.usage: [streamer read -all, -file -folder or -path <path>]')
print('write - writes data to the "tape". usage: [streamer write -path <full path to a file or folder> -folder or-file , -c {copies files to the "tape"} or -m {moves files to the tape}')
print('format - formats {prepares or clears the "tape" for future use in the file system} usage: [streamer format]')
print('check - checks the file system for integrity. usage: [streamer check]')
print('backup - makes a full copy of the tape to another tape. for this command to work, you must have 2 or more streamers. the cassettes must be the same length, or the spare cassette may be larger than the one being copied. in this case, the remaining space on the cassette is not used. usage: [streamer backup -a1 <address of the first streamer> -a2 <address of the second streamer>]')
print('debug - some debug information.')
end

local function debugfs() --size information (debug)
local size = td.getSize()
print('limit of data card: '..limit)
print('cassette size: '..size..' bytes, '..size/KB..' Kbytes.')
print('current state: '..td.getState()..', current pos: '..td.getPosition()..', current label: '..td.getLabel())
print('PRG. FS type = '..fstyp)
local ans = size/blocksz
local a, b = math.modf(ans)   --returns the integer part to the variable 'a' and the fractional part to the variable 'b'  
if (b == 0) then                                    --  :kostyl: 
 print('divided equally into swamps: true')         --  :kostyl:  
  else                                              --  :kostyl:  
   print('divided equally into swamps: false')      --  :kostyl:  
end                                                 --  :kostyl:
print('a='..a..' b='..b)                                                
print('blocks are placed on the tape:'..ans)
print('entire blocks are placed on the tape:'..a)
print('raw size of the cassette in the file system:'..a*blocksz..' bytes, '..(a*blocksz)/KB..' Kbytes')
--print('lost space:'..size-a*blocksz..' bytes)
end

local function readfs() --reading file system function
print("readfs v.1.0")

end

local function writefs()--writing file system function 
print("writefs v.1.0")

end

local function formatfs()-- formats blank "tape".
print("formatfs v.1.0")

if not td.isReady() then
io.stderr:write("tape not inserted.")
  return
end
local size = td.getSize()
print ("size = "..size.."bytes, "..size/KB.." Kbytes.")   


end

local function checkfs()-- WIP
print("checkfs v.1.0")


local size = td.getSize()
end

--auxiliary function
-- temporary functions 
local function label(name)
  if not name then
    if tape.getLabel() == "" then
      print("Tape is currently not labeled.")
      return
    end
    print("Tape is currently labeled: " .. tape.getLabel())
    return
  end
  tape.setLabel(name)
  print("Tape label set to " .. name)
end

local function rewind()
  print("Rewound tape")
  tape.seek(-tape.getSize())
end

local function speed(sp)
  local s = tonumber(sp)
  if not s or s < 0.25 or s > 2 then
    io.stderr:write("Speed needs to be a number between 0.25 and 2.0")
    return
  end
  tape.setSpeed(s)
  print("Playback speed set to " .. sp)
end

local function confirm(msg)
  if not options.y then
    print(msg)
    print("Type `y` to confirm, `n` to cancel.")
    repeat
      local response = io.read()
      if response and response:lower():sub(1, 1) == "n" then
        print("Canceled.")
        return false
      end
    until response and response:lower():sub(1, 1) == "y"
  end
  return true
end

local function wipe()
  if not confirm("Are you sure you want to wipe this tape?") then return end
  local k = tape.getSize()
  tape.stop()
  tape.seek(-k)
  tape.stop() --Just making sure
  tape.seek(-90000)
  local s = string.rep("\xAA", 8192)
  for i = 1, k + 8191, 8192 do
    tape.write(s)
  end
  tape.seek(-k)
  tape.seek(-90000)
  print("Done.")
end
-- temporary functions end 

local function wr64(datawr)
local datawrin = dt.encode64(datawr)
end

local function rd64(datard)
local datardout = dt.decode64(datard)
end
--auxiliary functions end





if args[1] == "check" then
 checkfs()
elseif args[1] == "format" then
 formatfs()
elseif args[1] == "write" then
 writefs()
elseif args[1] == "read" then
 readfs()
 elseif args[1] == "debug" then
 debugfs()
else
 help()
end
