function BlockRunesInArea(cid)
local block_area = { -- defina as areas
{{x=514,y=524,z=7}, {x=561,y=563,z=7}}, -- com a pos começo e final da area
{{x=561,y=524,z=7}, {x=515,y=563,z=7}},
{{x=513,y=542,z=7}, {x=564,y=542,z=7}}
}
for _, var in ipairs(block_area) do
if isInRange(getCreaturePosition(cid), var[1], var[2]) then
return true
end
end
return false
end