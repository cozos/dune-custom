jq -Rs . holden.utf8.lua > holden.lua.json
jq --rawfile code holden.utf8.lua \
   '.LuaScript = $code' \
   "Bloodlines Ranked 4.1 - ArwinUpdate.json" > "Bloodlines Ranked 4.1 - ArwinUpdate_tmp.json"
mv "Bloodlines Ranked 4.1 - ArwinUpdate_tmp.json" "Bloodlines Ranked 4.1 - ArwinUpdate.json"
