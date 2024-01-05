
{
  local cidrToIpInt32Bits = function(cidr) {
    local splitSlash = std.split(cidr, '/'),
    ret: {
      ip: ipStrToInt32(splitSlash[0]),
      bits: std.parseInt(splitSlash[1]),
    }
  }.ret,

  local ipStrToInt32 = function(ipStr) {
    local splitDot = std.split(ipStr, '.'),
    local bytes = std.map(function (x) std.parseInt(x), splitDot),
    ret: (bytes[0] << 24) +
         (bytes[1] << 16) +
         (bytes[2] <<  8) +
         (bytes[3] <<  0),
  }.ret,

  local ipInt32ToStr = function(ipInt) {
    local bytes = [
      (ipInt >> 24) & 255,
      (ipInt >> 16) & 255,
      (ipInt >>  8) & 255,
      (ipInt >>  0) & 255,
    ],
    ret: std.join('.', std.map(function(x) '' + x, bytes)),
  }.ret,

  cidrSubnet: function(cidr, newBits, netNum) {
    local orig = cidrToIpInt32Bits(cidr),
    local newIp = orig.ip + (netNum << (32 - orig.bits - newBits)),
    ret: ipInt32ToStr(newIp) + '/' + (orig.bits + newBits),
  }.ret,
}.cidrSubnet

