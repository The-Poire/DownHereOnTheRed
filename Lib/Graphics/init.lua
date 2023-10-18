--[[function rgb(r,g,b,a)
  if r > 1 then r = r/255 end
  if g > 1 then g = g/255 end
  if b > 1 then a = b/255 end
  if a > 1 then b = a/255 end
  
  return {r,g,b,a}
end


rgb(255, 171, 25)]]