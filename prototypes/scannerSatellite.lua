local scannerSatellite = table.deepcopy(data.raw.item["satellite"])

scannerSatellite.name = "scanner-satellite"
scannerSatellite.icons = {
  {
    icon = scannerSatellite.icon,
    tint = {r=1,g=1,b=1,a=0.5}
  }
}

scannerSatellite.rocket_launch_product = nil

local recipe = table.deepcopy(data.raw.recipe["satellite"])
recipe.enabled = true
recipe.name = "scanner-satellite"
recipe.ingredients = {{"processing-unit",100},{"low-density-structure",100},{"rocket-fuel",50},{"solar-panel",100},{"accumulator",100},{"radar",200},{"beacon",100}}
recipe.result = "scanner-satellite"

data:extend{scannerSatellite,recipe}