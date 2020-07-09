# Usually when you buy something, you're asked whether your credit card number, phone number or answer to your most secret question is still correct. However, since someone could look over your shoulder, you don't want that shown on your screen. Instead, we mask it.

# Your task is to write a function maskify, which changes all but the last four characters into '#'.

# askify('4556364607935616') # should return '############5616'
# maskify('64607935616')      # should return '#######5616'
# maskify('1')                # should return '1'
# maskify('')                 # should return ''
def maskify(cc)
  return cc.length <= 4 ? cc : ('#' * (cc.length-4)) + cc[cc.length-4..cc.length-1]
end
def maskify1(cc)
  cc.gsub(/.(?=....)/, '#')
end
def maskify2(cc)
  cc.size <= 4 ? cc : "#" * (cc.length-4) + cc[-4..-1]
end

p maskify('4556364607935616')