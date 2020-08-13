local names = {
  [10] = "A",
  [11] = "B",
  [12] = "C",
  [13] = "D",
  [14] = "E",
  [15] = "F",
  [16] = "G",
  [17] = "H",
  [18] = "I",
  [19] = "J",
  [20] = "K",
  [21] = "L",
  [22] = "M",
  [23] = "N",
  [24] = "O",
  [25] = "P",
  [26] = "Q",
  [27] = "R",
  [28] = "S",
  [29] = "T",
  [30] = "U",
  [31] = "V",
  [32] = "W",
  [33] = "X",
  [34] = "Y",
  [35] = "Z",
  A = 10,
  B = 11,
  C = 12,
  D = 13,
  E = 14,
  F = 15,
  G = 16,
  H = 17,
  I = 18,
  J = 19,
  K = 20,
  L = 21,
  M = 22,
  N = 23,
  O = 24,
  P = 25,
  Q = 26,
  R = 27,
  S = 28,
  T = 29,
  U = 30,
  V = 31,
  W = 32,
  X = 33,
  Y = 34,
  Z = 35
}
local toDec
toDec = function(input, base)
  if base > 11 then
    input = string.upper(input)
  end
  local sum = 0
  local num = string.len(input)
  for i = 1, num do
    local number = string.sub(input, -i, -i)
    if names[number] then
      sum = sum + names[number] * base ^ (i - 1)
    else
      sum = sum + tonumber(number * base ^ (i - 1))
    end
  end
  return sum
end
 local fromDec
fromDec = function(input, base)
  local hexstr = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  local s = ''
  while input > 0 do
    local mod = math.fmod(input, base)
    s = string.sub(hexstr, mod + 1, mod + 1) .. s
    input = math.floor(input / base)
  end
  if s == '' then
    s = '0'
  end
  return s
end
local CustomInteger
do
  local _class_0
  local _base_0 = {
    to = function(self, base)
      if base then
        if base == 10 then
          return toDec(self.int, self.base)
        else
          local dec = toDec(self.int, self.base)
          return fromDec(dec, base)
        end
      end
    end,
    __tostring = function(self)
      return self.int
    end,
    __add = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return left + right
    end,
    __sub = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return left - right
    end,
    __mul = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return left * right
    end,
    __div = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return left / right
    end,
    __mod = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return left % right
    end,
    __unm = function(a)
      local left = type(a) == "number" and a or a:to(10)
      return -left
    end,
    __pow = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return left ^ right
    end,
    __concat = function(a, b)
      local left = a
      local right = b
      return tostring(left) .. tostring(right)
    end,
    __eq = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return tostring(left) == tostring(right)
    end,
    __lt = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return tostring(left) < tostring(right)
    end,
    _le = function(a, b)
      local left = type(a) == "number" and a or a:to(10)
      local right = type(b) == "number" and b or b:to(10)
      return tostring(left) <= tostring(right)
    end,
    __inherited = function(self, cls)
      cls.__base.__add = self.__add
      cls.__base.__sub = self.__sub
      cls.__base.__mul = self.__mul
      cls.__base.__div = self.__div
      cls.__base.__mod = self.__mod
      cls.__base.__unm = self.__unm
      cls.__base.__pow = self.__pow
      cls.__base.__eq = self.__eq
      cls.__base.__lt = self.__lt
      cls.__base.__le = self.__le
      cls.__base.__concat = self.__concat
      cls.__base.__tostring = self.__tostring
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, int, base)
      self.int = type(int) == "string" and int or "0"
      self.base = base
    end,
    __base = _base_0,
    __name = "CustomInteger"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  CustomInteger = _class_0
end
local HexInteger
do
  local _class_0
  local _parent_0 = CustomInteger
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, int)
      return _class_0.__parent.__init(self, int, 16)
    end,
    __base = _base_0,
    __name = "HexInteger",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  HexInteger = _class_0
end
local OctInteger
do
  local _class_0
  local _parent_0 = CustomInteger
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, int)
      return _class_0.__parent.__init(self, int, 8)
    end,
    __base = _base_0,
    __name = "OctInteger",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  OctInteger = _class_0
end
local BinInteger
do
  local _class_0
  local _parent_0 = CustomInteger
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, int)
      return _class_0.__parent.__init(self, int, 2)
    end,
    __base = _base_0,
    __name = "BinInteger",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  BinInteger = _class_0
end
local DecInteger
do
  local _class_0
  local _parent_0 = CustomInteger
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, int)
      return _class_0.__parent.__init(self, int, 10)
    end,
    __base = _base_0,
    __name = "DecInteger",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  DecInteger = _class_0
end
return ({
  toDec = toDec,
  fromDec = fromDec,
  CustomInteger = CustomInteger,
  HexInteger = HexInteger,
  OctInteger = OctInteger,
  BinInteger = BinInteger,
  DecInteger = DecInteger
})