jq -Rs . holden.utf8.lua > holden.lua.json
jq --rawfile code holden.utf8.lua \
   '.LuaScript = $code' \
   "Bloodlines Ranked 4.1 - HoldenCustom.json" > "Bloodlines Ranked 4.1 - ArwinUpdate.json"
